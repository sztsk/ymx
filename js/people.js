// JavaScript Document
$(function(){
		   $("#people_content,#people_photo").hide();
		   })
$(window).load(function(){
	var $img = $("#people_content").find("img");
	$("#people_photo").append($img);
	var $firstImg = $("#people_photo").find("img:eq(0)");
	$("#big_photo").attr("src",$firstImg.attr("src"));
	$("#people_photo > img").click(function(){
		var imgSrc = $(this).attr("src");
		$("#big_photo").attr("src",imgSrc);
	})
	var imgNum = 1;
	var imgAll = $("#people_photo").find("img").length;
	$("#big_photo").click(function(){
		
		$(this).attr("src",$("#people_photo").find("img:eq("+ imgNum +")").attr("src"));
		imgNum++;
		if(imgNum == imgAll){
			imgNum = 0;
		}
		DrawImage($(this)[0],200);
//		console.info($("#people_photo").find("img:eq("+ imgNum +")").attr("width"),$(this).height());
//		console.info(imgNum,imgAll);
		
	})
	$("#people_content,#people_photo").show();
//	console.info($("#people_content").find("img"));
})
