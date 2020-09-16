<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/16
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改评价分项</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">编号</label>
            <div class="layui-input-inline">
                <label class="layui-form-label" id="appraiseId" style="position: relative; right: 80px"></label>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">评价分项</label>
            <div class="layui-input-inline">
                <input id="appraise" type="text" name="appraise" required value="${param.appraise}" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="display: flex; justify-content: center; margin-top: 30px; padding-left: 60px">
            <div class="layui-input-inline">
                <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
            </div>
        </div>
    </div>
</div>

<script>
    layui.use(['form','layer','upload'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        var upload = layui.upload;
        var appraiseId = ${param.appraiseId};
        $("#appraiseId").html(appraiseId);

        $("#sub").click(function () {
            $.ajax({
                url:'editAppraise_admin',
                type:'post',
                data:{
                    "appraiseId": appraiseId,
                    "appraise": $("#appraise").val()
                },
                dataType:'text',
                success:function (data) {
                    if (data == "true"){
                        layer.msg("修改成功");
                        setTimeout('close()',1000)
                    } else {
                        layer.msg("修改失败");
                        setTimeout('close()',1000)
                    }
                },
                error:function () {
                    layer.msg("执行失败");
                }
            })
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
