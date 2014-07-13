/**
 * @author Hugo
 */
var show;
$(document).ready(function(){
	show = parseInt(GetArgsFromHref(window.location.href,"show"));
	if( !isNaN(show)){
		$("#js_Show p,#js_Show ul").hide();
		$("#js_Show .show"+show).show();
//		console.log(show);
	}
	
	var pro = parseInt(GetArgsFromHref(window.location.href,"pro"));
	
	$("#js_blod a:eq("+ (pro - 1) +")").addClass("show_blod");
	
	var id = parseInt(GetArgsFromHref(window.location.href,"id"));
	if(id =="1"){
		$(".js_pro2","#js_blod").hide();
	}
	else if(id == "2"){
		$(".js_pro1","#js_blod").hide();
	}

Page();
})//

$(window).load(function(){
						SetTop1();
	SetListImg();
	
						})


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

function SetTop1(){
	$("#js_top_img").append($("#js_temp").find("img:eq(0)").attr("title",$("#js_temp").attr("title")));
	$("#js_temp img").remove()
	$("#js_top1").html( $("#js_temp").html() );
//	console.info($("#js_temp").html());
//	var getFirstImg = 
}

function SetListImg(){
	$(".js_list").each(function(){
		var firstImg = $(this).find("img:eq(0)").attr("src");
		if (firstImg) {
			$(this).next("li").find("img").attr("src",firstImg);
		}
	})
}



function Page(){
	var PAGE_NUM = 12;
	var $pageLi = $(".js_page_li");
	var length = $pageLi.length;
	var pages = Math.ceil(length/PAGE_NUM); 
	var nowPage = 1;
	$pageLi.slice(PAGE_NUM).hide();
	$("#js_next").click(function(){
		nowPage++;
		$pageContent = $pageLi.slice(PAGE_NUM*nowPage-PAGE_NUM,PAGE_NUM*nowPage);
		$pageContent.show();
		$pageLi.not($pageContent).hide();
		
		if(nowPage>=pages){
			nowPage = 0;
		}
//		console.info("next",PAGE_NUM*nowPage-PAGE_NUM,PAGE_NUM*nowPage);
		return false;
	})
	
	$("#js_pre").click(function(){
		nowPage--;
		if(nowPage<=0){
			nowPage = pages;
		}
		$pageContent = $pageLi.slice(PAGE_NUM*nowPage-PAGE_NUM,PAGE_NUM*nowPage);
		$pageContent.show();
		$pageLi.not($pageContent).hide();
//		console.info("pre---",PAGE_NUM*nowPage-PAGE_NUM,PAGE_NUM*nowPage);
//		
//		console.info("pre",PAGE_NUM*nowPage-PAGE_NUM,PAGE_NUM*nowPage);
		return false;
	})
}
