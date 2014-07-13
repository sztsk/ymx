<!--#include file = "includes/DBConnection.asp"-->
<!--#include file = "header.asp"-->
	  <div class="colGrid220">
      	<ul class="aboutMenu">
          <li id="about_1">蔬菜种类</li>
        </ul>      
      </div>
      <div class="colGrid700" id="vegetBox">
      	<div class="about_1">

<%
Set rs = New DB
v_sql = "select * from vegetable order by vegetableId desc"
Set rs2 = rs.GetRsBySql(v_sql,1)
do while not rs2.Eof
%>

<dl class="veget">
  <dt><a href="preVeget.asp?vegeId=<%=rs2(0)%>" class="jsPre"><img src="upload/vegetable/<%=rs2(3)%>" alt="<%=rs2(2)%>" title="<%=rs2(2)%>" /></a></dt>
  <dd>
    <ul class="vegetInfo">
      <li><b>蔬菜名称：</b><a href="preVeget.asp?vegeId=<%=rs2(0)%>" class="jsPre"><%=rs2(2)%></a></li>
      <li><b>所属菜场</b>：<%=rs.GetartelName(rs2(1))%></li>
    </ul>
  </dd>
</dl>

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