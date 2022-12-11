package com.kele.woodpecker.project.replay.service;

import com.kele.woodpecker.project.replay.domain.ReplayDiff;
import com.kele.woodpecker.project.replay.domain.dto.DiffResultDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDiffDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDto;

import java.util.List;

/**
 * @author :kele
 * @date : 2022/10/23
 */
public interface IReplayDiffService {
    void diffFlow(ReplayDiffDto diffDto);

    List<ReplayDiff> getDiffList(DiffResultDto diffResultDto);
}
