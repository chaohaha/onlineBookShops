package com.xiaowuyu.service;

import com.xiaowuyu.dao.CartMapper;
import com.xiaowuyu.dao.CategoryMapper;
import com.xiaowuyu.pojo.Cart;
import com.xiaowuyu.pojo.Category;

import java.util.List;

public class CategoryServiceImpl implements CategoryService{
    private CategoryMapper categoryMapper;

    public List<Category> queryAllCartgory() {
        return categoryMapper.queryAllCartgory();
    }

    public void setCategoryMapper(CategoryMapper categoryMapper) {
        this.categoryMapper=categoryMapper;
    }
}
