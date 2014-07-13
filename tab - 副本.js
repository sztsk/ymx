$(document).ready(function(){
	$("#menu li:first").addClass("clickLi");//tabMenu				   
	$("#menu li").click(function() {
		$("#menu li").removeClass("clickLi");
		$(this).addClass("clickLi");
	})
	$(".searchBox").css("color","#CCC").val("请输入关键字");//搜索框事件
	$(".searchBox").focus(function(){
								   if($(".searchBox").val()=="请输入关键字")
								   $(".searchBox").val("");
								   })
	$(".searchBox").blur(function(){
								   if($(".searchBox").val()=="")
								   $(".searchBox").val("请输入关键字");
								   })
	$.each([1,2,3],function(a,b){
	$(".tab_"+b+" li:first").addClass("oSelected");//新闻框事件
	if(b==1) $(".tab_"+b+"+.commonBox div:first").css("display","block");
	else $(".newsBox_"+b+" .commonBox dl:first").css("display","block");
	$(".tab_"+b+" li").click(function() {
		$(".tab_"+b+" li").removeClass("oSelected");
		$(this).addClass("oSelected");
		if(b==1) $(".tab_"+b+"+.commonBox div").css("display","none");
		else $(".newsBox_"+b+" .commonBox dl").css("display","none");
		$("#" + $(this).attr("title")).css("display","block");
		$("#" + $(this).attr("title") + " .newsBottom").css("display","block");
	});
	});
	$.each([1,2,3,4,5],function(i,n){
	$("#liTab_"+n+" .selectList li:first").addClass("liSelected");
	$("#liTab_"+n+" .liTab:first").css("display","block");
	$("#liTab_"+n+" .selectList li").click(function() {
		$("#liTab_"+n+" .selectList li").removeClass("liSelected");
		$(this).addClass("liSelected");
		$("#liTab_"+n+" .liTab").css("display","none");
		$("#" + $(this).attr("title")).css("display","block");
	});
	});
	$(".channelBoxLeft li:eq(3)").addClass("bottomLine");
	$(".channelBoxLeft li:eq(7)").addClass("bottomLine");
	$(".imgChannel dd ul li:first").addClass("coverImgLi");
	$(".imgChannel dd ul li").click(function(){
						$(".imgChannel dd ul li").removeClass("coverImgLi");
						$(this).addClass("coverImgLi");
						$(".imgChannel dt a img").css("opacity","0");
						$(".imgChannel dt a img").attr("src",$(this).children().attr("src"));
						$(".imgChannel dt a img").stop().animate({opacity: 1 }, 500);
						$(".imgChannel dt a").attr("href",$(this).children().attr("name"));
						$(".imgChannel dt p").html("<b>"+$(this).children().attr("alt")+"</b><br />"+$(this).children().attr("title"))
												 });
});
