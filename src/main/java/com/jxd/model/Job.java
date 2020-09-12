package com.jxd.model;

/**
 * @author Liang Yue
 * @description 职务
 * @date 2020/9/12 12:36
 */
public class Job {
    private Integer jobId;
    private String jobName;
    private Integer deptNo;

    public Job() {
    }

    public Job(Integer jobId, String jobName, Integer deptNo) {
        this.jobId = jobId;
        this.jobName = jobName;
        this.deptNo = deptNo;
    }

    public Job(String jobName, Integer deptNo) {
        this.jobName = jobName;
        this.deptNo = deptNo;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public Integer getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(Integer deptNo) {
        this.deptNo = deptNo;
    }
}
