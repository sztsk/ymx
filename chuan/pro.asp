<!--#include file = "admin/article/articleManage.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
Set sqldb = New DB
'set pre = GetArtByIdAll
'response.Write(pre(1))
%>
<title>深圳亚玛迅雕塑园林艺术有限公司</title>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/pro.js"></script>
<link rel="stylesheet" type="text/css" href="css/default.css"/>
</head>

<body>
<!--#include file = "header.asp"-->
<div class="mainBoxTopTitle">
<%
lmid = SafeRequest("lmid",0)
sql_img = "select * from category where ClassId= '"&lmid &"'"
set lm_rs = sqldb.GetRsValueBySql(sql_img)
%>
    	<a href="index.asp">首页</a> > <%=lm_rs("ClassName")%></div>
        <!-- right -->
    <div class="mainBoxLeft">
     <% IF lm_rs("ClassImg") <> "" THEN %>
 	 <img src="../../upload/cate/<%=lm_rs("ClassImg")%>" width="550" height="372"/> 
     <%ELSE%>
     <img src="ymx25.png"  width="550" height="372"/>
     <%End IF%>
	</div>
    <div class="mainBoxRight" id="js_Show">
<%
lm_rs.close
set lm_rs = nothing '关闭记录

sql_art = "select * from category where ClassTj = 2 and ClassList like '"&lmid &"%'"
set art_rs = sqldb.GetRsBySql(sql_art,1)
j=0
do while not art_rs.Eof
j=j+1
response.Write("<p class='titleP show" & j & "'>"& art_rs("ClassName") &"</p>")
response.Write("<ul class='show"&j&"'>")

	sql3 = "select * from category where ClassTj = 3 and ClassList like '%"&art_rs("ClassId") &"%'"
	set rs3 = sqldb.GetRsBySql(sql3,1)
	do while not rs3.Eof
	response.Write("<li><a href='news.asp?lmid="& rs3("ClassId") &"'>" & rs3("ClassName") & "</a></li>")
	IF rs3.Eof then exit do
	rs3.movenext
	loop 

response.Write("</ul>")
IF art_rs.Eof then exit do
art_rs.movenext
loop 
art_rs.close
set art_rs = nothing '关闭记录集
%>

    </div>
  </div>
  <div class="bottomBox">Copyright &copy; 2009-2010 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
