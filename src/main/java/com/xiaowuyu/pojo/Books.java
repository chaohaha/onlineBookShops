package com.xiaowuyu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Books {
    private int book_id;
    private String book_name;
    private String book_author;
    private String book_category;
    private double book_price;
    private int book_counts;
    private int book_sales;
    private String book_image;
    private String book_details;
    private String book_type;
}
