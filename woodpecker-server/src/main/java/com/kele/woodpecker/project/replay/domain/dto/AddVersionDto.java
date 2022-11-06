package com.kele.woodpecker.project.replay.domain.dto;

import lombok.Data;

/**
 * @author :kele
 * @date : 2022/10/15
 * 添加版本号入参
 */
@Data
public class AddVersionDto {
    private String beginTime;
    private String endTime;
    private String version;
}
