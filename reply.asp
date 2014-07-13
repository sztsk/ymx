<!--#include file = "admin/Message/messageManage.asp"-->
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
<link rel="stylesheet" type="text/css" href="css/default.css"/>
</head>

<body>
<!--#include file = "header.asp"-->
  <div class="mainBox">
  	

<div style="color:#784a21; font-size:18px; font-weight:bold;">回复会员：</div>
<%
set rs2 = new DB
msgId = SafeRequest("msgId",0)
msgName = rs2.GetValueBySql("select msgName from Message where msgId = " & msgId)
%>
        <form action="admin/Message/messageManage.asp?action=InsertMsg3&amp;msgId=<%=msgId%>" method="post">
        <dl class="msgMainBox">
          <dt>管理员名称：<input type="text" name="msgName" id="msgName" value="<%=msgName%>" readonly="readonly" /><br />
         
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


 <div class="bottomBox">优秀的设计 精良的制作<br />Copyright &copy; 2009-2010 <a href="http://www.ymx25.com/" title="深圳亚玛迅雕塑园林艺术有限公司">亚玛迅雕塑</a>. All right reserved. <a href="http://www.miibeian.gov.cn/">粤ICP备12016512号</a> 网站建设:<a href="http://www.sztsk.com/" title="深圳Ts.k Studio">sztsk.com</a></div>
</div>
</body>
</html>
