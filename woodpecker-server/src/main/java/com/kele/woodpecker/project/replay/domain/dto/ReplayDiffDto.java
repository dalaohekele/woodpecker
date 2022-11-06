package com.kele.woodpecker.project.replay.domain.dto;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author :kele
 * @date : 2022/10/23
 */
@Data
public class ReplayDiffDto {
    @NotNull(message = "新版本号不能为空")
    String newVersion;

    @NotNull(message = "老版本号不能为空")
    String oldVersion;

    // 过滤降噪字段
    List<String> noiseList;

}
