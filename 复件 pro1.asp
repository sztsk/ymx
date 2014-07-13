<!--#include file = "admin/article/articleManage.asp"-->
<!--#include file = "admin/article/commonOption.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
Set sqldb = New DB

'获取项目列表下的所有子栏目ID
'sql_lm_child = "select ClassId from category where ClassList like '20091121015949%'"
'set rs_lm_child = sqldb.GetRsBySql(sql_lm_child,1)
'do while not rs_lm_child.Eof
'proId_list = proId_list + rs_lm_child(0)&","
'IF rs_lm_child.Eof then exit do
'rs_lm_child.movenext
'loop 
'rs_lm_child.close
'set rs_lm_child = nothing '关闭记录集
'去掉最后的一个, 
proId_list = "20091121020108"


%>
<title>项目展示 | 深圳亚玛迅雕塑园林艺术有限公司</title>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/pro.js"></script>
<link rel="stylesheet" type="text/css" href="css/default.css"/>
</head>

<body>
<!--#include file = "header.asp"-->
<div class="mainBoxTopTitle">
<%
'lmid = SafeRequest("lmid",0)
'sql_img = "select * from category where ClassId= '"&lmid &"'"
'set lm_rs = sqldb.GetRsValueBySql(sql_img)
%>
    	<a href="index.asp">首页</a> > <a href="pro.asp">重点案例</a> >  雕塑·饰品 <%'=lm_rs("ClassName")%></div>
        <!-- right -->
        <%
sql_lei_1 = "select top 1 * from article where categoryId in ("& proId_list & ") and isTop = 1 order by artId desc"
set rs_lei_1 = rs.GetRsValueBySql(sql_lei_1)
response.Write("<div id='js_temp' title='"& rs_lei_1("title") &"' style='display:none'>"& rs_lei_1("content") & "</div>")

%>
    <div class="mainBoxLeft">
		<div id="js_top_img"></div>
    
	 <div id="js_top1" class="textDiv">text</div>
	 </div>
    <div class="mainBoxRight" id="js_Show">
	  <div class="leftMenu">
		<ul>
		  <li>&middot;类型&middot;</li>
		  <li>&middot;地域&middot;</li>
		  <li>&middot;年份&middot;</li>
          <!-- <li><a href="proNext.asp?id=1">&middot;类型&middot;</a></li>
		  <li><a href="proNextDy.asp?id=1">&middot;地域&middot;</a></li>
		  <li><a href="proNextNf.asp?id=1">&middot;年份&middot;</a></li>-->
		</ul>
	  </div>
	  <div class="leftPhoto">
		<ul>
<%


'前3个类型
sql_leixing = "select top 3 * from article where categoryId in ("& proId_list & ") and isTop = 1 order by artId desc"
set rs_leixing = sqldb.GetRsBySql(sql_leixing,1)
do while not rs_leixing.Eof
response.Write("<li class='js_list' style='display:none'>"& rs_leixing("content") &"</li>")
response.Write("<li><a href='proNext.asp?id=1'><img src='ymx25.jpg' title='"& rs_leixing("title") &"' /><br />"& ShowLeiXin(rs_leixing("isRecommend")) &"</a></li>")
IF rs_leixing.Eof then exit do
rs_leixing.movenext
loop 
rs_leixing.close
set rs_leixing = nothing '关闭记录集

'前3个地域 
sql_leixing = "select top 3 * from article where categoryId in ("& proId_list & ") and isTop = 2 order by artId desc"
set rs_leixing = sqldb.GetRsBySql(sql_leixing,1)
do while not rs_leixing.Eof
response.Write("<li class='js_list' style='display:none'>"& rs_leixing("content") &"</li>")
response.Write("<li><a href='prePro.asp?artId="& rs_leixing("artId") &"'><img src='ymx25.jpg' title='"& rs_leixing("title") &"' /><br />"& ShowDiYu(rs_leixing("isReview")) &"</a></li>")
IF rs_leixing.Eof then exit do
rs_leixing.movenext
loop 
rs_leixing.close
set rs_leixing = nothing '关闭记录集


'前3个年份
sql_leixing = "select top 3 * from article where categoryId in ("& proId_list & ") and isTop = 3 order by artId desc"
set rs_leixing = sqldb.GetRsBySql(sql_leixing,1)
do while not rs_leixing.Eof
response.Write("<li class='js_list' style='display:none'>"& rs_leixing("content") &"</li>")
response.Write("<li><a href='prePro.asp?artId="& rs_leixing("artId") &"'><img src='ymx25.jpg' title='"& rs_leixing("title") &"' /><br />"& ShowNainFen(rs_leixing("click")) &"</a></li>")
IF rs_leixing.Eof then exit do
rs_leixing.movenext
loop 
rs_leixing.close
set rs_leixing = nothing '关闭记录集

%>

		</ul>
	  </div>
    </div>
  </div>
  <div class="bottomBox">Copyright &copy; 2009-2010 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. <a href="http://www.miibeian.gov.cn/">粤ICP备09217406号</a> 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
