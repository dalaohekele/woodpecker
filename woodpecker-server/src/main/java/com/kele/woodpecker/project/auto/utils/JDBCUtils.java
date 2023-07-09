package com.kele.woodpecker.project.auto.utils;

import java.sql.*;

public class JDBCUtils {
    private JDBCUtils(){}

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    //获取连接的方法
    public static Connection getConnection(String env) throws SQLException {
        String url="";
        String userName="";
        String password="";
        return DriverManager.getConnection(url,userName,password);
    }
    //关闭连接的方法
    public static void close(ResultSet rs,Connection connection) throws SQLException {
        try {
            if (rs != null) {
                rs.close();
            }
        }finally {
            if (connection!=null){
                connection.close();
            }
        }
    }
    //执行查询操作
    public static ResultSet executeQuery(String env, String sql, Object... params) throws SQLException {
        Connection connection = getConnection(env);
        ResultSet rs=null;
        if (connection != null) {
            PreparedStatement ps = connection.prepareStatement(sql);
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    ps.setObject(i+1,params[i]);
                }
            }
            rs=ps.executeQuery();
        }
        return rs;
    }

    //通用的增删改操作
    public static int update(String env, String sql, Object... params) throws SQLException {
        Connection connection = getConnection(env);
        int res=0;
        if (connection != null) {
            PreparedStatement ps=connection.prepareStatement(sql);
            if (params != null&&params.length>0) {
                for (int i = 0; i < params.length; i++) {
                    ps.setObject(i+1,params[i]);
                }
            }
            res=ps.executeUpdate();
        }
        return  res;
    }



}
