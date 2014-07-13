/**
 * @author Hugo
 */
$(document).ready(function(){
	InsertArt();
	$("#dates").datepicker({
		dateFormat: "yy-mm-dd"
	});
	
	FormatData($("#dates"));
	ShowDia();
	GetAddOption();
//	Validate();
})//end ready

//插入文章
function InsertArt(){
	var options = { 
		beforeSubmit:  ShowValidate,  // pre-submit callback 
    	success:       ShowDialog,  // post-submit callback
    	url:"articleManage.asp?action=InsertArt",
		resetForm: true,
    	timeout:   3000 
	}
	$('#insertForm').submit(function() { 
        $(this).ajaxSubmit(options); 
        return false; 
    }); 
	
}//end InsertArt

//效验
function ShowValidate(formData, jqForm, options){
	if (!formData[0].value) {
        ShowErrorStyle($("#errorTitle"),$("#title"),"标题不能为空")
        return false; 
    }
	if (!formData[1].value) {
        ShowErrorStyle($("#errorauthor"),$("#author"),"作者不能为空")
        return false; 
    }
	if (formData[2].value == 0) {
        ShowErrorStyle($("#errorcategoryId"),$("#categoryId"),"请选择文章栏目")
        return false; 
    }
	if (!formData[3].value) {
        ShowErrorStyle($("#errordates"),$("#dates")," 日期不能为空");
        return false; 
    }
//	if (!formData[7].value) {
//        ShowErrorStyle($("#errorclick"),$("#click"),"点击率不能为空");
//		return false;
//		
//    }
//	reg=/^[-+]?\d+$/;
//	if(!reg.test(formData[7].value)){
//		ShowErrorStyle($("#errorclick"),$("#click"),"点击率只能为数字");
//		return false;
//	}
}//end ShowValidate

function ShowDialog(data){
	//alert(data);
	$("#showDialog").dialog("open");
}

//格式化日期
function FormatData(){
	var myDate = new Date();
	var thisDate = myDate.getFullYear()+ "-";
	thisDate += myDate.getMonth() + 1 + "-";//取月份
	thisDate += myDate.getDate();  
	$("#dates").val(thisDate);
}

//成功添加文章后弹出操作对话框
function ShowDia(){
	$("#showDialog").dialog({
			bgiframe: true,
			autoOpen: false,
			closeOnEscape: false,
			width:400,
			height: 200,
			modal: true
	})
}//end ModifyDialogState

//添加成功后弹出对话框的2个操作
function GetAddOption(){
	var radio = $("input[name='go'][checked]").val();
	$("#conArticle").click(function(){
		$("#showDialog").dialog("close");
		//清除错误提示信息
		RemoveTips();
	});
	$("#goArticle").click(function(){
		window.location ="index.asp";
	});
	
}


