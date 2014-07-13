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
case "Selectproject"
call Selectproject

case "InsertPro"
call InsertPro

case "GetProByIdSub"
call GetProByIdSub

case "UpdatProSpeedById"
call UpdatProSpeedById

case "DeleteProById"
call DeleteProById

case "EditProById"
call EditProById

End select

Sub Selectproject
Set record = rs.GetRsByStored("tsk_SelectprojectsAll")
do while not record.Eof
response.Write ("<tr class='jsTd'>")
response.Write ("<td class='textCenter'><input id='checkbox"&record(0)&"' type='checkbox' value='"&record(0)&"' /></td>")'Id
response.Write ("<td class='textCenter'>"&record(1)&"</td>")'编号
response.Write ("<td class='textLeft'><a class='jsPre' href='preview.asp?proId="&record(0)&"' title='"&record(2)&"'>"&record(2)&"</a>")'名称
response.Write (" <div class='tdLink'><a href='edit.asp?proId="&record(0)&"'>编辑</a> <a class='jsSpeedEidt' href='javascript:void(0)'>快速编辑</a><a class='jsDel' href='javascript:void(0)'>删除</a></div></td>")
response.Write ("<td class='textCenter'>￥"&record(3)&"</td>")'价格
response.Write ("<td class='textLeft'>"&GetStr(record(4),80)&"</td>")'描述
response.Write ("<td class='textCenter'>"&GetClassName(record(6))&"</td>")'栏目
response.Write ("<td class='textCenter'>"&ShowStateName(record(8))&"</td>")'状态
response.Write ("</tr>")
if record.Eof then exit do
record.movenext
loop 
record.close
set record = nothing '关闭记录集
'Set rs = nothing
End Sub

'根据id获取单个产品信息
Sub GetProByIdSub
proId = SafeRequest("proId",1)
Set record = rs.GetProById(proId)
'json 格式
Set format = jsObject()
format("proId") = record(0)
format("proNo") = record(1)
format("proName") = record(2)
format("proPrice") = record(3)
format("proExplain") = record(4)
'format("proContent") = record(5)
format("proCate") = record(6)
format("proImg") = record(7)
format("proHide") = record(8)
format("proData") = record(9)
format.Flush
End Sub

'根据id获取产品内容
Function GetProById
proId = SafeRequest("proId",1)
Set record = rs.GetProById(proId)
GetProById = record(5)
End Function

Function GetProPre
proId = SafeRequest("proId",1)
Set record = rs.GetProById(proId)
set GetProPre = record
End Function

'根据id快速更新部分产品内容
Sub UpdatProSpeedById
proId = SafeRequest("proId",1)
proNo = SafeRequest("proNo",0)
proName = SafeRequest("proName",0)
proPrice = SafeRequest("proPrice",0)
proCate = SafeRequest("proCate",0)
proHide = SafeRequest("proHide",1)
proData = SafeRequest("proData",0)
proCateName = GetClassName(proCate)

Call rs.UpdatSpeedProById(proId,proNo,proName,proPrice,proCate,proHide,proData)

Set format = jsObject()
format("proId") = proId
format("proNo") = proNo
format("proName") = proName
format("proPrice") = proPrice
format("proCate") = proCate
format("proHide") = proHide
format("proData") = proData
format("proCateName") = proCateName
format.Flush
End Sub

'添加产品
Sub InsertPro
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
request2.save "proImg",0
request2.Charset="UTF-8"

IF request2.Error = 0 THEN
proNo = Request2.Form("proNo")
proName = Request2.Form("proName")
proPrice = Request2.Form("proPrice")
proCate = Request2.Form("proCate")
proExplain = Request2.Form("proExplain")
proContent = Request2.Form("proContent")
proImg = Request2.Form("proImg")
proHide = Request2.Form("proHide")
proData = Request2.Form("proData")
'proId = rs.InsertProByStored(proNo,proName,32.00,proExplain,proContent,proCate,proImg,1,now())
proId = rs.InsertProByStored(proNo,proName,proPrice,proExplain,proContent,proCate,proImg,proHide,proData)
'response.Write(request2.Error)
End IF
'Request2.Close
set Request2 = nothing
Call Msg("成功添加产品","index.asp")
End Sub

'删除产品
Sub DeleteProById
proId = SafeRequest("dId",1)
Call rs.DelProById(proId)
response.Write(proId)
End Sub

Sub EditProById

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
request2.save "proImg",0
request2.Charset="UTF-8"


proId = Request2.Form("proId")
proNo = Request2.Form("proNo")
proName = Request2.Form("proName")
proPrice = Request2.Form("proPrice")
proCate = Request2.Form("proCate")
proExplain = Request2.Form("proExplain")
proContent = Request2.Form("proContent")
IF Request2.Form("proImg") = "" THEN
proImg = Request2.Form("oldImg")
ELSE
proImg = Request2.Form("proImg")
END IF
proHide = Request2.Form("proHide")
proData = Request2.Form("proData")
'proId = rs.InsertProByStored(proNo,proName,32.00,proExplain,proContent,proCate,proImg,1,now())
'proId = rs.InsertProByStored(proNo,proName,proPrice,proExplain,proContent,proCate,proImg,proHide,proData)
Call rs.UpdatProById(proId,proNo,proName,proPrice,proExplain,proContent,proCate,proImg,proHide,proData)
response.Write(proImg)

'Request2.Close
set Request2 = nothing
Call Msg("修改产品","index.asp")



End Sub

'ClassKind:栏目分类ID
'idSelect:select Id
'addOption 是否显示添加为根目录这个选项
Sub DrawSelect(ClassKind,idSelect,addOption)
sql ="select * from category where ClassKind= " & ClassKind &" Order By ClassList Asc,ClassOrder Asc"
response.Write( "<select id='"& idSelect &"' name='"& idSelect &"' class='selectFrom'>")
IF addOption = TRUE THEN
response.Write("<option value='0' class='colorRed'>请选择产品列表</option>")
END IF
set rs2 = rs.GetRsBySql(sql,1)
do while not rs2.Eof
IF rs2("ClassTj") =  1 THEN
response.Write( "<option value='"& rs2("ClassId") &"' class='colorRed'>" & rs2("ClassName")& "</option>")
'response.Write("<td class='textLeft bord'><img src='../images/openfolder.gif' alt='' />"& rs("ClassName")& "</td>")
ELSE

ClassName = "├ " & rs2("ClassName")
ClassName = StringOfChar(rs2("ClassTj") - 1, "　") & ClassName
response.Write( "<option value='"& rs2("ClassId") &"'>" & ClassName & "</option>")
END IF

'response.Write(dropSelect)
IF rs2.Eof then exit do
rs2.movenext
loop
response.Write( "</select>")
rs2.close
set rs2 = nothing '关闭记录集
End Sub

'根据栏目ID获取栏目名称
Function GetClassName(ClassId)
sql ="select ClassName from category where ClassId= '" & ClassId &"'"
GetClassName = rs.GetValueBySql(sql)
End Function



%>