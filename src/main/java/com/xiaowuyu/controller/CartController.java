package com.xiaowuyu.controller;

import com.xiaowuyu.pojo.Books;
import com.xiaowuyu.pojo.Cart;
import com.xiaowuyu.pojo.Users;
import com.xiaowuyu.service.*;
import com.xiaowuyu.utils.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String list(Model model, HttpSession session) {
       Users users = (Users) session.getAttribute("user");
       if (null==users||null==users.getUser_name()){
           return "redirect:/toLogin";
       }
        int user_id = users.getUser_id();
        List<Cart> list = cartService.queryAllCart(user_id);
        model.addAttribute("list", list);
        return "Cart";
    }

    /**
     * 购物车数量增
     * @return
     * IncreaseOrDecrease
     */
    @RequestMapping("/Increase")
    public String Increase(Model model, int books_id,HttpSession session) {
        System.out.println("。。。。。");
        Cart cart = new Cart();
        Books books = bookService.queryBookByBook_id(books_id);
        int book_counts = books.getBook_counts();
        System.out.println(book_counts);
        Users users=(Users) session.getAttribute("user");
        int user_id = users.getUser_id();
        cart.setBook_id(books_id);
        cart.setUser_id(user_id);
        Cart cart1 = cartService.userAndCart(cart);
        System.out.println(cart1);
        int cart_counts = cart1.getCart_counts();
        System.out.println(cart_counts);
        if (cart1.getCart_counts()<book_counts){
            int i = cartService.plusCart(cart);
            if (i>0) {
                System.out.println("修改成功！");
            }
        }else {
            System.out.println("库存不足！");
        }
        return "redirect:/allCart";
    }

    /**
     * 购物车数量减
     * @param model
     * @param books_id
     * @return
     */
    @RequestMapping("/Decrease")
    public String Decrease(Model model, int books_id,HttpSession session) {
        System.out.println("。。。。。");
        Cart cart = new Cart();
        Books books = bookService.queryBookByBook_id(books_id);
        int book_counts = books.getBook_counts();
        System.out.println(book_counts);
        Users users=(Users) session.getAttribute("user");
        int user_id = users.getUser_id();
        cart.setBook_id(books_id);
        cart.setUser_id(user_id);
        Cart cart1 = cartService.userAndCart(cart);
        System.out.println(cart1);
        int cart_counts = cart1.getCart_counts();
        System.out.println(cart_counts);
        if (cart1.getCart_counts()>1){
            int i = cartService.minusCart(cart);
            if (i>0) {
                System.out.println("修改成功！");
            }
        }else {
            System.out.println("数量不能少于一！");
        }
        return "redirect:/allCart";
    }

    /*加入购物车*/
    @RequestMapping("/TAddCart")
    @ResponseBody
    public Results toAddPaper(Cart cart, int id,int p, HttpSession session) {
        System.out.println(id);
        System.out.println(p);
        Users users=(Users) session.getAttribute("user");
        if (null==users||null==users.getUser_pwd()){
            System.out.println("没登录");
            return Results.setError("","您还未登陆,跳转登陆页？");
        }else {
            Books books=bookService.queryBookByBook_id(id);
            int book_counts = books.getBook_counts();
            System.out.println("书籍库存");
            cart.setBook_id(id);
            cart.setBook_name(books.getBook_name());
            cart.setCart_price(books.getBook_price());
            cart.setUser_id(users.getUser_id());
            cart.setCart_counts(1);
            System.out.println(cart);
            System.out.println(users);
            Cart cart1 = cartService.userAndCart(cart);
            if (book_counts==0){
                cart.setCart_counts(0);
            }
            if(null!=cart1){
                cartService.plusCart(cart);
                System.out.println("没有");
                return Results.setSuccess(444,"","已有订单，前往购物车查看");
            }
            /*if (null==cart1||null==cart1.getBook_name()){
                System.out.println("已有订单，前往购物车查看");
                return Results.setSuccess("","已有订单，前往购物车查看");
            }*/
            /*int j = bookService.upBook(books.getBook_id(),-1);
            if (j>0){
                System.out.println("增减成功");
            }*/

            int i = cartService.addCart(cart);
            if (p==1){
                return Results.setSuccess(333,"","跳转购物车结算订单！");
            }
            if (i>0){
                System.out.println("添加陈功");
            }

        }
        return Results.setSuccess("","添加成功！");
    }

    /**
     * 删除购物车
     * @return
     */
    @RequestMapping("/DeleteCart")
    public String DeleteCart(int cartId){
        System.out.println(cartId);
        int i = cartService.deleteByCart_id(cartId);
        if (i>0){
            System.out.println("删除成功");
        }
        return "redirect:/allCart";
    }

    /*@RequestMapping("/toAddCart")
    public Results toAddPaper(Cart cart, int book_id, Model model, HttpSession session) {
        Books books=bookService.queryBookByBook_id(book_id);
        cart.setBook_id(book_id);
        cart.setBook_name(books.getBook_name());
        cart.setCart_price(books.getBook_price());
        Users users=(Users) session.getAttribute("user");
        cart.setUser_id(users.getUser_id());
        model.addAttribute("cart",cart);
        session.setAttribute("cart",cart);
        return Results.setSuccess();
    }*/

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
