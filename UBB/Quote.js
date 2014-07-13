// JavaScript Document
function ReplyBoxFocus(){
document.getElementById("GBookEditor").focus();
}
function Quote(replybodyid,username){
document.getElementById("GBookEditor").value="[Quote=引用 "+username+" 的回复:]\r\n"+document.getElementById(replybodyid).innerText.subByte(400)+"\r\n[/Quote]";
window.location.href="#jumpTo";
ReplyBoxFocus();
}