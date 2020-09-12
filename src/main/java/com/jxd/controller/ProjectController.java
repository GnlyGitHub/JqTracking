package com.jxd.controller;

import com.jxd.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 15:18
 */
@Controller
public class ProjectController {
    @Autowired
    IProjectService projectService;
}
