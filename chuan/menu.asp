
      <li><a href="index.asp">首  页</a></li>
      <li><a href="other.asp?lmid=20091121015653">关于亚玛迅</a>
        <ul class="subnav">
<%
sql_lm ="select * from category where ClassKind= 1 and ClassTj=2 and ClassList like '20091121004507%' Order By ClassList Asc,ClassOrder Asc"
set rs1 = sqldb.GetRsBySql(sql_lm,1)
do while not rs1.Eof
response.Write(" <li>")
response.Write("<a href='other.asp?lmid="& rs1("ClassId") &"'>")
response.Write(rs1("ClassName"))
response.Write("</a></li>")
IF rs1.Eof then exit do
rs1.movenext
loop 
rs1.close
set rs1 = nothing '关闭记录集
%>
        </ul>
      </li>
      <li><a href="pro.asp?lmid=20091121015949">项目展示</a>
        <ul class="subnav">
<%
sql_lm ="select * from category where ClassKind= 1 and ClassTj=2 and ClassList like '20091121015949%' Order By ClassList Asc,ClassOrder Asc"
set rs1 = sqldb.GetRsBySql(sql_lm,1)
i = 0
do while not rs1.Eof
i=i+1
response.Write(" <li>")
response.Write("<a href='pro.asp?lmid=20091121015949&amp;show="& i &"'>")
response.Write(rs1("ClassName"))
response.Write("</a></li>")
IF rs1.Eof then exit do
rs1.movenext
loop 
rs1.close
set rs1 = nothing '关闭记录集
%>
        </ul>
      </li>
      <li><a href="other.asp?lmid=20091121020242">公司动态</a>
        <ul class="subnav">
<%
sql_lm ="select * from category where ClassKind= 1 and ClassTj=2 and ClassList like '20091121020221%' Order By ClassList Asc,ClassOrder Asc"
set rs1 = sqldb.GetRsBySql(sql_lm,1)
do while not rs1.Eof
response.Write(" <li>")
response.Write("<a href='news.asp?lmid="& rs1("ClassId") &"'>")
response.Write(rs1("ClassName"))
response.Write("</a></li>")
IF rs1.Eof then exit do
rs1.movenext
loop 
rs1.close
set rs1 = nothing '关闭记录集
%>
        </ul>
      </li>
      <li><a href="other.asp?lmid=20091121020415">招贤纳士</a>
        <ul class="subnav">
<%
sql_lm ="select * from category where ClassKind= 1 and ClassTj=2 and ClassList like '20091121020339%' Order By ClassList Asc,ClassOrder Asc"
set rs1 = sqldb.GetRsBySql(sql_lm,1)
do while not rs1.Eof
response.Write(" <li>")
response.Write("<a href='other.asp?lmid="& rs1("ClassId") &"'>")
response.Write(rs1("ClassName"))
response.Write("</a></li>")
IF rs1.Eof then exit do
rs1.movenext
loop 
rs1.close
set rs1 = nothing '关闭记录集
%>
        </ul>
      </li>
      <li><a href="other.asp?lmid=20091121020541">联系我们</a>
        <ul class="subnav">
<%
sql_lm ="select * from category where ClassKind= 1 and ClassTj=2 and ClassList like '20091121020504%' Order By ClassList Asc,ClassOrder Asc"
set rs1 = sqldb.GetRsBySql(sql_lm,1)
do while not rs1.Eof
response.Write(" <li>")
response.Write("<a href='other.asp?lmid="& rs1("ClassId") &"'>")
response.Write(rs1("ClassName"))
response.Write("</a></li>")
IF rs1.Eof then exit do
rs1.movenext
loop 
rs1.close
set rs1 = nothing '关闭记录集
%>
        </ul>
      </li>