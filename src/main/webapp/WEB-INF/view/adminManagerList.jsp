<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/12
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>项目经理管理</title>
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
                <li class="layui-nav-item layui-this"><a href="adminManagerList">项目经理管理</a></li>
                <li class="layui-nav-item"><a href="adminStudentList">学生管理</a></li>
                <li class="layui-nav-item"><a href="adminSubjectList">课程管理</a></li>
                <li class="layui-nav-item"><a href="adminClassList">班期管理</a></li>
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
                        <h2>项目经理管理</h2>
                    </div>
                    <div class="layui-input-inline" style="margin-right: 10px">
                        <input id="filter" type="text" placeholder="请输入姓名" class="layui-input">
                    </div>
                    <div class="layui-input-inline">
                        <button class="layui-btn layui-btn-sm layui-btn-primary" lay-event="query">搜索</button>
                        <button class="layui-btn layui-btn-sm layui-btn-sx" lay-event="add">添加</button>
                    </div>
                </div>
            </script>

            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-xs" lay-event="rePwd">重置密码</a>
                <a class="layui-btn layui-btn-xs" lay-event="update">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
            </script>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © jxdinfo.com - 底部固定区域
    </div>

    <script type="text/html" id="titleTpl">
        {{#  if(d.mSex == 1){ }}
        男
        {{#  } else { }}
        女
        {{#  } }}
    </script>

</div>
<script>
    layui.use(['element', 'table', 'layer'], function () {
        var element = layui.element;
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.$;

        //向表格添加数据
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo' //添加工具栏
            , height: 450
            , width: 1080
            , url: '/getAllManager_admin' //数据接口
            , page: true
            , limit: 8
            , limits: [8, 15, 20]
            //,dataType:"json"
            , cols: [[
                /*{type: 'checkbox'}*/
                {field: 'mId', title: '工号', width: 80, sort: true}
                , {field: 'mName', title: '姓名', width: 80}
                , {field: 'mSex', title: '性别', width: 80, templet: '#titleTpl'}
                , {field: 'mBirthday', title: '出生年月', width: 120}
                , {field: 'mPhone', title: '电话', width: 150}
                , {
                    field: 'dept.deptName', title: '部门', width: 150, templet: function (data) {
                        return data.dept.deptName
                    }
                }
                , {
                    field: 'project.projectName ', title: '项目', width: 155, templet: function (data) {
                        return data.project.projectName
                    }
                }
                , {fixed: 'right', title: '操作', width: 250, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        //表格头部工具栏事件
        table.on('toolbar(test)', function (obj) {
            switch (obj.event) {
                case 'query'://查询
                    var filter = $("#filter").val();//获取过滤条件
                    //重新加载表格
                    table.reload("demo", {
                        where: {mName: filter},
                        page: {
                            curr: 1
                        }
                    });
                    $("#filter").val(filter);
                    break;
                case 'add'://添加
                    layer.open({
                        type: 2,
                        title: '添加项目经理',
                        content: 'adminAddManager',
                        shadeClose: true,
                        area: ['455px', '470px']
                    });
                    break;
            }
        });

        //表格行内工具栏事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;//获取当前行数据
            if (obj.event === 'update') {//编辑
                layer.open({
                    type: 2,
                    title: '修改项目经理信息',
                    content: "adminEditManager?mId=" + data.mId,
                    shadeClose: true,
                    area: ['455px', '500px'],
                    end: function () {
                        //刷新当前页
                        $(".layui-laypage-btn").click();
                    }
                });
            } else if (obj.event === 'delete') {//删除
                layer.confirm('确定要删除吗？', function (index) {
                    $.ajax({
                        url: 'delManagerById_admin',
                        type: 'post',
                        data: {
                            mId: data.mId
                        },
                        success: function (data) {
                            if (data == "true") {
                                layer.msg("删除成功")
                            } else if (data == "1") {
                                layer.msg("该项目经理尚有工作未完成，无法删除")
                            } else {
                                layer.msg("删除失败")
                            }
                            table.reload("demo", function () {
                                url:'getAllManager_admin'
                            })
                        },
                        error: function () {
                            layer.msg("执行失败")
                        }
                    })
                });
            } else if (obj.event === 'rePwd') {//重置密码
                layer.open({
                    type: 2,
                    title: '重置密码',
                    content: 'adminRePwdManager?mId=' + data.mId,
                    shadeClose: true,
                    area: ['420px', '370px'],
                    end: function () {
                        //刷新当前页
                        $(".layui-laypage-btn").click();
                    }
                });
            }
        });
    });
</script>
</body>
</html>
