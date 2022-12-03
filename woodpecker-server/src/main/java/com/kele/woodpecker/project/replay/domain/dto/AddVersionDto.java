package com.kele.woodpecker.project.replay.domain.dto;

import com.kele.woodpecker.framework.web.domain.BaseEntity;
import lombok.Data;

/**
 * @author :kele
 * @date : 2022/10/15
 * 添加版本号入参
 */
@Data
public class AddVersionDto extends BaseEntity {
    private String version;
}
