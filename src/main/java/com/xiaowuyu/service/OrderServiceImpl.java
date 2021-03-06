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

    public int deleteOrderByOrder_id(String order_id) {
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

    public int addOrders(Orders orders) {
        return orderMapper.addOrders(orders);
    }

    /*更新订单*/
    public int updateOrderSend(Orders orders) {
        return orderMapper.updateOrderSend(orders);
    }

    public List<Orders> orderAll() {
        return orderMapper.orderAll();
    }

    public List<Orders> orderByIdANdUserIDAndstatus(String orderSel) {
        return orderMapper.orderByIdANdUserIDAndstatus(orderSel);
    }

    public Orders orderByIdAll(String order_id) {
        return orderMapper.orderByIdAll(order_id);
    }

    public int orderUpdate(Orders orders) {
        return orderMapper.orderUpdate(orders);
    }

    public int orderUpdateByID(String orderId) {
        return orderMapper.orderUpdateByID(orderId);
    }
}
