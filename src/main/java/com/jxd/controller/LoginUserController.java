package com.jxd.controller;

import com.jxd.service.ILoginUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:49
 */
@Controller
public class LoginUserController {
    @Autowired
    ILoginUserService loginUserService;
    @RequestMapping("editPassword_Manage")
    public String editPassword_Manage(){
        return "empEditPassword";
    }
}
