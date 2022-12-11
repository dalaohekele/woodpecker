package com.kele.woodpecker.project.replay.domain.dto;

import com.kele.woodpecker.framework.web.domain.BaseEntity;
import lombok.Data;

/**
 * @author :kele
 * @date : 2022/12/11
 */
@Data
public class DiffResultDto extends BaseEntity {
    String testVersion;
}
