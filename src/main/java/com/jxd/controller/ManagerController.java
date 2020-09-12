package com.jxd.controller;

import com.jxd.service.IManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:50
 */
@Controller
public class ManagerController {
    @Autowired
    IManagerService managerService;

    @RequestMapping("/adminManagerList")
    public String adminTeacherList(){
        return "adminManagerList";
    }
}
