<!--#include file = "../../includes/DBConnection.asp"-->
<!--#include file = "../../UBB/UBB2Html.asp"-->
<%
Response.Buffer=true
Response.Expires=0

Call Msg("请求错误！",-1)
response.End()

action = SafeRequest("action",0)
Set rs = New DB

select case action

case "InsertMsg"
call InsertMsg

case "InsertMsg2"
call InsertMsg2

case "InsertMsg3"
call InsertMsg3

case "DeleteMsg"
call DeleteMsg

end select


Sub InsertMsg
msgName = SafeRequest("msgName",0)
msgContent = SafeRequest("msgContent",0)
msgDate = Date()
replyId = 0
replyName =""
replyContent =""
replyDate = Date()
artId = rs.InsertMessage(msgName,msgContent,msgDate,replyId,replyName,replyContent,replyDate,"")
response.Write(msgContent)
End Sub

Sub InsertMsg2
msgName = SafeRequest("msgName",0)
msgContent = HTMLEncode(checkStr(request.Form("GBookEditor")))
msgEmail = SafeRequest("msgEmail",0)
checkCode = SafeRequest("checkCode",0)
'if Session("CheckCode") ="" or CheckCode<>CStr(Session("CheckCode")) then
'Call Msg("验证码错误，请重新输入！",-1)
'end if
if msgName = "" then
Call Msg("会员名不能为空！",-1)
end if

if msgContent = "" then
Call Msg("留言内容不能为空！",-1)
end if

msgDate = Date()
replyId = 0
replyName =""
replyContent =""
replyDate = Date()
artId = rs.InsertMessage(msgName,msgContent,msgDate,replyId,replyName,replyContent,replyDate,msgEmail)
Call Msg("添加留言成功！","/gbook.asp")

End Sub



Sub InsertMsg3

msgId = SafeRequest("msgId",0)
msgName = SafeRequest("msgName",0)
msgContent = ""
msgDate = Date()
replyId = SafeRequest("msgId",0)
replyName = Request.Cookies("adminName")
replyContent = HTMLEncode(checkStr(request.Form("GBookEditor")))
replyDate = Date()


if msgName = "" then
Call Msg("会员名不能为空！",-1)
end if

if replyContent = "" then
Call Msg("回复内容不能为空！",-1)
end if


artId = rs.InsertMessage(msgName,msgContent,msgDate,replyId,replyName,replyContent,replyDate,"")
Call Msg("回复成功！","/gbook.asp")
End Sub


Sub DeleteMsg
artelId = SafeRequest("msgId",1)
Call rs.DeleteMessage(artelId)
Call Msg("删除留言成功！","/gbook.asp")
End Sub


%>