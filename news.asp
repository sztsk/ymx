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
    	<a href="index.html">首页</a> > <%=lm_rs("ClassName")%></div>
        <!-- right -->
    <div class="mainBoxLeft">
     <% IF lm_rs("ClassImg") <> "" THEN %>
 	 <img src="../../upload/cate/<%=lm_rs("ClassImg")%>" /> 
     <%ELSE%>
     <img src="ymx25.jpg" />
     <%End IF%>
	</div>
	<style type="text/css">
		.mainBoxRight{ color:#B89B44; overflow-y:auto; line-height:180%}
		.mainBoxRight p{ margin:10px 0}
	</style>
    <div class="mainBoxRight">
<%
lm_rs.close
set lm_rs = nothing '关闭记录

sql_art = "select * from article where categoryId = '"&lmid &"'"

isHave = sqldb.HasRecordById(sql_art)

if isHave = true Then
	tmp = 0

set art_rs = sqldb.GetRsBySql(sql_art,1)
'response.Write(sql_art)
do while not art_rs.Eof

IF lmid = "20091121015653" or lmid = "20091121015811" THEN
response.Write("<ul class='newsUl'><li><a href='people.asp?artId="& art_rs("artId") &"'>" & art_rs("title") & "</a></li></ul>")

elseif lmid = "20091121020255" then
%>
	<script type="text/javascript">
		$(document).ready(function(e) {
			$("#zhaoping_box").load("preNews.asp?artId=<%=art_rs("artId")%>");
		});
	</script>
	<div id="zhaoping_box"></div>
<%
elseif lmid = "20091121015755" then
	if tmp = 0 then
%>
	<div>
		<p>港澳地区： <br />
				1、美国拉斯维加斯和中国澳门合资的澳门赌场项目威尼斯人酒店景观及建筑装饰品全亚洲采购中中标。 </p>
		<p>广东省： <br />
				1、&ldquo;亚太第一墙&rdquo;深圳莲塘华景路长344米、高4米的陶瓷艺术墙规划设计； <br />
				2、深圳市盐田政府在打造&ldquo;蓝色盐田，黄金海岸&rdquo;规划中，盐田隧道出口广场规划及标识物全国性公开招标评选荣获第一； <br />
				3、深圳市第五届国际园林花卉博览会山顶广场及标识物全国性竞标赛七套入选方案中独占三魁； <br />
				4、深圳市第五届国际园林花卉博览会宝安项目、龙岗项目、梅林项目文化艺术园境的设计施工及景观雕塑的设计制作； <br />
				5、深圳市历届春节花市景观标识雕塑创作设计实施； <br />
				6、深圳市梅林公园三期景观艺术墙及标识雕塑设计； <br />
				7、珠海市政项目&ldquo;珠海宣言&rdquo;策划及透光标识物设计制作； <br />
				8、珠海市首届&ldquo;南方文化产业论坛&rdquo;方案策划及道路文化形象整合设计； <br />
				9、深圳市西部田园风光步行街道景观雕塑及艺术造景； <br />
				10、由美国迪斯尼规划设计团队设计的深圳欢乐谷二期工程之景观艺术品制作； </p>
		<p>其他城市： <br />
				1、江苏常州市政改建工程项目-延陵东路文化艺术形象策划创作实施； <br />
				2、西安市高新技术开发区高新四路和南二环交汇处高科广场、景观雕塑设计实施； <br />
				3、山东省东营日报社广场规划设计及景观艺术品创作实施； <br />
				4、山东省蓬莱市政府项目&ldquo;黄海绿洲&rdquo;景观艺术品规划创作实施； <br />
				5、杭州西湖边宋城集团麾下&ldquo;儿童乐园&rdquo;巨型游乐场景观设计施工； <br />
				6、内蒙古蒙西集团&ldquo;蒙西广场&rdquo;景观及集团巨型标识构筑物设计； </p>
		<p>&nbsp;</p>
		<p>全国知名企业:<br />
				1、香港李嘉诚先生麾下和记黄埔地产深圳黄埔雅筑项目，所有室外陈列艺术品设计制作中标及和黄北京项目等； <br />
				2、万科地产深圳四季花城、东海岸、十七英里项目，长春万科、沈阳万科、江西万科等地产项目的雕塑和园林艺术品设计制作； <br />
				3、大型高级别墅群项目：深圳圣·莫丽斯别墅群所有文化形象策划设计制作和景观雕塑创作实施； <br />
				4、中海地产西安项目，深圳横岗大山地等项目； <br />
		5、招商地产花园城项目； </p>
	</div>
<%
		tmp=1
	end if
ELSE
response.Write("<ul class='newsUl'><li><a class='jsPre' href='preNews.asp?artId="& art_rs("artId") &"'>" & art_rs("title") & "</a></li></ul>")
END IF
IF art_rs.Eof then exit do
art_rs.movenext
loop 
art_rs.close
set art_rs = nothing '关闭记录集
ELSE
response.Write("<h2 class='otherTilte'>没有找到相关内容！</h2>")
END IF
%>
    </div>
  </div>
  <div class="bottomBox">优秀的设计 精良的制作<br />Copyright &copy; 2009-2010 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. <a href="http://www.miibeian.gov.cn/">粤ICP备12016512号</a> 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
