/**
 * @author Hugo
 */
$(document).ready(function(){

	AddDialogState();
	DelDialogState();
	ModifyDialogState();
	//AddForm();
	//ModifyForm();
	$('#delForm').ajaxForm(); 
	$('#addForm').ajaxForm(); 
	$('modifyForm').ajaxForm(); 
	DelUser();
	ModifyUser();
	$('#createUser').click(function() {
			$('#dialog').dialog("open");
			RemoveTips();
	})
	
})//end ready

function AddRow(data) {
	var modifyUser = "<a class='modify' href='javascript:void(0)'>修改</a>";
	var delUser = "<a class='del' href='javascript:void(0)'>删除</a>";
	//oTable.fnAddData( [data.adminName,powerName,data.adminEmail,data.adminState,optionUser] );
	var table = "<tr><td class='textCenter'><input id='checkbox"+data.Id +"' type='checkbox' value="+ data.Id +" /></td>";
	table += "<td>"+ data.adminName +"</td><td>"+ data.adminPower +"</td><td>"+ data.adminEmail +"</td><td>"+ data.adminState+"</td>";
	table += "<td>"+modifyUser +" "+ delUser +"</td></tr>";
	$("#dataTable").append(table);
	//重新绑定事件
	ModifyUser();
	DelUser();
	GTableEven();
	$('#dialog').dialog("close");
}

//修改用户
this.ModifyUser = function(){
	$(".modify").each(function(){
		$(this).click(function(){
			//找到修改ID
			var adminId = $(this).parent("td").parent("tr").find("input[type='checkbox']").attr("value");
			$.getJSON("adminManage.asp?action=GetAdminById&id="+ adminId,function(data){
				//alert(data.adminName)
				$("#mId").attr("value",adminId);
				$("#mAdminName").attr("value",data.adminName);
				$("#mAdminPwd").attr("value",data.adminPwd);
				$("#mAdminEmail").attr("value",data.adminEmail);
				$("select[name=mAdminPower] option[value='"+data.adminPower+"']").attr("selected",true);
				$("select[name=mAdminState] option[value='"+data.adminState+"']").attr("selected",true);
				$('#mDialog').dialog("open");
				RemoveTips();

			})
		})
	})
}//end modifyUser

//删除用户
function DelUser(){
	$(".del").each(function(){
		$(this).click(function(){
			var adminId = $(this).parent("td").parent("tr").find("input[type='checkbox']").attr("value");
			var adminName = $(this).parent("td").parent("tr").find("td:eq(1)").text();
			$("#dId").attr("value",adminId);
			$("#delAdminName").html(adminName);
			$("#delDialog").dialog("open");
		})
	})
}

function DelRow(data){
	$("#delDialog").dialog("close");
	$("#checkbox"+data).parent("td").parent("tr").remove();
	//重新绑定事件(隔行换色)
	GTableEven();
}
function ModifyRow(data){
	$('#mDialog').dialog("close");
	//找到ID
	var adminId = $("input[type='checkbox']").each(function(){
		if($(this).attr("value") == data.Id){
			var tr = $(this).parent("td").parent("tr");
			tr.find("td:eq(2)").html(data.adminPower).effect("highlight",{},1500);
			tr.find("td:eq(3)").html(data.adminEmail).effect("highlight",{},1500);
			tr.find("td:eq(4)").html(data.adminState).effect("highlight",{},1500);
		};
	});
}





function AddDialogState(){
	$("#dialog").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 330,
			widht: 400,
			modal: true,
			buttons:{
				
				取消: function() {
					$(this).dialog('close');
				},
				确定: function() {
					var options = { 
						url:"adminManage.asp?action=InsertUser",
						beforeSubmit:  validate,  // pre-submit callback 
			        	success:       AddRow,  // post-submit callback 
			        	resetForm: true,
						dataType:  'json', 
			        	timeout:   3000 
					}
			        $('#addForm').ajaxSubmit(options); 
				}
			}
	});
}
function validate(formData, jqForm, options) {
	RemoveTips();
    if (!formData[0].value) {
        ShowErrorStyle($("#errorText"),$("#adminName"),"用户名不能为空");
        return false; 
    }
	if (!formData[1].value) {
        ShowErrorStyle($("#errorText"),$("#adminPwd"),"密码不能为空");
        return false; 
    }
	regPwd =/^([0-9a-zA-Z])+$/;
	if(!regPwd.test(formData[1].value)){
		ShowErrorStyle($("#errorText"),$("#adminPwd"),"密码不能含有特殊字符");
		return false;
	}
	if (!formData[2].value) {
        ShowErrorStyle($("#errorText"),$("#adminEmail"),"Email不能为空");
        return false; 
    }
	regEmail =/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i;
	if(!regEmail.test(formData[2].value)){
		ShowErrorStyle($("#errorText"),$("#adminEmail"),"请输入正确的Email地址");
		return false;
	}
}
function ModifyDialogState(){
	$("#mDialog").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 330,
			widht: 400,
			modal: true,
			buttons:{
				
				取消: function() {
					$(this).dialog('close');
				},
				确定: function() {
					var options = { 
						beforeSubmit:  mValidate,  // pre-submit callback 
			        	success:       ModifyRow,  // post-submit callback
			        	url:"adminManage.asp?action=UpdataAdminC",
						dataType:  'json',
						resetForm: true,
			        	timeout:   3000 
					}
			        $("#modifyForm").ajaxSubmit(options); 
				}
			}
	})
}

function mValidate(formData, jqForm, options) {
	RemoveTips();
	if (!formData[2].value) {
        ShowErrorStyle($("#merrorText"),$("#mAdminPwd"),"密码不能为空");
        return false; 
    }
	regPwd =/^([0-9a-zA-Z])+$/;
	if(!regPwd.test(formData[2].value)){
		ShowErrorStyle($("#merrorText"),$("#mAdminPwd"),"密码不能含有特殊字符");
		return false;
	}
	if (!formData[3].value) {
        ShowErrorStyle($("#merrorText"),$("#mAdminEmail"),"Email不能为空");
        return false; 
    }
	regEmail =/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i;
	if(!regEmail.test(formData[3].value)){
		ShowErrorStyle($("#merrorText"),$("#mAdminEmail"),"请输入正确的Email地址");
		return false;
	}
}
function DelDialogState(){
	$("#delDialog").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 150,
			modal: true,
			buttons:{
				
				取消: function() {
					$(this).dialog('close');
				},
				确定: function() {
					var options = { 
			        	success:       DelRow,  // post-submit callback
			        	url:"adminManage.asp?action=DeleteadminById",
			        	timeout:   3000 
					}
					$("#delForm").ajaxSubmit(options);
				}
			}
	});
}

