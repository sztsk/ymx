<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../css/login.css" rel="stylesheet" type="text/css" />
<title>后台登录</title>
</head>
<body>
<div id="container">
  <div id="content">
    <ul id="mainnew">
      <form id="form1" name="form1" method="post" action="admin_login_check.asp"  onsubmit="return login();">
        <li class="newmenu">用户名:
          <input name="a_name" type="text" class="ui-widget-content ui-corner-all"  size="14"/>
        </li>
        <li class="newmenu">密　码:
          <input name="pwd" type="password" class="ui-widget-content ui-corner-all" value="admin"  size="14" />
        </li>
        <li class="newmenu">验证码:
          <input type="text" size="6" name="CheckCode" class="ui-widget-content ui-corner-all" />
          &nbsp;<img src="../includes/Code.asp" style="border:#CCC 1px solid" onclick="this.src=this.src+'?'" /></li>
        <li class="button">
          <input type="submit" name="button" id="button" value="提交" />
        </li>
        <li class="button">
          <input type="reset" name="button2" id="button2" value="重置" />
        </li>
      </form>
    </ul>
  </div>
</div>
</body>
</html>
