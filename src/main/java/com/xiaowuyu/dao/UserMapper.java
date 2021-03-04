package com.xiaowuyu.dao;

import com.xiaowuyu.pojo.Books;
import com.xiaowuyu.pojo.Users;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserMapper {
    //注册一个User
    int register(Users users);

    //用户登录
    Users login(Users users);

    //更新User信息
    int updateUser(Users users);

    //更新User状态
    int updateUserStatus(Users users);

    //更改用户权限
    int updateUserLimit(Users users);

    //根据uId查询,返回一个User
    Users queryUserByUser_id(@Param("user_id") int user_id);

    //根据uName查询,返回一个User
    Users queryUserByUser_name(@Param("user_name") String user_name);

    //查询全部管理员,返回list集合
    List<Users> queryAllManager();

    //查询全部用户,返回list集合
    List<Users> queryAllUser();
    // 找回密码
    @Update("update users set user_pwd=#{user_pwd} where user_phone=#{user_phone}  ")
    Integer retrievePassword(@Param("user_phone") String user_phone, @Param("user_pwd")  String user_pwd);
    // 根据手机号查用户名
    @Select("select * from users where user_phone=#{user_phone} ")
    Users QueryUserName(String user_phone);
}
