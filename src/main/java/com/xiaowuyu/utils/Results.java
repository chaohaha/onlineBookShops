package com.xiaowuyu.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Results {

    private  Integer code;
    private  String  msg;
    private  Object  data;

    public static Results setSuccess(Object data){

        return new Results(200,"success",data);
    }

    public static Results setSuccess(Object data, String msg){

        return new Results(200,msg,data);
    }

    public static Results setSuccess(int code, Object data, String msg){

        return new Results(code,msg,data);
    }
    public static Results setError(Object data){

        return new Results(500,"error",data);
    }



    public static Results setError(Object data, String msg){

        return new Results(500,msg,data);
    }

}
