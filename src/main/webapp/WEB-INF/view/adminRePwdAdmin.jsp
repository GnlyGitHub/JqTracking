<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/17
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员修改登录密码</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">金桥学员跟踪系统</div>
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="#">
                    ${sessionScope.aName}
                </a>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域 -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="adminTeacherList">教师管理</a></li>
                <li class="layui-nav-item"><a href="adminManagerList">项目经理管理</a></li>
                <li class="layui-nav-item"><a href="adminStudentList">学生管理</a></li>
                <li class="layui-nav-item"><a href="adminSubjectList">课程管理</a></li>
                <li class="layui-nav-item layui-this"><a href="adminClassList">班期管理</a></li>
                <li class="layui-nav-item"><a href="adminAppraiseList">评分项管理</a></li>
                <li class="layui-nav-item"><a href="">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 0px;">
            <div class="layui-form" style="width: 500px;">
                <div class="layui-form-item">
                    <label class="layui-form-label">请输入原密码：</label>
                    <div class="layui-input-inline">
                        <input id="oldPwd" type="text" name="oldPwd" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">请输入新密码：</label>
                    <div class="layui-input-inline">
                        <input id="newPwd" type="text" name="newPwd" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">请再次输入新密码：</label>
                    <div class="layui-input-inline">
                        <input id="repPwd" type="text" name="repPwd" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item" style="display: flex; justify-content: center">
                    <div class="layui-input-inline">
                        <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © jxdinfo.com - 底部固定区域
    </div>
</div>
<script>
    layui.use(['element','layer'], function(){
        var element = layui.element;
        var layer = layui.layer;
        var $ = layui.$;

        $("#sub").click(function () {
            $.ajax({
                url:'rePwdAdmin_admin',
                type:'post',
                data:{
                    oldPwd: $("#oldPwd").val(),
                    newPwd: $("#newPwd").val(),
                    repPwd: $("#repPwd").val(),
                },
                dataType:'text',
                success:function (data) {
                    if (data == "true"){
                        layer.msg("修改成功");
                        setTimeout('toLogin()',1000);
                    } else {
                        layer.msg("修改失败");
                    }
                },
                error:function () {
                    layer.msg("执行失败");
                }
            })
        })
    });
    var toLogin = function () {
        location.href = "AfterRePwdAdmin_admin";
    }
</script>
</body>
</html>
