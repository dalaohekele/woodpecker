package com.kele.woodpecker.project.replay.domain.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author :kele
 * @date : 2022/10/23
 */
@Data
public class ReplayDiffDto {
    @NotBlank(message = "基准版本号不能为空")
    String basicVersion;

    @NotBlank(message = "测试版本号不能为空")
    String testVersion;

    // 过滤降噪字段
    List<String> noiseList;
}
