<%--
  Created by IntelliJ IDEA.
  User: ANA
  Date: 2020/9/16
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>老师修改密码</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">金桥学员跟踪系统(教师)</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="#">
                    ${sessionScope.teacher.tName}
                </a>
            </li>
            <li class="layui-nav-item"><a href="ALogoutServlet">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="studentAppraise">学生评价</a></li>
                <li class="layui-nav-item layui-this"><a href="teacherRePwd_Teacher">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="display: flex;justify-content: center;margin-top: 30px">
            <form class="layui-form changePwd" action="editPassword_Teacher" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" value="${sessionScope.loginUser.userId}" name="userId" id="userId" disabled class="layui-input layui-disabled">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">旧密码</label>
                    <div class="layui-input-block">
                        <input type="password" value="" placeholder="请输入旧密码" lay-verify="required|oldPwd" class="layui-input pwd">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-block">
                        <input type="password" placeholder="请输入新密码" lay-verify="required|newPwd" name="password" id="oldPwd" class="layui-input pwd">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <input type="password" value="" placeholder="请确认密码" lay-verify="required|confirmPwd"
                               class="layui-input pwd">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="changePwd">立即修改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                    <div align="center">
                        ${editMsg}
                    </div>

                </div>
            </form>
        </div>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            © jxdinfo.com - 底部固定区域
        </div>

    </div>

    <script>
        layui.use(['form', 'layer', 'upload'], function () {
            var form = layui.form;
            var layer = layui.layer;
            var $ = layui.$;

            // 校验两次密码是否一致
            form.verify({
                oldPwd : function(value, item){
                    if(value != "${sessionScope.loginUser.password}"){
                        return "密码错误，请重新输入！";
                    }
                },
                newPwd: function (value, item) {
                    if (value.length < 6) {
                        return "密码长度不能小于6位";
                    }
                },
                confirmPwd: function (value, item) {
                    if (!new RegExp($("#oldPwd").val()).test(value)) {
                        return "两次输入密码不一致，请重新输入！";
                    }
                }
            });


        });
        //关闭当前弹框
        var close = function () {
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        }
    </script>
</body>
</html>
