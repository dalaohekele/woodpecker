package com.kele.woodpecker.project.replay.mapper;

import com.kele.woodpecker.project.replay.domain.ReplayFlow;
import com.kele.woodpecker.project.replay.domain.dto.ReplayQueryDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author :kele
 * @date : 2022/9/8
 */
public interface ReplayFlowMapper {

    List<String> selectVersionList();
    int insertReplayFlow(ReplayFlow reqAndRes);

    int updateReplayFlow(ReplayFlow reqAndRes);

    List<ReplayFlow> selectFlowByVersion(String version);

    List<ReplayFlow> selectFlowList(ReplayQueryDto replayQueryDto);

    ReplayFlow selectFlowByGorId(String gorId, String version);

    ReplayFlow selectReplayById(String id);

    int deleteReplayById(String[] ids);

    List<ReplayFlow> selectReqAndResList(@Param("createTime") String createTime, @Param("endTime") String endTime);

    int updateVersion(@Param("ids") List<Long> ids, @Param("version") String version);
}
