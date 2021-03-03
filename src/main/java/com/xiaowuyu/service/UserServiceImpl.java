package com.xiaowuyu.service;

import com.xiaowuyu.dao.UserMapper;
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

    public Integer retrievePassword(String mobile, String password) {

        return userMapper.retrievePassword(mobile,password);
    }

    public int updateUserStatus(Users users) {
        return userMapper.updateUserStatus(users);
    }

    public int updateUserLimit(Users users) {
        return userMapper.updateUserLimit(users);
    }

    public Users queryUserByUser_id(int user_id) {
        return userMapper.queryUserByUser_id(user_id);
    }

    public Users queryUserByUser_name(String user_name) {
        return userMapper.queryUserByUser_name(user_name);
    }

    public List<Users> queryAllManager() {
        return userMapper.queryAllManager();
    }

    public List<Users> queryAllUser() {
        return userMapper.queryAllUser();
    }
}
