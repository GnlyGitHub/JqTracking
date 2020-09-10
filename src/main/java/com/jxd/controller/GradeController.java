package com.jxd.controller;

import com.jxd.service.IGradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:52
 */
@Controller
public class GradeController {
    @Autowired
    IGradeService gradeService;
}
