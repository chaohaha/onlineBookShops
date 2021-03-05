package com.xiaowuyu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
    private int user_id;
    private String user_name;
    private String user_pwd;
    private String user_email;
    private String user_phone;
    private String user_address;
    private int user_status;
    private int user_limit;
    private String user_image;


    // 信息修改构造


    public Users(String user_name, String user_email, String user_phone, String user_address, String user_image) {
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_phone = user_phone;
        this.user_address = user_address;
        this.user_image = user_image;
    }
}
