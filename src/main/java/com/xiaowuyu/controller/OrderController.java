package com.xiaowuyu.controller;

import com.xiaowuyu.pojo.*;
import com.xiaowuyu.service.*;
import com.xiaowuyu.utils.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
/*需要同一个头部，所以去掉*/
/*@RequestMapping("/order")*/
public class OrderController {
    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    @Autowired
    @Qualifier("OrderItemServiceImpl")
    private OrderItemService orderItemService;

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("CartServiceImpl")
    private CartService cartService;

    /*直接购买  购买书*/
   /* @RequestMapping("/booksBuy")
    public String booksBuy(Model model, HttpSession session,String id) {
        session.setAttribute();
        Users users=(Users)session.getAttribute("user");
        List<Orders> list = orderService.queryAllUserOrder(users.getUser_id());
        model.addAttribute("list", list);
        return "Order";
    }*/

    /**
     * 提交订单
     * @return
     */
    @Transactional
    @RequestMapping("/booksBuy")
    @ResponseBody
    public Results deleteProduct(@RequestParam("ids[]") String[] ids){
        for (String id : ids) {
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
            System.out.println(dateFormat);
            System.out.println("date=" + dateFormat.format(date.getTime()));
            System.out.println(id);
            int zid = Integer.parseInt(id);
            Cart cart = cartService.queryCartByCart_id(zid);
            /*购物车书id*/
            int book_id = cart.getBook_id();
            int user_id = cart.getUser_id();
            UUID uuid = UUID.randomUUID();
            String s = uuid.toString();
            System.out.println(uuid);
            System.out.println("购物车"+cart);
            Double jia=cart.getCart_price()*cart.getCart_counts();
            Users users = userService.queryUserByUser_id(user_id);
            Books books = bookService.queryBookByBook_id(book_id);
            System.out.println("书"+books);
            /*添加订单表*/
            Orders orders = new Orders(s,users.getUser_id(),dateFormat.format(date.getTime()),
                    null,jia,0,"",users);
            System.out.println("用户"+users);
            int i = orderService.addOrder(orders);
            System.out.println("订单表"+i);

            /*订单详情*/
            OrderItems orderItems = new OrderItems(0,
                    cart.getCart_counts(),book_id,cart.getBook_name(),jia,s);

            int i1 = orderItemService.addOrderItem(orderItems);
            System.out.println("订单详情表"+i1);
            int i2 = cartService.deleteByCart_id(cart.getCart_id());
            System.out.println("购物车删除"+i2);
            if (cart.getCart_counts()==0){
                int k=1/0;
            }
            int i3 = bookService.upBook(book_id, cart.getCart_counts());
            System.out.println("减库存"+i3+",cart.getCart_counts()");



        }

        /*Arrays.stream(ids).forEach((id)-> System.out.println(id));
        for (String id : ids) {
            System.out.println(id);
            Integer integer = iProductService.deleteProduct(id);
            System.out.println(integer);
        }
        System.out.println(ids);*/
        return Results.setSuccess("","提交成功！");
        /*return "redirect:/allCart";*/
    }


    /*需要得到登陆完成的 session 得user的id*/
    @RequestMapping("/allUserOrder")
    public String list(Model model, HttpSession session) {
        Users users=(Users)session.getAttribute("user");
        if (null==users){
            return "redirect:/toLogin";
        }
        List<Orders> list = orderService.queryAllUserOrder(users.getUser_id());
        model.addAttribute("list", list);
        System.out.println(list);
        return "Order";
    }

    @RequestMapping("/toAddOrder")
    public String toAddPaper() {
        return "addOrder";
    }

    @RequestMapping("/addOrder")
    public String addPaper(Orders orders) {
        System.out.println(orders);
        orderService.addOrder(orders);
        return "redirect:/order/allUserOrder";
    }

    /*删除订单*/
    @RequestMapping("/deleteOrderByOrderId")
    public String toUpdateOrder(String orderId) {
        System.out.println(orderId);
        int i = orderService.deleteOrderByOrder_id(orderId);
        System.out.println(i);
        return "redirect:/allUserOrder";
    }

    /*更新订单*/

    @RequestMapping("/updateOrderComplete")
    @ResponseBody
    public Results updateOrderComplete(String orderId) {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        String format1 = dateFormat.format(date.getTime());
        System.out.println(orderId);
        Orders orders = new Orders();
        String format = dateFormat.format(date.getTime());
        System.out.println(format);
        orders.setOrder_complete_time(format1);
        orders.setOrder_id(orderId);
        orders.setOrder_status(2);
        int i = orderService.updateOrderSend(orders);
        System.out.println(i);
        return Results.setSuccess("","收货成功！");
    }


   /* @RequestMapping("/updateOrder")
    public String updateOrder(Model model, Orders order) {
        System.out.println(order);
        orderService.updateOrder(order);
        Orders orders = orderService.deleteOrderByOrder_id(order.getOrder_id());
        model.addAttribute("orders", orders);
        return "redirect:/order/allOrder";
    }*/

    /*@RequestMapping("/del/{order_id}")
    public String deleteOrder(@PathVariable("order_id") int order_id) {
        orderService.deleteOrderByOrder_id(order_id);
        return "redirect:/order/allOrder";
    }*/
}
