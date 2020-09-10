package com.jxd.model;

/**
 * @author Liang Yue
 * @description 登录用户类
 * @date 2020/9/10 19:38
 */
public class LoginUser {
    private Integer uId;//序号
    private String userName;//用户名
    private String password;//密码
    private Integer role;//登录角色

    public LoginUser() {
    }

    public LoginUser(Integer uId, String userName, String password, Integer role) {
        this.uId = uId;
        this.userName = userName;
        this.password = password;
        this.role = role;
    }

    public LoginUser(String userName, String password, Integer role) {
        this.userName = userName;
        this.password = password;
        this.role = role;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}
