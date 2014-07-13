<!--#include file = "vegetableManage.asp"-->
<!--#include file = "../admin-templates/HeadAndFoot.asp"-->
<%Call CheckAdmin(2)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改蔬菜配送中心</title>
<script src="../../js/jquery.js" type="text/javascript" ></script>
<script src="../../js/jquery-ui.js" type="text/javascript"></script>
<script src="../../js/admin.js" type="text/javascript"></script>

<link href="../../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../css/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% Call Header%>
<%
set pre = GetVegetById
response.Write(pre(1))
%>
    <!--start  -->
<form id="insertForm" action="vegetableManage.asp?action=EditVege&amp;vegeId=<%=pre(0)%>" method="post" enctype="multipart/form-data" >
  <table id="editTable" class="ui-widget ui-widget-content tableBlue" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="11%" class="textRight">蔬菜名称</td>
      <td width="47%"><input type="text" name="vegetableName" id="vegetableName"  value="<%=pre(2)%>" class="text ui-widget-content ui-corner-all" /></td>
      <td width="42%">&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">所属菜场</td>
      <td>
      <select name="artelId" id="artelId">
      	<%Call GetAllArte(pre(1)) %>
      </select>
      </td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">添加时间</td>
      <td><input type="text" name="addDate" id="addDate" value="<% =Date()%>" class="text ui-widget-content ui-corner-all" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">小图</td>
      <td><input type="file" name="vsmallImg" id="vsmallImg"  />
      <input type="hidden" name="_vsmallImg" id="_vsmallImg" value="<%=pre(3)%>" />
      </td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">大图</td>
      <td><input type="file" name="vbigImg" id="vbigImg" />
      <input type="hidden" name="_vbigImg" id="_vbigImg" value="<%=pre(4)%>" />
      </td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td></td>
      <td><input type="submit" value="修改" class="ui-button ui-state-default ui-corner-all" />
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
