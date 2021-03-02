package com.xiaowuyu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders {
    private int order_id;
    private int user_id;
    private Date order_create_time;
    private Date order_complete_time;
    private double order_totalPrice;
    private int order_status;
    private String order_remark;
    private Users users;
}
