<!--#include file = "includes/DBConnection.asp"-->
<!--#include file = "header.asp"-->
	  <div class="colGrid220">
      	<ul class="aboutMenu">
          <li id="about_1">生产资料配送中心简介</li>
          <li id="about_2">生产资料配送中心详细资料</li>
        </ul>
      </div>
      <div class="colGrid700" id="aboutTextBox">
<%
Set rs = New DB
sql_art = "select top 2 * from article where categoryId = '2009' order by artId desc"
Set rs2 = rs.GetRsBySql(sql_art,1)
dim i
do while not rs2.Eof
i=i+1
%>
      	<div class="about_<%=i%>">
          <dl>
          	<dt><img src="images/production_<%=i%>.gif" alt="<%=rs2(1)%>" title="<%=rs2(1)%>" /></dt>
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
        </div>
      </div>
<!--#include file = "footer.asp"-->