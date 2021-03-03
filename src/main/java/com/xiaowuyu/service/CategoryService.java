package com.xiaowuyu.service;

import com.xiaowuyu.pojo.Cart;
import com.xiaowuyu.pojo.Category;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CategoryService {
    List<Category> queryAllCartgory();

    int categoryAdd(String category_name);

    int categoryDelete(Category category);

    Category categoryById(Category category);

    int categoryUpdate(Category category);
}
