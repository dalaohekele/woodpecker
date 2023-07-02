package com.kele.woodpecker.project.auto.service;

import com.kele.woodpecker.project.auto.domain.AutoCaseBaseInfo;

import java.util.List;

public interface IAutoCaseBaseInfoService {

    int saveCaseBaseInfo(AutoCaseBaseInfo caseBaseInfo);

    AutoCaseBaseInfo getCaseBaseInfoById(long id );

    AutoCaseBaseInfo getCaseBaseInfoByName(String name);

    List<AutoCaseBaseInfo> getCaseBaseInfoList();
}
