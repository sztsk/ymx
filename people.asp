<!--#include file = "admin/article/articleManage.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="ymx25,yamaxun25,深圳亚玛迅雕塑园林艺术有限公司,亚玛迅,创作研发,设计实施,公共艺术品,城市雕塑,室内外装饰品,建筑及景观艺术品,园境规划设计" />
<meta name="Description" content="深圳市“亚玛迅”秉承东方文脉、融合西方设计精髓，是创作研发、设计实施城市雕塑及公共艺术品、室内外装饰品、建筑及景观艺术品、园境规划设计的专业公司。公司经多年的努力已在国内外市场赢得了良好的行业口碑！" />
<%
Set sqldb = New DB
%>
<title>深圳亚玛迅雕塑园林艺术有限公司</title>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/people.js"></script>
<link rel="stylesheet" type="text/css" href="css/default.css"/>
<style type="text/css">
#people_content{margin-left:33px;}
#people_photo{width:530px; height:80px; float:right;}
#people_photo img{border:1px solid #CCC; float:left; width:80px; height:80px; margin:12px; cursor:pointer}
#big_photo{cursor:pointer}
</style>
</head>

<body>
<!--#include file = "header.asp"-->
    <div class="mainBoxTopTitle">
    	<a href="index.html">首页</a> > <a href="other.asp?lmid=20091121015736">关于亚马逊</a></div>
        <!-- right -->
    <div class="mainBoxLeft">
     <img src="ymx25.jpg" id="big_photo" />
	</div>
    <div class="mainBoxRight">
<%
set pre = GetArtByIdAll
%>
	<h2 id="people_name" class='otherTilte' style="margin-left:33px;"><%=pre(1)%></h2>
    <div id="people_content" class='contentDiv'><%=pre(4)%></div>
    <div id="people_photo"></div>
    </div>
  </div>
  <div class="bottomBox">优秀的设计 精良的制作<br />Copyright &copy; 2009-2010 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. <a href="http://www.miibeian.gov.cn/">粤ICP备12016512号</a> 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
