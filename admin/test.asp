<!--#include file = "article/articleManage.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>111</title>
</head>

<body>
<%
set rs2 = GetArticleByClassId("20091005085705")
do while not rs2.Eof
response.Write(rs2(1))
IF rs2.Eof then exit do
rs2.movenext
loop
%>
</body>
</html>