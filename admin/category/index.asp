<!--#include file = "categoryManage.asp"-->
<!--#include file = "../admin-templates/HeadAndFoot.asp"-->
<%Call CheckAdmin(2)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>栏目管理</title>
<script src="../../js/jquery.js" type="text/javascript" ></script>
<script src="../../js/jquery-ui.js" type="text/javascript"></script>
<script src="../../js/jquery.form.js" type="text/javascript"></script>
<script src="../../js/admin.js" type="text/javascript"></script>
<script src="../../js/cateManage.js" type="text/javascript"></script>
<link href="../../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../css/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% Call Header%>
    <!--start  -->
  <form id="addForm" method="post" action="categoryManage.asp?action=ClassAdd&amp;ck=<% =SafeRequest("ck",1)%>" enctype="multipart/form-data">
    <fieldset class="addCateOption ui-corner-all">
      <legend>添加新栏目</legend>
      <label>栏目层次:
      <div id="jsAddSelect">
        <% Call DrawSelect("addSelect",true) %>
      </div>
      </label>
      <label for="addcateText">栏目名称:
        <input type="text" id="addcateText" name="addcateText" class="text ui-widget-content ui-corner-all" />
      </label>
      <label for="classimg">
      	<input type="file" id="classimg" name="classimg"  class="text ui-widget-content ui-corner-all" />
       </label>
      <input id="addCateBtn" type="submit" value="添加菜单" class="ui-button ui-state-default ui-corner-all smallBtn" />
      
    </fieldset>
  </form>
  <table id="cateTable" width="90%" class="ui-widget ui-widget-content tableBlue" border="0" cellspacing="0" cellpadding="0">
    <thead class="ui-widget-header">
      <tr>
        <th width="5%" scope="col"><input name="id" type="checkbox" value="" /></th>
        <th width="41%"  scope="col" class="textLeft">栏目名称</th>
        <th width="15%"  scope="col">栏目顺序</th>
        <th width="27%" scope="col">操作</th>
      </tr>
    </thead>
    <tbody>
      <%
  GetClassList
  %>
    </tbody>
  </table>

  <div id="delDialog" title="删除栏目">
    <form id="delForm" action="" method="post">
      你确定要删除 <span id="delClassName" class="colorRed"></span> 吗？
      <p id="tips" class="colorRed displayNone">提示：删除前请先确认该栏目下是否有子栏目，否则无法删除！</p>
      <input type="hidden" name="dId" id="dId" />
    </form>
  </div>
  <!--#delDialog -->
  <div id="showDialog" title="操作出错">
      <p id="errorTip" class="colorRed bord"></p>
  </div><!-- showDialog-->
    <!--end start -->
<%Call Footer%>
</body>
</html>