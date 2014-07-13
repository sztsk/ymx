<!--#include file = "includes/DBConnection.asp"-->
<!--#include file = "header.asp"-->
	  <div class="colGrid220">
      	<ul class="aboutMenu">
          <li id="about_1">合作社资料</li>
          <li id="about_2">合作社宗旨</li>
          <li id="about_3">组织结构</li>
          <li id="about_4">品牌标识</li>
          <li id="about_5">规章制度</li>
        </ul>
      </div>
      <div class="colGrid700" id="aboutTextBox">
<%
Set rs = New DB
sql_art = "select top 5 * from article where categoryId = '200704112010263437'"
Set rs2 = rs.GetRsBySql(sql_art,1)
dim i
do while not rs2.Eof
i=i+1
%>
<div class="about_<%=i%>">
  <dl>
    <dt><img src="images/about_<%=i%>.gif" alt="<%=rs2(1)%>" title="<%=rs2(1)%>" /></dt>
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
<!--#include file = "footer.asp"-->