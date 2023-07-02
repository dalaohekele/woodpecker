package com.kele.woodpecker.project.auto.service.impl;

import com.kele.woodpecker.project.auto.domain.AutoCaseBaseInfo;
import com.kele.woodpecker.project.auto.mapper.AutoCaseBaseInfoMapper;
import com.kele.woodpecker.project.auto.service.IAutoCaseBaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AutoCaseBaseInfoServiceImpl implements IAutoCaseBaseInfoService {

    @Autowired
    AutoCaseBaseInfoMapper caseBaseInfoMapper;

    @Override
    public int saveCaseBaseInfo(AutoCaseBaseInfo caseBaseInfo) {
        return caseBaseInfoMapper.insertAutoCaseBaseInfo(caseBaseInfo);
    }

    @Override
    public AutoCaseBaseInfo getCaseBaseInfoById(long id) {
        return caseBaseInfoMapper.selectAutoCaseBaseInfoById(id);
    }

    @Override
    public AutoCaseBaseInfo getCaseBaseInfoByName(String name) {
        return null;
    }

    @Override
    public List<AutoCaseBaseInfo> getCaseBaseInfoList() {
        return caseBaseInfoMapper.selectAutoCaseBaseInfoList();
    }
}
