<!--#include file = "proManage.asp"-->
<!--#include file = "../admin-templates/HeadAndFoot.asp"-->
<%Call CheckAdmin(2)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="../../js/jquery.js" type="text/javascript" ></script>
<script src="../../js/jquery-ui.js" type="text/javascript"></script>
<script src="../../js/jquery.form.js" type="text/javascript"></script>
<script src="../../js/admin.js" type="text/javascript"></script>
<script src="../../js/proManage.js" type="text/javascript"></script>
<script src="../../js/jquery.fancybox-1.2.1.pack.js" type="text/javascript"></script>
<script src="../../js/jquery.tablesorter.min.js" type="text/javascript"></script>
<script src="../../js/jquery.tablesorter.pager.js" type="text/javascript"></script>
<link href="../../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../css/adminStyle.css" rel="stylesheet" type="text/css" />
<link href="../../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />

<title>产品管理</title>
</head>

<body>
<% Call Header%>
<table id="articleTable" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-widget ui-widget-content tableBlue tablesorter">
<thead class="ui-widget-header">
  <tr>
    <th width="4%" scope="col"><input type="checkbox" name="all" id="all" /></th>
    <th width="11%" scope="col">编号</th>
    <th width="18%" class="textLeft" scope="col">名称</th>
    <th width="12%" scope="col">价格</th>
    <th width="26%" scope="col">描述</th>
    <th width="23%" scope="col">栏目</th>
    <th width="6%" scope="col">状态</th>
  </tr>
 </thead>
 <tbody>

  <%Call Selectproject%>
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
<div id="editArtDialog" title="快速修改产品">
    <form id="editForm" action="" method="post">
     <dl class="clearfix">
     	<dt>编号:</dt>
        <dd><input type="text" name="proNo" id="proNo" class="text ui-widget-content ui-corner-all" /></dd>
        <dt>名称:</dt>
        <dd><input type="text" name="proName" id="proName" class="text ui-widget-content ui-corner-all" /></dd>
        <dt>日期:</dt>
        <dd><input type="text" name="proData" id="proData" class="text ui-widget-content ui-corner-all" /></dd>
        <dt>栏目:</dt>
        <dd>
        	<% Call DrawSelect(2,"proCate",false) %>
        </dd>
        <dt>价格:</dt>
        <dd><input type="text" name="proPrice" id="proPrice" class="text ui-widget-content ui-corner-all" /></dd>
        
        <dt>是否显示:</dt>
        <dd>
        	<label><input type="radio" name="proHide" value="1" id="proHide_1" />是</label>
			<label><input type="radio" name="proHide" value="0" id="proHide_0" />否</label>
        </dd>
     </dl>
     <input type="hidden" name="proId" id="proId" />
     <p id="errorSpeed"  class="colorRed bord"></p>
    </form>
</div><!-- #editArtDialog -->
<div id="delDialog" title="删除产品">
    <form id="delForm" action="" method="post">
      你确定要删除 <span id="delArticleTitle" class="colorRed"></span> 吗？
      <input type="hidden" name="dId" id="dId" />
    </form>
  </div><!--delDialog -->
<%Call Footer%>
</body>
</html>