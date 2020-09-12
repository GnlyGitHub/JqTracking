package com.jxd.controller;

import com.jxd.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 10:19
 */
@Controller
public class AdminController {
    @Autowired
    IAdminService adminService;
}
