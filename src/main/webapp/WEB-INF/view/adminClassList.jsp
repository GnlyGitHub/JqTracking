<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/16
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>班期管理</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-table-tool-self {
            display: none;
        }

        .layui-icon-ok {
            margin-top: 7px;
        }

        .layui-table-tool-temp {
            padding-right: 0;
        }
    </style>
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
                    ${sessionScope.loginUser.userId}
                </a>
            </li>
            <li class="layui-nav-item"><a href="quit">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域 -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="adminTeacherList">教师管理</a></li>
                <li class="layui-nav-item"><a href="adminManagerList">项目经理管理</a></li>
                <li class="layui-nav-item"><a href="adminStudentList">学生管理</a></li>
                <li class="layui-nav-item"><a href="adminSubjectList">课程管理</a></li>
                <li class="layui-nav-item layui-this"><a href="adminClassList">班期管理</a></li>
                <li class="layui-nav-item"><a href="adminAppraiseList">评分项管理</a></li>
                <li class="layui-nav-item"><a href="adminRePwdAdmin">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 0px;">

            <div align="center">
                <table id="demo" lay-filter="test"></table>
            </div>

            <script type="text/html" id="toolbarDemo">
                <div align="right">
                    <div class="layui-input-inline" style="padding-right: 600px">
                        <h2>班期管理</h2>
                    </div>
                    <div class="layui-input-inline" style="margin-right: 10px">
                        <input id="filter" type="text" placeholder="请输入班期名" class="layui-input">
                    </div>
                    <div class="layui-input-inline">
                        <button class="layui-btn layui-btn-sm layui-btn-primary" lay-event="query">搜索</button>
                        <button class="layui-btn layui-btn-sm layui-btn-sx" lay-event="add">添加</button>
                    </div>
                </div>
            </script>

            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-xs" lay-event="update">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
            </script>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © jxdinfo.com - 底部固定区域
    </div>
</div>
<script>
    layui.use(['element', 'table', 'layer'], function () {
        var element = layui.element;
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.$;

        //向表格加载数据
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo' //添加工具栏
            , height: 450
            , width: 1080
            , url: '/getAllClasses_admin' //数据接口
            , page: true
            , limit: 8
            , limits: [8, 15, 20]
            , cols: [[
                /*{type: 'checkbox'}*/
                {field: 'classId', title: '班期号', width: 200, hide: true}
                , {field: 'className', title: '班期', width: 200, sort: true}
                , {field: 'startDate', title: '开课日期', width: 200}
                , {field: 'endDate', title: '结课日期', width: 200, templet: '#titleTpl'}
                , {field: 'tName', title: '代课教师', width: 220}
                , {fixed: 'right', title: '操作', width: 250, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        //表格头部工具栏事件
        table.on('toolbar(test)', function (obj) {
            switch (obj.event) {
                case 'query':
                    var filter = $("#filter").val();//获取过滤条件
                    //重新加载表格
                    table.reload("demo", {
                        where: {className: filter},
                        page: {
                            curr: 1
                        }
                    });
                    $("#filter").val(filter);
                    break;
                case 'add':
                    layer.open({
                        type: 2,
                        title: '添加班期',
                        content: 'adminAddClass',
                        shadeClose: true,
                        area: ['500px', '500px']
                    });
                    break;
            }
        });

        //表格行内工具栏事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;//获取当前行数据
            if (obj.event === 'update') {
                layer.open({
                    type: 2,
                    title: '修改班期信息',
                    content: "adminBeforeEditClass?classId=" + data.classId + "&tName=" + data.tName,
                    shadeClose: true,
                    area: ['500px', '500px'],
                    end: function () {
                        //刷新当前页
                        $(".layui-laypage-btn").click();
                    }
                });
            } else if (obj.event === 'delete') { //删除
                layer.confirm('确定要删除吗？', function (index) {
                    $.ajax({
                        url: 'delClassById_admin',
                        type: 'post',
                        data: {
                            classId: data.classId
                        },
                        success: function (data) {
                            if (data == "true") {
                                layer.msg("删除成功")
                            } else if (data == "1") {
                                layer.msg("改班期已分配学生，不能删除")
                            } else if (data == "2") {
                                layer.msg("改班期已开课，不能删除")
                            } else {
                                layer.msg("删除失败，请重试")
                            }
                            table.reload("demo", function () {
                                url:'getAllClasses_admin'
                            })
                        },
                        error: function () {
                            layer.msg("执行失败")
                        }
                    })
                });
            }
        });
    });
</script>
</body>
</html>
