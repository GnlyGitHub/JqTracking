package com.jxd.model;

/**
 * @author Liang Yue
 * @description 管理员
 * @date 2020/9/12 10:15
 */
public class Admin {
    private Integer aId;//编号
    private String aName;//姓名
    private Integer role;//角色

    public Admin() {
    }

    public Admin(Integer aId, String aName, Integer role) {
        this.aId = aId;
        this.aName = aName;
        this.role = role;
    }

    public Admin(String aName, Integer role) {
        this.aName = aName;
        this.role = role;
    }

    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}
