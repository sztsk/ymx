<%
'**************************************************
'函数名：GetStr
'作 用：截字符串，汉字一个算两个字符，英文算一个字符
'参 数：Str ----原字符串
' StrLen ----截取长度
'返回值：截取后的字符串
'**************************************************
Function GetStr(Str,StrLen)
    If Str="" Then
        GetStr=""
        Exit Function
    End If
    Dim l,t,c, i
    Str=Replace(Replace(Replace(Replace(Str," "," "),"",chr(34)),">",">"),"<","<")
    l=Len(Str)
    t=0
    For i=1 To l
        c=Abs(Ascw(Mid(str,i,1)))
        If c>255 Then
            t=t+2
        Else
            t=t+1
        End If
        If t>=Strlen Then
            GetStr=Left(Str,i) & "…"
            Exit For
        Else
            GetStr=Str
        End if
    Next
    GetStr=Replace(Replace(Replace(Replace(GetStr," "," "),chr(34),""),">",">"),"<","<")
End Function
	
'********************************************************************************
'    名称：过滤HTML代码
'********************************************************************************
function HTMLEncode(fString)
if not isnull(fString) then
	fString = replace(fString, ";", "；") '分号过滤 
	fString = replace(fString, "--", "——") '--过滤 
	fString = replace(fString, "%20", "") '特殊字符过滤 
	fString = replace(fString, "==", "") '==过滤
	fString = replace(fString, ">", "&gt;")
    fString = replace(fString, "<", "&lt;")
    fString = Replace(fString, CHR(32), "&nbsp;")
    fString = Replace(fString, CHR(9), "&nbsp;")
    fString = Replace(fString, CHR(34), "&quot;")
    fString = Replace(fString, CHR(39), "&#39;")
    fString = Replace(fString, CHR(13), "")
    fString = Replace(fString, CHR(10) & CHR(10), "</p><p> ")
    fString = Replace(fString, CHR(10), "<br /> ")

    'fString=ChkBadWords(fString)
    HTMLEncode = fString
else
   HTMLEncode=fstring
end if
end function

'********************************************************************************
'    名称：过滤SQL非法字符
'********************************************************************************
function checkStr(str)
if isnull(str) then
  checkStr = ""
  exit function 
end if
	checkStr=replace(str,"'","''")
end function
'========结束过滤SQL非法字符========

'=====sql防注函数，代替request函数===
'--- 传入参数 ---
'ParaName:参数名称-字符型
'ParaType:参数类型-数字型(1表示以上参数是数字，0表示以上参数为字符)
Function SafeRequest(ParaName,ParaType)
Dim ParaValue
ParaValue=Request(ParaName)
If ParaType=1 then
If not isNumeric(ParaValue) then
Response.write "<strong>特别提醒：参数" & ParaName & "必须为数字型！——你的IP已记录，请勿进行非法操作！</strong>"
Response.end
End if
Else
ParaValue=replace(ParaValue,"'","''")
End if
SafeRequest=ParaValue
End function

'========转换逗号========
function conComma(str)
if isnull(str) then
  conComma = ""
  exit function 
end if
conComma=replace(str,"，",",")
end function

'********************************************************************************
'    名称：判断数字是否整形
'********************************************************************************
function isInteger(para)
       on error resume next
       dim str
       dim l,i
       if isNUll(para) then 
          isInteger=false
          exit function
       end if
       str=cstr(para)
       if trim(str)="" then
          isInteger=false
          exit function
       end if
       l=len(str)
       for i=1 to l
           if mid(str,i,1)>"9" or mid(str,i,1)<"0" then
              isInteger=false 
              exit function
           end if
       next
       isInteger=true
       if err.number<>0 then err.clear
end function

'********************************************************************************
'    名称：判断字符长度(包括汉字)
'********************************************************************************
Function CheckStringLength(txt)
txt=trim(txt)
x = len(txt)
y = 0
for ii = 1 to x
  if asc(mid(txt,ii,1))<0 or asc(mid(txt,ii,1))>255 then
    y = y + 2
  else
    y = y + 1
  end if
next
CheckStringLength = y
End Function


'********************************************************************************
'    名称：弹出对话框
'    入口参数：message 显示内容 gourl 返回方式 or 返回地址
'    返回值:gourl为-1时 返回前一页不刷新 为网址时 返回gourl值页面
'********************************************************************************
Function Msg(message,gourl)
message = replace(message,"'","\'")
If gourl="-1" then
Response.Write ("<script language='javascript'>alert('" & message & "');history.go(-1)</script>")
Else
Response.Write ("<script language='javascript'>alert('" & message & "');location='" & gourl &"'</script>")
End If
Response.End()
End Function

'********************************************************************************
'    名称：高亮搜索字段
'********************************************************************************
Function BoldWord(strContent,word)
    dim objRegExp
    Set objRegExp=new RegExp
    objRegExp.IgnoreCase =true
    objRegExp.Global=True

    objRegExp.Pattern="(" & word & ")"
    strContent=objRegExp.Replace(strContent,"<strong style=""color:#F00"">$1</strong>" )

    Set objRegExp=Nothing
    BoldWord=strContent
End Function

'********************************************************************************
'    名称：：trunDate   
'    作用：转换月份格式（阿拉伯数字->英文）   
'    参数：myMonth-----月份   
'********************************************************************************
Function trunDate(myMonth)   
  select case myMonth
  case "1"
  myMonth="January"   
  case "2"
  myMonth="February"   
  case "3"
  myMonth="March"   
  case "4"
  myMonth="April"   
  case "5"
  myMonth="May"   
  case "6"
  myMonth="June"   
  case "7"
  myMonth="July"   
  case "8"
  myMonth="August"   
  case "9"
  myMonth="September"   
  case "10"
  myMonth="October"   
  case "11"
  myMonth="November"   
  case else
  myMonth="December"   
  end select
  trunDate=myMonth 
End Function

Function ShowPowerName(powerId)
	select case powerId
	case 1
	ShowPowerName ="录入员"
	case 2
	ShowPowerName = "管理员"
	case else
	ShowPowerName = "未知错误"
	end select
End Function

Function ShowStateName(stateId)
	select case stateId
	case 0
	ShowStateName ="<span class='colorRed'>锁定</span>"
	case 1
	ShowStateName = "正常"
	case else
	ShowStateName = "未知错误"
	end select
End Function

Function ShowTop(topId)
	select case topId
	case 0
	ShowTop =""
	case 1
	ShowTop = "类型置顶"
	case 2
	ShowTop = "地域置顶"
	case 3
	ShowTop = "年份置顶"
	case else
	ShowTop = "未知错误"
	end select
End Function

Function ShowRecommend(recommendId)
	select case recommendId
	case 0
	ShowRecommend =""
	case 1
	ShowRecommend = "推荐"
	case else
	ShowRecommend = "未知错误"
	end select
End Function



' 生成指定长度的字符串,即生成strLong个str字符串
Function StringOfChar( strLong, str )
	ReturnStr = ""
	FOR i = 0 TO strLong
	ReturnStr = ReturnStr & str
	NEXT
	StringOfChar = ReturnStr
End Function

' ============================================
' 格式化时间(显示)
' 参数：n_Flag
' 1:"yyyy-mm-dd hh:mm:ss"
' 2:"yyyy-mm-dd"
' 3:"hh:mm:ss"
' 4:"yyyy年mm月dd日"
' 5:"yyyymmdd"
' 6:"yyyymmddhhmmss"
' ============================================
Function Format_Time(s_Time, n_Flag)
Dim y, m, d, h, mi, s
Format_Time = ""
If IsDate(s_Time) = False Then Exit Function
y = cstr(year(s_Time))
m = cstr(month(s_Time))
If len(m) = 1 Then m = "0" & m
d = cstr(day(s_Time))
If len(d) = 1 Then d = "0" & d
h = cstr(hour(s_Time))
If len(h) = 1 Then h = "0" & h
mi = cstr(minute(s_Time))
If len(mi) = 1 Then mi = "0" & mi
s = cstr(second(s_Time))
If len(s) = 1 Then s = "0" & s
Select Case n_Flag
Case 1
' yyyy-mm-dd hh:mm:ss
Format_Time = y & "-" & m & "-" & d & " " & h & ":" & mi & ":" & s
Case 2
' yyyy-mm-dd
Format_Time = y & "-" & m & "-" & d
Case 3
' hh:mm:ss
Format_Time = h & ":" & mi & ":" & s
Case 4
' yyyy年mm月dd日
Format_Time = y & "年" & m & "月" & d & "日"
Case 5
' yyyymmdd
Format_Time = y & m & d
case 6
'yyyymmddhhmmss
format_time= y & m & d & h & mi & s
End Select
End Function 

'========检测用户权限登录========
Function CheckAdmin(Num)

Power_Cookies = request.Cookies("Power")

if Power_Cookies <> "" then
Power_Cookies = cint(Power_Cookies)
else
Call Msg("你无法浏览该页面！","../adminLogin.html")
end if

if Power_Cookies < cint(Num) then
Call Msg("你权限不足无法浏览该页面！","../adminLogin.html")
End if

End Function
'========结束检测用户类型========

%>