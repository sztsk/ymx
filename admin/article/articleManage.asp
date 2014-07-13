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
case "GetArtSpeedById"
call GetArtSpeedById

case "UpdatArtSpeedById"
call UpdatArtSpeedById

case "InsertArt"
call InsertArt

case "DeleteArtById"
call DeleteArtById

case "EditArtById"
call EditArtById

case "GetArtById"
call GetArtById

end select

Sub SelectAllArticle
Set record = rs.GetRsByStored("tsk_SelectarticlesAll")
do while not record.Eof
response.Write ("<tr class='jsTd'>")
response.Write ("<td class='textCenter'><input id='checkbox"&record(0)&"' type='checkbox' value='"&record(0)&"' /></td>")
response.Write ("<td class='textLeft'><a class='jsPre' href='preview.asp?artId="&record(0)&"' title='"&record(1)&"'>"&record(1)&"</a>")
response.Write (" <div class='tdLink'><a href='edit.asp?artId="&record(0)&"'>编辑</a> <a class='jsSpeedEidt' href='javascript:void(0)'>快速编辑</a><a class='jsDel' href='javascript:void(0)'>删除</a></div></td>")
response.Write ("<td class='textCenter'>"&record(2)&"</td>")
response.Write ("<td class='textCenter'>"&GetClassName(record(3))&"</td>")
response.Write ("<td class='textCenter'>"& ShowNainFen(record(4)) & "&nbsp;" & ShowDiYu(record(7)) &"&nbsp;"& ShowLeiXin(record(6)) &"</td>")
response.Write ("<td class='textCenter'>"&record(8)&"</td>")
response.Write ("<td class='textCenter'>"&ShowTop(record(5))&"</td></tr>")

if record.Eof then exit do
record.movenext
loop 
record.close
set record = nothing '关闭记录集
'Set rs = nothing
End Sub

Sub GetArtSpeedById
artId = SafeRequest("artId",1)
Set record = rs.GetArtById(artId)
'json 格式
Set format = jsObject()
format("artId") = record(0)
format("title") = record(1)
format("author") = record(2)
format("categoryId") = record(3)
format("content") = record(4)
format("click") = record(5)
format("isTop") = record(6)
format("isRecommend") = record(7)
format("isReview") = record(8)
format("dates") = record(9)
format.Flush
End Sub

Function GetArtById
artId = SafeRequest("artId",1)
Set record = rs.GetArtById(artId)
GetArtById = record(4)
End Function

Function GetArtByIdAll
artId = SafeRequest("artId",1)
Set record = rs.GetArtById(artId)
set GetArtByIdAll = record
End Function

Sub UpdatArtSpeedById
artId = SafeRequest("artId",1)
title = SafeRequest("title",0)
author = SafeRequest("author",0)
categoryId = SafeRequest("categoryId",0)
click = SafeRequest("click",1)
isTop = SafeRequest("isTop",1)
isRecommend = SafeRequest("isRecommend",1)
isReview = SafeRequest("isReview",1)
dates = SafeRequest("dates",0)
artCateName = GetClassName(categoryId)
Call rs.UpdatArtSpeedById(artId,title,author,categoryId,click,isTop,isRecommend,isReview,dates)

Set format = jsObject()
format("artId") = artId
format("title") = title
format("author") = author
format("categoryId") = categoryId
format("click") = click
format("isTop") = isTop
format("isRecommend") = isRecommend
format("isReview") = isReview
format("dates") = dates
format("artCateName") = artCateName
format.Flush
End Sub

Sub InsertArt
title = SafeRequest("title",0)
author = SafeRequest("author",0)
categoryId = SafeRequest("categoryId",0)
'content = SafeRequest("content",1)
content2 = Replace(Request("content2"),"'",chr(39))
click = SafeRequest("click",1)
isTop = SafeRequest("isTop",1)
isRecommend = SafeRequest("isRecommend",1)
isReview = SafeRequest("isReview",1)
dates = SafeRequest("dates",0)
artId = rs.InsertArtByStored(title,author,content2,categoryId,click,isTop,isRecommend,isReview,dates)
response.Write(title)
End Sub

Sub DeleteArtById
artId = SafeRequest("dId",1)
Call rs.DelArtById(artId)
response.Write(artId)
End Sub

Sub EditArtById
artId = SafeRequest("artId",1)
title = SafeRequest("title",0)
author = SafeRequest("author",0)
categoryId = SafeRequest("categoryId",0)

content = Replace(Request("content"),"'",chr(39))
click = SafeRequest("click",1)
isTop = SafeRequest("isTop",1)
isRecommend = SafeRequest("isRecommend",1)
isReview = SafeRequest("isReview",1)
dates = SafeRequest("dates",0)
Call rs.UpdatArtById(artId,title,author,content,categoryId,click,isTop,isRecommend,isReview,dates)
'Call Msg("修改文章成功！","index.asp")
'Call rs.UpdatArtById()

End Sub

'ClassKind:栏目分类ID
'idSelect:select Id
'addOption 是否显示添加为根目录这个选项
Sub DrawSelect(ClassKind,idSelect,addOption)
sql ="select * from category where ClassKind= " & ClassKind &" Order By ClassList Asc,ClassOrder Asc"
response.Write( "<select id='"& idSelect &"' name='"& idSelect &"' class='selectFrom'>")
IF addOption = TRUE THEN
response.Write("<option value='0' class='colorRed'>请选择文章栏目</option>")
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

Function GetClassName(ClassId)
sql ="select ClassName from category where ClassId= '" & ClassId &"'"
GetClassName = rs.GetValueBySql(sql)
End Function

'根据栏目id获取文章列表
Function GetArticleByClassId(ClassId)
sql ="select * from article where categoryId= '" & ClassId &"'"
Set art = rs.GetRsBySql(sql,1)
set GetArticleByClassId = art
End Function

%>