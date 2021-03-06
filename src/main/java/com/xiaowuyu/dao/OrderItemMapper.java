package com.xiaowuyu.dao;

import com.xiaowuyu.pojo.OrderItems;
import com.xiaowuyu.pojo.Orders;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderItemMapper {

    //增加一个Order
    int addOrderItem(OrderItems orderItems);

    //根据bName查询该书的购买记录,返回list集合
    List<OrderItems> queryOrderByBook_name(@Param("book_name") String book_ame);

    //查询全部Order,返回list集合
    List<OrderItems> queryAllOrderItem(@Param("order_id") int order_id);

    @Select("select * from orderitems where order_id=#{order_id}")
    OrderItems orderItemById(String order_id);

    @Delete("delete from orderitems where order_id = #{order_id}")
    int deleteorderItemByOrder_id(String order_id);
}
