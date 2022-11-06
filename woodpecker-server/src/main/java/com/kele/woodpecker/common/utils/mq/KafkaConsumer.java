package com.kele.woodpecker.common.utils.mq;


import com.alibaba.fastjson2.JSONObject;
import com.kele.woodpecker.common.utils.RegUtils;
import com.kele.woodpecker.common.utils.sign.Md5Utils;
import com.kele.woodpecker.project.replay.domain.ReplayFlow;
import com.kele.woodpecker.project.replay.mapper.ReplayFlowMapper;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Optional;


/**
 * @author :kele
 * @date : 2022/8/30
 */
//@Component
public class KafkaConsumer {
    private static final Logger log = LoggerFactory.getLogger(Md5Utils.class);

    @Autowired
    ReplayFlowMapper replayFlowMapper;

    @KafkaListener(topics = {"kafka-log"})
    public void consumer(ConsumerRecord<?, ?> record) {
        Optional<?> kafkaMessage = Optional.ofNullable(record.value());
        ReplayFlow replayFlow = new ReplayFlow();
        log.info("message.toString():" + kafkaMessage);
        if (kafkaMessage.isPresent()) {
            Object message = kafkaMessage.get();
            String[] kafkaMessages = message.toString().replace("\r", " ").split("\n");
            // 不收集OPTIONS请求
            if (kafkaMessages[1].split(" ")[0].equals("OPTIONS")) {
                return;
            }
            StringBuilder sb = new StringBuilder();
            for (String text : kafkaMessages) {
                sb.append(text).append(",");
            }
            //将消息装换为固定格式的字符串
            String kafkaMes = sb.toString();
            // gor 获取的 流量请求格式 第一个字符为"1"
            if (kafkaMessages[0].split(" ")[0].equals("1")) {
                // todo 根据你系统的请求头来修改如果是cookie则分隔符改为cookie
                String token = RegUtils.regStr(kafkaMes, "token: ");
                String type = RegUtils.regStr(kafkaMes, "Content-Type ");
                replayFlow.setReqContentType(type);
                replayFlow.setReqCookies(token);
                replayFlow.setGorId(kafkaMessages[0].split(" ")[1]);
                String[] reqData = kafkaMessages[1].split(" ");
                replayFlow.setReqMethod(reqData[0]);
                replayFlow.setReqPath(reqData[1]);
                replayFlow.setReqUrl(kafkaMessages[2].split(" ")[1]);
                replayFlow.setReqParam(kafkaMessages[kafkaMessages.length - 1]);
                replayFlow.setCreateTime(new Date());
                replayFlowMapper.insertReplayFlow(replayFlow);
                log.info("接口入参数据导入成功" + JSONObject.toJSONString(replayFlow));
            }
            // gor 获取的 流量返回格式 第一个字符为"2"
            if (kafkaMessages[0].split(" ")[0].equals("2")) {
                replayFlow.setGorId(kafkaMessages[0].split(" ")[1]);
                replayFlow.setRespStatusCode(kafkaMessages[1].split(" ")[1]);
                replayFlow.setRespData(kafkaMessages[kafkaMessages.length - 1]);
                replayFlowMapper.updateReplayFlow(replayFlow);
                log.info("接口出参数据导入成功:" + JSONObject.toJSONString(replayFlow));
            }
        }
    }

    public static void main(String[] args) {
        String text = "Host: 192.168.0.174:8888,  Connection: keep-alive  Accept: application/json, text/plain, */*  X-Requested-With: XMLHttpRequest  User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Mobile Safari/537.36  token:   ";
        String host = text.substring(text.indexOf("Host: ") + 6, text.indexOf(","));
        System.out.print(host);
    }

}
