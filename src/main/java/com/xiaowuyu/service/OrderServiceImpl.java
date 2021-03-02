package com.xiaowuyu.service;

import com.xiaowuyu.dao.OrderMapper;
import com.xiaowuyu.pojo.Orders;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class OrderServiceImpl implements OrderService{
    //调用dao层的操作，设置一个set接口，方便Spring管理
    private OrderMapper orderMapper;

    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    public int addOrder(Orders orders) {
        return orderMapper.addOrder(orders);
    }

    public int deleteOrderByOrder_id(int order_id) {
        return orderMapper.deleteOrderByOrder_id(order_id);
    }

    public int updateOrder(Orders books) {
        return orderMapper.updateOrder(books);
    }

    public Orders queryOrderByOrder_id(int order_id) {
        return orderMapper.queryOrderByOrder_id(order_id);
    }

    public List<Orders> queryAllOrder() {
        return orderMapper.queryAllOrder();
    }

    public List<Orders> queryAllUserOrder(int user_id){return orderMapper.queryAllUserOrder(user_id);}
}
