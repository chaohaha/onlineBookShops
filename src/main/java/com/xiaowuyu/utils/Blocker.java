package com.xiaowuyu.utils;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Classname Blocker
 * @Description TODO
 * @Date 2021/3/5 19:12
 * @Created by Admin
 */
public class Blocker implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        request.setCharacterEncoding("UTF-8");
        int role =0;
        try {
            role =(Integer) request.getSession().getAttribute("role");
        }catch (Exception e) {
            request.getRequestDispatcher("/WEB-INF/Home/404.jsp").forward(request,response);

            return false;

        }




            if (role==1){
                return true;
            }
        request.getRequestDispatcher("/WEB-INF/Home/404.jsp").forward(request,response);
        return false;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
