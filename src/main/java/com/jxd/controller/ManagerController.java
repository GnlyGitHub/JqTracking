package com.jxd.controller;

import com.jxd.model.Manager;
import com.jxd.service.IManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("login_Manage")
    public String login_Manage(Model model){
        Manager manager=new Manager(5001,"小红",2,"15613132","2020-1-2",3,2);
        return "empManage";
    }
}
