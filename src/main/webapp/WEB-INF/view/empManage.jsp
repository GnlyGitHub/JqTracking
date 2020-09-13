<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/12
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工评价表</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">新闻系统后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="img/admin.jpg" class="layui-nav-img">
                    ${}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/CleanSession_Manage">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="/makeAppraise_Manage" target="mainframe">员工评价表制作</a></li>
                <li class="layui-nav-item"><a href="/empAppraise_Manage" target="mainframe">员工评价</a></li>
                <li class="layui-nav-item"><a href="/editPassword_Manage" target="mainframe">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;"><iframe frameborder="1" class="layadmin-iframe" src="/empAppraise_Manage"
                                            style="width: 100%; height:90%;" id="mainframe"
                                            name="mainframe" scrolling="false"></iframe></div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script>

    //JavaScript代码区域
    layui.use(['layer','element','table'], function () {
        var element = layui.element;
        var layer=layui.layer;
        var table=layui.table;
    });
</script>
</body>
</html>
