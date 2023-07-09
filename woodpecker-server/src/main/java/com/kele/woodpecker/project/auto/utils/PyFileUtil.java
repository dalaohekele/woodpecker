package com.kele.woodpecker.project.auto.utils;


import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.ClassUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

public class PyFileUtil {
    private static final Logger logger = LoggerFactory.getLogger(PyFileUtil.class);

    public static String execPythonFile(String fileName, String params) throws IOException {
        // ① 当前系统类型
        String os = System.getProperty("os.name");
        // ② 获取python文件所在目录地址
        String windowsPath = ClassUtils.getDefaultClassLoader().getResource("").getPath().substring(1) + "/py/";
        String linuxPath = ClassUtils.getDefaultClassLoader().getResource("").getPath().substring(1) + "/py/";
        Process process;
        if (os.startsWith("Windows")) {
            // windows执行脚本需要使用 cmd.exe /c 才能正确执行脚本
            process = new ProcessBuilder("cmd.exe", "/c", "python", windowsPath + fileName, windowsPath + "ts723_Designs.txt", params).start();
        } else {
            // linux执行脚本一般是使用python3 + 文件所在路径
            process = new ProcessBuilder("python", linuxPath + fileName, windowsPath + "ts723_Designs.txt", params).start();
        }
        BufferedReader errorReader = null;
        // 脚本执行异常时的输出信息
        errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
        List<String> errorString = read(fileName, errorReader);
        if (errorString.size() != 0) {
            logger.info("读取python文件 异常 fileName={}&errorString={}", fileName, errorString);
        }
        // 脚本执行正常时的输出信息
        BufferedReader inputReader = null;
        inputReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        List<String> returnString = read(fileName, inputReader);
        logger.info("读取python文件 fileName={}&returnString={}", fileName, returnString);
        try {
            process.waitFor();
        } catch (InterruptedException e) {
            logger.error("读取python文件 fileName=" + fileName + " 等待结果返回异常", e);
        }
        return returnString.get(0);
    }

    private static List<String> read(String fileName, BufferedReader reader) {
        List<String> resultList = Lists.newArrayList();
        String res = "";
        while (true) {
            try {
                if (!((res = reader.readLine()) != null)) break;
            } catch (IOException e) {
                logger.error("读取python文件 fileName=" + fileName + " 读取结果异常", e);
            }
            resultList.add(res);
        }
        return resultList;
    }
}
