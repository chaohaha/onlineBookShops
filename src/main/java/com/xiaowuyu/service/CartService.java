package com.xiaowuyu.service;

import com.xiaowuyu.pojo.Cart;

import java.util.List;

public interface CartService {
    List<Cart> queryAllCart(int user_id);

    Cart queryCartByCart_id(int cart_id);

    Cart queryCartByUser_idAndBook_id(int user_id, int book_id);

    int addCart(Cart cart);

    int plusCart(Cart cart);

    int minusCart(Cart cart);

    int deleteByCart_id(int cart_id);

    int deleteAll(int user_id);
}
