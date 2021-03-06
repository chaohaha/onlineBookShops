package com.xiaowuyu.service;

import com.xiaowuyu.dao.UserMapper;
import com.xiaowuyu.pojo.Admin;
import com.xiaowuyu.pojo.Users;

import java.util.List;

public class UserServiceImpl implements UserService{
    //调用dao层的操作，设置一个set接口，方便Spring管理
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public int register(Users users) {
        return userMapper.register(users);
    }

    // 修改用户信息
    public Integer modification(Users user) {

        return  userMapper.modification(user);
    }

    public Users login(Users users){
        Users user = userMapper.login(users);
        return user;
    }

    public int updateUser(Users users) {
        return userMapper.updateUser(users);
    }

    public Users QueryUserName(String mobile) {
        return userMapper.QueryUserName(mobile);
    }

    public Integer userStatus(Integer user_id,Integer status) {
        Integer i = userMapper.updateUserStatus(user_id,status);
        System.out.println(i);
        return i;
    }

    public Admin adminLogin(Admin admin) {
        return userMapper.adminLogin(admin);
    }

    public Integer retrievePassword(String mobile, String password) {

        return userMapper.retrievePassword(mobile,password);
    }

    /*public int updateUserStatus(Users users) {
        return userMapper.updateUserStatus(users);
    }*/

    public Integer updateUserLimit(Integer user_id, Integer limit) {
       Integer i = userMapper.updateUserLimit(user_id,limit);

        return i  ;
    }

    public Users queryUserByUser_id(int user_id) {
        return userMapper.queryUserByUser_id(user_id);
    }

    public Integer changePassword(String user_name, String user_pwd ,  String newuser_pwd) {
        Integer integer = userMapper.changePassword(user_name, user_pwd, newuser_pwd);

        return integer;
    }

    public Users queryUserByUser_name(String user_name) {
        return userMapper.queryUserByUser_name(user_name);
    }

    public List<Users> queryAllManager() {
        return userMapper.queryAllManager();
    }

    public List<Users> queryAllUser(String userSearch) {
        List<Users> users = userMapper.queryAllUser(userSearch);
        return users;
    }
}
