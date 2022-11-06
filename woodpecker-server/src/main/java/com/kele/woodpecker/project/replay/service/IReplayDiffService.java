package com.kele.woodpecker.project.replay.service;

import com.kele.woodpecker.project.replay.domain.dto.ReplayDiffDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDto;

/**
 * @author :kele
 * @date : 2022/10/23
 */
public interface IReplayDiffService {
    public void diffFlow(ReplayDiffDto diffDto);
}
