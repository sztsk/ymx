<!--#include file = "includes/DBConnection.asp"-->
<!--#include file = "header.asp"-->
	  <div class="colGrid220">
      	<ul class="aboutMenu">
          <li id="about_1">联系方式</li>
          <li id="about_2">电子地图</li>
          <li id="about_3">人员招聘</li>
        </ul>
      </div>
      <div class="colGrid700" id="aboutTextBox">
      	<div class="about_1">
          <dl>
          	<dt><img src="images/contact_1.gif" alt="联系方式" title="联系方式" /></dt>
            <dd></dd>
          </dl>
        </div>
      	<div class="about_2">
          <dl>
          	<dt><img src="images/contact_2.gif" alt="电子地图" title="电子地图" /></dt>
            <dd style="text-align:center">
            <iframe width="525" height="450" style="border:1px solid #999" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src=" http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=zh-CN&amp;geocode=&amp;q=%E6%83%A0%E5%B7%9E%E5%B8%82%E5%8D%9A%E7%BD%97%E5%8E%BF%E6%9F%8F%E5%A1%98%E9%95%87%E5%AF%8C%E6%96%B0%E6%9D%91&amp;sll=37.0625,-95.677068&amp;sspn=50.823846,79.101563&amp;ie=UTF8&amp;hq=%E5%AF%8C%E6%96%B0%E6%9D%91&amp;hnear=%E4%B8%AD%E5%9B%BD%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%83%A0%E5%B7%9E%E5%B8%82%E6%9F%8F%E5%A1%98%E9%95%87&amp;ll=23.392308,114.403552&amp;spn=0.006295,0.081776&amp;output=embed"></iframe><br /><small><a href=" http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=zh-CN&amp;geocode=&amp;q=%E6%83%A0%E5%B7%9E%E5%B8%82%E5%8D%9A%E7%BD%97%E5%8E%BF%E6%9F%8F%E5%A1%98%E9%95%87%E5%AF%8C%E6%96%B0%E6%9D%91&amp;sll=37.0625,-95.677068&amp;sspn=50.823846,79.101563&amp;ie=UTF8&amp;hq=%E5%AF%8C%E6%96%B0%E6%9D%91&amp;hnear=%E4%B8%AD%E5%9B%BD%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%83%A0%E5%B7%9E%E5%B8%82%E6%9F%8F%E5%A1%98%E9%95%87&amp;ll=23.392308,114.403552&amp;spn=0.006295,0.081776" style="color:#0000FF;text-align:left">查看大图</a></small>
            </dd>
          </dl>
        </div>
        
<%
Set rs = New DB
sql_art = "select top 1 * from article where categoryId = '20091101101102'"
Set rs2 = rs.GetRsBySql(sql_art,1)
%>
<div class="about_3">
  <dl>
	<dt><img src="images/contact_3.gif" alt="<%=rs2(1)%>" title="<%=rs2(1)%>" /></dt>
	<dd><%=rs2(3)%></dd>
  </dl>
</div>
<%
rs2.close
set rs2 = nothing '关闭记录集
%>
      </div>
<!--#include file = "footer.asp"-->