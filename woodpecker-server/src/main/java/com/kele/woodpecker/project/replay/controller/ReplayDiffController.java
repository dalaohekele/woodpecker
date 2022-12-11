package com.kele.woodpecker.project.replay.controller;

import com.kele.woodpecker.framework.web.controller.BaseController;
import com.kele.woodpecker.framework.web.domain.AjaxResult;
import com.kele.woodpecker.framework.web.page.TableDataInfo;
import com.kele.woodpecker.project.replay.domain.ReplayDiff;
import com.kele.woodpecker.project.replay.domain.dto.DiffResultDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDiffDto;
import com.kele.woodpecker.project.replay.service.IReplayDiffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author :kele
 * @date : 2022/10/15
 * 流量比对
 */
@RestController
@RequestMapping("/replay")
public class ReplayDiffController extends BaseController {

    @Autowired
    private IReplayDiffService replayDiffService;

    @GetMapping("/diff/list")
    public TableDataInfo list(DiffResultDto diffResultDto)
    {
        startPage();
        List<ReplayDiff> diffList = replayDiffService.getDiffList(diffResultDto);
        return getDataTable(diffList);
    }

    @PostMapping("/diff")
    public AjaxResult diff(@Validated @RequestBody ReplayDiffDto diffDto)
    {
        replayDiffService.diffFlow(diffDto);
        return AjaxResult.success("数据比对中，请稍等");
    }
}
