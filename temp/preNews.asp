<!--#include file = "admin/article/articleManage.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
h1{font-size:14px; font-weight:700; margin:.5em 0 1em 0; color:#4297d7; text-align:center}
p{margin:0 1em; font-size:12px; line-height:180%;}
</style>
<title><%
set pre = GetArtByIdAll
response.Write(pre(1))
%>
</title>
</head>

<body>

<h1><%=pre(1)%></h1>
<div id="content"><%=pre(4)%></div><!--.content -->
<body>
</body>
</html>
