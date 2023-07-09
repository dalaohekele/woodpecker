package com.kele.woodpecker.project.auto.utils;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.fastjson2.JSONWriter;
import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.kele.woodpecker.common.utils.DateUtils.getDate;
import static com.kele.woodpecker.project.auto.utils.PyFileUtil.execPythonFile;

/**
 * 接口单字段无效等价类用例生成
 */
public class RecursiveCaseUtil {


    /**
     * 通过字段类型自动生成无效等价类用例
     *
     * @param valueType
     * @return
     */
    private static ArrayList<Object> getTypeBaseValue(String valueType) {
        ArrayList<Object> list = new ArrayList<>();
        if (("String").equals(valueType)) {
            list.add("");
            list.add(" ");
            list.add(null);
        } else if (("Int").equals(valueType)) {
            //#  整型测试 非数字类型，溢出, 0
            list.add(0);
            list.add("");
        } else if (("Boolean").equals(valueType)) {
            list.add("");
            list.add(" ");
        } else if ("Time".equals(valueType)) {
            list.add("");
            list.add("2010-02-30");
        } else {
            list.add("");
        }
        return list;
    }

    /**
     * 将默认设置的值替换为有效等价类，  控制变量用于校验单字段的输入
     *
     * @param oldJsonArray
     * @return
     */
    private static ArrayList<Object> defaultTypeReplace(ArrayList<JSONObject> oldJsonArray) {
        ArrayList<Object> list = new ArrayList<>();
        for (JSONObject oldJson : oldJsonArray) {
            JSONObject jsonCopy = JSON.parseObject(JSON.toJSONString(oldJson));
            for (Map.Entry<String, Object> entry : oldJson.entrySet()) {
                if ("String".equals(entry.getValue())) {
                    oldJson.put(entry.getKey(), "正常String");
                } else if ("Int".equals(entry.getValue())) {
                    oldJson.put(entry.getKey(), 1);
                } else if ("Boolean".equals(entry.getValue())) {
                    oldJson.put(entry.getKey(), true);
                } else if ("Time".equals(entry.getValue())) {
                    oldJson.put(entry.getKey(), getDate());
                } else {
                    continue;
                }
            }
            list.add(oldJson);
        }
        return list;
    }

    /**
     * 根据默认配置生成单字段无效接口字段用例
     *
     * @param caseJson
     * @return
     */
    public static ArrayList<Object> createSingleCase(JSONObject caseJson) {
        ArrayList<JSONObject> list = new ArrayList<>();
        for (Map.Entry<String, Object> entry : caseJson.entrySet()) {
            List<Object> valueList = getTypeBaseValue(entry.getValue().toString());
            for (Object value : valueList) {
                JSONObject jsonCopy = JSON.parseObject(JSON.toJSONString(caseJson));
                jsonCopy.put(entry.getKey(), value);
                list.add(jsonCopy);
            }
        }
        return defaultTypeReplace(list);
    }

    /**
     * 不同字段类型可能出现的值
     *
     * @param caseJson
     * @return
     */
    public static JSONObject getAllPairsCase(JSONObject caseJson) {
        for (Map.Entry<String, Object> entry : caseJson.entrySet()) {
            List<Object> valueList = getTypeBaseValue(entry.getValue().toString());
            caseJson.put(entry.getKey(), valueList);
        }
        return caseJson;
    }

    /**
     * 正交用例
     *
     * @param caseId
     * @return
     * @throws IOException
     */
    public static JSONArray createAllPairsCase(String caseId) throws IOException {
        // 执行python脚本生成用例并插入redis
        String pyRes = execPythonFile("OAT.py", caseId);
        JSONArray array = JSONArray.parseArray(pyRes);
        return array;
    }


    /**
     * 根据jsonpath规则,替换mock数据用于测试
     *
     * @param caseInfoList
     * @param mockObj
     * @return
     */
    public static List<Object> replaceMock(ArrayList<Object> caseInfoList, JSONObject mockObj) {
        List<Object> list = new ArrayList<>();
        for (Object caseObj : caseInfoList) {
            // value 为null也要输出
            JSONObject caseJson = JSON.parseObject(JSONObject.toJSONString(caseObj,  JSONWriter.Feature.WriteMapNullValue));
            DocumentContext json = JsonPath.parse(mockObj);
            for (Map.Entry<String, Object> entry : caseJson.entrySet()) {
                json.set(entry.getKey(), entry.getValue());
            }
            list.add(json.jsonString());
        }
        return list;
    }
}
