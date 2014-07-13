// JavaScript Document
$(document).ready(function(){
	//InsertPro();
	$("#proData").datepicker({
		dateFormat: "yy-mm-dd"
	});
	ShowDia();
	FormatData($("#proData"));
});//end ready

//插入产品
function InsertPro(){
	var options = { 
		beforeSubmit:  ShowValidate,  // pre-submit callback 
    	success:       ShowDialog,  // post-submit callback
    	//iframe: true,
    	url:"proManage.asp?action=InsertPro",
		resetForm: true,
    	timeout:   3000 
	}
	$('#insertForm').submit(function() { 
        $(this).ajaxSubmit(options); 
        return false; 
    }); 
	
}//end InsertPro

//效验
function ShowValidate(formData, jqForm, options){
	if (!formData[1].value) {
        ShowErrorStyle($("#errorproName"),$("#proName"),"产品名称不能为空")
        return false; 
    }
}//end ShowValidate

function doCheck(){
	if (!$("#proNo").val()) {
        ShowErrorStyle($("#errorproNo"),$("#proNo"),"编号不能为空")
        return false; 
    }
	if (!$("#proName").val()) {
        ShowErrorStyle($("#errorproName"),$("#proName"),"产品名称不能为空")
        return false; 
    }
	reg=/^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$/;
	if(!reg.test($("#proPrice").val())){
		ShowErrorStyle($("#errorproPrice"),$("#proPrice"),"货币只能为数字");
		return false;
	}
}//end doCheck

function ShowDialog(data){
	alert(data);
	//console.log(data);
	$("#showDialog").dialog("open");
}

//成功添加文章后弹出操作对话框
function ShowDia(){
	$("#showDialog").dialog({
			bgiframe: true,
			autoOpen: false,
			closeOnEscape: false,
			width:400,
			height: 250,
			modal: true
	})
}//end ShowDia