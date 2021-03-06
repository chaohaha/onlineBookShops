package com.xiaowuyu.controller;

import com.xiaowuyu.pojo.OrderItems;
import com.xiaowuyu.service.OrderItemService;
import com.xiaowuyu.utils.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
/*@RequestMapping("/orderItem")*/
public class OrderItemController {

    @Autowired
    @Qualifier("OrderItemServiceImpl")
    private OrderItemService orderItemService;

    @RequestMapping("/allOrderItem")
    public String list(Model model, int oId) {
        List<OrderItems> list = orderItemService.queryAllOrderItem(oId);
        model.addAttribute("list", list);
        return "OrderDetail";
    }
    @RequestMapping("/UserInfo")
    public String list(/*Model model, int oId*/) {
        /*List<OrderItems> list = orderItemService.queryAllOrderItem(oId);
        model.addAttribute("list", list);*/
        return "UserInfo";
    }

    @RequestMapping("/orderItemById")
    @ResponseBody
    public Results list( String order_id) {
        OrderItems orderItems = orderItemService.orderItemById(order_id);
        System.out.println("我是嘻嘻嘻"+orderItems);
        return Results.setSuccess(orderItems,"哈哈哈");
    }


}
