// JavaScript Document
var proId
$(document).ready(function(){
	proId = GetArgsFromHref(window.location.href,"proId");
	GetArt(); 
})//end ready


//效验
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

function GetArt(){
	//var proId = GetArgsFromHref(window.location.href,"proId");
	
	$.getJSON("proManage.asp?action=GetProByIdSub&proId="+ proId,function(data){
				$("#proId").attr("value",proId);
				$("#proNo").attr("value",data.proNo);
				$("#proName").attr("value",data.proName);
				$("#proPrice").attr("value",data.proPrice);
				$("#proExplain").attr("value",data.proExplain);
				$("#proData").attr("value",data.proData);
				$("input[name=proHide][value="+ data.proHide +"]").attr("checked",true);
				$("#showImg").attr("src","../../upload/pro/" + data.proImg);
				$("#oldImg").attr("value",data.proImg)
				$("#proData").datepicker({
					dateFormat: "yy-mm-dd"
				});
				$("select[name=proCate] option[value='"+data.proCate+"']").attr("selected",true);		
			});
}//end GetArt