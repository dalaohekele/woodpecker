package com.kele.woodpecker.project.replay.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kele.woodpecker.framework.web.domain.BaseEntity;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * @author :kele
 * @date : 2022/9/4
 */
@Data
@ToString
public class ReplayFlow extends BaseEntity {
    private static final long serialVersionUID = 1L;

    // 数据自增id
    private Long id;

    //gor 生成的唯一标识
    private String gorId;
    //入参相关参数
    private String reqUrl;

    private String reqPath;

    private String reqMethod;

    private String reqCookies;

    private String reqContentType;

    private String reqParam;

    // 出参相关数据
    private String respStatusCode;

    private String respData;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    // 版本号
    private String version;

}
