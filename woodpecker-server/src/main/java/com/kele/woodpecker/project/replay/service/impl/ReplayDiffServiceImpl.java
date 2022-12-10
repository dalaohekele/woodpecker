package com.kele.woodpecker.project.replay.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ke.diff.Diff;
import com.ke.diff.model.Result;
import com.kele.woodpecker.project.replay.domain.ReplayDiff;
import com.kele.woodpecker.project.replay.domain.ReplayFlow;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDiffDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDto;
import com.kele.woodpecker.project.replay.mapper.ReplayDiffMapper;
import com.kele.woodpecker.project.replay.service.IReplayDiffService;
import com.kele.woodpecker.project.replay.service.IReplayFlowService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author :kele
 * @date : 2022/10/23
 */
@Service
@Slf4j
public class ReplayDiffServiceImpl implements IReplayDiffService {

    @Autowired
    IReplayFlowService replayFlowService;

    @Autowired
    ReplayDiffMapper replayDiffMapper;

    @Async
    @Override
    public void diffFlow(ReplayDiffDto diffDto) {
        // 基准流量数据
        ReplayDto basicReplayDto = new ReplayDto();
        basicReplayDto.setNewVersion(diffDto.getNewVersion());
        List<ReplayFlow> basicFlowList = replayFlowService.getFlowList(basicReplayDto);
        ArrayList<String> basicList = new ArrayList<>();
        for (ReplayFlow basicReplayFlow : basicFlowList) {
            String gorId = basicReplayFlow.getGorId();
            basicList.add(gorId);
        }
        //测试版本流量
        ReplayDto testReplayDto = new ReplayDto();
        testReplayDto.setNewVersion(diffDto.getOldVersion());
        List<ReplayFlow> testLowList = replayFlowService.getFlowList(testReplayDto);
        ArrayList<String> testList = new ArrayList<>();
        for (ReplayFlow oldReplayFlow : testLowList) {
            String gorId = oldReplayFlow.getGorId();
            testList.add(gorId);
        }
        //测试版本理论会比基准流量多
        Map<String, List<String>> map = getIntersection(testList, basicList);
        List<String> inList = map.get("inList");
        List<String> outList = map.get("outList");

        // diff对比字段
        ReplayDiff replayDiff = new ReplayDiff();
        List<Object> list = new ArrayList<>();
        Diff diff = new Diff();
        for (String id : inList) {
            JSONObject basicReplayFlow = JSONObject.parseObject(JSON.toJSONString(replayFlowService.getFlowDes(id, diffDto.getNewVersion())));
            JSONObject testReplayFlow = JSONObject.parseObject(JSON.toJSONString(replayFlowService.getFlowDes(id, diffDto.getOldVersion())));
            List<Result> results = null;
            // gor 录制流量 返回值可能为空，这里需要判空
            if (basicReplayFlow.get("respData") != null && testReplayFlow.get("respData") != null) {
                if (diffDto.getNoiseList() != null) {
                    results = diff.withNoisePahList(diffDto.getNoiseList()).diff(basicReplayFlow.getString("respData"),
                            testReplayFlow.get("respData").toString());
                } else {
                    results = diff.diff(basicReplayFlow.getString("respData"),
                            testReplayFlow.get("respData").toString());
                }
            }
            HashMap<String, List<Result>> hashMap = new HashMap<>();
            // 存在不同则写入结果
            if (results!=null && !results.isEmpty()) {
                hashMap.put(id, results);
                list.add(hashMap);
            }
        }
        replayDiff.setTestVersion(diffDto.getNewVersion());
        replayDiff.setBasicVersion(diffDto.getOldVersion());
        replayDiff.setDiffResult(JSON.toJSONString(list));
        replayDiff.setCreateTime(new Date());
        replayDiff.setUpdateTime(new Date());
        replayDiffMapper.insertReplayDiff(replayDiff);
    }

    /**
     * list 取交集
     *
     * @param list1
     * @param list2
     * @return
     */
    public static Map<String, List<String>> getIntersection(List<String> list1, List<String> list2) {
        List<String> inList = new ArrayList<>();
        List<String> outList = new ArrayList<>();
        for (String str : list2) {
            if (list1.contains(str)) {
                inList.add(str);
            } else {
                outList.add(str);
            }
        }
        Map<String, List<String>> result = new HashMap<>();
        result.put("inList", inList);
        result.put("outList", outList);
        return result;
    }


    public static void main(String[] args) {
        Diff diff = new Diff();
        String jsonA = "{\"name\":\"张三\",\"phon3\":\"12345678901\",\"g3nder\":\"男\",\"timestamp\":\"1646201087874\"}";
        String jsonB = "{\"name\":\"张三\",\"b1rth\":\"2000-01-01\",\"g3nder\":\"男\",\"timestamp\":\"1646201087875\"}";
        try {
            List<String> noiseList = new ArrayList<>();
            noiseList.add("timestamp");
            // 降噪字段
            List<Result> results = diff.withNoisePahList(noiseList).diff(jsonA, jsonB);
            log.info(JSON.toJSONString(results));
        } catch (Exception e) {
            log.error("error:" + e.getMessage());
        }
    }
}
