package com.jxd.controller;

import com.jxd.service.IDisAppraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 16:09
 */
@Controller
public class DisAppraiseController {
    @Autowired
    IDisAppraiseService disAppraiseService;
}
