package com.zero.system.controller;

import com.zero.system.config.ReloadSecuritySource;
import com.zero.system.service.RoleService;
import com.zero.system.util.AjaxResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @Classname RoleController
 * @Description None
 * @Date 2019/7/19 16:19
 * @Created by WDD
 */
@Controller
@RequestMapping("/manager")
public class TestController {

    @Autowired
    private AjaxResult ajaxResult;
    @Autowired
    private RoleService roleService;

    @Autowired
    private ReloadSecuritySource reloadSecuritySource;

    @GetMapping("/test")
    public String role(){

        //数据库
        //

        return "manager/test.html";
    }

    /**
     * @return
     */
    @RequestMapping("/test/post")
    @ResponseBody
    public Object roleList(@RequestParam(value = "name", defaultValue = "1") String name,
                            @RequestParam(value = "age", defaultValue = "5") Integer age,
                            String rid){
        Map<String,Object> rest = new HashMap();
        rest.put("code", 0);
        rest.put("msg", "");
        rest.put("name",name);
        rest.put("age", age);
        return rest;
    }

    /**
     * @return
     */
    @GetMapping("/test/get")
    public Object get(String name,
                         Integer age){
        Map<String,Object> rest = new HashMap();
        rest.put("code", 0);
        rest.put("msg", "get");
        rest.put("name",name);
        rest.put("age", age);
        return rest;
    }


}