package com.xiaowuyu.dao;

import com.xiaowuyu.pojo.Cart;
import com.xiaowuyu.pojo.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryMapper {
    List<Category> queryAllCartgory();

    int categoryAdd(String category_name);

    int categoryDelete(Category category);

    Category categoryById(Category category);

    int categoryUpdate(Category category);
}
