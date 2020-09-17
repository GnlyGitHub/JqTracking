<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/12
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工评价表</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-table-tool-self {
            display: none;
        }

        .layui-icon-ok {
            margin-top: 8px;
        }
    </style>
</head>
<body>
<div align="center">
    <h1 style="margin: 30px 0 20px 0">员工列表</h1>
    <table id="demo" lay-filter="test"></table>
</div>
<script type="text/html" id="toolbarDemo">
    <div align="right">
        <label class="layui-form-label">班期：</label>
        <div class="layui-input-inline" style="width:112px ;margin-right: 77px">
            <select name="Class" id="Class" lay-filter="Class">
                <option value="">请选择班期</option>
            </select>
        </div>
        <div class="layui-input-inline "><input type="text" id="filterId" placeholder="请输入员工编号" class="layui-input">
        </div>
        <div class="layui-input-inline "><input type="text" id="filterName" placeholder="请输入员工姓名" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn layui-btn-sm layui-btn-warm" lay-event="query">查询</button>
        </div>
    </div>

</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="grade">评分</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">修改</a>
</script>
<script>
    layui.use(['table', 'layer', 'jquery'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;//内置jQuery
        //第一个实例
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo'//添加工具栏
            , height: 400
            , width: 850
            , even: true
            , url: '/GetAllStudent_Manage/${sessionScope.manage.projectId}' //数据接口
            , page: true //开启分页
            , limit: 5//每页显示几条数据
            , limits: [5, 10, 15, 20]
            , cols: [[ //表头
                {type: 'numbers', title: '序号'}
                , {field: 'sId', title: '员工编号'}
                ,{field:'sName',title:'员工姓名'}
                , {field: 'sClass', title: '班期编号',hide:true}
                , {
                    field: 'className', title: '班期名', width: 150, templet: function (data) {
                        return data.aClass.className;
                    }
                }
                , {field: 'sSchool', title: '毕业学校', width: 120}
                ,{field: 'sHireDate', title: '入职日期', width: 150}
                , {fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo'}
            ]]
        });
        var reloadClass = function () {
            $.ajax({
                url: 'getAllClass_Manage',
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    $.each(data, function (index, item) {
                        $('#Class').append(new Option(item.className, item.classId));//下拉菜单里添加元素
                    });
                    layui.form.render("select");
                },
                error: function () {
                    layer.msg("执行失败")
                }
            });
        }
        reloadClass();
        //监听事件，监听lay-filter为"test"的员工的工具栏
        table.on('toolbar(test)', function (obj) {
            switch (obj.event) {
                case'query':
                    var empId = $("#filterId").val();
                    var empName = $("#filterName").val();
                    var classId=$("#Class option:checked").val()
                    table.reload("demo", {//demo对应是tableid，where对应的是过滤条件
                        where: {
                            empId: empId,
                            empName:empName,
                            classId:classId
                        },
                        page: {
                            curr: 1
                        }
                    })
                    reloadClass();
                    break;
            }
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            var sid=data.sId
            var className=data.aClass.className
            var classId=data.aClass.classId
            if (layEvent === 'detail') {
                layer.open({
                    type: 2, //弹出完整div，type：1弹出隐藏div
                    title: '员工资料查看',
                    content: "detailEmpMsg_Manage?sId="+sid+"&className="+className+"&mId="+${sessionScope.manage.mId},
                    shadeClose: true,    //点击遮罩关闭弹框
                    area: ['830px', '500px']
                })
            } else if (layEvent === 'grade') {
               layer.open({
                   type:2,
                   title:'评分页面',
                   content:"addGrade_Manage?sId="+sid+"&classId="+classId,
                   shadeClose:true,
                   area:['500px','500px']
               })
            } else if (layEvent === 'edit') {
                if (data.length < 1) {
                    layer.msg("请选择一条要编辑的数据")
                } else if (data.length > 1) {
                    layer.msg("只能选择一条数据进行编辑")
                } else {
                    var classId = data.classId;
                    var number = data.number;
                    var className = data.aClass.className;
                    layer.open({
                        type: 2, //弹出完整div，type：1弹出隐藏div
                        title: '评价表编辑',
                        content: 'editDisAppraise_Manage?classId=' + classId + '&number=' + number + '&className=' + className + '&mId=' +${sessionScope.manage.mId},
                        shadeClose: true,    //点击遮罩关闭弹框
                        area: ['380px', '460px'],
                        end: function () {
                            //最后来通过点击当前页按钮来刷新当前页
                            $(".layui-laypage-btn").click();
                        }
                    })
                }
            }
        });
    });

</script>
</body>
</html>
