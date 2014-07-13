<!--#include file = "articleManage.asp"-->
<!--#include file = "commonOption.asp"-->
<!--#include file = "../admin-templates/HeadAndFoot.asp"-->
<%Call CheckAdmin(2)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>文章管理</title>
<script src="../../js/jquery.js" type="text/javascript" ></script>
<script src="../../js/jquery-ui.js" type="text/javascript"></script>
<script src="../../js/jquery.form.js" type="text/javascript"></script>
<script src="../../js/admin.js" type="text/javascript"></script>
<script src="../../js/articleManage.js" type="text/javascript"></script>
<script src="../../js/jquery.fancybox-1.2.1.pack.js" type="text/javascript"></script>
<script src="../../js/jquery.tablesorter.min.js" type="text/javascript"></script>
<script src="../../js/jquery.tablesorter.pager.js" type="text/javascript"></script>
<link href="../../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../css/adminStyle.css" rel="stylesheet" type="text/css" />
<link href="../../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% Call Header%>
    <!--start  -->
<table id="articleTable" class="ui-widget ui-widget-content tableBlue tablesorter" border="0" cellspacing="0" cellpadding="0">
  <thead class="ui-widget-header">
    <tr>
      <th scope="col"><input type="checkbox" name="all" id="all" /></th>
      <th scope="col">文章</th>
      <th scope="col">作者</th>
      <th scope="col">目录</th>
      <th scope="col">分类</th>
      <th scope="col">日期</th>
      <th scope="col">状态</th>
    </tr>
  </thead>
  <tbody>
    <%
	Call SelectAllArticle
	%>
  </tbody>
</table>
<div id="pager" class="tablesorterPager ui-widget-header ui-corner-all">
<form>
    <img src="../images/pages/first.png" class="first"/>
    <img src="../images/pages/prev.png" class="prev"/>
    <input type="text" class="pagedisplay text ui-widget-content ui-corner-all" readonly="readonly"/>
    <img src="../images/pages/next.png" class="next"/>
    <img src="../images/pages/last.png" class="last"/>
    <select class="pagesize ui-widget-content ui-corner-all">
        <option selected="selected" value="10">10</option>

        <option value="20">20</option>
        <option value="30">30</option>
        <option  value="40">40</option>
    </select>
</form>
</div><!-- pager-->

<div id="editArtDialog" title="快速修改文章">
    <form id="editForm" action="" method="post">
    <input type="hidden" name="artId" id="artId" />
     <dl class="clearfix">
     	<dt>标题:</dt>
        <dd><input type="text" name="title" id="title" class="text ui-widget-content ui-corner-all" /></dd>
        <dt>作者:</dt>
        <dd><input type="text" name="author" id="author" class="text ui-widget-content ui-corner-all" /></dd>
        <dt>日期:</dt>
        <dd><input type="text" name="dates" id="dates" class="text ui-widget-content ui-corner-all" /></dd>
        <dt>栏目:</dt>
        <dd>
        	<% Call DrawSelect(1,"categoryId",false) %>
        </dd>

        <dt>是否固顶:</dt>
        <dd>
        	 <% Call zd_isTop%>
        </dd>
        <dt>类型:</dt>
        <dd><%Call lx_isRecommend%></dd>
        <dt>地域:</dt>
        <dd><%Call dy_isReview%></dd>
        <dt>年份:</dt>
        <dd><%Call nf_click%></dd>
        
     </dl>
    </form>
</div><!-- #editArtDialog -->

<div id="delDialog" title="删除文章">
    <form id="delForm" action="" method="post">
      你确定要删除 <span id="delArticleTitle" class="colorRed"></span> 吗？
      <input type="hidden" name="dId" id="dId" />
    </form>
  </div><!--delDialog -->
  <!--end start -->
<%Call Footer%>
</body>
</html>