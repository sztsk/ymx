<%@ Language = "VBScript" %>
<% Response.Buffer = True %>

<html>

<%

' Prepare variables.

Dim oFS, oFSPath
Dim sServername, sServerinst, sPhyspath, sServerVersion 
Dim sServerIP, sRemoteIP
Dim sPath, oDefSite, sDefDoc, sDocName, aDefDoc

Dim bSuccess           ' This value is used later to warn the user if a default document does not exist.
Dim iVer               ' This value is used to pass the server version number to a function.

bSuccess = False
iVer = 0

' Get some server variables to help with the next task.

sServername = LCase(Request.ServerVariables("SERVER_NAME"))
sServerinst = Request.ServerVariables("INSTANCE_ID")
sPhyspath = LCase(Request.ServerVariables("APPL_PHYSICAL_PATH"))
sServerVersion = LCase(Request.ServerVariables("SERVER_SOFTWARE"))
sServerIP = LCase(Request.ServerVariables("LOCAL_ADDR"))      ' Server's IP address
sRemoteIP =  LCase(Request.ServerVariables("REMOTE_ADDR"))    ' Client's IP address

' If the querystring variable uc <> 1, and the user is browsing from the server machine, 
' go ahead and show them localstart.asp.  We don't want localstart.asp shown to outside users.

If Not (sServername = "localhost" Or sServerIP = sRemoteIP) Then
  Response.Redirect "iisstart.asp"
Else 

' Using ADSI, get the list of default documents for this Web site.

sPath = "IIS://" & sServername & "/W3SVC/" & sServerinst
Set oDefSite = GetObject(sPath)
sDefDoc = LCase(oDefSite.DefaultDoc)
aDefDocs = split(sDefDoc, ",")

' Make sure at least one of them is valid.

Set oFS = CreateObject("Scripting.FileSystemObject")

For Each sDocName in aDefDocs
  If oFS.FileExists(sPhyspath & sDocName) Then
    If InStr(sDocName,"iisstart") = 0 Then
      ' IISstart doesn't count because it is an IIS file.
      bSuccess = True  ' This value will be used later to warn the user if a default document does not exist.
      Exit For
    End If
  End If
Next

' Find out what version of IIS is running.

Select Case sServerVersion 
   Case "microsoft-iis/5.0"
     iVer = 50         ' This value is used to pass the server version number to a function.
   Case "microsoft-iis/5.1"
     iVer = 51
   Case "microsoft-iis/6.0"
     iVer = 60
End Select

%>

<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">

<script language="javascript">

  // This code is executed before the rest of the page, even before the ASP code above.
  
  var gWinheight;
  var gDialogsize;
  var ghelpwin;
  
  // Move the current window to the top left corner.
  
  window.moveTo(5,5);
  
  // Change the size of the window.

  gWinheight= 480;
  gDialogsize= "width=640,height=480,left=300,top=50,"
  
  if (window.screen.height > 600)
  {
<% if not success and Err = 0 then %>
    gWinheight= 700;
<% else %>
    gWinheight= 700;
<% end if %>
    gDialogsize= "width=640,height=480,left=500,top=50"
  }
  
  window.resizeTo(620,gWinheight);
  
  // Launch IIS Help in another browser window.
  
  loadHelpFront();

function loadHelpFront()
// This function opens IIS Help in another browser window.
{
  ghelpwin = window.open("http://localhost/iishelp/","Help","status=yes,toolbar=yes,scrollbars=yes,menubar=yes,location=yes,resizable=yes,"+gDialogsize,true);  
      window.resizeTo(620,gWinheight);
}

function activate(ServerVersion)
// This function brings up a little help window showing how to open the IIS snap-in.
{
  if (50 == ServerVersion)
    window.open("http://localhost/iishelp/iis/htm/core/iisnapin.htm", "SnapIn", 'toolbar=no, left=200, top=200, scrollbars=yes, resizeable=yes,  width=350, height=350');
  if (51 == ServerVersion)
    window.open("http://localhost/iishelp/iis/htm/core/iiabuti.htm", "SnapIn", 'toolbar=no, left=200, top=200, scrollbars=yes, resizeable=yes,  width=350, height=350');
  if (60 == ServerVersion)
    window.open("http://localhost/iishelp/iis/htm/core/gs_iissnapin.htm", "SnapIn", 'toolbar=no, left=200, top=200, scrollbars=yes, resizeable=yes,  width=350, height=350');
  if (0 == ServerVersion)
    window.open("http://localhost/iishelp/", "Help", 'toolbar=no, left=200, top=200, scrollbars=yes, resizeable=yes,  width=350, height=350');  
}

</script>

<title>欢迎使用 Windows XP Server Internet 服务</title>
<style>
  ul{margin-left: 15px;}
  .clsHeading {font-family: 宋体; color: black; font-size: 12; font-weight: 800; width:210;}  
  .clsEntryText {font-family: 宋体; color: black; font-size: 12; font-weight: 400; background-color:#FFFFFF;}    
  .clsWarningText {font-family: 宋体; color: #B80A2D; font-size: 12; font-weight: 600; width:550;  background-color:#EFE7EA;}  
  .clsCopy {font-family: 宋体; color: black; font-size: 12; font-weight: 400;  background-color:#FFFFFF;}  
</style>
</head>

<body topmargin="3" leftmargin="3" marginheight="0" marginwidth="0" bgcolor="#FFFFFF"
link="#000066" vlink="#000000" alink="#0000FF" text="#000000">

<!-- BEGIN MAIN DOCUMENT BODY --->

<p align="center"><img src="winXP.gif" vspace="0" hspace="0"></p>
<table width="500" cellpadding="5" cellspacing="3" border="0" align="center">

  <tr>
  <td class="clsWarningText" colspan="2">
  
  <table><tr><td>
  <img src="warning.gif" width="40" height="40" border="0" align="left">
  </td><td class="clsWarningText">
  <b>Web 服务正在运行。
  
<% If Not bSuccess And Err = 0 Then %>
  
  <p>当前没有为用户设置默认网页。试图从其他计
算机连接到此网站的所有用户当前都将收到
  <a href="iisstart.asp?uc=1">正在建设中</a> 网页。
Web 服务器将列出下列文件作为默认网页: <%=sDefDoc%>。当前，只有 iisstart.asp。<br><br>
  
<% End If %>

  要将文档添加到默认网站中，请将文件保存在<%=sPhyspath%>中。 
  </b>
  </td></tr></table>
 
  </td>
  </tr>
  
  <tr>
  <td>
  <table cellpadding="3" cellspacing="3" border=0 >
  <tr>
    <td valign="top" rowspan=3>
      <img src="web.gif">
    </td>  
    <td valign="top" rowspan=3>
  <span class="clsHeading">
  欢迎使用 IIS 5.1</span><br>
      <span class="clsEntryText">    
    Microsoft Windows XP Professional 中的 Internet 信息服务 (IIS) 5.1 
在 Windows 中增加了强大的 Web 计算功能。通过 IIS，可以轻松地
共享文件和打印机，或者创建应用程序以在网站上安全地发布信息，
从而改善组织共享信息的方式。IIS 是在网站上构建和部署电子商务
解决方案以及任务关键的应用程序的一种安全平台。  <p>
    安装了 IIS 的 Windows XP Professional 可以提供个人和开发操作系统，并允许:</span>
  <p>
    <ul class="clsEntryText">
      <li>设置个人 Web 服务器
      <li>在工作组中共享信息
<li>访问数据库
      <li>开发企业 Intranet
      <li>开发 Web 应用程序
</ul>
  <p>
  <span class="clsEntryText">
    IIS 将公认的 Internet 标准与 Windows 集成，因此使用 Web 并不意味着
  必须重新学习新的 Web 内容发布、管理和开发方式。
  <p>
  </span>
  </td>

    <td valign="top">
      <img src="mmc.gif">
    </td>
    <td valign="top">
      <span class="clsHeading">集成管理</span>
      <br>
      <span class="clsEntryText">
        可以通过 Windows XP 计算机管理<a href="javascript:activate(<%=iVer%>);">控制台</a> 
        或通过编写脚本来管理 IIS。还可以使用控制台，通过 Web 与他人共享使用 
Internet 信息服务管理的站点和服务器的内容。从控制台访问 Internet 信息服务
管理单元，可以配置最常用的 IIS 设置和属性。开发站点和应用程序之后，
可以在运行功能更加强大的 Windows Server 的生产环境中使用这些设置和属性。
      <p>
       
      </span>
    </td>
  </tr>
  <tr>
    <td valign="top">
      <img src="help.gif">
    </td>
    <td valign="top">
      <span class="clsHeading"><a href="javascript:loadHelpFront();">联机文档</a></span>
      <br>
      <span class="clsEntryText">IIS 联机文档包含索引和全文搜索，并具有按节点或单个主题
打印的功能。请参阅随 IIS 安装的示例，了解编程管理和脚本
开发。帮助文件以 HTML 格式存储，使您可以根据需要进行
批注和共享。使用 IIS 联机文档，可以:
<p>
      </span>
      <ul class="clsEntryText">
         <li>获取任务帮助
         <li>了解服务器操作和管理
         <li>参阅参考资料
         <li>查看代码示例
      </ul>
      <p>
        <span class="clsEntryText">
        可以在下列 Microsoft.com 网站中找到有关 IIS 的其他
有用资源: MSDN、TechNet 和 Windows 站点。
        </span>
    </td>
  </tr>
  
  <tr>
    <td valign="top">
      <img src="print.gif">
    </td>
    <td valign="top">
      <span class="clsHeading">Web 打印</span>
      <br>
      <span class="clsEntryText">Windows XP Professional 在一个可以轻松访问的网站中动态列出
服务器上的所有打印机。可以通过浏览此站点监视打印机以及
打印作业。也可以通过此站点从任何一台 Windows 计算机连接
到打印机。请参阅有关“Internet 打印”的 Windows 帮助文档。 
      </span>
    </td>
  </tr>
  
  </table>
</td>
</tr>
</table>

<p align=center><em><a href="/iishelp/common/colegal.htm">(C) 1997-2001 Microsoft Corporation. 保留所有权利。</a></em></p>

</body>
</html>

<% End If %>

