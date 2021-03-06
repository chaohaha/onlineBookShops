package com.xiaowuyu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Classname Admin
 * @Description TODO
 * @Date 2021/3/6 22:02
 * @Created by Admin
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {

    private Integer admin_id;
    private String admin_name;
    private String admin_pwd;
    private String admin_email;
    private String admin_phone;
    private Integer admin_limit;

}
