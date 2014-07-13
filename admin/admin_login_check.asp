<!--#include file = "../includes/DBConnection.asp"-->
<%
a_name = SafeRequest("a_name",0)
pwd = SafeRequest("pwd",0)
CheckCode = SafeRequest("CheckCode",0)
Set sqldb = New DB
if Session("CheckCode") ="" or CheckCode<>CStr(Session("CheckCode")) then
Call Msg("验证码错误，请重新输入！",-1)
end if
pwd = md5(pwd)

'=server.CreateObject("adodb.recordset")
sql="select * from admin where adminName = '" & a_name & "'"
check = sqldb.HasRecordById(sql)
if check = true Then
	set rs = sqldb.GetRsValueBySql(sql)
	if rs("adminPwd") <> pwd then
	Call Msg("你的密码错误！请重新输入！",-1)
	end if

	Response.Cookies("AdminID") = rs("Id")	
	Response.Cookies("adminName") = rs("adminName")
	Response.Cookies("power") = cint(rs("adminPower"))
	Session("CheckCode") = ""
	session("adminlogin")="ok" 
	'session.Timeout=600 超时设置，若用户大于600秒没反应，即自动注销

	response.Redirect("admin-templates/index.html")
	rs.close
	set rs = nothing
	
else
Call Msg("用户名或密码出错，请重新输入！",-1)
end if

%>