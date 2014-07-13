<!--#include file = "includes/DBConnection.asp"-->
<!--#include file = "header.asp"-->
<%
Set rs = New DB
artel_sql = "select * from artel order by artelId desc"
Set rs2 = rs.GetRsBySql(artel_sql,1)
do while not rs2.Eof
%>
	  <div class="colGrid220">
		<dl class="memberBOx">
          <dt><a href="preMenber.asp?artId=<%=rs2(0)%>" class="jsPre"><img src="upload/pro/<%=rs2(6)%>" alt="<%=rs2(1)%>" title="<%=rs2(1)%>" width="200" height="150" /></a></dt>
          <dd>
          	<ul class="memberInfo">
              <li><b>基地名：</b><a href="preMenber.asp?artId=<%=rs2(0)%>" class="jsPre"><%=rs2(1)%></a></li>
              <li><b>负责人</b>：<%=rs2(2)%></li>
              <li><b>地址：</b><%=rs2(3)%></li>
              <li><b>面积：</b><%=rs2(4)%></li>
              <li><b>蔬菜品种：</b><%=rs2(5)%></li>
            </ul>
          </dd>
        </dl>
      </div><!-- colGrid220 -->
<%

IF rs2.Eof then exit do
rs2.movenext
loop
rs2.close
set rs2 = nothing '关闭记录集
%>
<!--#include file = "footer.asp"-->