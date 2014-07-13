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
    	<a href="index.html">首页</a> > <%=lm_rs("ClassName")%></div>
    <div class="mainBoxLeft">
<%If lmid <> 20091121020306 then%>
      <% IF lm_rs("ClassImg") <> "" THEN %>
 	 <img src="../../upload/cate/<%=lm_rs("ClassImg")%>" /> 
     <%ELSE%>
     <img src="ymx25.jpg" />
     <%End IF%>
<%else%>
<!--iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src=" http://ditu.google.com/maps?q=%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E7%A6%8F%E7%94%B0%E5%8C%BA%E7%BA%A2%E8%8D%94%E8%B7%AF%E8%8A%B1%E5%8D%89%E4%B8%96%E7%95%8C4018%E5%8F%B7&amp;hl=zh-CN&amp;ei=SGwCS-O2J47muQPWuMDaCw&amp;sll=22.548572,114.075527&amp;sspn=0.024732,0.038418&amp;brcurrent=3,0x3403f43635816e55:0x3b8f8715305be7e0,0,0x3403f3f633f78ad9:0x7a30a41e1da40b9e%3B5,0,0&amp;ie=UTF8&amp;view=map&amp;cid=10191518290260252572&amp;ved=0CA4QpQY&amp;hq=%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E7%A6%8F%E7%94%B0%E5%8C%BA%E7%BA%A2%E8%8D%94%E8%B7%AF%E8%8A%B1%E5%8D%89%E4%B8%96%E7%95%8C4018%E5%8F%B7&amp;hnear=&amp;ll=22.54857,114.07553&amp;spn=0.006295,0.006295&amp;output=embed"></iframe><br /><small><a href=" http://ditu.google.com/maps?q=%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E7%A6%8F%E7%94%B0%E5%8C%BA%E7%BA%A2%E8%8D%94%E8%B7%AF%E8%8A%B1%E5%8D%89%E4%B8%96%E7%95%8C4018%E5%8F%B7&amp;hl=zh-CN&amp;ei=SGwCS-O2J47muQPWuMDaCw&amp;sll=22.548572,114.075527&amp;sspn=0.024732,0.038418&amp;brcurrent=3,0x3403f43635816e55:0x3b8f8715305be7e0,0,0x3403f3f633f78ad9:0x7a30a41e1da40b9e%3B5,0,0&amp;ie=UTF8&amp;view=map&amp;cid=10191518290260252572&amp;ved=0CA4QpQY&amp;hq=%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E7%A6%8F%E7%94%B0%E5%8C%BA%E7%BA%A2%E8%8D%94%E8%B7%AF%E8%8A%B1%E5%8D%89%E4%B8%96%E7%95%8C4018%E5%8F%B7&amp;hnear=&amp;ll=22.54857,114.07553&amp;spn=0.006295,0.006295&amp;source=embed" style="color:#0000FF;text-align:left">查看大图</a></small-->

	<!--百度地图容器-->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
	<div style="width:430px; height:320px;border:#fff solid 1px; margin-right:18px" id="dituContent"></div>
	<div>
		<a onclick="NORMAL()">平面地图</a>
		<a onclick="HYBRID()">卫星地图</a>
	</div>
	<script type="text/javascript">
		var zoom=18;
		var mapX = 113.944617;
		var mapY = 22.605049;
		//创建和初始化地图函数：
		function initMap(){
			createMap();//创建地图
			setMapEvent();//设置地图事件
			addMapControl();//向地图添加控件
		}
		
		//创建地图函数：
		function createMap(){
			var map = new BMap.Map("dituContent", {mapType:BMAP_NORMAL_MAP});//在百度地图容器中创建一个地图
			var point = new BMap.Point(mapX,mapY);//定义一个中心点坐标
			var opts = {
				width : 270,     // 信息窗口宽度
				height: 30,     // 信息窗口高度
				title : "<b>亚玛迅雕塑园林艺术有限公司</b>"  // 信息窗口标题
			}
			map.setCurrentCity("深圳"); 
			var infoWindow = new BMap.InfoWindow("地址：广东省深圳市南山区沙河西路4811号", opts);  // 创建信息窗口对象
			var marker = new BMap.Marker(point);  // 创建标注
			map.centerAndZoom(point,zoom);//设定地图的中心点和坐标并将地图显示在地图容器中
			map.addOverlay(marker);              // 将标注添加到地图中
			marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			marker.openInfoWindow(infoWindow, map.getCenter());      // 打开信息窗口
			window.map = map;//将map变量存储在全局
			marker.addEventListener("click", function(){          
				this.openInfoWindow(infoWindow);  
			});
		}
		function PERSPECTIVE(){
			map.setMapType(BMAP_PERSPECTIVE_MAP)
			map.panTo(new BMap.Point(mapX,mapY));
			map.setZoom(18);
		}
		function NORMAL(){
			map.setMapType(BMAP_NORMAL_MAP)
			map.panTo(new BMap.Point(mapX,mapY));
			map.setZoom(18);
		}
		function HYBRID(){
			map.setMapType(BMAP_HYBRID_MAP)
			map.panTo(new BMap.Point(mapX,mapY));
			map.setZoom(18);
		}
		
		function s(){
			map.zoomTo(map.getZoom()-1);
		}
		
		function b(){
			map.zoomTo(map.getZoom()+1);
		}
		
		//地图事件设置函数：
		function setMapEvent(){
			map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
			map.enableScrollWheelZoom();//禁用地图滚轮放大缩小，默认禁用(可不写)
			map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
			map.enableKeyboard();//启用键盘上下左右键移动地图
		}
		
		//地图控件添加函数：
		function addMapControl(){
			//向地图中添加缩放控件
			var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
			map.addControl(ctrl_nav);
			//向地图中添加缩略图控件
			//var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
			//map.addControl(ctrl_ove);
			//向地图中添加比例尺控件
			var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
			map.addControl(ctrl_sca);
		}
		
		initMap();//创建和初始化地图
	</script>
	<!--百度地图容器-->


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
<div class="contentDiv"><%=art_rs("content")%></div>
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
  <div class="bottomBox">优秀的设计 精良的制作<br />Copyright &copy; 2009-2012 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. <a href="http://www.miibeian.gov.cn/">粤ICP备12016512号</a> 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
