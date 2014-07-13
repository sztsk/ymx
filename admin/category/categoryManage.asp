<!--#include file = "../../includes/DBConnection.asp"-->
<!--#include file = "../../includes/JSON.asp"-->
<!--#include file = "../../includes/UpLoadClass.asp"-->
<%'Call CheckAdmin(2)%>
<%
'缓存
Response.Buffer=true
Response.Expires=0

action = SafeRequest("action",0)
ck = SafeRequest("ck",1)
Set sqldb = New DB
select case action
case "UpdateNameOrder"
call UpdateNameOrder

case "DelByClassId"
call DelByClassId

case "ClassAdd"
call ClassAdd
case "GetClassList"
call GetClassList
case "DrawSelect"
call DrawSelect("addSelect",true)
end select

'获取ClassId的包含菜单列表
Function GetClassListByClassId(ClassID)
'ClassId = "200704112010263437"
sql = "select ClassList,ClassTj from category where ClassId='" & ClassId & " '"
'response.Write(sql)
set GetClassListByClassId = sqldb.GetRsValueBySql(sql)
End Function

'添加一个菜单项
Sub ClassAdd

Server.ScriptTimeOut=5000
dim request2
set request2=New UpLoadClass
'设置文件允许的附件类型为gif/jpg/rar/zip
request2.FileType="GIF/JPG/PNG/BMP"
request2.MaxSize=0
'设置服务器文件保存路径
request2.SavePath="/upload/cate/"
request2.AutoSave=2
'打开对象
request2.open() 
request2.save "classimg",0
request2.Charset="UTF-8"

ClassName = Request2.Form("addcateText")
ClassPre = Request2.Form("addSelect")
ClassImg = Request2.Form("classimg")
ClassId = Format_Time(now,6)
ClassList = ""
ClassTj = 1
ClassKind = ck

IF ClassPre = 0 THEN
  ClassList = ClassId & ","
ELSE
set list = GetClassListByClassId(ClassPre)
 If Not list.eof Then 
 ClassList =list("ClassList") & ClassId & ","
 ClassTj = list("ClassTj") + 1
 END IF
END IF

sql = "insert into category(ClassId,ClassName,ClassList,ClassPre,ClassTj,ClassKind,ClassImg)values('"&ClassId&"','"&ClassName&"','"&ClassList&"','"&ClassPre&"',"&ClassTj&","&ClassKind&",'"&ClassImg&"')"
'response.Write(sql)
'response.Write(ClassPre)
sqldb.InsertBySql(sql)
response.Write(200)
set list = nothing
Call Msg("添加菜单成功！","index.asp?ck="&ck)
End Sub

'编辑一个菜单项
'Function ClassSave("2009" ,"hugo","hugo","hugo",2)
Sub ClassSave(ClassId ,ClassName,ClassList,ClassPre,ClassTj)
'ClassId = SafeRequest("ClassId",0)
'ClassName = SafeRequest("ClassName",0)
'ClassList = SafeRequest("ClassList",0)
'ClassPre = SafeRequest("ClassPre",0)
'ClassTj = SafeRequest("ClassTj",1)

sql = "update category set ClassName = '"& ClassName & "', ClassList = '"& ClassList & "', ClassPre = '"& ClassPre & "', ClassTj = "& ClassTj & " where ClassId ='"& ClassId &"'"
sqldb.UpdateBySql(sql)
'同步更新子菜单
set subRs = GetSubClassList(ClassId)
do while not subRs.Eof
SubClassList = ClassList & subRs("ClassId") &","
sClassId = subRs("ClassId")
sClassName = subRs("ClassName")
sClassList = SubClassList
sClassPre = subRs("ClassPre")
sClassTj = ClassTj + 1
'Call ClassSave("2009" ,"hugo",SubClassList,"hugo",2)
sql2 = "update category set ClassName = '"& sClassName & "', ClassList = '"& sClassList & "', ClassPre = '"& sClassPre & "', ClassTj = "& sClassTj & " where ClassId ='"& sClassId &"'"
sqldb.UpdateBySql(sql2)
if subRs.Eof then exit do
subRs.movenext
loop 
End Sub

'获取该菜单项的所有子菜单项
Function GetSubClassList(ClassId)
'ClassId ="2009"
sql = "select * from category where ClassPre='" & ClassId & "'"
set rs =  sqldb.GetRsBySql(sql,1)
set GetSubClassList = rs
End Function

'获取菜单列表
Sub GetClassList
ClassKind = ck
sql ="select * from category where ClassKind= " & ClassKind &" Order By ClassList Asc,ClassOrder Asc"
set rs = sqldb.GetRsBySql(sql,1)
do while not rs.Eof
response.Write("<tr><td class='textCenter'>")
response.Write(" <input id='checkbox"& rs("ClassId") &"' type='checkbox' value='"& rs("ClassId") &"' /></td>")
IF rs("ClassTj") =  1 THEN
response.Write("<td class='textLeft bord'><img src='../images/openfolder.gif' alt='' /><span>"& rs("ClassName")& "</span></td>")
ELSE 
ClassName = "<img src='../images/t.gif' alt='' /><img src='../images/file.gif' alt='' /><span>" & rs("ClassName") & "</span>"
ClassName = StringOfChar(rs("ClassTj") - 1, "　")  & ClassName
response.Write("<td class='textLeft'>"& ClassName &"</td>")
END IF
response.Write("<td class='textCenter'>")
response.Write(rs("ClassOrder"))
response.Write("</td><td class='textCenter'>")

response.Write("<a class='editCate' href='javascript:void(0)'>编辑</a><a class='delCate' href='javascript:void(0)'>删除</a><a class='saveCate displayNone' href='javascript:void(0)'>保存</a><a class='cancelCate displayNone' href='javascript:void(0)'>取消</a>")
response.Write("</td></tr>")
IF rs.Eof then exit do
rs.movenext
loop 
rs.close
set rs = nothing '关闭记录集
End Sub

'根据ClassId获取上级ClassPre值
Function GetPreClassId(ClassId)
sql = "Select top 1 ClassPre From category Where ClassId='" & ClassId &+ "'"
preClassId = sqldb.GetValueBySql(sql)
GetPreClassId = preClassId
End Function

'删除一个菜单项
Sub DelByClassId
ClassId = SafeRequest("dId",0)
checksql = "Select top 1 * from category Where ClassPre  = '"& ClassId &"'"
tf = sqldb.HasRecordById(checksql)
IF tf = True Then
Set format = jsObject()
format("showRe") = 400'存在子菜单，不可删除
format("ClassId") = ClassId
format.Flush
Else
sql = "Delete From category where ClassId='" & ClassId & "'"
sqldb.DeleteBySql(sql)
Set format = jsObject()
format("showRe") = 200
format("ClassId") = ClassId
format.Flush

End IF
End Sub

'更新名称和排序
Sub UpdateNameOrder
ClassOrder = SafeRequest("ClassOrder",1)
ClassName = SafeRequest("ClassName",0)
ClassId = SafeRequest("ClassId",0)
sql ="Update category Set ClassOrder= " & ClassOrder & ", ClassName  = '"& ClassName &"' where ClassId='" & ClassId & "' "
sqldb.UpdateBySql(sql)
response.Write(200)
End Sub

'ClassKind:栏目分类ID
'idSelect:select Id
'addOption 是否显示添加为根目录这个选项
Sub DrawSelect(idSelect,addOption)
ClassKind = ck
sql ="select * from category where ClassKind= " & ClassKind &" Order By ClassList Asc,ClassOrder Asc"
response.Write( "<select id='"& idSelect &"' name='"& idSelect &"' class='selectFrom'>")
IF addOption = TRUE THEN
response.Write("<option value='0' class='colorRed'>添加为根栏目</option>")
END IF
set rs = sqldb.GetRsBySql(sql,1)
do while not rs.Eof
IF rs("ClassTj") =  1 THEN
response.Write( "<option value='"& rs("ClassId") &"' class='colorRed'>" & rs("ClassName")& "</option>")
'response.Write("<td class='textLeft bord'><img src='../images/openfolder.gif' alt='' />"& rs("ClassName")& "</td>")
ELSE

ClassName = "├ " & rs("ClassName")
ClassName = StringOfChar(rs("ClassTj") - 1, "　") & ClassName
response.Write( "<option value='"& rs("ClassId") &"'>" & ClassName & "</option>")
END IF

'response.Write(dropSelect)
IF rs.Eof then exit do
rs.movenext
loop
response.Write( "</select>")
rs.close
set rs = nothing '关闭记录集
End Sub

%>
