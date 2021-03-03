package com.xiaowuyu.controller;

import com.xiaowuyu.pojo.Users;
import com.xiaowuyu.service.UserService;
import com.xiaowuyu.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
/*@RequestMapping("/user")*/
public class UserController {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @RequestMapping("/allUser")
    public String list(Model model) {
        List<Users> list = userService.queryAllUser();
        model.addAttribute("list", list);
        return "allUser";
    }

    /*跳转登陆页面*/
    @RequestMapping("/toLogin")
    public String toLogin(Model model, Users users){

        model.addAttribute("users",users);
        return "Login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public Result login(Model model, Users users, HttpSession session){

        Users user = userService.login(users);
        model.addAttribute("user",user);
       session.setAttribute("user",user);
        if(user!=null){
            System.out.println("成功");
            session.setAttribute("user",user);
            return Result.setSuccess("user","登录成功");
        }
        System.out.println("失败");
        return Result.setError("user","账号或密码错误");

    }
    /*跳转注册页面*/
    @RequestMapping("/toRegister")
    public String toRegister(){
        return "Register";
    }

    @RequestMapping("/register")
    public String registerUser(Users users){
        System.out.println(users);
        userService.register(users);
        return "redirect:/user/toLogin";
    }

    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(Model model,int user_id){
        Users users=userService.queryUserByUser_id(user_id);
        System.out.println(users);
        model.addAttribute("users",users);
        return "updateUser";
    }

    @RequestMapping("/updateUser")
    public String updateUser(Model model,Users user){
        System.out.println(user);
        userService.updateUser(user);
        Users users=userService.queryUserByUser_id(user.getUser_id());
        model.addAttribute("users",users);
        return "redirect:/user/toLogin";
    }

    @RequestMapping("/toUpdateUserStatus")
    public String toUpdateUserStatus(Model model,int user_id){
        Users users=userService.queryUserByUser_id(user_id);
        System.out.println(users);
        model.addAttribute("users",users);
        return "updateUserStatus";
    }

    @RequestMapping("/updateUserStatus")
    public String updateUserStatus(Model model,Users user){
        System.out.println(user);
        userService.updateUserStatus(user);
        Users users=userService.queryUserByUser_id(user.getUser_id());
        model.addAttribute("users",users);
        return "redirect:/user/allUser";
    }

    @RequestMapping("/toUpdateUserLimit")
    public String toUpdateUserLimit(Model model,int user_id){
        Users users=userService.queryUserByUser_id(user_id);
        System.out.println(users);
        model.addAttribute("users",users);
        return "updateUserLimit";
    }

    @RequestMapping("/updateUserLimit")
    public String updateUserLimit(Model model,Users user){
        System.out.println(user);
        userService.updateUserLimit(user);
        Users users=userService.queryUserByUser_id(user.getUser_id());
        model.addAttribute("users",users);
        return "redirect:/user/allUser";
    }

}
