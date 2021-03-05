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
    @Update("update users set user_status = #{status} where user_id=#{user_id}")
    Integer updateUserStatus(@Param("user_id") Integer user_id ,@Param("status") Integer status);

    //更改用户权限
    @Update("update users set user_limit = #{user_limit} where user_id=#{user_id}")
    Integer updateUserLimit( @Param("user_id") Integer user_id,@Param("user_limit") Integer user_limit);

    //根据uId查询,返回一个User
    Users queryUserByUser_id(@Param("user_id") int user_id);

    //根据uName查询,返回一个User
    Users queryUserByUser_name(@Param("user_name") String user_name);

    //查询全部管理员,返回list集合
    List<Users> queryAllManager();

    //查询全部用户,返回list集合
    List<Users> queryAllUser(@Param("userSearch") String userSearch);

    // 找回密码
    @Update("update users set user_pwd=#{user_pwd} where user_phone=#{user_phone}  ")
    Integer retrievePassword(@Param("user_phone") String user_phone, @Param("user_pwd")  String user_pwd);
    // 根据手机号查用户名
    @Select("select * from users where user_phone=#{user_phone} ")
    Users QueryUserName(String user_phone);

    @Update("update users set user_phone=#{user_phone},user_email=#{user_email}," +
            "user_address=#{user_address},user_image=#{user_image} where user_name=#{user_name}")
    Integer modification(Users user);

    @Update("update users set user_pwd = #{newuser_pwd} where user_name=#{user_name} and user_pwd=#{user_pwd}")
    Integer changePassword(@Param("user_name") String user_name,@Param("user_pwd") String user_pwd , @Param("newuser_pwd") String newuser_pwd);
}
