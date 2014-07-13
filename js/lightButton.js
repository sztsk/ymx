// JavaScript Document
$(document).ready(function(){
	var url=document.location.href;
	
	kk=url.split("/");
	switch (kk[3])
	{
	case "aboutUs.asp": 
		$(".menuA2").attr("class","menuA2c");
	break
	case "member.asp":
		$(".menuA3").attr("class","menuA3c");
	break
	case "news.asp":
		$(".menuA4").attr("class","menuA4c");
	break
	case "vegetables.asp":
		$(".menuA5").attr("class","menuA5c");
	break
	case "production.asp":
		$(".menuA6").attr("class","menuA6c");
	break
	case "check.asp":
		$(".menuA7").attr("class","menuA7c");
	break
	case "contactUs.asp":
		$(".menuA8").attr("class","menuA8c");
	break
	default:
		$(".menuA1").attr("class","menuA1c");
	}
	
	$(".menu a").hover(function() {
		var ss = $(this).attr("class").split("c");
		if(ss[1] == ""){return false;}
				$(this).attr("class",$(this).attr("class")+"o");
				$(this).click(function() {
								var stringArray = $(this).attr("class").split("o");
								$(this).addClass(stringArray[0]+"c");
								$(".menu a").attr("class","");
								})
				},function() {
					var stringArray = $(this).attr("class").split("o");
					$(this).attr("class",stringArray[0]);
					}
)
});

//关于合作社Menu
$(document).ready(function(){
	$(".aboutMenu li:first").addClass("aboutMenuClick");				   
	$("#aboutTextBox div:not(:first)").hide();
	$("#vegetBox div:not(:first)").hide();
	$(".aboutMenu li").hover(function() {
		$(".aboutMenu li").removeClass("aboutMenuHover");
		$(this).addClass("aboutMenuHover");
		$(this).click(function() {
								$(".aboutMenu li").removeClass("aboutMenuHover");
								$(".aboutMenu li").removeClass("aboutMenuClick");
								$(this).addClass("aboutMenuClick");
								$("#aboutTextBox div").hide();
								$("#vegetBox div").hide();
								$("." + $(this).attr("id")).fadeIn("fast");
								})
	},function() {
		$(this).removeClass("aboutMenuHover");
		}
)});

