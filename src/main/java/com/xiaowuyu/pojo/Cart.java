package com.xiaowuyu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private int cart_id;
    private int book_id;
    private String book_name;
    private int user_id;
    private int cart_counts;
    private double cart_price;

    private HashMap<String,Cart> map = new LinkedHashMap();
    private double totalPrice;

    public double getTotalPrice(){
        double temp = 0;
        for (Map.Entry<String, Cart> cartEntry : map.entrySet()) {
            Cart cart = cartEntry.getValue();
            temp = temp + cart.getCart_counts() * cart.getCart_price();
        }
        this.totalPrice = temp;
        return totalPrice;
    }
}
