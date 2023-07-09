package com.kele.woodpecker.project.auto.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.fastjson2.JSONWriter;
import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;
import com.kele.woodpecker.common.exception.ServiceException;
import com.kele.woodpecker.common.utils.StringUtils;
import com.kele.woodpecker.framework.redis.RedisCache;
import com.kele.woodpecker.project.auto.domain.AutoCaseBaseInfo;
import com.kele.woodpecker.project.auto.domain.AutoCaseInfo;
import com.kele.woodpecker.project.auto.mapper.AutoCaseInfoMapper;
import com.kele.woodpecker.project.auto.service.IAutoCaseBaseInfoService;
import com.kele.woodpecker.project.auto.service.IAutoCaseInfoService;
import com.kele.woodpecker.project.auto.utils.JDBCUtils;
import com.kele.woodpecker.project.auto.utils.RecursiveCaseUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

@Service
public class AutoCaseInfoServiceImpl implements IAutoCaseInfoService {

    private static final Logger log = LoggerFactory.getLogger(AutoCaseInfoServiceImpl.class);


    @Autowired
    IAutoCaseBaseInfoService caseBaseInfoService;

    @Autowired
    AutoCaseInfoMapper caseInfoMapper;

    @Autowired
    RedisCache redisCache;

    @Override
    public boolean autoBaseCaseExit(long id) {
        AutoCaseInfo autoCaseInfo = caseInfoMapper.selectAutoCaseInfoByBaseId(id);
        return StringUtils.isNotNull(autoCaseInfo);
    }

    /**
     * 通过baseInfo 的id自动生成用例
     * 异步
     * @param id
     */
    @Async
    @Override
    public void saveAutoCaseByBaseId(long id) {
        try {
            AutoCaseBaseInfo autoCaseBaseInfo = caseBaseInfoService.getCaseBaseInfoById(id);

            //从Mock 表中取出数据进行修改
            String mockName = autoCaseBaseInfo.getMockName();
            String selectMockSql = String.format("select mock_data from mock where mock_name=%s",mockName);
            //todo 环境切换
            ResultSet sqlData = JDBCUtils.executeQuery("sit1",selectMockSql);
            JSONObject mockJson = JSON.parseObject(sqlData.toString());

            JSONObject paramJson = JSONObject.parseObject(autoCaseBaseInfo.getCaseParam());
            //预期值存入redis，让python脚本获取，然后输出用例
            JSONObject caseJson = RecursiveCaseUtil.getAllPairsCase(paramJson);
            redisCache.setCacheObject("base_id_" + id, caseJson.toString());
            // 自动生成用例
            JSONArray caseParams = RecursiveCaseUtil.createAllPairsCase("" + id);
            for (Object res: caseParams){
                String resString = JSONObject.toJSONString(res, JSONWriter.Feature.WriteMapNullValue);
                JSONObject resJson = JSON.parseObject(resString);
                DocumentContext json = JsonPath.parse(mockJson);
                for (Map.Entry<String, Object> entry : resJson.entrySet()) {
                    json.set(entry.getKey(), entry.getValue());
                }
                AutoCaseInfo caseInfo = new AutoCaseInfo();
                caseInfo.setCaseBaseId(id);
                caseInfo.setMockName("测试数据为 "+JSONObject.toJSONString(resJson, JSONWriter.Feature.WriteMapNullValue));
                caseInfo.setReqParam(json.jsonString());
                caseInfo.setCaseAssertion(autoCaseBaseInfo.getCaseAssertion());
                caseInfoMapper.insertAutoCaseInfo(caseInfo);
            }

        } catch (Exception e) {
            log.error("生成用例失败:" + e.getMessage());
            throw new ServiceException("生成用例失败:" + e.getMessage());
        }

    }
}
