package com.kele.woodpecker.project.replay.utils;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.kele.woodpecker.common.utils.DateUtils.getDate;

public class RecursiveCaseUtil {
    /**
     * 通过字段类型自动生成无效等价类用例
     * @param valueType
     * @return
     */
    private static ArrayList<Object> getTypeBaseValue(String valueType) {
        ArrayList<Object> list = new ArrayList<>();
        if (("String").equals(valueType)) {
            list.add("");
            list.add("!@#$%^&*()_+<>?:{}|~`");
            list.add("<JavaScript>alert(0)</JavaScript>");
        } else if (("Int").equals(valueType)) {
            //#  整型测试 非数字类型，溢出, 0
            list.add("");
            list.add("notInt");
            list.add("12567890123456781234567123451234567");
        } else if (("Boolean").equals(valueType)) {
            list.add("");
            list.add("notBoolean");
        } else if ("Time".equals(valueType)) {
            list.add("");
            list.add("notTime");
            list.add("2010-02-30");
        } else {
            list.add("");
        }
        return list;
    }

    /**
     * 将默认设置的值替换为有效等价类，  控制变量用于校验单字段的输入
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
     * @param source
     * @return
     */
    public static ArrayList<Object> createBaseCase(JSONObject source) {
        ArrayList<JSONObject> list = new ArrayList<>();
        for (Map.Entry<String, Object> entry : source.entrySet()) {
            List<Object> valueList = getTypeBaseValue("" + entry.getValue());
            for (Object value : valueList) {
                JSONObject jsonCopy = JSON.parseObject(JSON.toJSONString(source));
                jsonCopy.put(entry.getKey(), value);
                list.add(jsonCopy);
            }
        }
        return defaultTypeReplace(list);
    }


    public static void main(String[] args) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("$.data.name", "String");
        jsonObject.put("$.data.age", "Int");
        jsonObject.put("$.data.student", "Boolean");
        System.out.println(createBaseCase(jsonObject));
    }
}
