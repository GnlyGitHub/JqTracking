<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/16
  Time: 18:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<html>
<head>
    <title>评分页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-input-block {
            width: 200px;
        }

        .layui-textarea {
            width: 300px;
            text-align: left;
        }

        .layui-unselect {
            padding-top: 5px;
            width: 130px;
        }

        .layui-form-label {
            padding-left: 1px;
            padding-right: 1px;
        }

        .layui-input {
            padding-left: 20px;
        }

        .layui-table-tool-self {
            display: none;
        }

        .displ {
            display: none;
        }
        .red {
            border: 1px solid #FF8765;
            background-color: #FFF2E5;
            outline: none;
        }
    </style>
</head>
<body>
<%
    String datetime2 = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间
    String datetime1 = new SimpleDateFormat("yyyy-MM-dd").format(request.getAttribute("sDate")); //获取系统时间
    DateFormat df = DateFormat.getDateInstance();
    long l1 = df.parse(datetime1).getTime(); //把字符串转化为时间
    long l2 = df.parse(datetime2).getTime();
    int timediff = (int) ((l2 - l1) / 3600000 / 24);
%>
<div style="width: 150px;padding-left: 50px">
    <div class="layui-form" style="width: 150px;margin-top: 25px">
        <div class="layui-form-item">
            <label class="layui-form-label">评价序数：</label>
            <div class="layui-input-block" style="width:70px">
                <select name="appraise" class="appraise" id="appraise" lay-filter="appraise">
                    <option value="">请选择序数</option>
                    <option value="0">转正</option>
                    <option value="1">一年</option>
                    <option value="2">两年</option>
                    <option value="3">三年</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" id="checkNumber">
                <p>(请输入0-100)的整数</p>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">请评分：</label>
            <div class="layui-input-block" id="div1">
                <table id="tab1" lay-filter="test"></table>
            </div>
        </div>
        <div class="displ">
            <div class="layui-form-item">
                <label class="layui-form-label">评价：</label>
                <div class="layui-input-block" id="div2">
               <textarea id="text1" rows="5" class="layui-textarea">

               </textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">评价人：</label>
                <div class="layui-input-block">
                    <input id="appraiser" type="text" class="layui-input" value="${sessionScope.manage.mName}">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="add" lay-filter="formDemo">提交</button>
            </div>
        </div>
    </div>
</div>
<script>
    //Demo
    layui.use(['form', 'layer', 'table'], function () {
        var form = layui.form;
        var $ = layui.$;
        var layer = layui.layer;
        var table = layui.table
        var getAllApp = function () {
            $.ajax({
                url: 'getAllAppraise_Manage',
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    $.each(data, function (index, item) {
                        var dataBak = [];   //定义一个空数组,用来存储之前编辑过的数据已经存放新数据
                        var tableBak = table.cache.tab1;
                        //获取之前编辑过的全部数据，前提是编辑数据是要更新缓存，stock_add_table 为表格的id
                        for (var i = 0; i < tableBak.length; i++) {
                            dataBak.push(tableBak[i]);      //将之前的数组备份
                        }
                        //在尾部新增一行空数据，实现增行效果
                        dataBak.push({
                            "appraiseId": item.appraiseId,
                            "appraise": item.appraise,
                            "grade": ""
                        });
                        table.reload("tab1", {
                            data: dataBak   // 将新数据重新载入表格
                        })
                    });
                    layui.form.render();
                    $(".displ").css("display", "none")
                },
                error: function () {
                    layer.msg("执行失败")
                }
            })
        }

        getAllApp()
        table.render({
            elem: '#tab1'
            , width: 305
            , even: true
            , data: [] //数据接口
            , page: false //关闭分页
            /*, limit: 5//每页显示几条数据
            , limits: [5, 10, 15, 20]*/
            , cols: [[ //表头
                , {type: 'numbers', title: '序号', width: 80}
                , {field: 'appraiseId', title: '评分编号', hide: true}
                , {field: 'appraise', title: '评分项', width: 130}
                , {field: 'grade', title: '评价分数', edit: 'text', width: 90}
            ]],
            /* done: function (res, curr, count) {
                 var i=$("#addGrade").css("diaplay")
                     let tableView = this.elem.next();
                     layui.each(res.data, function (i, item) {
                         tableView.find('tr[data-index=' + i + ']').find('td').data('edit', false);
                     })
             }*/
        });
        //监听单元格编辑
        table.on('edit(test)', function (obj) {
            $("#checkNumber p").text("(请输入0-100)的整数");
            $("#checkNumber p").removeClass("red");
            var value = obj.value //得到修改后的值
            var data1 = obj.data //得到所在行所有键值
            var field1 = obj.field; //得到字段
            if (isNaN(Number(data1.grade))) {
                $("#checkNumber p").text("数字格式有误");
                $("#checkNumber p").addClass("red");
            } else {
                if (parseInt(value) < 0 || parseInt(value) > 100) {
                    $("#checkNumber p").text("数字格式有误");
                    $("#checkNumber p").addClass("red");
                } else {
                    $("#checkNumber p").text("(请输入0-100)的整数");
                    $("#checkNumber p").removeClass("red");
                }
            }
        });
        var getAppra = function (number) {
            $.ajax({
                url: 'getDisAppraiseTable_Manage',
                type: 'get',
                data: {
                    number: number,
                    classId: ${classId},
                    mId:${sessionScope.manage.mId}
                },
                dataType: 'json',
                success: function (data) {
                    var tab = table.cache.tab1;
                    $.each(tab, function (index, item) {
                        tab.pop();
                    });
                    table.reload("tab1", {
                        data: tab   // 将新数据重新载入表格
                    })
                    layui.form.render();
                    $.each(data, function (index, item) {
                        var dataBak = [];   //定义一个空数组,用来存储之前编辑过的数据已经存放新数据
                        var tableBak = table.cache.tab1;
                        //获取之前编辑过的全部数据，前提是编辑数据是要更新缓存，stock_add_table 为表格的id
                        for (var i = 0; i < tableBak.length; i++) {
                            dataBak.push(tableBak[i]);      //将之前的数组备份
                        }
                        //在尾部新增一行空数据，实现增行效果
                        if (item.appraiseId != 10) {
                            dataBak.push({
                                "appraiseId": item.appraiseId,
                                "appraise": item.appraise,
                                "grade": ""
                            });
                        }
                        table.reload("tab1", {
                            data: dataBak   // 将新数据重新载入表格
                        })
                        /*  $("#tab1 tr:eq(' + index + ') td").css('edit', 'text');*/
                    });
                    $(".displ").css("display", "block")
                    layui.form.render();
                },
                error: function () {
                    layer.msg("表格获取失败")
                }
            })
        }
        /*获取数据*/
        var getGradeData = function (number) {
            $.ajax({
                url: 'getGradeData_Manage',
                type: 'get',
                data: {
                    sId:${sId},
                    number: number
                },
                dataType: 'json',
                success: function (data) {
                    var tab = table.cache.tab1;
                    $.each(tab, function (index, item) {
                        tab.pop();
                    });
                    table.reload("tab1", {
                        data: tab   // 将新数据重新载入表格
                    })
                    layui.form.render();
                    $.each(data, function (index, item) {
                        var dataBak = [];   //定义一个空数组,用来存储之前编辑过的数据已经存放新数据
                        var tableBak = table.cache.tab1;
                        //获取之前编辑过的全部数据，前提是编辑数据是要更新缓存，stock_add_table 为表格的id
                        for (var i = 0; i < tableBak.length; i++) {
                            dataBak.push(tableBak[i]);      //将之前的数组备份
                        }
                        //在尾部新增一行空数据，实现增行效果
                        if (item.appraise.appraiseId != 10) {
                            dataBak.push({
                                "appraiseId": item.appraise.appraiseId,
                                "appraise": item.appraise.appraise,
                                "grade": item.grade
                            });
                        }
                        $("#text1").text(item.grade)
                        $("#appraiser").val(item.appraiser)
                        table.reload("tab1", {
                            data: dataBak   // 将新数据重新载入表格
                        })

                    });
                    $(".displ").css("display", "block")
                    layui.form.render();
                },
                error: function () {
                    layer.msg("表格获取失败")
                }
            })
        }
        /*清空并隐藏*/
        var clearData = function () {
            var tab = table.cache.tab1;
            $.each(tab, function (index, item) {
                tab.pop();
            });
            table.reload("tab1", {
                data: tab   // 将新数据重新载入表格
            })
            layui.form.render();
            $("#text1").text("")
            $(".displ").css("display", "none")
        }
        var judgeAppState = function (time, number, appraiseState) {
            if (appraiseState >= parseInt(number) + 1) {
                getGradeData(parseInt(number))
                layer.msg("已评分", {icon: 5, time: 1500}, function () {
                    $('#add').addClass("layui-btn-disabled").attr("disabled", true);
                })
            } else {
                if (time >= 0 && time < 30) {
                    layer.msg("不能评价", {icon: 5, time: 1500})
                    $('#add').addClass("layui-btn-disabled").attr("disabled", true);
                    $('#add').addClass("layui-btn-disabled").attr("disabled", true);
                } else if (time >= 30 && time < 90) {
                    if (parseInt(number) >= 1) {
                        layer.msg("时间未到", {icon: 5, time: 1500})
                        clearData()
                        getAppra(parseInt(number))
                        $(".displ").css("display", "none")
                        $('#add').addClass("layui-btn-disabled").attr("disabled", true);
                    } else if (parseInt(number) == 0) {
                        $("#text1").text("")
                        getAppra(parseInt(number))
                            $('#add').removeClass("layui-btn-disabled").attr("disabled", false);
                    }
                } else if (time >= 366 && time < 730) {
                    if (parseInt(number) >= 2) {
                        layer.msg("时间未到", {icon: 5, time: 1500})
                        clearData()
                        getAppra(parseInt(number))
                        $('#add').addClass("layui-btn-disabled").attr("disabled", true);
                        $(".displ").css("display", "none")
                    } else if (parseInt(number) == 0) {
                        layer.msg("已评或过时", {icon: 5, time: 1500})
                        getGradeData(parseInt(number))
                        $('#add').addClass("layui-btn-disabled").attr("disabled", true);
                    } else if (parseInt(number) == 1) {
                        $("#text1").text("")
                        getAppra(parseInt(number))
                        $('#add').removeClass("layui-btn-disabled").attr("disabled", false);
                    }
                } else if (time >= 730 && time < 1095) {
                    if (parseInt(number) >= 3) {
                        layer.msg("时间未到", {icon: 5, time: 1500})
                        clearData()
                        getAppra(parseInt(number))
                        $('#add').addClass("layui-btn-disabled").attr("disabled", true);
                        $(".displ").css("display", "none")
                    } else if (parseInt(number) == 0 || parseInt(number) == 1) {
                        layer.msg("已评或过时", {icon: 5, time: 1500})
                        getGradeData(parseInt(number))
                        $('#add').addClass("layui-btn-disabled").attr("disabled", true);
                    } else if (parseInt(number) == 2) {
                        $("#text1").text("")
                        getAppra(parseInt(number))
                            $('#add').removeClass("layui-btn-disabled").attr("disabled", false);
                    }
                } else if (time >= 1095 && time < 1460) {
                    if (parseInt(number) == 3) {
                        $("#text1").text("")
                        getAppra(parseInt(number))
                        layer.msg("未评", {icon: 6, time: 1500}, function () {
                            $('#add').removeClass("layui-btn-disabled").attr("disabled", false);
                        })
                    } else {
                        layer.msg("已评或过时", {icon: 5, time: 1500})
                        getGradeData(parseInt(number))
                        $('#add').addClass("layui-btn-disabled").attr("disabled", true);
                    }
                } else {
                    layer.msg("全部已评", {icon: 6, time: 1500})
                    getAllApp()
                    $('#add').addClass("layui-btn-disabled").attr("disabled", true);
                }
            }
        }
        form.on('select(appraise)', function (data) {
            var number = data.value
            var time =
            <%=timediff%>
            var appraiseState =
            ${stu.get("appraiseState")}
            if (number != "") {
                if (number == 0) {
                    judgeAppState(time, number, appraiseState)
                } else if (number == 1) {
                    judgeAppState(time, number, appraiseState)
                } else if (number == 2) {
                    judgeAppState(time, number, appraiseState)
                } else if (number == 3) {
                    judgeAppState(time, number, appraiseState)
                }
            } else {
                layer.msg("请选择下拉框", {time: 1500})
            }
        })
        //点击提交按钮
        $("#add").click(function () {
            var number = $("#appraise option:checked").val();
            if (number != "") {
                var n = $("#checkNumber p").text()
                if (n == "(请输入0-100)的整数") {
                    /*获取数据判定是否存在成绩*/
                    $.ajax({
                        url: 'getGradeData_Manage',
                        type: 'get',
                        data: {
                            sId:${stu.get("sId")},
                            number: number
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.length == 0) {
                                var dataBak = [];   //定义一个空数组,用来存储之前编辑过的数据已经存放新数据
                                var tableBak = table.cache.tab1;
                                for (var i = 0; i < tableBak.length; i++) {
                                    dataBak.push(tableBak[i]);      //将之前的数组备份
                                }
                                $.ajax({
                                    url: 'addGradeData_Manage',
                                    type: 'get',
                                    data: {
                                        dataBak: JSON.stringify(dataBak),
                                        appraiser: $("#appraiser").val(),
                                        /*文本框内容*/
                                        appr: $("#text1").val(),
                                        sId:${stu.get("sId")},
                                        number: number
                                    },
                                    traditional: true,
                                    success: function (data) {
                                        if (true == data) {
                                            layer.msg("新增成功", {icon: 6, time: 1500});
                                            setTimeout('closeAdd()', 1000)
                                        } else {
                                            layer.msg("新增失败", {icon: 5, time: 1500});
                                        }
                                    },
                                    error: function () {
                                        layer.msg("执行失败")
                                    }
                                })
                            } else {
                                layer.msg("成绩已经存在")
                            }
                            $(".displ").css("display", "block")
                            layui.form.render();
                        },
                        error: function () {
                            layer.msg("表格获取失败")
                        }
                    })
                } else {
                    layer.msg("数据格式有误", {icon: 5, time: 1500});
                }
            } else {
                layer.msg("请选择下拉框内容", {icon: 5, time: 1500})
            }
        })
    });
    var closeAdd = function () {
        parent.location.reload();//刷新父页面
    }
</script>
</body>
</html>
