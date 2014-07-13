<div class="otherPage">
  <div class="topBox">
  	<h1 class="logo"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="179" height="72">
  	    <param name="movie" value="logo.swf" />
  	    <param name="quality" value="high" />
  	    <param name="wmode" value="opaque" />
  	    <embed src="logo.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="179" height="72"></embed>
      </object></h1>
    <ul class="topMenu">
      <!--#include file = "menu.asp"-->
    </ul>
  </div>
<script type="text/javascript">
$(document).ready(function(){
	
	$("h1.logo img").hover(function(){
	$(this).attr("src","images/logo_1.png");
	},function(){
		$(this).attr("src","images/logo.png");
	});
	//$("ul.subnav").css("opacity","0.6");
	$("ul.topMenu a").hover(
		function() {
			$(this).parent().find("ul.subnav").show();
			$(this).parent().hover(function() {
			}, function(){	
				$(this).parent().find("ul.subnav").hide();
			});
		},
		function() {	
		}
		);
	
})

//防止图片撑大，破坏布局
function DrawImage(ImgD,iwidth)
{
var image=new Image();
image.src=ImgD.src;
if(image.style.width>0 && image.style.height>0)
{
   if(image.style.width>iwidth)
   {  
    ImgD.style.width=iwidth;
    ImgD.style.height=(image.style.height*iwidth)/image.style.width;
   }
}
ImgD.style.display = "block";
} 
</script>
  <div class="mainBox">
  	<div class="mainBoxTopLine">
        <marquee scrollAmount="4" direction="left" behavior="scroll" onmouseover="stop()" onmouseout="start()"　SCROLLDELAY="5">
<%
sql_artTop ="select top 3 * from article where categoryId = '20100301234624' Order By dates desc"
set arttop = sqldb.GetRsBySql(sql_artTop,1)
do while not arttop.Eof
response.Write(" <p style='float:left'>· ")
response.Write("<a href='other.asp?lmid="& arttop("categoryId") &"'>")
response.Write(arttop("title"))
response.Write("</a></p>")
IF arttop.Eof then exit do
arttop.movenext
loop 
arttop.close
set arttop = nothing '关闭记录集
%>

        </marquee>
    </div>