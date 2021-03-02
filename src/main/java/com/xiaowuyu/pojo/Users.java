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
}
