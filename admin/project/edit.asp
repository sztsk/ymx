<!--#include file = "proManage.asp"-->
<!--#include file = "../admin-templates/HeadAndFoot.asp"-->
<%Call CheckAdmin(2)%>
<!--#include file="../FCKeditor/fckeditor.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改产品</title>
<script src="../../js/jquery.js" type="text/javascript" ></script>
<script src="../../js/jquery-ui.js" type="text/javascript"></script>
<script src="../../js/jquery.form.js" type="text/javascript"></script>
<script src="../../js/admin.js" type="text/javascript"></script>
<script src="../../js/editPro.js" type="text/javascript"></script>
<link href="../../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../css/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% Call Header%>  
<%
'set rs = new DB
'Call rs.UpdatProById(10,"no2","good pro",32.00,"dsadsa","fdsafdsa","fdsafdsa","fdsa",1,"2009-09-09")
%>  <!--start  -->
    <form id="insertForm" action="proManage.asp?action=EditProById" method="post" enctype="multipart/form-data" onSubmit="return doCheck();">
    <input type="hidden" name="proId" id="proId" value="<%= SafeRequest("proId",1)%>" />
<div style="position:relative">
  <table id="insertTable" class="ui-widget ui-widget-content tableBlue" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="11%" class="textRight">产品编号</td>
      <td width="47%"><input type="text" name="proNo" id="proNo" class="text ui-widget-content ui-corner-all" /></td>
      <td width="42%" id="errorproNo"></td>
    </tr>
    <tr>
      <td class="textRight">产品名称</td>
      <td><input type="text" name="proName" id="proName" value="" class="text ui-widget-content ui-corner-all" /></td>
      <td id="errorproName">&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">价格</td>
      <td><input type="text" name="proPrice" id="proPrice" value="" class="text ui-widget-content ui-corner-all" /></td>
      <td id="errorproPrice">&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">栏目</td>
      <td>
      <% Call DrawSelect(2,"proCate",true) %>
      </td>
      <td id="errorproCate">&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">日期</td>
      <td><input type="text" name="proData" id="proData" value="" class="text ui-widget-content ui-corner-all" /></td>
      <td id="errorproData">&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">显示图片</td>
      <td><input type="file" name="proImg" id="proImg" class="text ui-widget-content ui-corner-all" /></td>
      <td><input type="hidden" name="oldImg" id="oldImg" value="" /></td>
    </tr>
    <tr>
      <td class="textRight">是否显示</td>
      <td class="textLeft"><label>
          <input type="radio" name="proHide" value="1" id="proHide_1" checked="checked" />
          是</label>
        <label>
          <input type="radio" name="proHide" value="0" id="proHide_0"  />
          否</label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
    	<td class="textRight">产品简介</td>
      <td colspan="2" class="textLeft"><textarea id="proExplain" name="proExplain" cols="100" rows="5">&nbsp;</textarea></td>
    </tr>
    <tr>
      <td colspan="3"><%
' 定义变量
Dim oFCKeditor
'' 类的初始化
Set oFCKeditor = New FCKeditor
'' 定义路径（默认路径：/FCKeditor/）
oFCKeditor.BasePath="../FCKeditor/"
'' 定义工具条（默认为：Default）
oFCKeditor.ToolbarSet="Default"
'' 定义宽度（默认宽度：100%）
oFCKeditor.Width="100%"
'' 定义高度（默认高度：200）
oFCKeditor.Height=450
oFCKeditor.Value= GetProById
oFCKeditor.Create "proContent"
%></td>
    </tr>
    <tr>
      <td></td>
      <td><input type="submit" value="提交" class="ui-button ui-state-default ui-corner-all" />
        <input type="reset" value="重置" class="ui-button ui-state-default ui-corner-all" /></td>
      <td></td>
    </tr>
  </table>
  <img id="showImg" src="#" width="200" height="150" alt="" style="position:absolute; right:10px; top:20px" />
  </div>
</form>
  <!--end start -->
<%Call Footer%>
</body>
</html>