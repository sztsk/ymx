<!--#include file = "admin/article/articleManage.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="ymx25,yamaxun25,深圳亚玛迅雕塑园林艺术有限公司,亚玛迅,创作研发,设计实施,公共艺术品,城市雕塑,室内外装饰品,建筑及景观艺术品,园境规划设计" />
<meta name="Description" content="深圳市“亚玛迅”秉承东方文脉、融合西方设计精髓，是创作研发、设计实施城市雕塑及公共艺术品、室内外装饰品、建筑及景观艺术品、园境规划设计的专业公司。公司经多年的努力已在国内外市场赢得了良好的行业口碑！" />
<%
Set sqldb = New DB
'set pre = GetArtByIdAll
'response.Write(pre(1))
%>
<title>深圳亚玛迅雕塑园林艺术有限公司</title>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery.fancybox-1.2.1.pack.js"></script>
<script type="text/javascript" src="js/prePro.js"></script>
<link rel="stylesheet" type="text/css" href="css/default.css"/>
<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css" />
<style type="text/css">
#content img,#jsImg img{width:98px; height:74px; margin-bottom:9px; margin-left:9px; float:left;}
#fist{cursor:pointer}
</style>
</head>

<body>

<!--#include file = "header.asp"-->
    <div class="mainBoxTopTitle">
<%
set pre = GetArtByIdAll
%>
    	<a href="index.html">首页</a> > <a href="pro1.asp">重点案例</a> > 
		<%
		if pre("categoryId") = "20091121020108" then
		response.Write("<a href='pro1.asp'> 雕塑·饰品 </a>  > ")
		elseif pre("categoryId") = "20091121020129" then
		response.Write("<a href='proNext.asp?id=2'>园境·展示</a> > ")
		end if
	
		%> 
		<%=pre(1)%></div>
    <div class="mainBoxLeft">
     <img src="ymx25.jpg" id="fist"/>
     <div  id="js_top1"  class="textDiv"></div>
	</div>
    <div class="mainBoxRight">
    
    <h2 class="otherTilte" style="margin-left:133px;"><%=pre(1)%></h2>
	<div id="content" style="display:none"><%=pre(4)%></div><!--.content -->
    <div id="jsImg" class="contentImg"></div>
    </div>
  </div>
  <div class="bottomBox">优秀的设计 精良的制作<br />Copyright &copy; 2009-2010 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. <a href="http://www.miibeian.gov.cn/">粤ICP备12016512号</a> 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div></div>
</body>
</html>
