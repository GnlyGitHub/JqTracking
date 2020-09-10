package com.jxd.controller;

import com.jxd.service.IScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:51
 */
@Controller
public class ScoreController {
    @Autowired
    IScoreService scoreService;
}
