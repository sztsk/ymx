﻿<!--#include file = "admin/article/articleManage.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
Set sqldb = New DB
%>
<title>深圳亚玛迅雕塑园林艺术有限公司</title>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery.fancybox-1.2.1.pack.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<link rel="stylesheet" type="text/css" href="css/default.css"/>
<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css" />
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
 		<img src="../../upload/cate/<%=lm_rs("ClassImg")%>" width="550" height="372"/> 
	</div>
    <div class="mainBoxRight">
<%
lm_rs.close
set lm_rs = nothing '关闭记录

sql_art = "select * from article where categoryId = '"&lmid &"'"

isHave = sqldb.HasRecordById(sql_art)

if isHave = true Then

set art_rs = sqldb.GetRsBySql(sql_art,1)
'response.Write(sql_art)
do while not art_rs.Eof
response.Write("<ul>")
response.Write("<li><a class='jsPre' href='preNews.asp?artId="& art_rs("artId") &"'>" & art_rs("title") & "</a></li>")
response.Write("</ul>")
IF art_rs.Eof then exit do
art_rs.movenext
loop 
art_rs.close
set art_rs = nothing '关闭记录集
ELSE
response.Write("<h2 class='otherTilte'>没有找到相关内容！</h2>")
END IF
%>



      <!--<p class="titleP">项目案例</p>
      <ul>
      	<li><a href="#">城市雕塑</a></li>
      	<li><a href="#">城市公共艺术品</a></li>
      	<li><a href="#">园林小品</a></li>
      	<li><a href="#">酒店家具装饰品</a></li>
      	<li><a href="#">公共空间文化形象策划实施</a></li>
      	<li><a href="#">景观园林规划设计</a></li>
      	<li><a href="#">城市街道规划改造</a></li>
      	<li><a href="#">旅游主题公园造景</a></li>
      </ul>
      <p class="titleP">最新项目实景</p>
      <ul>
      	<li><a href="#">城市雕塑</a></li>
      	<li><a href="#">城市公共艺术品</a></li>
      	<li><a href="#">园林小品</a></li>
      	<li><a href="#">酒店家具装饰品</a></li>
      	<li><a href="#">公共空间文化形象策划实施</a></li>
      	<li><a href="#">景观园林规划设计</a></li>
      	<li><a href="#">城市街道规划改造</a></li>
      	<li><a href="#">旅游主题公园造景</a></li>
      	<li><a href="#">公共空间文化形象策划实施</a></li>
      	<li><a href="#">景观园林规划设计</a></li>
      	<li><a href="#">城市街道规划改造</a></li>
      	<li><a href="#">旅游主题公园造景</a></li>
      </ul>-->
    </div>
  </div>
  <div class="bottomBox">Copyright &copy; 2009-2010 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
