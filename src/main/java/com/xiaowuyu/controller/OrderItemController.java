package com.xiaowuyu.controller;

import com.xiaowuyu.pojo.OrderItems;
import com.xiaowuyu.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/orderItem")
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

}
