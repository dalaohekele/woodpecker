package com.kele.woodpecker.project.replay.controller;

import com.kele.woodpecker.framework.web.domain.AjaxResult;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDiffDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDto;
import com.kele.woodpecker.project.replay.service.IReplayDiffService;
import com.kele.woodpecker.project.replay.service.IReplayFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author :kele
 * @date : 2022/10/15
 * 流量比对
 */
@RestController
@RequestMapping("/replay")
public class ReplayDiffController {

    @Autowired
    private IReplayDiffService jsonDiffService;

    @PostMapping("/diff")
    public AjaxResult diff(@RequestBody ReplayDiffDto diffDto)
    {
        jsonDiffService.diffFlow(diffDto);
        return AjaxResult.success("数据比对中，请稍等");
    }
}
