<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/17
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<html>
<head>
    <title>修改评分</title>
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
                    <input id="appraiser" type="text" class="layui-input" value="">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" id="addGrade" lay-filter="formDemo">提交</button>
                </div>
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
                if (parseInt(value)<0||parseInt(value)>100) {
                    $("#checkNumber p").text("数字格式有误");
                    $("#checkNumber p").addClass("red");
                }else {
                    $("#checkNumber p").text("(请输入0-100)的整数");
                    $("#checkNumber p").removeClass("red");
                }
            }
        });
        /*获取数据*/
        var getGradeData = function (number) {
            $.ajax({
                url: 'getGradeData_Manage',
                type: 'get',
                data: {
                    sId:${stu.get("sId")},
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
            $(".displ").css("display", "none")
        }

//点击提交按钮
        $("#addGrade").click(function () {
            var number = $("#appraise option:checked").val();
            if (number != "") {
                var n=$("#checkNumber p").text()
                if (n=="(请输入0-100)的整数"){
                    var dataBak = [];   //定义一个空数组,用来存储之前编辑过的数据已经存放新数据
                    var tableBak = table.cache.tab1;
                    for (var i = 0; i < tableBak.length; i++) {
                        dataBak.push(tableBak[i]);      //将之前的数组备份
                    }
                    $.ajax({
                        url: 'editGradeData_Manage',
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
                                layer.msg("修改成功", {icon: 6, time: 1500});
                                setTimeout('close()', 1000)
                            } else {
                                layer.msg("修改失败", {icon: 5, time: 1500});
                                setTimeout('close()', 1000)
                            }
                        },
                        error: function () {
                            layer.msg("执行失败")
                        }
                    })
                }else {
                    layer.msg("数据格式有误", {icon: 5, time: 1500});
                }
            } else {
                layer.msg("请选择下拉框内容", {icon: 5, time: 1500})
            }
        })
        form.on('select(appraise)', function (data) {
            var number = data.value
            var time =
            <%=timediff%>
            var appraiseState =
            ${stu.get("appraiseState")}
            if (time >= 0 && time < 30) {
                clearData()
                layer.msg("无转正数据", {icon: 5, time: 1500})
                $('#addGrade').addClass("layui-btn-disabled").attr("disabled", true);
            } else if (time >= 90 && time < 366) {
                if (number != "") {
                    if (number == 1 || number == 2 || number == 3) {
                        clearData()
                        layer.msg("工作未满一年", {icon: 5, time: 1500})
                    } else if (number == 0) {
                        getGradeData(0)
                    }
                } else {
                    layer.msg("请选择下拉框", {time: 1500})
                }

            } else if (time >= 366 && time < 730) {
                if (number != "") {
                    if (number == 2 || number == 3) {
                        clearData()
                        layer.msg("工作未满两年", {icon: 5, time: 1500})
                    } else if (number == 0) {
                        clearData()
                        layer.msg("已评或超时", {icon: 5, time: 1500})
                    } else if (number == 1) {
                        getGradeData(1)
                    }
                } else {
                    layer.msg("请选择下拉框", {time: 1500})
                }

            } else if (time >= 730 && time < 1095) {
                if (number != "") {
                    if (number == 3) {
                        clearData()
                        layer.msg("工作未满三年", {icon: 5, time: 1500})
                    } else if (number == 0 || number == 1) {
                        clearData()
                        layer.msg("已评或超时", {icon: 5, time: 1500})
                    } else if (number == 2) {
                        getGradeData(2)
                    }
                } else {
                    layer.msg("请选择下拉框", {time: 1500})
                }
            } else if (time >= 1095 && time < 1460) {
                if (number != "") {
                    if (number == 0 || number == 1 || number == 2) {
                        clearData()
                        layer.msg("已评或超时", {icon: 5, time: 1500})
                    } else if (number == 3) {
                        getGradeData(3)
                    }
                } else {
                    layer.msg("请选择下拉框", {time: 1500})
                }
            } else {
                layer.msg("所有评价已结束", {icon: 5, time: 1500})
                $("#appraise option[value='']").prop("selected", "selected");
                layui.form.render("select")
            }
        })
    });
    //关闭当前层
    var close = function () {
        var index = parent.layer.getFrameIndex(window.name);//获取当前iframe层的索引
        parent.layer.close(index);
    }
</script>
</body>
</html>
