package com.xiaowuyu.controller;

import com.xiaowuyu.pojo.Books;
import com.xiaowuyu.pojo.Cart;
import com.xiaowuyu.pojo.Users;
import com.xiaowuyu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
/*@RequestMapping("/cart")*/
public class CartController {

    @Autowired
    @Qualifier("CartServiceImpl")
    private CartService cartService;

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    /*跳转购物车 需要session*/
    @RequestMapping("/allCart")
    public String list(/*Model model, HttpSession session*/) {
       /* Users users = (Users) session.getAttribute("user");
        int user_id = users.getUser_id();
        List<Cart> list = cartService.queryAllCart(user_id);
        model.addAttribute("list", list);*/
        return "Cart";
    }

    @RequestMapping("/toAddCart")
    public String toAddPaper(Cart cart, int book_id, Model model, HttpSession session) {
        Books books=bookService.queryBookByBook_id(book_id);
        cart.setBook_id(book_id);
        cart.setBook_name(books.getBook_name());
        cart.setCart_price(books.getBook_price());
        Users users=(Users) session.getAttribute("user");
        cart.setUser_id(users.getUser_id());
        model.addAttribute("cart",cart);
        session.setAttribute("cart",cart);
        return "redirect:/cart/addCart";
    }

    @RequestMapping("/addCart")
    public String addPaper(Cart cart, HttpSession session) {
        cart=(Cart) session.getAttribute("cart");
        Books books=bookService.queryBookByBook_id(cart.getBook_id());
        //购物车中的商品数量不能超过库存数量
        if(cart.getCart_counts()>=books.getBook_counts()){

        }
        //如果购物车里已有该商品，则+1
        if(cartService.queryCartByUser_idAndBook_id(cart.getUser_id(),cart.getBook_id())!=null){
            cartService.plusCart(cart);
            return "redirect:/book/allGoods";
        }
        cartService.addCart(cart);
        return "redirect:/book/allGoods";
    }

    @RequestMapping("/plusCart")
    public String plusCart(Model model, int cart_id) {
        Cart carts = cartService.queryCartByCart_id(cart_id);
        Books books=bookService.queryBookByBook_id(carts.getBook_id());
        model.addAttribute("cart",carts );
        //购物车中的商品数量不能超过库存数量
        if(carts.getCart_counts()>=books.getBook_counts()){

        }
        cartService.plusCart(carts);
        Cart cart = cartService.queryCartByCart_id(carts.getCart_id());
        model.addAttribute("cart", cart);
        return "redirect:/cart/allCart";
    }

    @RequestMapping("/minusCart")
    public String minusCart(Model model, int cart_id) {
        Cart carts = cartService.queryCartByCart_id(cart_id);
        model.addAttribute("cart",carts );
        cartService.minusCart(carts);
        if (carts.getCart_counts()==1){
            cartService.deleteByCart_id(carts.getCart_id());
            return "redirect:/cart/allCart";
        }
        Cart cart = cartService.queryCartByCart_id(carts.getCart_id());
        model.addAttribute("cart", cart);
        return "redirect:/cart/allCart";
    }

    @RequestMapping("/delAll/{user_id}")
    public String deleteAll(@PathVariable("user_id") int user_id) {
        cartService.deleteAll(user_id);
        return "redirect:/cart/allCart";
    }

}
