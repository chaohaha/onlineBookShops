package com.xiaowuyu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/*分类实体类*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    private int category_id;
    private String category_code;
    private String category_name;
    private int category_level;
    private int category_preid;

}
