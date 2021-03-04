package com.xiaowuyu.dao;

import com.xiaowuyu.pojo.Cart;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CartMapper {
    List<Cart> queryAllCart(@Param("user_id")int user_id);

    Cart queryCartByCart_id(@Param("cart_id")int cart_id);

    Cart queryCartByUser_idAndBook_id(@Param("user_id")int user_id, @Param("book_id")int book_id);

    int addCart(Cart cart);

    int plusCart(Cart cart);

    int minusCart(Cart cart);

    int deleteByCart_id(@Param("cart_id")int cart_id);

    int deleteAll(@Param("user_id")int user_id);


    /*查看是否有订单*/
    @Select("select * from cart where user_id = #{user_id} and book_id = #{book_id}")
    Cart userAndCart(Cart cart);

    /*查看购物车商品数量*//*
    @Select("select * from cart where user_id = #{user_id} and book_id = #{book_id}")
    Cart CartByCartId(int books_id);*/

}
