package com.kele.woodpecker.project.auto.domain;

import com.kele.woodpecker.framework.web.domain.BaseEntity;
import lombok.Data;
import lombok.ToString;

/**
 * 用例基本信息
 */
@Data
@ToString
public class AutoCaseBaseInfo extends BaseEntity {
    private static final long serialVersionUID = 1L;
    // 数据自增id
    private Long id;
    // 测试名称
    private String name;
    // 需要变更的Mock的名称
    private String mockName;
    //入参相关参数 用于后续切换环境
    private String env;
    // 用例入参
    private String caseParam;
    // 用例预期值
    private String caseAssertion;

}
