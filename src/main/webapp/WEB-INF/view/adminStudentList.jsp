<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/14
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生管理</title>
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
                <li class="layui-nav-item layui-this"><a href="adminStudentList">学生管理</a></li>
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
                    <div class="layui-input-inline" style="padding-right: 20px">
                        <div class="layui-input-inline">
                            <h2>项目经理管理</h2>
                        </div>
                        <div class="layui-input-inline" style="padding-left: 280px">
                            <label style="font-size: 15px">选择班期&nbsp;&nbsp;</label>
                            <div class="layui-input-inline">
                                <select id="sClass" name="sClass" lay-filter="test" lay-verify="required">
                                    <option value="">所有班期</option>
                                </select>
                            </div>
                        </div>
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
        {{#  if(d.sSex == 1){ }}
        男
        {{#  } else { }}
        女
        {{#  } }}
    </script>

</div>
<script>
    layui.use(['element', 'table', 'layer', 'form'], function () {
        var element = layui.element;
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.$;
        var form = layui.form;

        //向表格加载数据
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo' //添加工具栏
            , height: 450
            , width: 1080
            , url: '/getAllStudent_admin' //数据接口
            , page: true
            , limit: 8
            , limits: [8, 15, 20]
            , cols: [[
                /*{type: 'checkbox'}*/
                {field: 'sId', title: '工号', width: 80, sort: true}
                , {field: 'sName', title: '姓名', width: 100}
                , {field: 'sSex', title: '性别', width: 80, templet: '#titleTpl'}
                , {field: 'sBirthday', title: '出生年月', width: 120}
                , {field: 'sSchool', title: '学校', width: 170}
                , {field: 'sMajor', title: '专业', width: 200}
                , {field: 'sClass', title: '班期号', width: 150, hide: true}
                , {
                    field: 'className', title: '班期', width: 150, templet: function (data) {
                        return data.aClass.className
                    }
                }
                , {fixed: 'right', title: '操作', width: 170, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        //向班期下拉框添加数据
        var getAllClass = function () {
            $.ajax({
                url: '/getAllClass_admin',
                dataType: 'json',
                data: {'state': 0},
                type: 'post',
                success: function (data) {
                    $.each(data.data, function (index, item) {
                        $('#sClass').append(new Option(item.className, item.classId));//下拉菜单里添加元素
                    });
                    layui.form.render("select");
                }
            });
        };

        getAllClass();

        //表格头部工具栏事件
        table.on('toolbar(test)', function (obj) {
            switch (obj.event) {
                case 'query'://查询
                    var filter = $("#filter").val();
                    //重新加载表格
                    table.reload("demo", {
                        where: {
                            sName: filter,
                            sClass: $("#sClass").val()
                        },
                        page: {
                            curr: 1
                        }
                    });
                    getAllClass();
                    break;
                case 'add'://添加
                    layer.open({
                        type: 2,
                        title: '添加学生',
                        content: 'adminAddStudent',
                        shadeClose: true,
                        area: ['700px', '500px']
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
                    title: '修改学生信息',
                    content: "adminEditStudent?sId=" + data.sId + "&sPlace=" + data.sPlace,
                    shadeClose: true,
                    area: ['700px', '500px'],
                    end: function () {
                        //刷新当前页
                        $(".layui-laypage-btn").click();
                    }
                });
            } else if (obj.event === 'delete') {//删除
                layer.confirm('确定要删除吗？', function (index) {
                    $.ajax({
                        url: 'delStudentById_admin',
                        type: 'post',
                        data: {
                            sId: data.sId
                        },
                        success: function (data) {
                            if (data == "true") {
                                layer.msg("删除成功")
                            } else if (data == "1") {
                                layer.msg("该学生已入职，无法删除")
                            } else {
                                layer.msg("删除失败")
                            }
                            table.reload("demo", function () {
                                url:'getAllStudent_admin'
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
