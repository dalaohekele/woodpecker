package com.kele.woodpecker.project.auto.service;

public interface IAutoCaseInfoService {
    boolean autoBaseCaseExit(long id);

    void saveAutoCaseByBaseId(long id);
}
