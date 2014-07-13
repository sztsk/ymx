// JavaScript Document
//G表示全局，凡是G开头的函数都在这里
$(document).ready(function(){
	GTableEven();
	GBtn();
})//end ready

//表格偶数行变色
function GTableEven(){
	$(".tableBlue tr").removeClass("even").removeClass("odd");
	$(".tableBlue tr:even").addClass("even");/*table ou shu hang*/
	$(".tableBlue tr:odd").addClass("odd");/*table ou shu hang*/
}

function GBtn(){
	$('.ui-button').hover(
		function(){ 
			$(this).addClass("ui-state-hover"); 
		},
		function(){ 
			$(this).removeClass("ui-state-hover"); 
		}
	).mousedown(function(){
		$(this).addClass("ui-state-active"); 
	})
	.mouseup(function(){
			$(this).removeClass("ui-state-active");
	});
}
//插入错误样式div
//validateId:要验证的ID
//errorText:错误显示文本
function ShowErrorStyle(insertTag,valiDateId,errorText){
	var divError = '<div class="ui-widget jsRemove">';
		divError += '<div class="ui-state-error ui-corner-all" style="padding: 0 .7em; margin:1px">';
     	divError += '<p style="text-align:left"><span class="ui-icon ui-icon-alert" style="float: left; margin:6px 6px 0 0 "></span>';
		divError += '<strong>Alert:</strong> '+errorText +'</p>';
        divError += '</div></div>';
	
	insertTag.html(divError);
	valiDateId.removeClass("ui-state-error");
	valiDateId.addClass("ui-state-error");
}//end ShowErrorStyle

function ShowTipsStype(insertTag,valiDateId,tipsText){
	var divTips = '<div class="ui-widget jsRemove">';
		divTips += '<div class="ui-state-highlight ui-corner-all" style="padding: 0 .7em; margin:1px">';
		divTips += '<p style="text-align:left"><span class="ui-icon ui-icon-info" style="float: left; margin:6px 6px 0 0 "></span>';
		divTips += '<strong>Tips:</strong>'+tipsText+'</p>';
		divTips += '</div></div>';
	
	insertTag.html(divTips);
	valiDateId.removeClass("ui-state-highlight");
	valiDateId.addClass("ui-state-highlight");
	
	
}//end ShowTipsStype
//显示错误提示
function updateTips(tipsId,t) {
	tipsId.text(t).effect("highlight",{},1500);
}

function RemoveTips(){
	$(".jsRemove").remove();
	$("input[type='text'] , input[type='password']").removeClass("ui-state-error");
}//end RemoveTipsR

//js读取url参数
function GetArgsFromHref(sHref, sArgName){
	var args = sHref.split("?");
	var retval = "";
	
	if (args[0] == sHref) /*参数为空*/ {
		return retval; /*无需做任何处理*/
	}
	var str = args[1];
	args = str.split("&");
	for (var i = 0; i < args.length; i++) {
		str = args[i];
		var arg = str.split("=");
		if (arg.length <= 1) 
			continue;
		if (arg[0] == sArgName) 
			retval = arg[1];
	}
	return retval;
}

//格式化日期
function FormatData(inputId){
	var myDate = new Date();
	var thisDate = myDate.getFullYear()+ "-";
	thisDate += myDate.getMonth() + 1 + "-";//取月份
	thisDate += myDate.getDate();  
	inputId.val(thisDate);
}