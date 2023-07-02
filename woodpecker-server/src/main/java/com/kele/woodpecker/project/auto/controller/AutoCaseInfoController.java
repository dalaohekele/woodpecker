package com.kele.woodpecker.project.auto.controller;

import com.alibaba.fastjson2.JSONObject;
import com.kele.woodpecker.framework.aspectj.lang.annotation.Log;
import com.kele.woodpecker.framework.web.domain.AjaxResult;
import com.kele.woodpecker.project.auto.domain.AutoCaseBaseInfo;
import com.kele.woodpecker.project.auto.domain.AutoCaseInfo;
import com.kele.woodpecker.project.auto.service.IAutoCaseBaseInfoService;
import com.kele.woodpecker.project.auto.service.IAutoCaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/autoCaseInfo")
public class AutoCaseInfoController {


    @Autowired
    IAutoCaseInfoService caseInfoService;

    @PostMapping("/add")
    public AjaxResult autoAddCaseInfo(@RequestBody JSONObject object)
    {

        long baseCaseId = object.getLong("baseCaseId");
        if (caseInfoService.autoBaseCaseExit(baseCaseId)){
            return AjaxResult.error("已存在生成用例,请先清空存在用例");
        }
        caseInfoService.saveAutoCaseByBaseId(object.getLong("baseCaseId"));
        return AjaxResult.success("用例生成中，请稍等");
    }


}
