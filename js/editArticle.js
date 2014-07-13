// JavaScript Document
var artId
$(document).ready(function(){
	artId = GetArgsFromHref(window.location.href,"artId");
	ConBtn();
	GetArt(); 
	EditForm();
	ShowDia();
})//end ready


function EditForm(){
	
	var options = { 
			url:"articleManage.asp?action=EditArtById&artId="+artId,
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

function ShowChange(data){
	$("#showDialog").dialog("open");
}

function GetArt(){
	//var artId = GetArgsFromHref(window.location.href,"artId");
	
	$.getJSON("articleManage.asp?action=GetArtSpeedById&artId="+ artId,function(data){
				$("#artId").attr("value",artId);
				$("#title").attr("value",data.title);
				$("#author").attr("value",data.author);
//				$("#click").attr("value",data.click);
				$("#dates").attr("value",data.dates);
//				$("input[name=isTop][value="+ data.isTop +"]").attr("checked",true);
				$("select[name=isTop]").val(data.isTop);
				$("select[name=isRecommend]").val(data.isRecommend);
//				$("select[name=isRecommend] option[value="+ data.isRecommend +"]").attr("selected",true);		
				$("select[name=isReview] option[value="+ data.isReview +"]").attr("selected",true);
				$("select[name=click] option[value="+ data.click +"]").attr("selected",true);

				//$('#editArtDialog').dialog("open");
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
