package com.kele.woodpecker.project.auto.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.kele.woodpecker.common.utils.StringUtils;
import com.kele.woodpecker.project.auto.domain.AutoCaseBaseInfo;
import com.kele.woodpecker.project.auto.domain.AutoCaseInfo;
import com.kele.woodpecker.project.auto.mapper.AutoCaseInfoMapper;
import com.kele.woodpecker.project.auto.service.IAutoCaseBaseInfoService;
import com.kele.woodpecker.project.auto.service.IAutoCaseInfoService;
import com.kele.woodpecker.project.auto.utils.RecursiveCaseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AutoCaseInfoServiceImpl implements IAutoCaseInfoService {

    @Autowired
    IAutoCaseBaseInfoService caseBaseInfoService;

    @Autowired
    AutoCaseInfoMapper caseInfoMapper;

    @Override
    public boolean autoBaseCaseExit(long id) {
        AutoCaseInfo autoCaseInfo = caseInfoMapper.selectAutoCaseInfoByBaseId(id);
        return StringUtils.isNotNull(autoCaseInfo);
    }

    /**
     * 通过baseInfo 的id自动生成用例
     *
     * @param id
     */
    @Override
    public void saveAutoCaseByBaseId(long id) {
        AutoCaseBaseInfo autoCaseBaseInfo = caseBaseInfoService.getCaseBaseInfoById(id);
        JSONObject paramJson = JSONObject.parseObject(autoCaseBaseInfo.getCaseParam());
        // 自动生成用例并插入表中
        ArrayList<Object> caseParams = RecursiveCaseUtil.createBaseCase(paramJson);
        for (Object param:caseParams){
            AutoCaseInfo caseInfo = new AutoCaseInfo();
            caseInfo.setCaseBaseId(id);
            caseInfo.setReqParam(param.toString());
            caseInfo.setCaseAssertion(autoCaseBaseInfo.getCaseAssertion());
            caseInfoMapper.insertAutoCaseInfo(caseInfo);
        }
    }
}
