/**
 * @author hugo
 */
var id;
$(document).ready(function(){
	id = parseInt(GetArgsFromHref(window.location.href,"ID"));
	TabSelect(id);
})//end ready



function GetArgsFromHref(sHref, sArgName){
	var args = sHref.split("?");
	var retval = "";
	
	if (args[0] == sHref) {
		return retval; 
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

function TabSelect(id){
	switch(id){
		case 13:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(1)").addClass("clickLi");
		break;
		
		case 69:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(2)").addClass("clickLi");
		break;
		
		case 73:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(3)").addClass("clickLi");
		break;
		
		case 116:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(4)").addClass("clickLi");
		break;
		
		case 132:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(5)").addClass("clickLi");
		break;
		
		case 145:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(6)").addClass("clickLi");
		break;
		
		case 159:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(7)").addClass("clickLi");
		break;
		
		case 163:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(8)").addClass("clickLi");
		break;
		
		case 171:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(9)").addClass("clickLi");
		break;
		
		case 174:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(10)").addClass("clickLi");
		break;
		
		case 177:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(11)").addClass("clickLi");
		break;
		
		default:
		$("#menu li").removeClass("clickLi");
		$("#menu li:eq(0)").addClass("clickLi");
		break;
	}
}//end TabSelect
