package com.kele.woodpecker.project.replay.domain.dto;

import com.kele.woodpecker.framework.web.domain.BaseEntity;
import lombok.Data;

/**
 * @author :kele
 * @date : 2022/11/5
 */
@Data
public class ReplayQueryDto extends BaseEntity {
    String gorId;
    String version;
}
