package com.jxd.service.impl;

import com.jxd.dao.IScoreDao;
import com.jxd.model.Score;
import com.jxd.service.IScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:10
 */
@Service
public class ScoreServiceImpl implements IScoreService {
    @Autowired
    IScoreDao scoreDao;

    @Override
    public boolean addScore_Teacher(List<Score> list) {
        return scoreDao.addScore_Teacher(list);
    }

    @Override
    public boolean editScore_Teacher(List<Score> list) {
        return scoreDao.editScore_Teacher(list);
    }

    @Override
    public List<Score> getScoreBySId_Teacher(Integer sId) {
        return scoreDao.getScoreBySId_Teacher(sId);
    }
}
