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
    private String category_id;
    private double book_price;
    private int book_counts;
    private int book_sales;
    private String book_image;
    private String book_details;
    private int book_type;
    private Category category;
}
