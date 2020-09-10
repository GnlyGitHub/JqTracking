package com.jxd.controller;

import com.jxd.service.ISubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:50
 */
@Controller
public class SubjectController {
    @Autowired
    ISubjectService subjectService;
}
