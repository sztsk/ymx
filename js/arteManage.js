/**
 * @author Hugo
 */
$(document).ready(function(){
	DelDialogState();
	DelDataRow();
	FancyBox();
	TableSorter();
})//end ready

function TableSorter(){
	$("#articleTable")
	 .tablesorter({widthFixed:false, widgets: ['zebra'],headers:{0:{sorter: false}}}) 
     .tablesorterPager({container: $("#pager")}); 
}//end TableSorter

function DelDataRow(){
	$(".jsDel").click(function(){
			var artId = $(this).parent("td").parent("tr").find("input[type='checkbox']").attr("value");
			var title = $(this).parent("td").parent("tr").find("a:eq(0)").attr("title");
			$("#dId").attr("value",artId);
			//alert(title);
			$("#delArticleTitle").html(title);
			$("#delDialog").dialog("open");
		})//end click
}

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
			        	url:"artelManage.asp?action=DeleteArteById",
			        	timeout:   3000 
					}
					$("#delForm").ajaxSubmit(options);
				}
			}
	})
}//end DelDialogState

function DelRow(data){
	$("#delDialog").dialog("close");
	$("#checkbox"+data).parent("td").parent("tr").remove();
	//重新绑定事件(隔行换色)
	GTableEven();
}//end DelRow