<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2017/8/29
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <title>生成房号</title>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/bootstrap/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="<%=path%>/public/css/ye/index-css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/public/plugins/easyui/themes/bootstrap/easyui.css"/>
</head>
<body>
<div class="col-lg-12">

    <form class="form-inline" id="addForm">
        <label for="buildings" class="control-label">选择楼盘</label>
        <select class="form-control" id="buildings" name="room.buildings.id" onchange="setBuilding(0)">

        </select>
        <a class="btn btn-primary" onclick="setBuilding();">确认</a>

        <label for="building" class="control-label">选择楼栋</label>
        <select class="form-control" id="building" name="room.building.id" onchange="setRoomTable()">

        </select>
        <a href="javascript:void(0)" class="btn btn-primary"
           onclick="setRoomTable();">确认</a>
    </form>
</div>

<table id="list" class="easyui-datagrid"
       data-options="
        singleSelect:true,  <!--是否支持多选-->
        collapsible:true,   <!--是否可以查询-->
        rownumbers:true,    <!--是否显示行数-->
        pagination:true,    <!--是否标记页码-->
        pageSize:20,        <!--分页的大小-->
        toolbar:'#tb',      <!--工具栏-->
        method:'get'">
    <thead>
    <tr>
        <th data-options="field:'id',width:60,checkbox:true"></th>
        <th data-options="field:'house',align:'center',formatter:formatName">户型</th>
        <th data-options="field:'building',align:'center',formatter:formatName">楼栋</th>
        <th data-options="field:'name',align:'center'">房号</th>
        <th data-options="field:'sale_status',align:'center'">销售状态</th>
    </tr>
    </thead>
</table>

<!--顶部栏-->
<div id="tb">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validActivity(1);">激活活动</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="validActivity(0);">冻结活动</a>
    <a href="javascript:void(0);" class="easyui-linkbutton"
       onclick="baseMessageActivity();">修改活动</a>
</div>

<script src="<%=path %>/public/plugins/jquery.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/public/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/public/plugins/easyui/site-easyui.js"></script>

<!--自己的js-->
<script src="<%= path %>/public/js/xie/agency_room.js"></script>
<script src="<%=path %>/public/js/xie/agency.js"></script>

<script>
    $(function () {
        setBuildings("${sessionScope.agency.id}");
        formatSaleStatus();
    })
</script>
</body>
</html>
