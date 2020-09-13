<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/12
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评价制作</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-table-tool-self {
            display: none;
        }
        .layui-icon-ok  {
            margin-top: 8px;
        }
    </style>
</head>
<body>
<div align="center">
    <h1 style="margin: 30px 0 20px 0">评价表列表</h1>
    <table id="demo" lay-filter="test"></table>
</div>
<script type="text/html" id="toolbarDemo">
    <div align="right">
        <div class="layui-input-inline " ><input type="text" id="filter" placeholder="请输入班期名" class="layui-input"></div>
        <div class="layui-input-inline">
            <button class="layui-btn layui-btn-sm layui-btn-warm" lay-event="query">查询</button>
            <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delete">删除</button>
        </div>
    </div>

</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="titleTpl">
    {{#  if(d.number == 0){ }}
    转正
    {{#  } else if(d.number==1){ }}
    一年
    {{#  }else if(d.number==2){ }}
    两年
    {{#  }else { }}
    三年
    {{# } }}
</script>
<script type="text/html" id="titleTp2">
    {{#  if(true){ }}

    {{# } }}
</script>
<script>
    layui.use(['table', 'layer','jquery'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $=layui.jquery;//内置jQuery
        //第一个实例
        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo'//添加工具栏
            , height: 400
            , width: 650
            ,even:true
            , url: '/GetAllAppraise_Manage/${sessionScope.manage.mId}' //数据接口
            , page: true //开启分页
            ,limit:5//每页显示几条数据
            ,limits:[5,10,15,20]
            , cols: [[ //表头
                {type: 'checkbox'}
                ,{type:'numbers',title:'序号'}
                ,{field:'id',title:'评价表编号',hide:true}
                ,{field:'aClass.className',title:'班期名',width:150,templet: function (data) {
                        return data.aClass.className;
                    }}
                ,{field:'number',title:'在职状态',width:120,templet: '#titleTpl'}
                ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
            ]]
        });
        //监听事件，监听lay-filter为"test"的员工的工具栏
        table.on('toolbar(test)', function (obj) {
            switch (obj.event) {
                case'query':
                    var filter=$("#filter").val();
                    table.reload("demo",{//demo对应是tableid，where对应的是过滤条件
                        where:{mname:filter},
                        page:{
                            curr:1
                        }
                    })
                    break;
                case 'add':
                    layer.open({
                        type: 2, //弹出完整div，type：1弹出隐藏div
                        title: '新增评论表',
                        content: 'AddDisAppraise_Manage',
                        shadeClose: true,    //点击遮罩关闭弹框
                        area: ['450px', '500px']
                    })
                    break;
                case 'delete':
                    //获取选中行
                    var checkStatus = table.checkStatus('demo'); //demo为表格id
                    //获取选中行的数据
                    var data = checkStatus.data;
                    if (data.length < 1) {
                        layer.msg("请选择要删除的数据！")
                    } else {
                        layer.confirm('确定要删除吗？','学生删除',function () {
                            var ids = "";
                            for (var i = 0; i < data.length; i++) {
                                ids +=data[i].id + ",";
                            }
                            ids = ids.substring(0, ids.length - 1);
                            $.ajax({
                                url: 'deleteStudent',
                                type: 'post',
                                data: {
                                    id: ids
                                },
                                success: function (data) {
                                    if (true==data) {
                                        layer.msg("删除成功")
                                    } else {
                                        layer.msg("删除失败")
                                    }
                                    table.reload("demo", function () {
                                        url:'GetAllStudent'
                                    })
                                },
                                error: function () {
                                    layer.msg("执行失败")
                                }
                            })
                        })
                    }
                    break;
            }
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                var empnos = data.mid;
                //根据员工编号获取员工信息
                //location.href="GetEmpByEmpnoServlet?empnos="+empnos;
                layer.open({
                    type: 2, //弹出完整div，type：1弹出隐藏div
                    title: '新闻查看',
                    content: 'DetailJurgeServlet?mid=' + empnos,
                    shadeClose: true,    //点击遮罩关闭弹框
                    area: ['380px', '460px']
                })
            } else if(layEvent === 'del'){
                layer.confirm('确定要删除吗？','删除新闻',function () {
                    var empNums = "";
                    empNums +=data.mid + ",";
                    empNums = empNums.substring(0, empNums.length - 1);
                    $.ajax({
                        url: 'DeleteMsgServlet',
                        type: 'post',
                        data: {
                            mid: empNums
                        },
                        success: function (data) {
                            if (data) {
                                layer.msg("删除成功")
                            } else {
                                layer.msg("删除失败")
                            }
                            table.reload("demo", function () {
                                url:'GetAllMsgServlet'
                            })
                        },
                        error: function () {
                            layer.msg("执行失败")
                        }
                    })
                })
            } else if(layEvent === 'edit'){
                if (data.length<1){
                    layer.msg("请选择一条要编辑的数据")
                }else if (data.length>1){
                    layer.msg("只能选择一条数据进行编辑")
                }else {
                    //获取要编辑的员工编号
                    var empnos = data.mid;
                    //根据员工编号获取员工信息
                    //location.href="GetEmpByEmpnoServlet?empnos="+empnos;
                    layer.open({
                        type: 2, //弹出完整div，type：1弹出隐藏div
                        title: '新闻编辑',
                        content: 'GetMsgByMidServlet?mid=' + empnos,
                        shadeClose: true,    //点击遮罩关闭弹框
                        area: ['450px', '500px'],
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
