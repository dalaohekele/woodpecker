package com.kele.woodpecker.project.auto.mapper;


import com.kele.woodpecker.project.auto.domain.AutoCaseBaseInfo;

import java.util.List;

public interface AutoCaseBaseInfoMapper {

    int insertAutoCaseBaseInfo(AutoCaseBaseInfo autoCaseBaseInfo);

    AutoCaseBaseInfo selectAutoCaseBaseInfoByName(String name);

    AutoCaseBaseInfo selectAutoCaseBaseInfoById(long id);

    List<AutoCaseBaseInfo> selectAutoCaseBaseInfoList();
}
