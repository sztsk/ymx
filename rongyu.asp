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
<script type="text/javascript">
$(window).load(function(){

	SetListImg();
	ChangeImg();
						})

function SetListImg(){
	$(".js_list").each(function(){
		var firstImg = $(this).find("img:eq(0)").attr("src");
		if (firstImg) {
			$(this).next("li").find("img").attr("src",firstImg);
		}
	})
}

function ChangeImg(){
	$(".js_img_small").click(function(){
									  $("#js_big_img").attr("src",$(this).find("img").attr("src"));
									  return false;
									  }).click();
	}
</script>
<style type="text/css">
</style>
<link rel="stylesheet" type="text/css" href="css/default.css"/>
<style type="text/css">
#imgul li{text-decoration: none;}
</style>
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
     <img src="ymx25.jpg" id="js_big_img" />
	</div>
    <div class="mainBoxRight">
		<div class="leftPhoto">
<%
lm_rs.close
set lm_rs = nothing '关闭记录

sql_art = "select * from article where categoryId = '"&lmid &"'"

isHave = sqldb.HasRecordById(sql_art)

if isHave = true Then

set art_rs = sqldb.GetRsBySql(sql_art,1)
'response.Write(sql_art)
response.Write("<ul id='imgul'>")
do while not art_rs.Eof
response.Write("<li class='js_list' style='display:none'>"& art_rs("content") &"</li>")
response.Write("<li style='text-align:center;'><a class='js_img_small' href='people.asp?artId="& art_rs("artId") &"'><img class='imgsmall' src='ymx25.jpg' alt='' title='"& art_rs("title")  &"' /><br /></a></li>")

IF art_rs.Eof then exit do
art_rs.movenext
loop 
art_rs.close
set art_rs = nothing '关闭记录集
response.Write("</ul>")
ELSE
response.Write("<h2 class='otherTilte'>没有找到相关内容！</h2>")
END IF
%>
	</div>
    </div>
  </div>
  <div class="bottomBox">优秀的设计 精良的制作<br />Copyright &copy; 2009-2010 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. <a href="http://www.miibeian.gov.cn/">粤ICP备12016512号</a> 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
