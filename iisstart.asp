<%@ Language = "VBScript" %>
<% Response.Buffer = true %>

<!--
    WARNING!
    Please do not alter this file. It may be replaced if you upgrade your web server 
      If you want to use it as a template, we recommend renaming it, and modifying the new file.
    Thanks.
-->

<html>

<head>
<meta HTTP-EQUIV="Content-Type" Content="text-html; charset=gb2312">

<%

Dim strServername, strLocalname, strServerIP

strServername = LCase(Request.ServerVariables("SERVER_NAME"))   ' Server's name
strServerIP = LCase(Request.ServerVariables("LOCAL_ADDR"))      ' Server's IP address
strRemoteIP =  LCase(Request.ServerVariables("REMOTE_ADDR"))    ' Client's IP address

' If the querystring variable uc <> 1, and the user is browsing from the server machine, 
' go ahead and show them localstart.asp.  We don't want localstart.asp shown to outside users.

If Request("uc") <> 1 And  (strServername = "localhost" Or strServerIP = strRemoteIP) Then
  Response.Redirect "localstart.asp"
Else 

%>

<title id=titletext>���ڽ�����</title>
</head>

  <body bgcolor=white>
  <table>
  <tr>
  <td id="tableProps" width=70 valign=top align=center>
  <img id="pagerrorImg" src="pagerror.gif" width=36 height=48>  
  <td id="tablePropsWidth" width=400>
  
  <h1 id=errortype style="font:14pt/16pt ����; color:#4e4e4e">
  <id id="Comment1"><!--Problem--></id><id id="errorText">���ڽ�����</id></h1>
  <id id="Comment2"><!--Probable causes:<--></id><id id="errordesc"><font style="font:9pt/12pt ����; color:black">
  ��ͼ���ʵ�վ�㵱ǰû������Ĭ����ҳ����վ������������������á�
  </id>
  <br><br>
  
  <hr size=1 color="blue">
  
  <br>
  <id  id=term1>
  ���Ժ����Է��ʴ�վ�㡣�����Ȼ�������⣬������վ����Ա��ϵ�� 
  </id>
  <p>
  
  </ul>
  <br>
  </td>
  </tr>
  </table>
  </body>
  
<%

End If 

%>

</html>













