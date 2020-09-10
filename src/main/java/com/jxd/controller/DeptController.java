package com.jxd.controller;

import com.jxd.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:52
 */
@Controller
public class DeptController {
    @Autowired
    IDeptService deptService;
}
