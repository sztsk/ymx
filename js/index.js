/**
 * @author Hugo
 */
$(document).ready(function(){
	
	FancyBox();
})//

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

