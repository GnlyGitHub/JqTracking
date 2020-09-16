package com.jxd.service;

import com.jxd.model.LoginUser;

import java.util.List;

public interface ILoginUserService {
    /**
     * 添加登录账户
     * @param loginUser 要添加的登录账户
     * @return 是否添加成功
     */
    boolean addLoginUser_admin(LoginUser loginUser);

    /**
     * 删除登录账户
     * @param userId 要删除的登录账户名
     * @return 是否删除成功
     */
    boolean delLoginUser_admin(Integer userId);

    /**
     * 修改登录账户
     * @param loginUser 要修改的登录账户
     * @return 是否修改成功
     */
    boolean editLoginUser_admin(LoginUser loginUser);

    /**
     * @Description 登录验证
     * @params [loginUser]
     * @return java.util.List<com.jxd.model.LoginUser>
     **/
    List<LoginUser> loginCheck(LoginUser loginUser);

    /**
     * @Description 根据用户名查找密码
     * @params [userId]
     * @return java.lang.String
     **/
    String getPasswordById_Teacher(Integer userId);
}
