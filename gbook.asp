<!--#include file = "admin/article/articleManage.asp"-->
<!--#include file = "UBB/UBB2Html.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="ymx25,yamaxun25,深圳亚玛迅雕塑园林艺术有限公司,亚玛迅,创作研发,设计实施,公共艺术品,城市雕塑,室内外装饰品,建筑及景观艺术品,园境规划设计" />
<meta name="Description" content="深圳市“亚玛迅”秉承东方文脉、融合西方设计精髓，是创作研发、设计实施城市雕塑及公共艺术品、室内外装饰品、建筑及景观艺术品、园境规划设计的专业公司。公司经多年的努力已在国内外市场赢得了良好的行业口碑！" />
<%
Set sqldb = New DB
'set pre = GetArtByIdAll
'response.Write(pre(1))
%>
<title>深圳亚玛迅雕塑园林艺术有限公司</title>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/pro.js"></script>
<link rel="stylesheet" type="text/css" href="css/default.css"/>
</head>

<body>
<!--#include file = "header.asp"-->
<%
randomize
strTempNum = int((99 - 1 + 1) * rnd + 1) 
%>
<div class="mainBoxTopTitle">
    	<a href="index.html">首页</a> > 建议</div>
        <!-- right -->
    <div class="mainBoxLeft">
    <form action="admin/Message/messageManage.asp?action=InsertMsg2" method="post">
        <dl class="msgMainBox">
          <dt>游客ID：<input type="text" name="msgName" id="msgName" value="游客<%=strTempNum%>" /><br />
		  Email：&nbsp;<input type="text" name="msgEmail" id="msgEmail" value="" /><br />
          <!--div>验证码：<input type="text" name="checkCode" id="checkCode" value="" class="tdInputBox" style="width:60px;" /><img src="includes/Code.asp" onclick="this.src=this.src+'?'" title="看不清楚验证码？点击这里换一个" /><div-->
		  </dt>
          <dd><textarea name="GBookEditor" id="GBookEditor" rows="2" cols="18" style="height:150px;width:99%; margin:auto;"></textarea>
	<script language="javascript" type="text/javascript" src="ubb/CsdnUbbEditor.js"></script>
    <script type="text/javascript">
	/*<![CDATA[*/
		var ubb = new CsdnUbbEditor("GBookEditor");
		ubb.contentLength = 1000;
		ubb.render("fontsize|space|bold|italic|underline|color|space|url|email|image|space|left|center|right");
/*]]>*/</script>
		<input name="submit" type="submit" value="提交" class="submitUbbInput" /></dd>
        </dl>
       </form>
	</div>
	<div class="mainBoxRight" style="overflow-y:auto; scrollbar-face-color: #de9221; scrollbar-highlight-color: #CCC; scrollbar-shadow-color: #000; scrollbar-3dlight-color: #333; scrollbar-arrow-color: #09171e; scrollbar-track-color: #999; scrollbar-darkshadow-color: #f90">
	   <table width="450" border="0" cellspacing="0" cellpadding="0" style="color:#b89b44;">
<!--板块1-->
<%

sqlMsg = "select * from Message where replyId = 0 order by msgId desc" 
set art_rs = sqldb.GetRsBySql(sqlMsg,1)
do while not art_rs.Eof
%>

<tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>会员名：<% =art_rs("msgName")%><span style="margin-left:10px;">留言日期：<% =art_rs("msgDate")%></span>&nbsp;&nbsp;<a href="reply.asp?msgId=<%=art_rs(0)%>">
        <%
		if Request.Cookies("power") <> "" then
if Request.Cookies("power") > 1 then
		%>
        【回复】</a>&nbsp;&nbsp;<a href="admin/Message/messageManage.asp?action=DeleteMsg&amp;msgId=<%=art_rs(0)%>" onClick="return confirmInfo(this.form)">【删除】</a>
        <%end if
		end if
		%>
        </td>
      </tr>
      <tr>
        <td><div class="msgBox"><% =UBB2Html(art_rs("msgContent"),0)%></div></td>
      </tr>
    </table>
    </td>
</tr>
<%
sqlReply = "select * from Message where replyId = "& art_rs("msgId") &" order by msgId desc" 
set rep_rs = sqldb.GetRsBySql(sqlReply,1)
do while not rep_rs.Eof
%>

          <tr>
            <td><table width="95%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><b style="color:red;">管理员回复<% =rep_rs("msgName")%><% =rep_rs("replyDate")%><!--显示会员以及留言的具体时间-->的留言</b>&nbsp;&nbsp;<span style="margin-left:10px;">回复日期：2010-1-5</span></td>
              </tr>
              <tr>
                <td><div class="msgBox"><% =rep_rs("replyContent")%></div></td>
              </tr>
              </table>
            </td>
          </tr>
<%
IF rep_rs.Eof then exit do
rep_rs.movenext
loop 
rep_rs.close
set rep_rs = nothing '关闭记录集

%>
<%
if art_rs.Eof then exit do
art_rs.movenext      
loop                      '记录向下移动一行
art_rs.close
set art_rs = nothing '关闭记录集
%>
          
<!--板块2，有管理员回复则显示以下-->

            
<!--如有多个留言则循环输出上面两个板块-->
        </table>
	</div>
  </div>
  <div class="bottomBox">优秀的设计 精良的制作<br />Copyright &copy; 2009-2010<a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. <a href="http://www.miibeian.gov.cn/">粤ICP备09217406号</a> 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
