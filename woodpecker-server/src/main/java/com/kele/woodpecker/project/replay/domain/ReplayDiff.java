package com.kele.woodpecker.project.replay.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * @author :kele
 * @date : 2022/10/29
 */
@Data
@ToString
public class ReplayDiff {
    // 数据自增id
    private Long id;

    // diff结果
    private String diffResult;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
}
