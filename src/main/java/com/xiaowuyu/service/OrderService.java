package com.xiaowuyu.service;

import com.xiaowuyu.pojo.Orders;

import java.util.List;

public interface OrderService {
    //增加一个Order
    int addOrder(Orders orders);

    //根据id删除一个Order
    int deleteOrderByOrder_id(int order_id);

    //更新Order
    int updateOrder(Orders orders);

    //根据id查询,返回一个Order
    Orders queryOrderByOrder_id(int order_id);

    //查询全部Order,返回list集合
    List<Orders> queryAllOrder();

    //查询一个userd的全部Order,返回list集合
    List<Orders> queryAllUserOrder(int user_id);

    int addOrders(Orders orders);
}
