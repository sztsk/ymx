<!--#include file = "articleManage.asp"-->
<!--#include file = "commonOption.asp"-->
<!--#include file = "../admin-templates/HeadAndFoot.asp"-->
<%Call CheckAdmin(2)%>
<!--#include file="../FCKeditor/fckeditor.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加文章</title>
<script src="../../js/jquery.js" type="text/javascript" ></script>
<script src="../../js/jquery-ui.js" type="text/javascript"></script>
<script src="../../js/jquery.form.js" type="text/javascript"></script>
<script src="../../js/admin.js" type="text/javascript"></script>
<script src="../../js/addArticle.js" type="text/javascript"></script>
<link href="../../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../css/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% Call Header%>    <!--start  -->
    <form id="insertForm" action="" method="post">
  <table id="insertTable" class="ui-widget ui-widget-content tableBlue" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="11%" class="textRight">标题</td>
      <td width="47%"><input type="text" name="title" id="title" class="text ui-widget-content ui-corner-all" /></td>
      <td width="42%" id="errorTitle"></td>
    </tr>
    <tr>
      <td class="textRight">作者</td>
      <td><input type="text" name="author" id="author" value="<%=Request.Cookies("adminName")%>" class="text ui-widget-content ui-corner-all" /></td>
      <td id="errorauthor">&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">栏目</td>
      <td>
      <% Call DrawSelect(2,"categoryId",true) %>
      </td>
      <td id="errorcategoryId">&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">日期</td>
      <td><input type="text" name="dates" id="dates" value="<% =Date()%>" class="text ui-widget-content ui-corner-all" /></td>
      <td id="errordates">&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">是否置顶</td>
      <td class="textLeft">
      <% Call zd_isTop%>
      <!--<label>
          <input type="radio" name="isTop" value="1" id="isTop_0" />
          是</label>
        <label>
          <input type="radio" name="isTop" value="0" id="isTop_1" checked="checked" />
          否</label>--></td>
      <td>&nbsp;</td>
    </tr>
     <tr>
      <td class="textRight">类型</td>
      <td class="textLeft">
      <%Call lx_isRecommend%>
      </td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">地域</td>
      <td class="textLeft">
      <%Call dy_isReview%>
     </td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="textRight">年份</td>
      <td>
      <%Call nf_click%>
      </td>
      <td id="errorclick">&nbsp;</td>
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
oFCKeditor.Value= ""
oFCKeditor.Create "content2"
%></td>
    </tr>
    <tr>
      <td></td>
      <td><input type="submit" value="提交" class="ui-button ui-state-default ui-corner-all" />
        <input type="reset" value="重置" class="ui-button ui-state-default ui-corner-all" /></td>
      <td></td>
    </tr>
  </table>
</form>
<div id="showDialog" title="添加文章成功" >
  <p class="secArt">添加文章成功！</p>
      <input id="conArticle" type="button" value="继续添加文章" class="ui-button ui-state-default ui-corner-all" />
      <input id="goArticle" type="button" value="跳转到文章管理页面" class="ui-button ui-state-default ui-corner-all" />   
</div>
  <!--end start -->
<%Call Footer%>
</body>
</html>