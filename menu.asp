
      <li><a href="index.html">首  页</a></li>
      
       <li><a href="pro1.asp">重点案例</a>
        <ul class="subnav">
        	<li><a href="pro1.asp">雕塑·饰品</a></li>
            <li><a href="pro2.asp">园境·展示</a></li>
<%
'sql_lm = ""
'sqldb.InsertBySql(sql_aa,1)
'sql_lm ="select * from category where ClassKind= 1 and ClassTj=2 and ClassList like '20091121015949%' Order By ClassList Asc,ClassOrder Asc"
'set rs1 = sqldb.GetRsBySql(sql_lm,1)
'i = 0
'do while not rs1.Eof
'i=i+1
'response.Write(" <li>")
'response.Write("<a href='pro"& i &".asp'>")
'response.Write(rs1("ClassName"))
'response.Write("</a></li>")
'IF rs1.Eof then exit do
'rs1.movenext
'loop 
'rs1.close
'set rs1 = nothing '关闭记录集
%>
        </ul>
      </li>
      
      <li><a href="other.asp?lmid=20091121015736">关于亚玛迅</a>
        <ul class="subnav">
        	<li><a href="news.asp?lmid=20091121015653">主创人员</a></li>
            <li><a href="other.asp?lmid=20091121015736">简介</a></li>
            <li><a href="news.asp?lmid=20091121015755">业绩地域</a></li>
            <li><a href="rongyu.asp?lmid=20091121015811">荣誉及奖项</a></li>
            <li><a href="news.asp?lmid=20100301234624">最新动态</a></li>
        </ul>
      </li>
     
      <li><a href="other.asp?lmid=20091121020221">沟通互动</a>
        <ul class="subnav">
			<li><a href="gbook.asp">建议</a></li>
            <li><a href="news.asp?lmid=20091121020255">求职</a></li>
            <li><a href="other.asp?lmid=20091121020306">联系我们</a></li>
            <li><a href="rongyu.asp?lmid=20100302001427">公司环境</a></li>
        </ul>
      </li>