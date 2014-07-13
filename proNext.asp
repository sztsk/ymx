<!--#include file = "admin/article/articleManage.asp"-->
<!--#include file = "admin/article/commonOption.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="ymx25,yamaxun25,深圳亚玛迅雕塑园林艺术有限公司,亚玛迅,创作研发,设计实施,公共艺术品,城市雕塑,室内外装饰品,建筑及景观艺术品,园境规划设计" />
<meta name="Description" content="深圳市“亚玛迅”秉承东方文脉、融合西方设计精髓，是创作研发、设计实施城市雕塑及公共艺术品、室内外装饰品、建筑及景观艺术品、园境规划设计的专业公司。公司经多年的努力已在国内外市场赢得了良好的行业口碑！" />
<%
Set sqldb = New DB
id = SafeRequest("id",1)
IF id = 1 THEN
proId_list = "20091121020108"
ELSEIF id = 2 THEN
proId_list = "20091121020129"
ELSE 
proId_list = "20091121020108,20091121020129"
END IF
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
dy = SafeRequest("pro",0)
if dy <> "" then
orderbydy = "and isRecommend = "& dy
else
orderbydy =""
end if
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
''去掉最后的一个, 
'proId_list = left(proId_list,len(proId_list)-1)

%>
    	<a href="index.html">首页</a> > <a href="pro.asp">重点案例</a> > 
        <% IF id = 1 Then %>
        <a href="pro1.asp">雕塑·饰品</a> 
        <%ELSE%>
        <a href="pro2.asp">园境·展示</a> 
        <%END IF %>
        > <a href="">类型列表</a></div>
        
<%
sql_lei_1 = "select top 1 * from article where categoryId in ("& proId_list & ") "& orderbydy &"  and isTop = 1 order by artId desc"
set rs_lei_1 = rs.GetRsValueBySql(sql_lei_1)
if isnull(rs_lei_1("title"))   then
response.Write("<div id='js_temp' title='"& rs_lei_1("title") &"' style='display:none'>"& rs_lei_1("content") & "</div>")
ELSE
response.Write("<div id='js_temp' title='123' style='display:none'><img src='ymx25.jpg'></div>")
End IF


%>
        <!-- right -->
    <div class="mainBoxLeft">
    	<div id="js_top_img"></div>
	 <div  id="js_top1"  class="textDiv">text</div>
	 </div>
    <div class="mainBoxRight" id="js_Show">
	  <div class="leftMenuNext">
	  	<style type="text/css">
			#js_blod{ margin-left:18px}
			#js_blod li{ list-style:disc; text-align:left!important}
		</style>
		<ul id="js_blod">
		  <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=1" title="">公共艺术</a></li>
		  <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=2" title="">高尚住宅</a></li>
		  <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=3" title="">酒店会所</a></li>
		  <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=4" title="">商业空间</a></li>
		  <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=5" title="">主题公园</a></li>
		  <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=6" title="">旧城改造</a></li>
		  <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=7" title="">公园社区</a></li>
           <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=8" title="">旅游名胜</a></li>
		  <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=9" title="">居家饰品</a></li>
		  <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=10" title="">宗教题材</a></li>
		  <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=11" title="">企业礼品</a></li>
          <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=12" title="">特色定制</a></li>
          <li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=13" title="">艺术原创</a></li>
          <!--li class="js_pro1"><a href="proNext.asp?id=<% =id%>&pro=14" title="">新材料实践</a></li-->
          <li class="js_pro2"><a href="proNext.asp?id=<% =id%>&pro=15" title="">商业展示</a></li>
          <li class="js_pro2"><a href="proNext.asp?id=<% =id%>&pro=16" title="">旅游项目</a></li>
          <li class="js_pro2"><a href="proNext.asp?id=<% =id%>&pro=17" title="">地产豪宅</a></li>
          <li class="js_pro2"><a href="proNext.asp?id=<% =id%>&pro=18" title="">旧城改造</a></li>
<!--          <li class="js_pro2"><a href="proNext.asp?id=<% =id%>&pro=19" title="">星级酒店</a></li>-->
          
         
		</ul>
	  </div>
	  <div class="leftPhotoNext">
		<ul>
<%


sql_leixing = "select * from article where categoryId in ("& proId_list & ") "& orderbydy &"  order by artId desc , isTop desc"
set rs_leixing = sqldb.GetRsBySql(sql_leixing,1)
do while not rs_leixing.Eof
response.Write("<li class='js_list' style='display:none'>"& rs_leixing("content") &"</li>")
response.Write("<li class='js_page_li'><a href='prePro.asp?artId="& rs_leixing("artId") &"'><img src='ymx25.jpg' title='"& rs_leixing("title") &"' /><br />"& ShowLeiXin(rs_leixing("isRecommend")) &"</a></li>")
IF rs_leixing.Eof then exit do
rs_leixing.movenext
loop 
rs_leixing.close
set rs_leixing = nothing '关闭记录集
%>
		</ul>
	  </div>
      <div class="pageDiv"><a href="#" id="js_pre"><img src="images/24-arrow-previous.png" alt="previous" title="previous" /></a>  <a href="#" id="js_next"><img src="images/24-arrow-next.png" alt="next" title="next" /></a></div>
    </div>
  </div>
  <div class="bottomBox">优秀的设计 精良的制作<br />Copyright &copy; 2009-2010 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. <a href="http://www.miibeian.gov.cn/">粤ICP备12016512号</a> 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
