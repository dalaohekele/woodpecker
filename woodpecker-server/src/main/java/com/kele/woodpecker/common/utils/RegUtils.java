package com.kele.woodpecker.common.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author :kele
 * @date : 2022/9/5
 */
public class RegUtils {

    /**
     * gor返回的token清洗
     * @param text
     * @return
     */
    public static String regStr(String text,String reg){
        if (!Pattern.compile(reg).matcher(text).find()) {
            return "";
        }
        String firstSub = text.substring(text.indexOf(reg));
        return firstSub.substring(firstSub.indexOf(reg)+reg.length(),firstSub.indexOf(" ,"));
    }

    public static void main(String[] args) {
        System.out.print(regStr("1 d8a722b8c0a8007ccb0f1e72 1662625177055281707 0,POST /api/v1/user/login HTTP/1.1 ,Host: 192.168.0.174:8888 ,Connection: keep-alive ,Content-Length: 76 ,Accept: application/json, text/plain, */* ,X-Requested-With: XMLHttpRequest ,User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Mobile Safari/537.36 ,token:  ,Content-Type: application/json;charset=UTF-8 ,Origin: http://192.168.0.174:8080 ,Referer: http://192.168.0.174:8080/ ,Accept-Encoding: gzip, deflate ,Accept-Language: zh-CN,zh;q=0.9,en;q=0.8 , ,{\"loginName\":\"18684940192\",\"passwordMd5\":\"e10adc3949ba59abbe56e057f20f883e\"},\n",
                "Origin: "));
    }
}
