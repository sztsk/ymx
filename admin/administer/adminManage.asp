<!--#include file = "../../includes/DBConnection.asp"-->
<!--#include file = "../../includes/JSON.asp"-->
<%Call CheckAdmin(2)%>
<%
'缓存
Response.Buffer=true
Response.Expires=0

action = SafeRequest("action",0)
Set rs = New DB

select case action
case "InsertUser"
call InsertUser

case "ValidateName"
call ValidateName

case "tesy"
call tesy

case "GetAdminById"
call GetAdminById

case "UpdataAdminC"
call UpdataAdminC

case "DeleteadminById"
call DeleteadminById

end select


Sub InsertUser
adminName = SafeRequest("adminName",0)
adminPwd = SafeRequest("adminPwd",0)
adminEmail = SafeRequest("adminEmail",0)
adminPower = SafeRequest("adminPower",0)
adminState = SafeRequest("adminState",0)
uid = rs.InsertByStored(adminName,md5(adminPwd),adminPower,adminEmail,adminState)
'response.Write( "{Id:'"& uid &"',adminName:'" & adminName & "',adminPower:'"  & adminPower &"',adminEmail:'"  & adminEmail &"',adminState:'"  & adminState & "'}")
Set format = jsObject()
format("Id") = uid
format("adminName") = adminName
format("adminPower") = ShowPowerName(adminPower)
format("adminEmail") =adminEmail
format("adminState") = ShowStateName(adminState)
format.Flush
  
End Sub

Sub ValidateName
adminName = SafeRequest("adminName",0)
check = rs.ValidateAdminName(adminName) ''验证用户名。存在返回0，不存在返回-1
if check = 0 Then
response.Write("0")
Else
response.Write("1")
End if
End Sub

Sub SelectAllUser

Set record = rs.GetRsByStored("tsk_SelectadminsAll")
do while not record.Eof

response.Write("<tr><td class='textCenter'>")
response.Write("<input id='checkbox"& record("Id")&"' type='checkbox' value='"& record("Id")&"' />")
response.Write("</td><td class='textCenter'>")
response.Write(record("adminName"))
response.Write("</td><td class='textCenter'>")
response.Write(ShowPowerName(record("adminPower")))
response.Write("</td><td class='textCenter'>")
response.Write(record("adminEmail"))
response.Write("</td><td class='textCenter'>")
response.Write(ShowStateName(record("adminState")))
response.Write("</td><td class='textCenter'>")
response.Write("<a class='modify'  href='javascript:void(0)'>修改</a> <a class='del' href='javascript:void(0)'>删除</a>")
response.Write("</td></tr>")
'adminManage.asp?action=modifyUser&id="& record("Id") &"
if record.Eof then exit do
record.movenext
loop 
record.close
set record = nothing '关闭记录集
End Sub

Sub GetAdminById
adminId = SafeRequest("id",1)
Set record = rs.GetAdminById(adminId)
'json 格式
Set format = jsObject()
format("Id") = record(0)
format("adminName") = record(1)
format("adminPwd") = record(2)
format("adminPower") = record(3)
format("adminEmail") = record(4)
format("adminState") = record(5)
format.Flush
End Sub

Sub UpdataAdminC
adminId = SafeRequest("mId",1)
adminPwd = SafeRequest("mAdminPwd",0)
adminEmail = SafeRequest("mAdminEmail",0)
adminPower = SafeRequest("mAdminPower",0)
adminState = SafeRequest("mAdminState",0)
sqlPwd = rs.GetValueBySql("select adminPwd from admin where Id = " & adminId)
IF adminPwd = sqlPwd THEN
md5Pwd = sqlPwd
ELSE
md5Pwd = md5(adminPwd)
END IF
Call rs.UpdataAdmin(adminId,md5Pwd,adminPower,adminEmail,adminState)
'Call rs.UpdataAdmin(2,33,1,2,1)
Set format = jsObject()
format("Id") = adminId
format("adminPower") = ShowPowerName(adminPower)
format("adminEmail") =adminEmail
format("adminState") = ShowStateName(adminState)
format.Flush
End Sub

Sub DeleteadminById
adminId = SafeRequest("dId",1)
Call rs.DeleteadminById(adminId)
response.Write(adminId)
End Sub
%>

