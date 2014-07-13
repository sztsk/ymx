<!--#include file = "includes/DBConnection.asp"-->
<!--#include file = "header.asp"-->
	  <div class="colGrid220">
      	<ul class="aboutMenu">
          <li id="about_1">检测站介绍</li>
          <li id="about_2">检测程序</li>
          <li id="about_3">流程图</li>
        </ul>
      </div>
      <div class="colGrid700" id="aboutTextBox">
<%
Set rs = New DB
sql_art = "select top 2 * from article where categoryId = '20090929000146'"
Set rs2 = rs.GetRsBySql(sql_art,1)
dim i
do while not rs2.Eof
i=i+1
%>
      	<div class="about_<%=i%>">
          <dl>
          	<dt><img src="images/check_<%=i%>.gif" alt="<%=rs2(1)%>" title="<%=rs2(1)%>" /></dt>
            <dd><%=rs2(3)%></dd>
          </dl>
        </div>
<%

IF rs2.Eof then exit do
rs2.movenext
loop
rs2.close
set rs2 = nothing '关闭记录集
%>
      	<div class="about_3">
          <dl>
          	<dt><img src="images/check_3.gif" alt="流程图" title="流程图" /></dt>
            <dd><img src="images/flowChart.gif" alt="蔬菜质量监测流程图" title="蔬菜质量监测流程图" style="margin:0 auto; padding:2px; border:1px solid #000;" /></dd>
          </dl>
        </div>
        </div>
      </div>
<!--#include file = "footer.asp"-->