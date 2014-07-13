<!--#include file = "artelManage.asp"-->
<!--#include file = "../admin-templates/HeadAndFoot.asp"-->
<%Call CheckAdmin(2)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>合作社成员管理</title>
<script src="../../js/jquery.js" type="text/javascript" ></script>
<script src="../../js/jquery-ui.js" type="text/javascript"></script>
<script src="../../js/jquery.form.js" type="text/javascript"></script>
<script src="../../js/admin.js" type="text/javascript"></script>
<script src="../../js/arteManage.js" type="text/javascript"></script>
<script src="../../js/jquery.fancybox-1.2.1.pack.js" type="text/javascript"></script>
<script src="../../js/jquery.tablesorter.min.js" type="text/javascript"></script>
<script src="../../js/jquery.tablesorter.pager.js" type="text/javascript"></script>
<link href="../../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../css/adminStyle.css" rel="stylesheet" type="text/css" />
<link href="../../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% Call Header%>
    <!--start  -->
<table id="articleTable" class="ui-widget ui-widget-content tableBlue tablesorter" border="0" cellspacing="0" cellpadding="0">
  <thead class="ui-widget-header">
    <tr>
     <th scope="col"><input type="checkbox" name="all" id="all" /></th>
      <th scope="col">图片</th>
      <th scope="col">基地名</th>
      <th scope="col">负责人</th>
      <th scope="col">地址</th>
      <th scope="col">面积</th>
      <th scope="col">蔬菜品种</th>
      <th scope="col">操作</th>
    </tr>
  </thead>
  <tbody>
    <%
	Call SelectAllArte
	%>
  </tbody>
</table>
<div id="pager" class="tablesorterPager ui-widget-header ui-corner-all">
<form>
    <img src="../images/pages/first.png" class="first"/>
    <img src="../images/pages/prev.png" class="prev"/>
    <input type="text" class="pagedisplay text ui-widget-content ui-corner-all" readonly="readonly"/>
    <img src="../images/pages/next.png" class="next"/>
    <img src="../images/pages/last.png" class="last"/>
    <select class="pagesize ui-widget-content ui-corner-all">
        <option selected="selected" value="10">10</option>

        <option value="20">20</option>
        <option value="30">30</option>
        <option  value="40">40</option>
    </select>
</form>
</div><!-- pager-->


<div id="delDialog" title="删除合作社成员">
    <form id="delForm" action="" method="post">
      你确定要删除 <span id="delArticleTitle" class="colorRed"></span> 吗？
      <input type="hidden" name="dId" id="dId" />
    </form>
  </div><!--delDialog -->
  <!--end start -->
<%Call Footer%>
</body>
</html>