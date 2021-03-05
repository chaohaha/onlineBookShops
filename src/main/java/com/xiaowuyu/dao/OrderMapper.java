package com.xiaowuyu.dao;

import com.xiaowuyu.pojo.Orders;
import com.xiaowuyu.pojo.Users;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface OrderMapper {
    //增加一个Order
    @Insert("INSERT INTO orders VALUE(${order_id},${user_id},${order_create_time}," +
            "${order_complete_time},${order_totalPrice},${order_status}," +
            "${order_remark})")
    int addOrders(Orders orders);


    int addOrder(Orders orders);

    //根据id删除一个Order
    int deleteOrderByOrder_id(@Param("order_id") int order_id);

    //更新Order
    int updateOrder(Orders orders);

    //根据id查询,返回一个Order
    Orders queryOrderByOrder_id(@Param("order_id") int order_id);

    //查询全部Order,返回list集合
    List<Orders> queryAllOrder();

    //查询一个userd的全部Order,返回list集合
    List<Orders> queryAllUserOrder(@Param("user_id") int user_id);
}
