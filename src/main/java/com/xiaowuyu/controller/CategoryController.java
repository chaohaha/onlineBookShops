package com.xiaowuyu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xiaowuyu.pojo.Category;
import com.xiaowuyu.service.CategoryService;
import com.xiaowuyu.utils.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public ModelAndView categoryAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
                                    @RequestParam(name = "size",required = true,defaultValue = "5") Integer pageSize
                                    ,Integer category_id){
        ModelAndView mv = new ModelAndView();
        PageHelper.startPage(page,pageSize);
        List<Category> categoryList = categoryService.categoryAll(category_id);
        PageInfo<Category> pageInfo = new PageInfo<Category>(categoryList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("admin/categoryadmin");
        return mv;
    }

    /**
     * 查询所有分类,传到前台ajax
     */

    @RequestMapping("categoryAllAjax")
    @ResponseBody
    public List<Category> categoryAllAjax(){
        List<Category> categoryList = categoryService.queryAllCartgory();
        return categoryList;
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
    public ModelAndView categoryUpdate(Category category,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,
                                 @RequestParam(name = "size",required = true,defaultValue = "5") Integer pageSize
                                ,Integer category_id){
        int i=categoryService.categoryUpdate(category);
        ModelAndView mv = new ModelAndView();
        if (i>0){
            PageHelper.startPage(page,pageSize);
            List<Category> categoryList = categoryService.categoryAll(category_id);
            PageInfo<Category> pageInfo = new PageInfo<Category>(categoryList);
            mv.addObject("pageInfo",pageInfo);
            mv.setViewName("admin/categoryadmin");
            return mv;
        }
        return mv;
    }

}
