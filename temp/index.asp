<!--#include file = "includes/DBConnection.asp"-->
<!--#include file = "header.asp"-->
      <div class="colGrid300">
      	<!--新闻中心列表-->
      	<dl class="leftDl">
          <dt><img src="images/newsTitle.gif" alt="新闻中心" title="新闻中心" /></dt>
          <dd class="leftDd1">
          	<ul class="newsUl">
<%
dim sql ,i
Set rs = New DB
sql = "select top 8 * from article order by artId"
Set rs2 = rs.GetRsBySql(sql,1)
i=0
do while not rs2.Eof
i = i+1
%>
 <li><span><%=rs2(9)%></span><img src="images/icon<%=i%>.png" alt="<%=rs2(1)%><%=i%>" /><a href="preNews.asp?artId=<%=rs2(0)%>" class="jsPre" title="<%=rs2(1)%>"><%=rs2(1)%></a></li>
 <%

IF rs2.Eof then exit do
rs2.movenext
loop
%>
            </ul>
          </dd>
        </dl>
        <dl class="leftDl">
          <dt><img src="images/contactTitle.gif" alt="联系我们" title="联系我们" /></dt>
          <dd class="leftDd2">
          	<ul class="contactUl">
              <li>合作社地址：地址地址地址地址地址</li>
              <li>配送中心地址：地址地址地址地址地址地址</li>
              <li>电话：000000000000000</li>
              <li>传真：000000000000000</li>
            </ul>
          </dd>
        </dl>
      </div>
      <div class="colGrid300">
      	<div class="imgTitle"><img src="images/newGoods.gif" alt="最新产品" title="最新产品" /></div>
        <div class="imgBox">
          <div class="imgBoxLeft" id="changeImgB">
<%
rs2.close
set rs2 = nothing '关闭记录集

dim sql2
sql2 = "select top 1 * from vegetable order by vegetableId desc"
set rs3 = rs.GetRsValueBySql(sql2)
%>
          	<a href="preVeget.asp?vegeId=<%=rs3(0)%>" class="jsPre"><img src="upload/vegetable/<%=rs3(3)%>" alt="<%=rs3(2)%>" /></a>
            <dl>
              <dt></dt>
              <dd>
              	<ul class="goodsUl">
                  <li><b>蔬菜名称：</b><a href="preVeget.asp?vegeId=<%=rs3(0)%>" class="jsPre"><%=rs3(2)%></a></li>
                  <li><b>所属菜场：</b><a href="preVeget.asp?vegeId=<%=rs3(0)%>" class="jsPre"><%=rs.GetartelName(rs3(1))%></a></li>
                  <span><a href="vegetables.asp" title="进入蔬菜配送中心查看更多">进入蔬菜配送中心查看更多</a></span>
                </ul>
              </dd>
            </dl>
          </div>
          <div class="imgBoxRight" id="changeImgS">
          <%
rs3.close
set rs3 = nothing '关闭记录集

sql4 = "select top 4 * from vegetable order by vegetableId desc"
set rs4 = rs.GetRsBySql(sql4,1)

do while not rs4.Eof
%>
<img src="upload/vegetable/<%=rs4(3)%>" alt="preVeget.asp?vegeId=<%=rs4(0)%>" />
 <%
IF rs4.Eof then exit do
rs4.movenext
loop
rs4.close
set rs4 = nothing '关闭记录集
%>

          </div>
        </div>
      </div>
      <div class="colGrid300">
      	<dl class="infoBox">
          <dt><img src="images/infoTitle.gif" alt="惠州市吕氏蔬菜专业合作社简介" title="惠州市吕氏蔬菜专业合作社简介" /></dt>
          <dd>    本合作社属下有25个蔬菜种植基地，种植蔬菜总面积
为12873.5亩，年可产蔬菜约10万吨，年产值约2亿4千万
元。<br />    本合作社生产的蔬菜主要供应惠州地区，稳定了惠州
的蔬菜市场，同时也保障了惠州市民的蔬菜食品安全，同
时也销往珠三角、上海、北京港澳等地。<br /><br /><span>经营范围：</span><br />
1.种植、销售蔬菜、玉米<br />
2.养殖、销售:鱼塘<br />
3.组织采购成员所需的农业生产资料<br />
4.组织收购、销售成员生产的蔬菜产品<br />
5.引进种植蔬菜新技术、新品种<br />
6.开展与农业生产经营有关的技术培训、
技术交流和信息咨询服务</dd>
        </dl>
      </div>
<!--#include file = "footer.asp"-->