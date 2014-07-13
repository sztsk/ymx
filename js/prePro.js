// JavaScript Document
$(document).ready(function(){
	$("#fist").attr("src",$("#content img:eq(0)").attr("src"));
//	console.info($("#content img:eq(0)").attr("src"));
	$("#content img").each(function(){
		var imgPath = $(this).attr("src");
		
		$(this).clone().appendTo("#jsImg").wrap("<a href='"+ imgPath +"'  rel='group' class='jsPre'></a>");
		$(this).remove();
	})
	
//	FancyBox();
})

function FancyBox(){
	$(".jsPre").fancybox({
		'overlayShow'			: true,
		'zoomSpeedIn'			: 500,
		'zoomSpeedOut'			: 500,
		'hideOnContentClick': false,
		'frameHeight':350,
		'frameWidth':700
	});
}//end FancyBox

$(window).load(function(){
	$("#jsImg img").click(function(){
		var src = $(this).attr("src");
		$("#fist").attr("src",src);
		DrawImage($("#fist")[0],450);
//		console.info(src)
		return false;
	})
	var imgNum = 1;
	var imgAll = $("#jsImg").find("img").length;
	$("#fist").click(function(){
		$(this).attr("src",$("#jsImg").find("img:eq("+ imgNum +")").attr("src"));
		imgNum++;
		if(imgNum == imgAll){
			imgNum = 0;
		}
	})
	
	$("#content").clone().show().appendTo($("#js_top1"));
})
