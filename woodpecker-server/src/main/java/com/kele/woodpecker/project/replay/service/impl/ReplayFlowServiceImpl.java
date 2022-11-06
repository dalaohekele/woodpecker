package com.kele.woodpecker.project.replay.service.impl;

import com.kele.woodpecker.common.utils.http.HttpUtils;
import com.kele.woodpecker.project.replay.domain.ReplayFlow;
import com.kele.woodpecker.project.replay.domain.dto.AddVersionDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayQueryDto;
import com.kele.woodpecker.project.replay.mapper.ReplayFlowMapper;
import com.kele.woodpecker.project.replay.service.IReplayFlowService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author :kele
 * @date : 2022/9/9
 */
@Service
@Slf4j
public class ReplayFlowServiceImpl implements IReplayFlowService {

    @Autowired
    ReplayFlowMapper replayFlowMapper;

    @Override
    public List<String> getVersionList() {
        return replayFlowMapper.selectVersionList();
    }

    @Override
    public List<ReplayFlow> getReplayList(ReplayQueryDto replayQueryDto) {
        return replayFlowMapper.selectFlowList(replayQueryDto);
    }

    @Override
    public List<ReplayFlow> getFlowList(ReplayDto replayDto) {
        return replayFlowMapper.selectFlowByVersion(replayDto.getNewVersion());
    }

    @Override
    public ReplayFlow getFlowDes(String id, String version) {
        return replayFlowMapper.selectFlowByGorId(id, version);
    }

    @Override
    public ReplayFlow getReplayById(String id) {
        return replayFlowMapper.selectReplayById(id);
    }

    @Override
    public int delReplayById(String[] ids) {
        return replayFlowMapper.deleteReplayById(ids);
    }

    @Async
    @Override
    public void replayGor(ReplayDto replayDto) {
        List<ReplayFlow> reqAndResList = replayFlowMapper.selectFlowByVersion(replayDto.getNewVersion());

        for (ReplayFlow reqAndRes : reqAndResList) {
            String method = reqAndRes.getReqMethod();
            String url = reqAndRes.getReqUrl() + reqAndRes.getReqPath();
            String token = reqAndRes.getReqCookies();
            String param = reqAndRes.getReqParam();
            try {
                String result = HttpUtils.doHttpReq(method, url, token, param);
                log.info("result:" + result);
                reqAndRes.setRespData(result);
                replayFlowMapper.updateReplayFlow(reqAndRes);
            }catch (Exception e){
                log.info("流量回放请求异常:"+e.getMessage());
                continue;
            }
        }
    }

    @Override
    public int addVersion(AddVersionDto addVersionDto) {
        String createDate = addVersionDto.getBeginTime();
        String endDate = addVersionDto.getEndTime();
        String version = addVersionDto.getVersion();
        // 将时间范围内的数据添加版本号
        List<ReplayFlow> reqAndResList = replayFlowMapper.selectReqAndResList(createDate, endDate);
        List<Long> listId = new ArrayList<>();
        for (ReplayFlow reqAndRes : reqAndResList) {
            listId.add(reqAndRes.getId());
        }
        return replayFlowMapper.updateVersion(listId, version);
    }

    @Async
    @Override
    public void copyVersion(ReplayDto replayDto) {
        List<ReplayFlow> reqAndResList = replayFlowMapper.selectFlowByVersion(replayDto.getNewVersion());
        for (ReplayFlow reqAndRes : reqAndResList) {
            //复制流量，将原接口的response置空
            reqAndRes.setVersion(replayDto.getOldVersion());
            reqAndRes.setRespData("");
            reqAndRes.setCreateTime(new Date());
            replayFlowMapper.insertReplayFlow(reqAndRes);
        }
    }
}
