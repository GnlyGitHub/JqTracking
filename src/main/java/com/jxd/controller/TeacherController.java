package com.jxd.controller;

import com.jxd.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:49
 */
@Controller
public class TeacherController {
    @Autowired
    ITeacherService teacherService;
}
