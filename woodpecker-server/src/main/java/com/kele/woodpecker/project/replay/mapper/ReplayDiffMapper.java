package com.kele.woodpecker.project.replay.mapper;

import com.kele.woodpecker.project.replay.domain.ReplayDiff;
import com.kele.woodpecker.project.replay.domain.ReplayFlow;
import com.kele.woodpecker.project.replay.domain.dto.DiffResultDto;

import java.util.List;

/**
 * @author :kele
 * @date : 2022/10/29
 */
public interface ReplayDiffMapper {
    int insertReplayDiff(ReplayDiff replayDiff);

    List<ReplayDiff> getReplayList(DiffResultDto diffResultDto);
}
