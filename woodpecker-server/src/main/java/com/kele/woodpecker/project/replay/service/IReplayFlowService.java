package com.kele.woodpecker.project.replay.service;

import com.kele.woodpecker.project.replay.domain.ReplayFlow;
import com.kele.woodpecker.project.replay.domain.dto.AddVersionDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayQueryDto;

import java.util.List;

/**
 * @author :kele
 * @date : 2022/9/9
 */
public interface IReplayFlowService {

    List<String> getVersionList();

    /**
     * 查询流量
     * @param replayQueryDto
     * @return
     */
    List<ReplayFlow> getReplayList(ReplayQueryDto replayQueryDto);

    /**
     * 通过版本号获取流量列表数据
     *
     * @param replayDto
     */
    List<ReplayFlow> getFlowList(ReplayDto replayDto);

    /**
     * 通过gorId 查询流量详情
     *
     * @param
     * @return
     */
    ReplayFlow getFlowDes(String gorId,String version);

    /**
     * 通过id 查询流量详情
     * @param id
     * @return
     */
    ReplayFlow getReplayById(String id);

    int delReplayById(String[] ids);

    /**
     * 回放流量
     *
     * @param replayDto
     */
    void replayGor(ReplayDto replayDto);

    /**
     * 流量添加版本号标签
     *
     * @param addVersionDto
     * @return
     */
    int addVersion(AddVersionDto addVersionDto);


    /**
     * 通过版本号copy一份流量
     *
     * @param replayDto
     * @return
     */
     void copyVersion(ReplayDto replayDto);

}
