package com.xiaowuyu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItems {
    private int orderItem_id;
    private int orderItem_num;
    private int book_id;
    private String book_name;
    private double orderItem_price;
    private String order_id;
}
