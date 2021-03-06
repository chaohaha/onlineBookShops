package com.xiaowuyu.service;

import com.xiaowuyu.dao.OrderItemMapper;
import com.xiaowuyu.dao.OrderMapper;
import com.xiaowuyu.pojo.OrderItems;

import java.util.List;

public class OrderItemServiceImpl implements OrderItemService{
    //调用dao层的操作，设置一个set接口，方便Spring管理
    private OrderItemMapper orderItemMapper;

    public void setOrderItemMapper(OrderItemMapper orderItemMapper) {
        this.orderItemMapper = orderItemMapper;
    }

    public int addOrderItem(OrderItems orderItems) {return orderItemMapper.addOrderItem(orderItems);}

    public List<OrderItems> queryOrderByBook_name(String book_name){return orderItemMapper.queryOrderByBook_name(book_name);}

    public List<OrderItems> queryAllOrderItem(int order_id){return orderItemMapper.queryAllOrderItem(order_id);}

    public OrderItems orderItemById(String s) {
        return orderItemMapper.orderItemById(s);
    }

    public int deleteorderItemByOrder_id(String orderId) {
        return orderItemMapper.deleteorderItemByOrder_id(orderId);
    }

    ;
}
