<!--#include file = "includes/DBConnection.asp"-->
<!--#include file = "header.asp"-->
	  <div class="colGrid220">
      	<ul class="aboutMenu">
          <li id="about_1">合作社历程</li>
          <li id="about_2">合作社动态</li>
          <li id="about_3">媒体报道</li>
        </ul>
      </div>
      <div class="colGrid700" id="aboutTextBox">
      	<div class="about_1">
          <dl>
          	<dt><img src="images/news_1.gif" alt="合作社历程" title="合作社历程" /></dt>
            <dd>
              <ul class="newsList">
<%
Set rs = New DB
lichen_sql = "select * from article where categoryId = '20091005091549' order by artId desc"
Set rs2 = rs.GetRsBySql(lichen_sql,1)
do while not rs2.Eof
%>
              	<li><span><%=rs2(9)%></span><a href="preNews.asp?artId=<%=rs2(0)%>" class="jsPre" title="<%=rs2(1)%>"><%=rs2(1)%></a></li>
<%
IF rs2.Eof then exit do
rs2.movenext
loop
rs2.close
set rs2 = nothing '关闭记录集
%>

              </ul>
            </dd>
          </dl>
        </div><!--about_1 -->
      	<div class="about_2">
          <dl>
          	<dt><img src="images/news_2.gif" alt="合作社动态" title="合作社动态" /></dt>
            <dd>
             <ul class="newsList">
<%

dongtai_sql = "select * from article where categoryId = '20091005091611' order by artId desc"
Set rs3 = rs.GetRsBySql(dongtai_sql,1)
do while not rs3.Eof
%>
              	<li><span><%=rs3(9)%></span><a href="preNews.asp?artId=<%=rs3(0)%>" class="jsPre" title="<%=rs3(1)%>"><%=rs3(1)%></a></li>
<%
IF rs3.Eof then exit do
rs3.movenext
loop
rs3.close
set rs3 = nothing '关闭记录集
%>

              </ul>
            </dd>
          </dl>
        </div><!-- about_2-->
      	<div class="about_3">
          <dl>
          	<dt><img src="images/news_3.gif" alt="媒体报道" title="媒体报道" /></dt>
            <dd>
              <ul class="newsList">
<%

meiti_sql = "select * from article where categoryId = '20091005091630' order by artId desc"
Set rs4 = rs.GetRsBySql(meiti_sql,1)
do while not rs4.Eof
%>
              	<li><span><%=rs4(9)%></span><a href="preNews.asp?artId=<%=rs4(0)%>" class="jsPre"  title="<%=rs4(1)%>"><%=rs4(1)%></a></li>
<%
IF rs4.Eof then exit do
rs4.movenext
loop
rs4.close
set rs4 = nothing '关闭记录集
%>

              </ul>
            </dd>
          </dl>
        </div>
        </div>
      </div>
<!--#include file = "footer.asp"-->