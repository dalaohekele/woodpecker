package com.kele.woodpecker.project.auto.domain;

import com.kele.woodpecker.framework.web.domain.BaseEntity;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 *  测试用例详细信息
 */
@EqualsAndHashCode(callSuper = true)
@Data
@ToString
public class AutoCaseInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    // 数据自增id
    private Long id;

    private Long caseBaseId;

    private String reqParam;

    private String respData;

    // 预期断言内容
    private String caseAssertion;

    // 真实断言内容
    private String caseRealAssertion;
    //断言是否通过
    private Boolean caseStatus;
}
