package com.xiaowuyu.controller;

import com.alibaba.fastjson.JSONObject;
import com.xiaowuyu.pojo.Users;
import com.xiaowuyu.service.UserService;
import com.xiaowuyu.utils.CodeConfig;
import com.xiaowuyu.utils.Results;
import com.zhenzi.sms.ZhenziSmsClient;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

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
    public Results login(Model model, Users users, HttpSession session){

        Users user = userService.login(users);
        System.out.println(user);
        if (user!=null&&user.getUser_status()==0){
            return Results.setError("user","您的账户已被禁用");
        }

        model.addAttribute("user",user);
       session.setAttribute("user",user);

        if(user!=null&&user.getUser_limit()==0){
            System.out.println(user.getUser_limit());
            session.setAttribute("user",user);
            return Results.returnState(200,"用户","登陆成功",0);
        }

        if(user!=null&&user.getUser_limit()==1){
            System.out.println(user.getUser_limit());
            return Results.returnState(200,"管理员","登陆成功",1);
        }

        System.out.println("失败");
        return Results.setError("user","账号或密码错误");

    }
    // 注销
    @RequestMapping("/logout")
    public String logout(HttpSession httpSession){
        httpSession.removeAttribute("user");
        return "Login";
    }

    /*跳转注册页面*/
    @RequestMapping("/toRegister")
    public String toRegister(){
        return "Register";
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
    // 跳转找回密码页面
    @RequestMapping("/toRetrieve")
    public String forgetPassword(){
        return "retrieve";
    }

    // 找回密码手机号验证
    @RequestMapping("/sendSms")
    @ResponseBody
    public Results sendSms(String mobile,HttpSession httpSession) {
        System.out.printf(mobile);
        String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
        System.out.print("验证码: " + verifyCode);

        Users users =  userService.QueryUserName(mobile);

        System.out.println(users);
        if (users ==null){
            return Results.setError("users","账户不存在");
        }
        // 发送短信
        ZhenziSmsClient client = new ZhenziSmsClient(CodeConfig.apiUrl, CodeConfig.appId, CodeConfig.appSecret);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("templateId", "3881");
        params.put("number", mobile);
        String[] templateParams = new String[2];
        templateParams[0] = verifyCode;
        templateParams[1] = "5分钟";
        params.put("templateParams", templateParams);
        JSONObject json = null;
        String result = null;
        try {
            result = client.send(params);
            json = JSONObject.parseObject(result);
            if(json.getIntValue("code") != 0){//发送短信失败
                return Results.setError("失败");
            }
            httpSession.setAttribute("verifyCode",verifyCode);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        httpSession.setAttribute("backUser",users.getUser_name());
        return Results.setSuccess("成功");

    }


    // 找回密码
    @RequestMapping("/retrievePassword")
    @ResponseBody
    public Results retrievePassword(HttpSession httpSession,String userId,String password,String mobile,String verifyCode){
        String verifyCodeStr =(String)httpSession.getAttribute("verifyCode");
        int verifyCodes = Integer.parseInt(verifyCodeStr);
        System.out.println(verifyCodes);
        int verifyCodes2 = Integer.parseInt(verifyCode);
        System.out.println(verifyCodes2);
        if (verifyCodes==verifyCodes2){
            Integer integer = userService.retrievePassword(mobile,password);

            if (integer!=null){
                System.out.println("找回成功");
                return Results.setSuccess("","找回成功");
            }
            return Results.setSuccess("","找回失败");
        }

        System.out.println("验证码错误");
        return Results.setError("","验证码错误");
    }

    // 注册手机号验证
    @RequestMapping("/sendSmsRegister")
    @ResponseBody
    public Results sendSmsRegister(String mobile,HttpSession httpSession) {
        System.out.printf(mobile);
        String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
        System.out.print("验证码: " + verifyCode);

        Users users =  userService.QueryUserName(mobile);

        System.out.println(users);
        if (users !=null){
            return Results.setError("users","手机号已注册");
        }
        // 发送短信
        ZhenziSmsClient client = new ZhenziSmsClient(CodeConfig.apiUrl, CodeConfig.appId, CodeConfig.appSecret);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("templateId", "3881");
        params.put("number", mobile);
        String[] templateParams = new String[2];
        templateParams[0] = verifyCode;
        templateParams[1] = "5分钟";
        params.put("templateParams", templateParams);
        JSONObject json = null;
        String result = null;
        try {
            result = client.send(params);
            json = JSONObject.parseObject(result);
            if(json.getIntValue("code") != 0){//发送短信失败
                return Results.setError("失败");
            }
            httpSession.setAttribute("verifyCodes",verifyCode);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return Results.setSuccess("成功");

    }

    // 用户注册
    @RequestMapping("/register")
    @ResponseBody

    public Results registerUser(@RequestParam("user_name")String userName, @RequestParam("user_pwd")String password,
                               @RequestParam("user_phone")String user_phone,
                               @RequestParam("verifyCode")String verifyCode,
                               @RequestParam("user_email")String user_email,
                               @RequestParam("user_address")String user_address,
                               @RequestParam("user_image") MultipartFile uploadFile,
                               HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("upload");//获取路径
        String fileName = uploadFile.getOriginalFilename();//获取上传文件的名字
        File targetFile = new File(path,fileName);


        System.out.println(fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();//是否存在目录，不存在就创建
        }
        //保存
        try {
            uploadFile.transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Users users = new Users(0,userName,password,user_email,user_phone,user_address,1,0);
        String verifyCodes =(String) request.getSession().getAttribute("verifyCodes");
        int verifyCode1 = Integer.parseInt(verifyCodes);
        int verifyCode2 = Integer.parseInt(verifyCode);
        // 验证码正确则添加到数据库
        if (verifyCode1==verifyCode2){
        int i = userService.register(users);

        if (i>0){
            request.getSession().setAttribute("photo",fileName);
            return Results.setSuccess("","注册成功");
        }
        return Results.setSuccess("","注册失败");
        }


        return Results.setError("","验证码错误");
    }

}
