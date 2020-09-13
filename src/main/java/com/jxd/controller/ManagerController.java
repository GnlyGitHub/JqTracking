package com.jxd.controller;

import com.jxd.model.Manager;
import com.jxd.service.IManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:50
 */
@Controller
@SessionAttributes("manage")
public class ManagerController {
    @Autowired
    IManagerService managerService;
    @RequestMapping("/adminManagerList")
    public String adminTeacherList(){
        return "adminManagerList";
    }
    @RequestMapping("login_Manage")
    public String login_Manage(Model model) {
        Manager manager = new Manager(5002, "小红", 2, "15613132", "2020-1-2", 3, 2);
        model.addAttribute("manage", manager);
        return "empManage";
    }
}
