<!--#include file = "../../includes/DBConnection.asp"-->
<!--#include file = "../../includes/JSON.asp"-->
<!--#include file = "../../includes/UpLoadClass.asp"-->
<%Call CheckAdmin(2)%>
<%
Response.Buffer=true
Response.Expires=0

action = SafeRequest("action",0)
Set rs = New DB

select case action

case "GetArteAll"
call GetArteAll

case "updateArteById"
call updateArteById

case "DeleteArteById"
call DeleteArteById

case "InsertArte"
call InsertArte

case "EditArtById"
call EditArtById

end select

Sub SelectAllArte
Set record = rs.GetRsByStored("tsk_SelectartelsAll")
do while not record.Eof
response.Write ("<tr class='jsTd'>")
response.Write ("<td class='textCenter'><input id='checkbox"&record(0)&"' type='checkbox' value='"&record(0)&"' /></td>")
response.Write ("<td class='textCenter'><img src='../../upload/pro/"&record(6)&"' width='50' height='50' /></td>")
response.Write ("<td class='textCenter'><a class='jsPre' href='preview.asp?artId="&record(0)&"' title='"&record(1)&"'>"&record(1)&"</a></td>")
response.Write ("<td class='textCenter'>"&record(2)&"</td>")
response.Write ("<td class='textCenter'>"&record(3)&"</td>")
response.Write ("<td class='textCenter'>"&record(4)&"</td>")
response.Write ("<td class='textCenter'>"&record(5)&"</td>")
response.Write ("<td class='textCenter'><a href='edit.asp?artId="&record(0)&"'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#'  class='jsDel'>删除</a></td></tr>")

if record.Eof then exit do
record.movenext
loop 
record.close
set record = nothing '关闭记录集
'Set rs = nothing
End Sub


Sub DeleteArteById
artelId = SafeRequest("dId",1)
Call rs.Deleteartel(artelId)
response.Write(artelId)
End Sub


Sub EditArtById
artId = SafeRequest("artId",1)
Server.ScriptTimeOut=5000
dim request2
set request2=New UpLoadClass
'设置文件允许的附件类型为gif/jpg/rar/zip
request2.FileType="GIF/JPG/PNG/BMP"
request2.MaxSize=0
'设置服务器文件保存路径
request2.SavePath="/upload/pro/"
request2.AutoSave=2
'打开对象
request2.open() 
request2.save "asmallImg",0
request2.save "abigImg",0
request2.Charset="UTF-8"

IF request2.Error = 0 THEN

artelName = Request2.Form("artelName")
principal = Request2.Form("principal")
artelAddr = Request2.Form("artelAddr")
artelArea = Request2.Form("artelArea")
vegeBreed = Request2.Form("vegeBreed")
addDate = Request2.Form("addDate")

IF Request2.Form("asmallImg") = "" Then
asmallImg = Request2.Form("_asmallImg")
ELSE
asmallImg = Request2.Form("asmallImg")
END IF

IF Request2.Form("abigImg") = "" Then
abigImg = Request2.Form("_abigImg")
ELse
abigImg = Request2.Form("abigImg")
ENd If

addDate = Request2.Form("addDate")
a = rs.Updateartel(artId,artelName,principal,artelAddr,artelArea,vegeBreed,asmallImg,abigImg,addDate)
response.Write(asmallImg)
End IF
'Request2.Close
set Request2 = nothing
Call Msg("修改合作社信息成功","index.asp")
End Sub




Function Selectartel2
artId = SafeRequest("artId",1)
Set record = rs.SelectartelById(artId)
set Selectartel2 = record
End Function


'添加产品
Sub InsertArte
Server.ScriptTimeOut=5000
dim request2
set request2=New UpLoadClass
'设置文件允许的附件类型为gif/jpg/rar/zip
request2.FileType="GIF/JPG/PNG/BMP"
request2.MaxSize=0
'设置服务器文件保存路径
request2.SavePath="/upload/pro/"
request2.AutoSave=2
'打开对象
request2.open() 
request2.save "asmallImg",0
request2.save "abigImg",0
request2.Charset="UTF-8"

IF request2.Error = 0 THEN
artelName = Request2.Form("artelName")
principal = Request2.Form("principal")
artelAddr = Request2.Form("artelAddr")
artelArea = Request2.Form("artelArea")
vegeBreed = Request2.Form("vegeBreed")
addDate = Request2.Form("addDate")
asmallImg = Request2.Form("asmallImg")
abigImg = Request2.Form("abigImg")
'proId = rs.InsertProByStored(proNo,proName,32.00,proExplain,proContent,proCate,proImg,1,now())
proId = rs.InsertArtelByStored(artelName,principal,artelAddr,artelArea,vegeBreed,asmallImg,abigImg,addDate)
'response.Write(request2.Error)
End IF
'Request2.Close
set Request2 = nothing
Call Msg("成功添加合作社","index.asp")
End Sub


Function GetartelById
artId = SafeRequest("artId",1)
Set record = rs.SelectartelById(artId)
set GetartelById = record
End Function
%>