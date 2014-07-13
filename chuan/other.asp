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
    <div class="mainBoxLeft">
<%If lmid <> 20091121020541 then%>
      <% IF lm_rs("ClassImg") <> "" THEN %>
 	 <img src="../../upload/cate/<%=lm_rs("ClassImg")%>" width="550" height="372"/> 
     <%ELSE%>
     <img src="ymx25.jpg"  width="550" height="372"/>
     <%End IF%>
<%else%>
<iframe width="550" height="372" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src=" http://ditu.google.com/maps?q=%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E7%A6%8F%E7%94%B0%E5%8C%BA%E7%BA%A2%E8%8D%94%E8%B7%AF%E8%8A%B1%E5%8D%89%E4%B8%96%E7%95%8C4018%E5%8F%B7&amp;hl=zh-CN&amp;ei=SGwCS-O2J47muQPWuMDaCw&amp;sll=22.548572,114.075527&amp;sspn=0.024732,0.038418&amp;brcurrent=3,0x3403f43635816e55:0x3b8f8715305be7e0,0,0x3403f3f633f78ad9:0x7a30a41e1da40b9e%3B5,0,0&amp;ie=UTF8&amp;view=map&amp;cid=10191518290260252572&amp;ved=0CA4QpQY&amp;hq=%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E7%A6%8F%E7%94%B0%E5%8C%BA%E7%BA%A2%E8%8D%94%E8%B7%AF%E8%8A%B1%E5%8D%89%E4%B8%96%E7%95%8C4018%E5%8F%B7&amp;hnear=&amp;ll=22.54857,114.07553&amp;spn=0.006295,0.006295&amp;output=embed"></iframe><br /><small><a href=" http://ditu.google.com/maps?q=%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E7%A6%8F%E7%94%B0%E5%8C%BA%E7%BA%A2%E8%8D%94%E8%B7%AF%E8%8A%B1%E5%8D%89%E4%B8%96%E7%95%8C4018%E5%8F%B7&amp;hl=zh-CN&amp;ei=SGwCS-O2J47muQPWuMDaCw&amp;sll=22.548572,114.075527&amp;sspn=0.024732,0.038418&amp;brcurrent=3,0x3403f43635816e55:0x3b8f8715305be7e0,0,0x3403f3f633f78ad9:0x7a30a41e1da40b9e%3B5,0,0&amp;ie=UTF8&amp;view=map&amp;cid=10191518290260252572&amp;ved=0CA4QpQY&amp;hq=%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E7%A6%8F%E7%94%B0%E5%8C%BA%E7%BA%A2%E8%8D%94%E8%B7%AF%E8%8A%B1%E5%8D%89%E4%B8%96%E7%95%8C4018%E5%8F%B7&amp;hnear=&amp;ll=22.54857,114.07553&amp;spn=0.006295,0.006295&amp;source=embed" style="color:#0000FF;text-align:left">查看大图</a></small>
<%End if%>
	</div>
    <div class="mainBoxRight">
<%
lm_rs.close
set lm_rs = nothing '关闭记录

sql_art = "select * from article where categoryId= '"&lmid &"'"
'先判断是否存在记录
isHave = sqldb.HasRecordById(sql_art)
if(isHave = true) Then
set art_rs = sqldb.GetRsValueBySql(sql_art)
%>
<h1 class="otherTilte"><%=art_rs("title")%></h1>
<div><%=art_rs("content")%></div>
<%
art_rs.close
set art_rs = nothing '关闭记录
ELSE
%>
<h1 class="otherTilte">没有相关文章</h1>
<%
End if
%>

    </div>
  </div>
  <div class="bottomBox">Copyright &copy; 2009-2010 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
