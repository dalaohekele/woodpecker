package com.kele.woodpecker.project.auto.mapper;

import com.kele.woodpecker.project.auto.domain.AutoCaseBaseInfo;
import com.kele.woodpecker.project.auto.domain.AutoCaseInfo;

import java.util.List;

public interface AutoCaseInfoMapper {
    int insertAutoCaseInfo(AutoCaseInfo autoCaseInfo);

    AutoCaseInfo selectAutoCaseInfoByBaseId(long id);

    AutoCaseInfo selectAutoCaseInfoById(long id);

    List<AutoCaseInfo> selectAutoCaseInfoList();
}
