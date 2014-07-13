<!--#include file = "../../includes/DBConnection.asp"-->
<!--#include file = "../admin-templates/HeadAndFoot.asp"-->
<%Call CheckAdmin(2)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加合作社成员</title>
<script src="../../js/jquery.js" type="text/javascript" ></script>
<script src="../../js/jquery-ui.js" type="text/javascript"></script>
<script src="../../js/admin.js" type="text/javascript"></script>
<link href="../../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../css/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% Call Header%>
    <!--start  -->
<form id="insertForm" action="artelManage.asp?action=InsertArte" method="post" enctype="multipart/form-data" >
  <table id="editTable" class="ui-widget ui-widget-content tableBlue" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="11%" class="textRight">基地名称</td>
      <td width="47%"><input type="text" name="artelName" id="artelName" class="text ui-widget-content ui-corner-all" /></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">负责人</td>
      <td><input type="text" name="principal" id="principal" value="" class="text ui-widget-content ui-corner-all" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">地址</td>
      <td><input type="text" name="artelAddr" id="artelAddr" value="" class="text ui-widget-content ui-corner-all" /></td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td class="textRight">面积</td>
      <td><input type="text" name="artelArea" id="artelArea" value="" class="text ui-widget-content ui-corner-all" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
       <td class="textRight">蔬菜品种</td>
      <td><input type="text" name="vegeBreed" id="vegeBreed" value="" class="text ui-widget-content ui-corner-all" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">修改时间</td>
      <td><input type="text" name="addDate" id="addDate" value="<% =Date()%>" class="text ui-widget-content ui-corner-all" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">小图</td>
      <td><input type="file" name="asmallImg" id="asmallImg" class="text ui-widget-content ui-corner-all" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">大图</td>
      <td><input type="file" name="abigImg" id="abigImg" class="text ui-widget-content ui-corner-all" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td></td>
      <td><input type="submit" value="添加" class="ui-button ui-state-default ui-corner-all" />
        <input type="reset" value="重置" class="ui-button ui-state-default ui-corner-all" /></td>
      <td></td>
    </tr>
  </table>
      <!--end start -->
    
</form>
<!--#showDialog -->
<%Call Footer%>
</body>
</html>
