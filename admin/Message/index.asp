<!--#include file = "messageManage.asp"-->
<!--#include file = "../admin-templates/HeadAndFoot.asp"-->
<%Call CheckAdmin(3)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言管理</title>
<script src="../../js/jquery.js" type="text/javascript" ></script>
<script src="../../js/jquery-ui.js" type="text/javascript"></script>
<script src="../../js/jquery.form.js" type="text/javascript"></script>
<script src="../../js/message.js" type="text/javascript"></script>

<link href="../../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../css/adminStyle.css" rel="stylesheet" type="text/css" />

</head>
<body>
<% Call Header%>
    <!--start  -->
<%
Set sqldb = New DB
sqlMsg = "select * from Message order by msgId desc" 
set art_rs = sqldb.GetRsBySql(sqlMsg,1)
do while not art_rs.Eof
%>
<div style="background:#f2f2f2; border:1px solid #ccc">
<p>留言者：<% =art_rs("msgName")%></p>
<p>留言内容：<% =art_rs("msgContent")%></p>
<p>留言时间：<% =art_rs("msgDate")%></p>
<%
sqlReply = "select * from Message where replyId = "& art_rs("msgId") &" order by msgId desc" 
set rep_rs = sqldb.GetRsBySql(sqlReply,1)
do while not rep_rs.Eof
%>
    <div style="width:80%; background:#F96; border:1px solid #F30">
    	<p>回复者：<% =rep_rs("replyName")%></p>
        <p>回复内容：<% =rep_rs("replyContent")%></p>
        <p>回复时间：<% =rep_rs("replyDate")%></p>
    </div>
<%
IF rep_rs.Eof then exit do
rep_rs.movenext
loop 
rep_rs.close
set rep_rs = nothing '关闭记录集

%>
</div>
<% 
IF art_rs.Eof then exit do
art_rs.movenext
loop 
art_rs.close
set art_rs = nothing '关闭记录集
%>

<form action="messageManage.asp?action=InsertMsg" method="post" id="insertForm">
	<input type="text" id="msgName" name="msgName" value="<%=Request.Cookies("adminName")%>"/>
    <textarea rows="10" cols="100" id="msgContent" name="msgContent"></textarea>
    <input type="submit" value="提交回复" />
</form>
  <!--end start -->
  
<div id="showDialog" title="提示" >
  <p class="secArt">添加留言成功！请等待管理员回复！</p>
</div>
<%Call Footer%>
</body>
</html>