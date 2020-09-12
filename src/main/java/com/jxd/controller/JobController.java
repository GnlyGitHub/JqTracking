package com.jxd.controller;

import com.jxd.service.IJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 12:39
 */
@Controller
public class JobController {
    @Autowired
    IJobService jobService;
}
