package com.xiaowuyu.service;

import com.xiaowuyu.dao.CartMapper;
import com.xiaowuyu.pojo.Cart;

import java.util.List;

public class CartServiceImpl implements CartService{

    //调用dao层的操作，设置一个set接口，方便Spring管理
    private CartMapper cartMapper;

    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    public List<Cart> queryAllCart(int user_id){return cartMapper.queryAllCart(user_id);}

    public Cart queryCartByCart_id(int cart_id){return cartMapper.queryCartByCart_id(cart_id);}

    public Cart queryCartByUser_idAndBook_id(int user_id, int book_id){return cartMapper.queryCartByUser_idAndBook_id(user_id,book_id);}

    public int addCart(Cart cart){return cartMapper.addCart(cart);}

    public int plusCart(Cart cart){return cartMapper.plusCart(cart);}

    public int minusCart(Cart cart){return cartMapper.minusCart(cart);}

    public int deleteByCart_id(int cart_id){return cartMapper.deleteByCart_id(cart_id);};

    public int deleteAll(int user_id){return cartMapper.deleteAll(user_id);};
}
