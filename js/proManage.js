// JavaScript Document
$(document).ready(function(){
	ShowEdit();
	ModifyDialogState();
	DelDialogState();
	SpeedEdit();
	DelDataRow();
	FancyBox();
	TableSorter();
	
})//end ready
function TableSorter(){
	$("#articleTable")
	 .tablesorter({widthFixed: true, widgets: ['zebra'],headers:{0:{sorter: false}}}) 
     .tablesorterPager({container: $("#pager")}); 
}//end TableSorter
//鼠标移到表格行，显示文章相关操作按钮
function ShowEdit(){
	$(".jsTd").each(function(){
		$(this).hover(
			function(){
				$(this).find(".tdLink").css("visibility","visible");
			},
			function(){
				$(this).find(".tdLink").css("visibility","hidden");
			}
		);
	});
}//end showedit

//点击快速编辑链接，弹出操作对话框
function SpeedEdit(){
	$(".jsSpeedEidt").click(function(){
			var proId = $(this).parent("div").parent("td").parent("tr").find("input[type='checkbox']").attr("value");
			$.getJSON("proManage.asp?action=GetProByIdSub&proId="+ proId,function(data){
				$("#proId").attr("value",proId);
				$("#proNo").attr("value",data.proNo);
				$("#proName").attr("value",data.proName);
				$("#proPrice").attr("value",data.proPrice);
				$("#proData").attr("value",data.proData);
				$("input[name=proHide][value="+ data.proHide +"]").attr("checked",true);
				$('#editArtDialog').dialog("open");
				$("#errorSpeed").empty();//清除错误提示信息
				$("#proData").datepicker({
					dateFormat: "yy-mm-dd"
				});
				$("select[name=proCate] option[value='"+data.proCate+"']").attr("selected",true);
		});//end getJson
	});//end click
}//end SpeedEdit

//快速修改产品
function ModifyDialogState(){
	$("#editArtDialog").dialog({
			bgiframe: true,
			autoOpen: false,
			width:300,
			height: 320,
			modal: true,
			buttons:{
				
				取消: function() {
					$(this).dialog('close');
				},
				确定: function() {
					var options = { 
						beforeSubmit:  doCheck,  // pre-submit callback 
			        	success:       ModifyRow,  // post-submit callback
			        	url:"proManage.asp?action=UpdatProSpeedById",
						dataType:  'json',
						resetForm: true,
			        	timeout:   3000 
					}
			        $("#editForm").ajaxSubmit(options); 
				}
			}
	})
}//end ModifyDialogState

//修改成功后更新表格数据
function ModifyRow(data){
	$('#editArtDialog').dialog("close");
			//找到更新文章ID
			var tr = $("input[type='checkbox'][value='"+data.proId+"']").parent("td").parent("tr");
			tr.find("td:eq(1)").html(data.proNo).effect("highlight",{},1500);
			tr.find("td:eq(2)").find("a:eq(0)").html(data.proName).effect("highlight",{},1500);
//			tr.find("td:eq(2)").html(data.proName).effect("highlight",{},1500);
			tr.find("td:eq(3)").html(data.proPrice).effect("highlight",{},1500);
			tr.find("td:eq(5)").html(data.proCateName).effect("highlight",{},1500);
			var hide ="";
			if(data.proHide == 1){
				hide = "正常";
			}else {
				hide = "<span class='colorRed'>锁定</span>";
			}
			tr.find("td:eq(6)").html(hide).effect("highlight",{},1500);
}//end ModifyRow

//删除产品
function DelDataRow(){
	$(".jsDel").click(function(){
			var proId = $(this).parent("div").parent("td").parent("tr").find("input[type='checkbox']").attr("value");
			var proName = $(this).parent("div").parent("td").parent("tr").find("a:eq(0)").attr("title");
			$("#dId").attr("value",proId);
			//alert(title);
			$("#delArticleTitle").html(proName);
			$("#delDialog").dialog("open");
		});
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
			        	url:"proManage.asp?action=DeleteProById",
			        	timeout:   3000 
					}
					$("#delForm").ajaxSubmit(options);
				}
			}
	})
}//end DelDialogState

function DelRow(data){
	$("#delDialog").dialog("close");
	//alert($("#checkbox"+data).parent("td").parent("tr").text());
	$("#checkbox"+data).parent("td").parent("tr").remove();
	//重新绑定事件(隔行换色)
	GTableEven();
}//end DelRow

function doCheck(formData, jqForm, options){
	if (!formData[0].value) {
        //ShowErrorStyle($("#errorproNo"),$("#proNo"),"编号不能为空");
		updateTips($("#errorSpeed"),"编号不能为空");
        return false; 
    }
	if (!formData[1].value) {
        ShowErrorStyle($("#errorproName"),$("#proName"),"产品名称不能为空")
        return false; 
    }
	reg=/^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$/;
	if(!reg.test(formData[4].value)){
		ShowErrorStyle($("#errorproPrice"),$("#proPrice"),"货币只能为数字");
		return false;
	}
}//end doCheck

function FancyBox(){
	$(".jsPre").fancybox({
		'overlayShow'			: true,
		'zoomSpeedIn'			: 600,
		'zoomSpeedOut'			: 500,
		'hideOnContentClick': false,
		'frameHeight':350,
		'frameWidth':700
	});
}//end FancyBox

