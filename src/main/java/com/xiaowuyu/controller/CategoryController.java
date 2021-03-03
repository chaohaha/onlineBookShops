package com.xiaowuyu.controller;

import com.xiaowuyu.pojo.Category;
import com.xiaowuyu.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 查询所有分类
     * @return categoryList集合到前台页面
     */
    @RequestMapping("categoryAll")
    public ModelAndView categoryAll(){
        ModelAndView mv = new ModelAndView();
        List<Category> categoryList = categoryService.queryAllCartgory();
        mv.addObject("categoryList",categoryList);
        mv.setViewName("admin/categoryadmin");
        return mv;
    }

    /**
     * 跳转分类新增页面
     */
    @RequestMapping("categoryAddOne")
    public String categoryAddOne(){
        return "admin/categoryadmin_add";
    }

    /**
     * 添加分类
     */
    @RequestMapping("categoryAdd")
    public String categoryAdd(String category_name){
        int i=categoryService.categoryAdd(category_name);
        if (i>0){
            return "redirect:categoryAll";
        }
        return "";
    }

    /**
     * 分类删除
     */
    @RequestMapping("categoryDelete")
    public String categoryDelete(Category category){
        int i= categoryService.categoryDelete(category);
        if (i>0){
            return "redirect:categoryAll";
        }
        return "";
    }

    @RequestMapping("categoryById")
    public ModelAndView categoryById(Category category){
        System.out.println(category);
        ModelAndView mv=new ModelAndView();
        Category category1=categoryService.categoryById(category);
        mv.addObject("category",category1);
        mv.setViewName("admin/categoryadmin_update");
        return mv;
    }

    /**
     * 分类修改
     */
    @RequestMapping("categoryUpdate")
    public String categoryUpdate(Category category){
        int i=categoryService.categoryUpdate(category);
        if (i>0){
            return "redirect:categoryAll";
        }
        return "";
    }

}
