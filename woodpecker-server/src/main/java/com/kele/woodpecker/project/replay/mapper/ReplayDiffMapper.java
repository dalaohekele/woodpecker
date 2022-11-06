package com.kele.woodpecker.project.replay.mapper;

import com.kele.woodpecker.project.replay.domain.ReplayDiff;
import com.kele.woodpecker.project.replay.domain.ReplayFlow;

/**
 * @author :kele
 * @date : 2022/10/29
 */
public interface ReplayDiffMapper {
    public int insertReplayDiff(ReplayDiff replayDiff);
}
