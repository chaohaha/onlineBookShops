package com.xiaowuyu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class TestController {

    @RequestMapping("/{page}")
    public String getPages(@PathVariable("page") String page){
        return "admin/"+page;
    }
}
