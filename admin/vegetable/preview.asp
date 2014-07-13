<!--#include file = "vegetableManage.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
h1{font-size:14px; font-weight:700; margin:.5em 0 1em 0; color:#4297d7; text-align:center}
#content{margin:0 1em; font-size:12px; line-height:180%;word-break:break-all}
</style>
<title>
<%
set pre = GetVegetById
response.Write(pre(2))
%>
</title>
</head>

<body>

<h1><%=pre(2)%></h1>
<p>所属菜场:<%=pre(1)%></p>
<p>添加时间:<%=pre(5)%></p>
<p><img src="../../upload/vegetable/<%=pre(3)%>" /></p>
<p><img src="../../upload/vegetable/<%=pre(4)%>" /></p>
</body>
</html>
