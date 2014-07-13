// JavaScript Document
$(document).ready(function(){
	$("#changeImgS img").click(function(){
	   $("#changeImgB img").css("opacity","0");
	   $("#changeImgB img").attr("src",$(this).attr("src"));
	   $("#changeImgB img").stop().animate({opacity: 1 }, 500);
	   $("#changeImgB a").attr("href",$(this).attr("alt"));
	   })
});//end ready