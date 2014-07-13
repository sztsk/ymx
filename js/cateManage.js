/**
 * @author Hugo
 */
var ck
$(document).ready(function(){
	ck = GetArgsFromHref(window.location.href,"ck");
	EditCate();
	SaveCate();
	DelCate();
	CancelCate();
	DelDialogState();
	ShowDialogState();
//	AddForm();
})//end ready

function EditCate(){
	$(".editCate").each(function(){
		$(this).click(function(){
		  var span = $(this).parent("td").parent("tr").find("td:eq(1) span");
		  textChangeInput(span);
    		
		 var order = $(this).parent("td").parent("tr").find("td:eq(2)");
		 textChangeInput(order);
		 $(this).hide();
		 $(this).next().hide();
		 $(this).parent("td").find(".saveCate,.cancelCate").show();
		 		
		});//end click
	});//end each
}//end EditCate

function SaveCate(){
	$(".saveCate").each(function(){
		var saveCate = $(this);
		$(this).click(function(){
			var tr = $(this).parent("td").parent("tr");
			var ClassName =  tr.find("td:eq(1) input").val();
			var ClassOrder = tr.find("td:eq(2) input").val();
			var ClassId = tr.find("td:eq(0) input").val();
			$.post("categoryManage.asp?action=UpdateNameOrder",
					{ ClassId: ClassId, ClassName: ClassName,ClassOrder:ClassOrder },
					function(data){
						if(data ==  200){
							//删除输入框并更新页面数据
							tr.find("td:eq(1) input").remove();
							tr.find("td:eq(1) span").html(ClassName).effect("highlight",{},1500);
							tr.find("td:eq(2) input").remove();
							tr.find("td:eq(2)").html(ClassOrder).effect("highlight",{},1500);
							
							saveCate.next().hide();
							saveCate.hide();
							saveCate.prev().show();
							saveCate.prev().prev().show();
							
							DrawSelect();
						};
						
					});//post
		});//click
	})//end each
}

function CancelCate(){
	$(".cancelCate").click(function(){
		var cancelCate = $(this);
		var tr = cancelCate.parent("td").parent("tr");
		var ClassName =  tr.find("td:eq(1) input").val();
		var ClassOrder = tr.find("td:eq(2) input").val();
		var ClassId = tr.find("td:eq(0) input").val();
		tr.find("td:eq(1) input").remove();
		tr.find("td:eq(1) span").html(ClassName);
		tr.find("td:eq(2) input").remove();
		tr.find("td:eq(2)").html(ClassOrder);
		
		cancelCate.prev().hide();//save
		cancelCate.prev().prev().show();//del
		cancelCate.prev().prev().prev().show();//edit
		cancelCate.hide();
		
	});//click
}

function DelCate(){
	$(".delCate").each(function(){
		var tr = $(this).parent("td").parent("tr");
		var classId = tr.find("td:eq(0) input").attr("value");
		var className = tr.find("td:eq(1) span").text();
		$(this).click(function(){
			$("#dId").attr("value",classId);
			$("#delClassName").empty();
			$("#delClassName").append(className);
			$("#delDialog").dialog("open");
		})
	});//end eahc
}//end delCate

function DelDialogState(){
	$("#delDialog").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 220,
			modal: true,
			buttons:{
				
				取消: function() {
					$(this).dialog('close');
				},
				确定: function() {
					var options = { 
			        	success:       DelRow,  // post-submit callback
			        	dataType: "json",
			        	url:"categoryManage.asp?action=DelByClassId",
			        	timeout:   3000 
					}
					$("#delForm").ajaxSubmit(options);
				}
			}
	})
}//end DelDialogState



function DelRow(data){
	if(data.showRe == 200 ){
		$("#delDialog").dialog("close");
		$("#checkbox"+data.ClassId).parent("td").parent("tr").remove();
		DrawSelect();
	}
	else {
		$("#tips").show("highlight",{},1500);
	}
	
	//重新绑定事件(隔行换色)
	GTableEven();
}

function ShowDialogState(){
	$("#showDialog").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 220,
			buttons:{
				
				确定: function() {
					$(this).dialog('close');
				}
			}
	})
}//end DelDialogState


//对菜单操作后要更新select列表
function DrawSelect(){
	$.get("categoryManage.asp?action=DrawSelect&ck=" + ck,function(data){
		$("#jsAddSelect").html(data);
	});//
}

function AddForm(){
	var options = { 
			url:"categoryManage.asp?action=ClassAdd&ck=" + ck,
			beforeSubmit:  ShowValidate,  // pre-submit callback 
        	success:       AddRow,  // post-submit callback 
        	timeout:   3000 
		}
		 $('#addForm').submit(function() { 
        	$(this).ajaxSubmit(options); 
       		return false; 
    	});
}

function AddRow(data){
	var tbody = $("#cateTable tbody");
	$.get("categoryManage.asp?action=GetClassList&ck=" + ck,function(data){
		tbody.html(data);
		$("#addcateText").removeClass("ui-state-error");
		GTableEven();
		EditCate();
		SaveCate();
		DelCate();
		CancelCate();
		DrawSelect();
	});
	
}//AddRow

function ShowValidate(formData, jqForm, options){
	//formData[1].value :"addcateText"
    if (!formData[1].value) {
		$("#showDialog").dialog("open");
        updateTips($("#errorTip"),"栏目名称不能为空，请输入你要添加的栏目！");
		$("#addcateText").addClass("ui-state-error");
        return false; 
    } 
}

//将文本转为输入框
//textObject 文本Jquery对象
function textChangeInput(textObject){
	  var span = textObject;
	  var name = span.text();
	  span.empty();
	  var input = $("<input class='ui-widget-content ui-corner-all' />");
	  input.attr("value",name);
	  span.append(input);
	  input.keyup(function(event){
           var myEvent = event || window.event;
           var keyCode = myEvent.keyCode;
           //2.判断是否是ESC键按下
           if(keyCode == 27){
               //将input输入框的值还原成修改之前的值
               input.val(name);
           }
		});//end keyup
}
