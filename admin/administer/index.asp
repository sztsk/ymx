<!--#include file = "adminManage.asp"-->
<!--#include file = "../admin-templates/HeadAndFoot.asp"-->
<%Call CheckAdmin(2)%>
<%
'Set adminCl = new adminManage

'a = adminCl.AddAdmin(2,1,1,1,1)
'adminCl.UpdateBySql("update admin set adminName = 10 where id = 1")
'response.Write(a)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<script src="../../js/jquery.js" type="text/javascript" ></script>
<script src="../../js/jquery-ui.js" type="text/javascript"></script>
<script src="../../js/jquery.form.js" type="text/javascript"></script>
<script src="../../js/admin.js" type="text/javascript"></script>
<script src="../../js/adminManage.js" type="text/javascript"></script>
<link href="../../css/reset.css" rel="stylesheet" type="text/css" />
<link href="../../css/redmond/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../../css/adminStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<% Call Header%>
      <!--start  -->
      <table id="dataTable" class="ui-widget ui-widget-content tableBlue" border="0" cellspacing="0" cellpadding="0">
        <thead class="ui-widget-header">
          <tr>
            <th width="1%" scope="col"><input name="id" type="checkbox" value="" /></th>
            <th width="21%" scope="col">用户</th>
            <th width="24%" scope="col">权限</th>
            <th width="19%" scope="col">Email</th>
            <th width="15%" scope="col">状态</th>
            <th width="20%" scope="col">操作</th>
          </tr>
        </thead>
        <tbody>
          <%
  Call SelectAllUser
  %>
        </tbody>
      </table>
      <input id="createUser" type="button" value="增加用户" class="ui-button ui-state-default ui-corner-all" />
      <div id="dialog" title="添加新的管理员">
        <form id="addForm" class="formUser" action="" method="post">
          <table width="100%" class="tableHight">
            <tr>
              <td width="30%" class="textRight">管理员名称</td>
              <td width="50%"><input type="text" name="adminName" id="adminName" class="text ui-widget-content ui-corner-all" maxlength="16"  /></td>
              <td width="20%">&nbsp;</td>
            </tr>
            <tr>
              <td class="textRight">密码</td>
              <td><input type="password" name="adminPwd" id="adminPwd" class="text ui-widget-content ui-corner-all" maxlength="16" /></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="textRight">E-mail</td>
              <td><input type="text" name="adminEmail" id="adminEmail" class="text ui-widget-content ui-corner-all" maxlength="20" /></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="textRight">用户权限</td>
              <td><select name="adminPower" class="selectFrom">
                  <option value="1">录入员</option>
                  <option value="2">管理员</option>
                </select></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="textRight">用户状态</td>
              <td><select id="adminState" name="adminState" class="selectFrom">
                  <option value="1">正常</option>
                  <option value="0">锁定</option>
                </select></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3" id="errorText" class="colorRed bord"></td>
            </tr>
          </table>
        </form>
      </div>
      <div id="mDialog" title="修改用户">
        <form id="modifyForm" class="formUser" action="" method="post">
          <input type="hidden" name="mId" id="mId" />
          <table width="100%" class="tableHight">
            <tr>
              <td width="30%" class="textRight">管理员名称</td>
              <td width="50%"><input type="text" name="mAdminName" id="mAdminName" class="text ui-widget-content ui-corner-all" readonly="readonly" /></td>
              <td width="20%">&nbsp;</td>
            </tr>
            <tr>
              <td class="textRight">密码</td>
              <td><input type="password" name="mAdminPwd" id="mAdminPwd" class="text ui-widget-content ui-corner-all" /></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="textRight">E-mail</td>
              <td><input type="text" name="mAdminEmail" id="mAdminEmail" class="text ui-widget-content ui-corner-all" /></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="textRight">用户权限</td>
              <td><select name="mAdminPower" id="mAdminPower" class="selectFrom">
                  <option value="1">录入员</option>
                  <option value="2">管理员</option>
                </select></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td class="textRight">用户状态</td>
              <td><select id="mAdminState" name="mAdminState" class="selectFrom">
                  <option value="1">正常</option>
                  <option value="0">锁定</option>
                </select></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3" id="merrorText" class="colorRed"></td>
            </tr>
          </table>
        </form>
      </div>
      <div id="delDialog" title="删除用户" class="displayNone">
        <form id="delForm" action="" method="post">
          你确定要删除 <span id="delAdminName" class="colorRed"></span> 吗？
          <input type="hidden" name="dId" id="dId" />
        </form>
      </div>
      <!-- #delDialog-->
     <%Call Footer%>
</body>
</html>