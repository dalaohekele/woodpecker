package com.kele.woodpecker.project.replay.controller;

import com.kele.woodpecker.framework.web.controller.BaseController;
import com.kele.woodpecker.framework.web.domain.AjaxResult;
import com.kele.woodpecker.framework.web.page.TableDataInfo;
import com.kele.woodpecker.project.replay.domain.ReplayFlow;
import com.kele.woodpecker.project.replay.domain.dto.AddVersionDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayDto;
import com.kele.woodpecker.project.replay.domain.dto.ReplayQueryDto;
import com.kele.woodpecker.project.replay.service.IReplayFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author :kele
 * @date : 2022/9/9
 */
@RestController
@RequestMapping("/replay/gor")
public class ReplayFlowController extends BaseController {
    @Autowired
    private IReplayFlowService reqAndResService;

    /**
     * 获取所有版本号 Limit10
     * @return
     */
    @GetMapping("/version")
    public AjaxResult version( )
    {
        List<String> versionList = reqAndResService.getVersionList();
        return AjaxResult.success(versionList);
    }

    /**
     * 获取流量列表详情
     *
     * @param queryDto
     * @return
     */
    @GetMapping("/list")
    public TableDataInfo list(ReplayQueryDto queryDto)
    {
        startPage();
        List<ReplayFlow> replayFlows = reqAndResService.getReplayList(queryDto);
        return getDataTable(replayFlows);
    }

    /**
     * 通过id 获取流量详情
     * @param id
     * @return
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return AjaxResult.success(reqAndResService.getReplayById(id));
    }

    /**
     * 删除流量数据
     * @param ids
     * @return
     */
    @DeleteMapping(value = "/delReplay/{ids}")
    public AjaxResult delReplay(@PathVariable String[] ids)
    {
        return toAjax(reqAndResService.delReplayById(ids));
    }

    @PostMapping("/flow")
    public AjaxResult flow(@RequestBody ReplayDto replayDto)
    {
        reqAndResService.replayGor(replayDto);
        return AjaxResult.success("回放数据中,请稍等");
    }


    /**
     * 通过日期区间对流量进行打标签
     * @param addVersionDto
     * @return
     */
    @PostMapping("/addVersion")
    public AjaxResult addVersion(@RequestBody AddVersionDto addVersionDto)
    {
        int res = reqAndResService.addVersion(addVersionDto);
        if (res>0){
            return AjaxResult.success("版本添加成功");
        }
        return AjaxResult.error("版本添加失败");
    }


    @PostMapping("/copyVersion")
    public AjaxResult copyVersion(@RequestBody ReplayDto replayDto)
    {
        reqAndResService.copyVersion(replayDto);
        return AjaxResult.success("流量复制中,请稍等");
    }


}
