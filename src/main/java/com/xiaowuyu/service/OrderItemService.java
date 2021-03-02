package com.xiaowuyu.service;

import com.xiaowuyu.pojo.OrderItems;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderItemService {
    //增加一个Order
    int addOrderItem(OrderItems orderItems);

    //根据bName查询该书的购买记录,返回list集合
    List<OrderItems> queryOrderByBook_name(String book_name);

    //查询全部Order,返回list集合
    List<OrderItems> queryAllOrderItem(int order_id);
}
