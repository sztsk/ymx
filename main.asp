<%
	set iim1= CreateObject ("imacros")
	s = iim1.iimInit("-runner")

	s = iim1.iimSet("-var_keyword", Request("keyword"))
	s = iim1.iimPlay(Request("macro"))
	Response.Write("iimplay=")
	Response.Write(s)

	Response.Write("extract=")
	Response.Write(iim1.iimGetLastExtract)

	s = iim1.iimExit()
%>