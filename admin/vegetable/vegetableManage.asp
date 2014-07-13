<!--#include file = "../../includes/DBConnection.asp"-->
<!--#include file = "../../includes/JSON.asp"-->
<!--#include file = "../../includes/UpLoadClass.asp"-->
<%'Call CheckAdmin(2)%>
<%
Response.Buffer=true
Response.Expires=0

action = SafeRequest("action",0)
Set rs = New DB

select case action

case "InsertVege"
call InsertVege

case "EditVege"
call EditVege

case "DeleteVegetById"
call DeleteVegetById

end select

Sub SelectAllVeget
Set record = rs.GetRsByStored("tsk_SelectvegetablesAll")
do while not record.Eof
response.Write ("<tr class='jsTd'>")
response.Write ("<td class='textCenter'><input id='checkbox"&record(0)&"' type='checkbox' value='"&record(0)&"' /></td>")
response.Write ("<td class='textLeft'><img src='../../upload/vegetable/"&record(3)&"' alt='"&record(2)&"' width='50' height='50' /></td>")
response.Write ("<td class='textLeft'><a class='jsPre' href='preview.asp?vegeId="&record(0)&"' title='"&record(2)&"'>"&record(2)&"</a></td>")
response.Write ("<td class='textCenter'>"&record(1)&"</td>")
response.Write ("<td class='textCenter'>"&record(5)&"</td>")
response.Write ("<td class='textCenter'><a href='edit.asp?vegeId="&record(0)&"'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#'  class='jsDel'>删除</a></td></tr>")

if record.Eof then exit do
record.movenext
loop 
record.close
set record = nothing '关闭记录集
'Set rs = nothing
End Sub


Sub InsertVege
Server.ScriptTimeOut=5000
dim request2
set request2=New UpLoadClass
'设置文件允许的附件类型为gif/jpg/rar/zip
request2.FileType="GIF/JPG/PNG/BMP"
request2.MaxSize=0
'设置服务器文件保存路径
request2.SavePath="/upload/vegetable/"
request2.AutoSave=2
'打开对象
request2.open() 
request2.save "vsmallImg",0
request2.save "vbigImg",0
request2.Charset="UTF-8"

IF request2.Error = 0 THEN
artelId = Request2.Form("artelId")
vegetableName = Request2.Form("vegetableName")
vsmallImg = Request2.Form("vsmallImg")
vbigImg = Request2.Form("vbigImg")
addDate = Request2.Form("addDate")
aa = rs.InsertVegetableByStored(artelId,vegetableName,vsmallImg,vbigImg,addDate)
response.Write(vbigImg)
End IF
'Request2.Close
set Request2 = nothing
Call Msg("成功蔬菜产品","add.asp")
End Sub

Sub GetAllArte(sel)
Set record = rs.GetRsByStored("tsk_SelectartelsAll")
do while not record.Eof

if sel <> record(0) Then
response.Write ("<option value='"&record(0)&"'>"&record(1)&"</option>")
Else
response.Write ("<option value='"&record(0)&"' selected='selected'>"&record(1)&"</option>")
End If

if record.Eof then exit do
record.movenext
loop 
record.close
set record = nothing '关闭记录集
'Set rs = nothing
End Sub

Sub DeleteVegetById
artId = SafeRequest("dId",1)
Call rs.Deletvegetable(artId)
response.Write(artId)
End Sub

Function GetVegetById
vegetId = SafeRequest("vegeId",1)
Set record = rs.Selectvegetable(vegetId)
set GetVegetById = record
End Function

Sub EditVege
vegetableId = SafeRequest("vegeId",1)
Server.ScriptTimeOut=5000
dim request2
set request2=New UpLoadClass
'设置文件允许的附件类型为gif/jpg/rar/zip
request2.FileType="GIF/JPG/PNG/BMP"
request2.MaxSize=0
'设置服务器文件保存路径
request2.SavePath="/upload/vegetable/"
request2.AutoSave=2
'打开对象
request2.open() 
request2.save "vsmallImg",0
request2.save "vbigImg",0
request2.Charset="UTF-8"

IF request2.Error = 0 THEN
vegetableName = Request2.Form("vegetableName")
artelId = Request2.Form("artelId")
IF Request2.Form("vsmallImg") = "" Then
vsmallImg = Request2.Form("_vsmallImg")
ELSE
vsmallImg = Request2.Form("vsmallImg")
END IF

IF Request2.Form("vbigImg") = "" Then
vbigImg = Request2.Form("_vbigImg")
ELse
vbigImg = Request2.Form("vbigImg")
ENd If

addDate = Request2.Form("addDate")
a = rs.Updatevegetable(vegetableId,artelId,vegetableName,vsmallImg,vbigImg,addDate)
response.Write(vegetableId)
End IF
'Request2.Close
set Request2 = nothing
Call Msg("修改蔬菜产品成功","index.asp")
End Sub

%>