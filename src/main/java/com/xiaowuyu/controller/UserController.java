package com.xiaowuyu.controller;

import com.xiaowuyu.pojo.Users;
import com.xiaowuyu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
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

    @RequestMapping("/toLogin")
    public String toLogin(Model model, Users users){
        System.out.println(users);
        model.addAttribute("users",users);
        return "login";
    }

    @RequestMapping("/login")
    public String login(Model model, Users users,HttpSession session){
        if(userService.login(users) != null){
            model.addAttribute("user",users);
            Users user=userService.queryUserByUser_name(users.getUser_name());
            users.setUser_id(user.getUser_id());
            model.addAttribute("user",users);
            session.setAttribute("user",users);
            System.out.println("登录成功");
            return "redirect:/book/allGoods";
        } else{
            model.addAttribute("error","账号或密码错误");
            return "redirect:/user/toLogin";
        }
    }

    @RequestMapping("/toRegister")
    public String toRegister(){return "register";}

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
