package com.xiaowuyu.controller;

import com.xiaowuyu.pojo.Orders;
import com.xiaowuyu.pojo.Users;
import com.xiaowuyu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    @RequestMapping("/allUserOrder")
    public String list(Model model, HttpSession session) {
        Users users=(Users)session.getAttribute("user");
        List<Orders> list = orderService.queryAllUserOrder(users.getUser_id());
        model.addAttribute("list", list);
        return "allUserOrder";
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

    @RequestMapping("/toUpdateOrder")
    public String toUpdateOrder(Model model, int order_id) {
        Orders orders = orderService.queryOrderByOrder_id(order_id);
        System.out.println(orders);
        model.addAttribute("order",orders );
        return "updateOrder";
    }

    @RequestMapping("/updateOrder")
    public String updateOrder(Model model, Orders order) {
        System.out.println(order);
        orderService.updateOrder(order);
        Orders orders = orderService.queryOrderByOrder_id(order.getOrder_id());
        model.addAttribute("orders", orders);
        return "redirect:/order/allOrder";
    }

    @RequestMapping("/del/{order_id}")
    public String deleteOrder(@PathVariable("order_id") int order_id) {
        orderService.deleteOrderByOrder_id(order_id);
        return "redirect:/order/allOrder";
    }
}
