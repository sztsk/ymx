<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%   
Response.CodePage=65001
Response.Charset="UTF-8"

Response.Cookies("AdminID") = ""
Response.Cookies("adminName") = ""
Response.Cookies("power") = ""
session("adminlogin")="" 

Response.Redirect "../../"

%>
