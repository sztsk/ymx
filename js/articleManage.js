/**
 * @author Hugo
 */
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
	 .tablesorter({widthFixed:false, widgets: ['zebra'],headers:{0:{sorter: false}}}) 
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
		)
	})
}//end ShowEdit

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

//点击快速编辑链接，弹出操作对话框
function SpeedEdit(){
	$(".jsSpeedEidt").click(function(){
			var artId = $(this).parent("div").parent("td").parent("tr").find("input[type='checkbox']").attr("value");
			$.getJSON("articleManage.asp?action=GetArtSpeedById&artId="+ artId,function(data){
				$("#artId").attr("value",artId);
				$("#title").attr("value",data.title);
				$("#author").attr("value",data.author);
				$("#click").attr("value",data.click);
				$("#dates").attr("value",data.dates);
				$("input[name=isTop][value="+ data.isTop +"]").attr("checked",true);
				$("input[name=isRecommend][value="+ data.isRecommend +"]").attr("checked",true);
				$("input[name=isReview][value="+ data.isReview +"]").attr("checked",true);
				$('#editArtDialog').dialog("open");
				$("#dates").datepicker({
					dateFormat: "yy-mm-dd"
				});
				$("select[name=categoryId] option[value='"+data.categoryId+"']").attr("selected",true);

			});
	});
}//end SpeedEdit

//快速修改文章
function ModifyDialogState(){
	$("#editArtDialog").dialog({
			bgiframe: true,
			autoOpen: false,
			width:300,
			height: 400,
			modal: true,
			buttons:{
				
				取消: function() {
					$(this).dialog('close');
				},
				确定: function() {
					var options = { 
						//beforeSubmit:  validate,  // pre-submit callback 
			        	success:       ModifyRow,  // post-submit callback
			        	url:"articleManage.asp?action=UpdatArtSpeedById",
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
			var tr = $("input[type='checkbox'][value='"+data.artId+"']").parent("td").parent("tr");
			tr.find("td:eq(1)").find("a:eq(0)").html(data.title).effect("highlight",{},1500);
			tr.find("td:eq(2)").html(data.author).effect("highlight",{},1500);
			tr.find("td:eq(3)").html(data.artCateName).effect("highlight",{},1500);
			tr.find("td:eq(4)").html(data.isReview).effect("highlight",{},1500);
			tr.find("td:eq(5)").html(data.dates).effect("highlight",{},1500);
			var top ="";
			var re ="";
			if(data.isTop == 1)
				top = "置顶";
			
			if(data.isRecommend == 1)
				re= "推荐";
			tr.find("td:eq(6)").html(top+"  "+re).effect("highlight",{},1500);
			//alert(adminPwd)
}//end ModifyRow


function DelDataRow(){
	$(".jsDel").each(function(){
		$(this).click(function(){
			var artId = $(this).parent("div").parent("td").parent("tr").find("input[type='checkbox']").attr("value");
			var title = $(this).parent("div").parent("td").parent("tr").find("a:eq(0)").attr("title");
			$("#dId").attr("value",artId);
			//alert(title);
			$("#delArticleTitle").html(title);
			$("#delDialog").dialog("open");
		})
	})
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
			        	url:"articleManage.asp?action=DeleteArtById",
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

