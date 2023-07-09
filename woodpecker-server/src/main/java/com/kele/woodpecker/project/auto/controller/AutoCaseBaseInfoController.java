package com.kele.woodpecker.project.auto.controller;


import com.kele.woodpecker.framework.web.controller.BaseController;
import com.kele.woodpecker.framework.web.domain.AjaxResult;
import com.kele.woodpecker.framework.web.page.TableDataInfo;
import com.kele.woodpecker.project.auto.domain.AutoCaseBaseInfo;
import com.kele.woodpecker.project.auto.service.IAutoCaseBaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/autoCase")
public class AutoCaseBaseInfoController extends BaseController {

    @Autowired
    IAutoCaseBaseInfoService caseBaseInfoService;

    @PostMapping("/baseCase/add")
    public AjaxResult addCaseBaseInfo(@RequestBody AutoCaseBaseInfo caseBaseInfo)
    {
        return toAjax(caseBaseInfoService.saveCaseBaseInfo(caseBaseInfo));
    }

    @GetMapping("/baseCase/list")
    public TableDataInfo list()
    {
        startPage();
        List<AutoCaseBaseInfo> autoCaseBaseInfoList = caseBaseInfoService.getCaseBaseInfoList();
        return getDataTable(autoCaseBaseInfoList);
    }

}
