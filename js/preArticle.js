// JavaScript Document
var artId
$(document).ready(function(){
	artId = GetArgsFromHref(window.location.href,"artId");
	GetArt();
})//end ready

function GetArt(){
	$.getJSON("articleManage.asp?action=GetArtSpeedById&artId="+ artId,function(data){
//		$("h1").text(data.title);
//		$("title").text(data.title);
//		$("#content").text(data.content);
	});//
}
