package com.xiaowuyu.service;


import com.xiaowuyu.dao.CategoryMapper;
import com.xiaowuyu.pojo.Category;


import java.util.List;

public class CategoryServiceImpl implements CategoryService{

    private CategoryMapper categoryMapper;

    public List<Category> queryAllCartgory() {
        return categoryMapper.queryAllCartgory();
    }

    public int categoryAdd(String category_name) {
        int i=categoryMapper.categoryAdd(category_name);
        return i;
    }

    public int categoryDelete(Category category) {
        return categoryMapper.categoryDelete(category);
    }

    public Category categoryById(Category category) {
        return categoryMapper.categoryById(category);
    }

    public int categoryUpdate(Category category) {
        return categoryMapper.categoryUpdate(category);
    }

    public void setCategoryMapper(CategoryMapper categoryMapper) {
        this.categoryMapper=categoryMapper;
    }
}
