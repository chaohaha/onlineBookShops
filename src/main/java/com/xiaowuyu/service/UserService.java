package com.xiaowuyu.service;

import com.xiaowuyu.pojo.Admin;
import com.xiaowuyu.pojo.Users;

import java.util.List;

public interface UserService {
    //注册一个User
    int register(Users users);

    //用户登录
    Users login(Users users);

    //更新User信息
    int updateUser(Users users);

    //更新User状态
    Integer userStatus(Integer user_id,Integer status);

    //更改用户权限
    Integer updateUserLimit(Integer user_id,Integer limit);

    //根据id查询,返回一个User
    Users queryUserByUser_id(int user_id);

    //根据id查询,返回一个User
    Users queryUserByUser_name(String user_name);

    //查询全部管理员,返回list集合
    List<Users> queryAllManager();

    //查询全部用户,返回list集合
    List<Users> queryAllUser(String userSearch);

    Integer retrievePassword(String mobile, String password);

    Users QueryUserName(String mobile);

    // 修改用户信息
    Integer modification(Users user);

    Integer changePassword(String user_name,String user_pwd , String newuser_pwd);


    Admin adminLogin(Admin admin);
}
