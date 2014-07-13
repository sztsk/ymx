// JavaScript Document
var vegetId
$(document).ready(function(){
	vegetId = GetArgsFromHref(window.location.href,"vegeId");
	ConBtn();
	GetArt(); 
	EditForm();
	ShowDia();
})//end ready


function EditForm(){
	
	var options = { 
			url:"artelManage.asp?action=EditArtById&vegetId="+vegetId,
			beforeSubmit:  ShowValidate,  // pre-submit callback 
        	success:       ShowChange,  // post-submit callback 
        	timeout:   3000 
		}
		 $('#editForm').submit(function() { 
        	$(this).ajaxSubmit(options); 
       		return false; 
    	});
}

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
	if (!formData[2].value) {
        ShowErrorStyle($("#errorcategoryId"),$("#categoryId"),"栏目不能为空")
        return false; 
    }
	if (!formData[3].value) {
        ShowErrorStyle($("#errordates"),$("#dates")," 日期不能为空");
        return false; 
    }
	if (!formData[7].value) {
        ShowErrorStyle($("#errorclick"),$("#click"),"点击率不能为空");
		return false;
		
    }
	reg=/^[-+]?\d+$/;
	if(!reg.test(formData[7].value)){
		ShowErrorStyle($("#errorclick"),$("#click"),"点击率只能为数字");
		return false;
	}
}//end ShowValidate

function ShowChange(data){
	$("#showDialog").dialog("open");
}

function GetArt(){
	
	$.getJSON("vegetableManage.asp?action=GetVegetById&vegetId="+ vegetId,function(data){
				$("#artelName").attr("value",data.artelName);
				$("#principal").attr("value",data.principal);
				$("#artelAddr").attr("value",data.artelAddr);
				$("#artelArea").attr("value",data.artelArea);
				$("#vegeBreed").attr("value",data.vegeBreed);
				
				$("#dates").datepicker({
					dateFormat: "yy-mm-dd"
				});
				$("select[name=categoryId] option[value='"+data.categoryId+"']").attr("selected",true);		
			})
}

function ConBtn(){
	$("#jsGo").click(function(){
		window.location ="index.asp";
	})
}

//成功修改文章后弹出操作对话框
function ShowDia(){
	$("#showDialog").dialog({
			bgiframe: true,
			autoOpen: false,
			closeOnEscape: false,
			width:200,
			height: 150,
			modal: true
	})
}//end ModifyDialogState
