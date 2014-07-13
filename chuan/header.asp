<div class="otherPage">
  <div class="topBox">
  	<h1 class="logo"><img src="images/logo.png" alt="深圳亚玛迅雕塑园林艺术有限公司" title="深圳亚玛迅雕塑园林艺术有限公司" /></h1>
    <div class="searchBox">
      <form action="#" method="post" name="search">
      	<input type="text" value="" class="searchInput" /><input type="submit" value="搜　索" class="searchSubmit" />
      </form>
    </div>
    <ul class="topMenu">
      <!--#include file = "menu.asp"-->
    </ul>
  </div>
<script type="text/javascript">
$(document).ready(function(){
	
		$("ul.subnav").css("opacity","0.6");
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
	
})//
</script>
  <div class="mainBox">
  	<div class="mainBoxTopLine">
        <ul>
<%
sql_lm ="select * from category where ClassKind= 1 and ClassTj=2 and ClassList like '20091121015949%' Order By ClassList Asc,ClassOrder Asc"
set rs1 = sqldb.GetRsBySql(sql_lm,1)
k=0
do while not rs1.Eof
k=k+1
response.Write(" <li>· ")
response.Write("<a href='pro.asp?lmid=20091121015949" &"&amp;show="& k &"'>")
response.Write(rs1("ClassName"))
response.Write("</a></li>")
IF rs1.Eof then exit do
rs1.movenext
loop 
rs1.close
set rs1 = nothing '关闭记录集
%>
        </ul>
        <marquee scrollAmount="1" direction="up" behavior="scroll" onmouseover="stop()" onmouseout="start()"　SCROLLDELAY="5">
<%
sql_artTop ="select top 3 * from article where categoryId = '20091121020255' Order By dates desc"
set arttop = sqldb.GetRsBySql(sql_artTop,1)
do while not arttop.Eof
response.Write(" <p>· ")
response.Write("<a href='?lmid="& arttop("categoryId") &"'>")
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