<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.CodePage=65001%>   
<%Response.Charset="UTF-8"%>
<!--#include file = "Function.asp"-->
<!--#include file = "md5.asp"-->
<%
'on error resume next
Class DB

	public DB
	public ConnEx 
	public webTitle 
	
'********************************************************************************
'*设置连接数据库驱动
'*Class_Initialize()是类的初始化事件，只要一开始使用该类，首先会触发该部分的执行.
'*另Class_Terminate()是类的结束事件，只要一退出该类，就会触发该事件.
'********************************************************************************
	Private Sub Class_Initialize()
	 DataServer   = "(local)"                                 '数据库服务器IP
	 DataUser     = "sa"                                    '访问数据库用户名
	 DataBaseName = "ymx"                                        '数据库名称
	 DataBasePsw  = ""                                        '访问数据库密码 

	ConnStr = "Provider = Sqloledb; User ID = " & datauser & "; Password = " & databasepsw & "; Initial Catalog = " & databasename & "; Data Source = " & dataserver & ";"
	Set ConnEx = Server.Createobject("ADODB.Connection") 
	ConnEx.Open ConnStr 
	CatchError("Class_Terminate") 
	webTitle ="tsk"
	End Sub  

	
'********************************************************************************
'*捕捉错误类型 
'********************************************************************************
	Sub CatchError( Str ) 
	If Err Then 
	Err.Clear 
	Class_Terminate() 
	Response.Write("捕捉到错误,程序结束!在"&Str&"处") 
	Response.End() 
	End If 
	End Sub 

	Sub Class_Terminate
	If Not IsEmpty(ConnEx) Then 
	ConnEx.Close 
	Set ConnEx = Nothing 
	CatchError() 
	End If 
	End Sub 

'********************************************************************************
'*检查SQL语句权限，根据标志Flag 来检测语句拥有的权限 
'********************************************************************************
	Sub CheckSql( Sql , Flag ) 
	'Init
	Dim StrSql,SinCounts,DouCounts,i 
	StrSql = Lcase(Sql) 
	SinCounts = 0 
	DouCounts = 0 
	For i = 1 to Len(StrSql) 
	If Mid(StrSql,i,1) = "’" Then SinCounts = SinCounts + 1 
	If Mid(StrSql,i,1) = """" Then DouConnts = DouCounts + 1 
	Next 
	
	If (SinCounts Mod 2) <> 0 Or (DouCounts Mod 2) <> 0 Then 
	Call Class_Terminate()
	Response.Write("SQL语法错误!") 
	Response.End() 
	End If 
	Select Case Flag 
	Case "R","r": 
	If Instr(StrSql,"delete") > 0 Or Instr(StrSql,"update") > 0 Or Instr(StrSql,"drop") > 0 Or Instr(StrSql,"insert") > 0 Then 
	Class_Terminate() 
	Response.Write("权限不足,没有执行写操作的权限") 
	Response.End() 
	End If 
	Case "W","w": 
	If Instr(StrSql,"delete") > 0 Or Instr(StrSql,"drop") > 0 Or Instr(StrSql,"select") > 0 Then 
	Class_Terminate() 
	Response.Write("权限不足，没有执行删除操作的权限") 
	Response.End() 
	End If 
	Case "D","d": 
	Case Else: 
	Response.Write("函数CheckSql标志错误!") 
	End Select 
	End Sub 
	
'********************************************************************************
'*通过ID来查找记录是否存在 
'*返回值：存在为True，不存在为False
'********************************************************************************
	Function HasRecordById( sql ) 
	'CheckValue( IntID , 1 ) 
	Dim Rs,HasR 
	'Sql = "Select top 1 * from "&StrTableName&" Where '"& IdName &"' = "&IntID 
	Call CheckSql(Sql,"R") 
	Set Rs = ConnEx.Execute(Sql) 
	CatchError("HasRecordByID") 
	If Not (Rs.eof Or Rs.bof) Then 
	HasR = True 
	Else 
	HasR = False
	End If 
	Rs.close 
	Set Rs = Nothing 
	HasRecordById = HasR 
	End Function 

'********************************************************************************
'*通过SQL语句取得记录集
'********************************************************************************
	Function GetRsBySql( Sql , RW ) 
	Call CheckSql(Sql,"R") 
	Dim Rs 
	Set Rs = Server.CreateObject("Adodb.RecordSet") 
	Rs.Open Sql,ConnEx,1,RW 
	Set GetRsBySql = Rs 
	End Function
	

'********************************************************************************
'*取得几个字段的值 
'********************************************************************************
	Function GetRsValueBySql( Sql ) 
	Call CheckSql(Sql,"R") 
	Dim Rs,ReturnValue 
	Set Rs = ConnEx.Execute(Sql) 
	CatchError("GetRsValueBySql") 
	set GetRsValueBySql = Rs 
	End Function 

'********************************************************************************
'*取得某个字段的值 
'********************************************************************************
	Function GetValueBySql( Sql ) 
	Call CheckSql(Sql,"R") 
	Dim Rs,ReturnValue 
	Set Rs = ConnEx.Execute(Sql) 
	CatchError("GetValueBySql") 
	If Not( Rs.Eof Or Rs.Bof ) Then 
	ReturnValue = Rs(0) 
	Else 
	ReturnValue = "NullRecord" 
	End If 
	Rs.Close 
	Set Rs = Nothing 
	GetValueBySql = ReturnValue 
	End Function 

'********************************************************************************
'*通过SQL语句删除 
'********************************************************************************
	Function DeleteBySql( Sql ) 
	Call CheckSql(Sql,"D") 
	ConnEx.Execute(Sql) 
	CatchError("DeleteBySql") 
	DeleteBySql = True 
	End Function 

'********************************************************************************
'*利用SQL修改数据 
'********************************************************************************
	Function UpdateBySql( Sql ) 
	Call CheckSql(Sql,"w") 
	ConnEx.Execute(Sql) 
	CatchError("UpdateBySql") 
	UpdateBySql = True 
	End Function 

'********************************************************************************
'*利用SQL语句插入数据 
'********************************************************************************
	Function InsertBySql(Sql) 
	Call CheckSql(Sql,"w") 
	ConnEx.Execute(Sql) 
	CatchError("InsertBySql") 
	InsertBySql = True 
	End Function 
	
'********************************************************************************
'*通过Connection对象调用存储过程
'*参数StoredProcedures 为存储过程名字 
'*返回值：单一的数据集
'********************************************************************************
	Function GetRsByStored(StoredProcedures)
	Dim Rs
    Set Rs = ConnEx.Execute(StoredProcedures,0,4) '4 表明CommandText参数是一个存储过程的名称 
	Set GetRsByStored = Rs
	End Function
	
	'添加管理员
	Function InsertByStored(adminName,adminPwd,adminPower,adminEmail,adminState)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    with MyComm
       .ActiveConnection = ConnEx          'MyConStr是数据库连接字串
       .CommandText      = "tsk_Insertadmin"     '指定存储过程名
       .CommandType      = 4                 '表明这是一个存储过程
       .Prepared         = true              '要求将SQL命令先行编译
	   '声明输入参数时5个参数分别为：参数名、参数数据类型、参数类型、数据长度、参数值。声明输出参数时，没有最后一个参数：参数值。
       .Parameters.append .CreateParameter("@adminName",200,1,50,adminName)
	   .Parameters.append .CreateParameter("@adminPwd",200,1,50,adminPwd)
	   .Parameters.append .CreateParameter("@adminPower",3,1,4,adminPower)
	   .Parameters.append .CreateParameter("@adminEmail",200,1,50,adminEmail)
	   .Parameters.append .CreateParameter("@adminState",3,1,4,adminState)
       .Parameters.append .CreateParameter("@Id",3,2,4)'output
       .Execute
    end with
    InsertByStored = MyComm("@Id")
	Set MyComm = Nothing
	End Function
	
	'验证用户名。存在返回0，不存在返回1
	Function ValidateAdminName(adminName)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    with MyComm
       .ActiveConnection = ConnEx          'MyConStr是数据库连接字串
       .CommandText      = "ValidateAdminName"     '指定存储过程名
       .CommandType      = 4                 '表明这是一个存储过程
       .Prepared         = true              '要求将SQL命令先行编译
       '返回值是最新被申明的
	   ' 第三个参数(4)，表明参数的性质，此处4表明这是一个返回值。
	   '此参数取值的说 0 : 类型无法确定； 1: 输入参数；2: 输入参数；3：输入或输出参数；4: 返回值参数：参数值。
       .Parameters.append .CreateParameter("RETURN",2,4)
	   .Parameters.append .CreateParameter("@adminName",200,1,50,adminName)
       .Execute
    end with
    ValidateAdminName = MyComm("RETURN")
	Set MyComm = Nothing
	End Function
	
	'根据ID获取单个管理员资料
	Function GetAdminById(adminId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    MyComm.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
    MyComm.CommandText      = "tsk_SelectadminById"     '指定存储过程名
    MyComm.CommandType      = 4                 '表明这是一个存储过程
    MyComm.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    MyComm.Parameters.append MyComm.CreateParameter("@Id",3,1,4,adminId)
    GetAdminById = MyComm.Execute
	Set MyComm = Nothing
	End Function
	
	'根据ID更新单个管理员资料
	Sub UpdataAdmin(adminId,adminPwd,adminPower,adminEmail,adminState)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_Updateadmin"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@Id",3,1,4,adminId)
    .Parameters.append .CreateParameter("@adminPwd",200,1,50,adminPwd)
    .Parameters.append .CreateParameter("@adminPower",3,1,4,adminPower)
    .Parameters.append .CreateParameter("@adminEmail",200,1,50,adminEmail)
    .Parameters.append .CreateParameter("@adminState",3,1,4,adminState)
     .Execute
	 end with
	 Set MyComm = Nothing
	End Sub
	
	'根据ID删除单个管理员
	Sub DeleteadminById(adminId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_Deleteadmin"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@Id",3,1,4,adminId)
    .Execute
	end with
	Set MyComm = Nothing
	End Sub
	
'article 
	'获取文章内容
	Function SelectarticlesAll
	dim RS
	set RS = GetRsByStored("tsk_SelectadminsAll")
	SelectarticlesAll = RS
	End Function
	'添加文章
	Function InsertArtByStored(title,author,content,categoryId,click,isTop,isRecommend,isReview,dates)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    with MyComm
       .ActiveConnection = ConnEx          'MyConStr是数据库连接字串
       .CommandText      = "tsk_Insertarticle"     '指定存储过程名
       .CommandType      = 4                 '表明这是一个存储过程
       .Prepared         = true              '要求将SQL命令先行编译
	   '声明输入参数时5个参数分别为：参数名、参数数据类型、参数类型、数据长度、参数值。声明输出参数时，没有最后一个参数：参数值。
       .Parameters.append .CreateParameter("@title",200,1,200,title)
	   .Parameters.append .CreateParameter("@author",200,1,50,author)
	   .Parameters.append .CreateParameter("@content",201,1,8000,content) '201 是大字符
	   .Parameters.append .CreateParameter("@categoryId",200,1,30,categoryId)
	   .Parameters.append .CreateParameter("@click",3,1,4,click)
	   .Parameters.append .CreateParameter("@isTop",3,1,4,isTop)
	   .Parameters.append .CreateParameter("@isRecommend",3,1,4,isRecommend)
	   .Parameters.append .CreateParameter("@isReview",3,1,4,isReview)
	   .Parameters.append .CreateParameter("@dates",135 ,1,4,dates) '135是日期
       .Parameters.append .CreateParameter("@artId",3,2,4)'output
       .Execute
    end with
    InsertArtByStored = MyComm("@artId")
	Set MyComm = Nothing
	End Function
	
	'根据ID获取单篇文章内容
	Function GetArtById(artId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    MyComm.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
    MyComm.CommandText      = "tsk_Selectarticle"     '指定存储过程名
    MyComm.CommandType      = 4                 '表明这是一个存储过程
    MyComm.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    MyComm.Parameters.append MyComm.CreateParameter("@artId",3,1,4,artId)
    GetArtById = MyComm.Execute
	Set MyComm = Nothing
	End Function
	
	'根据条件和排序获得文章记录集
	Function GetArtDynamic(WhereCondition,OrderByExpression)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    MyComm.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
    MyComm.CommandText      = "tsk_SelectarticlesDynamic"     '指定存储过程名
    MyComm.CommandType      = 4                 '表明这是一个存储过程
    MyComm.Prepared         = true              '要求将SQL命令先行编译
    MyComm.Parameters.append .CreateParameter("@WhereCondition",200,1,500,WhereCondition)
	MyComm.Parameters.append .CreateParameter("@OrderByExpression",200,1,250,OrderByExpression)
	GetArtDynamic = MyComm.Execute
	Set MyComm = Nothing
	End Function
	
	'根据ID更新单篇文章内容
	Sub UpdatArtById(artId,title,author,content,categoryId,click,isTop,isRecommend,isReview,dates)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_Updatearticle"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@artId",3,1,4,artId)
    .Parameters.append .CreateParameter("@title",200,1,200,title)
    .Parameters.append .CreateParameter("@author",200,1,50,author)
    .Parameters.append .CreateParameter("@content",201,1,2147483647,content) '201 是大字符
    .Parameters.append .CreateParameter("@categoryId",200,1,30,categoryId)
    .Parameters.append .CreateParameter("@click",3,1,4,click)
    .Parameters.append .CreateParameter("@isTop",3,1,4,isTop)
    .Parameters.append .CreateParameter("@isRecommend",3,1,4,isRecommend)
    .Parameters.append .CreateParameter("@isReview",3,1,4,isReview)
    .Parameters.append .CreateParameter("@dates",135 ,1,4,dates) '135是日期
     .Execute
	 end with
	 Set MyComm = Nothing
	End Sub
	
'	'根据ID更新单个值(@isWhat 取值有3个artId，isWhat，isValue)
'	Sub UpdatArtPartById(artId,isWhat,isValue)
'	DIM MyComm
'    Set MyComm = Server.CreateObject("ADODB.Command")
'	with MyComm
'	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
'	.CommandText      = "tsk_UpdateArrtById"     '指定存储过程名
'	.CommandType      = 4                 '表明这是一个存储过程
'	.Prepared         = true              '要求将SQL命令先行编译
'    '声明参数
'    .Parameters.append .CreateParameter("@artId",3,1,4,artId)
'    .Parameters.append .CreateParameter("@isWhat",200,1,50,isWhat)
'    .Parameters.append .CreateParameter("@isValue",3,1,4,isValue)
'     .Execute
'	 end with
'	 Set MyComm = Nothing
'	End Sub
	
	'根据ID删除单篇文章
	Sub DelArtById(artId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_Deletearticle"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@artId",3,1,4,artId)
    .Execute
	end with
	Set MyComm = Nothing
	End Sub
	
	'根据ID快速更新单篇文章内容
	Sub UpdatArtSpeedById(artId,title,author,categoryId,click,isTop,isRecommend,isReview,dates)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_UpdateSpeedarticle"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@artId",3,1,4,artId)
    .Parameters.append .CreateParameter("@title",200,1,200,title)
    .Parameters.append .CreateParameter("@author",200,1,50,author)
    .Parameters.append .CreateParameter("@categoryId",200,1,30,categoryId)
    .Parameters.append .CreateParameter("@click",3,1,4,click)
    .Parameters.append .CreateParameter("@isTop",3,1,4,isTop)
    .Parameters.append .CreateParameter("@isRecommend",3,1,4,isRecommend)
    .Parameters.append .CreateParameter("@isReview",3,1,4,isReview)
    .Parameters.append .CreateParameter("@dates",135 ,1,4,dates) '135是日期
     .Execute
	 end with
	 Set MyComm = Nothing
	End Sub

'project

'根据ID获取单个产品内容
	Function GetProById(proId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    MyComm.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
    MyComm.CommandText      = "tsk_Selectproject"     '指定存储过程名
    MyComm.CommandType      = 4                 '表明这是一个存储过程
    MyComm.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    MyComm.Parameters.append MyComm.CreateParameter("@proId",3,1,4,proId)
    GetProById = MyComm.Execute
	Set MyComm = Nothing
	End Function
	
'根据ID快速更新单个产品内容
	Sub UpdatSpeedProById(proId,proNo,proName,proPrice,proCate,proHide,proData)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_UpdateSpeedproject"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@proId",3,1,4,proId)
    .Parameters.append .CreateParameter("@proNo",200,1,50,proNo)
    .Parameters.append .CreateParameter("@proName",200,1,200,proName)
    .Parameters.append .CreateParameter("@proPrice",6,1,8,proPrice)'6是货币
    .Parameters.append .CreateParameter("@proCate",200,1,30,proCate)
    .Parameters.append .CreateParameter("@proHide",3,1,4,proHide)
    .Parameters.append .CreateParameter("@proData",135,1,4,proData)'135是日期
     .Execute
	 end with
	 Set MyComm = Nothing
	End Sub
	
'根据ID更新单个产品内容
	Sub UpdatProById(proId,proNo,proName,proPrice,proExplain,proContent,proCate,proImg,proHide,proData)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_Updateproject"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@proId",3,1,4,proId)
    .Parameters.append .CreateParameter("@proNo",200,1,50,proNo)
    .Parameters.append .CreateParameter("@proName",200,1,200,proName)
    .Parameters.append .CreateParameter("@proPrice",6,1,8,proPrice)'6是货币
	.Parameters.append .CreateParameter("@proExplain",200,1,300,proExplain)
	.Parameters.append .CreateParameter("@proContent",201,1,2147483647,proContent)
    .Parameters.append .CreateParameter("@proCate",200,1,30,proCate)
	.Parameters.append .CreateParameter("@proImg",200,1,50,proImg)
    .Parameters.append .CreateParameter("@proHide",3,1,4,proHide)
    .Parameters.append .CreateParameter("@proData",135,1,4,proData)'135是日期
     .Execute
	 end with
	 Set MyComm = Nothing
	End Sub
	
	'根据ID删除单个管理员
	Sub DelProById(proId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_Deleteproject"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@proId",3,1,4,proId)
    .Execute
	end with
	Set MyComm = Nothing
	End Sub
	
	'添加产品
	Function InsertProByStored(proNo,proName,proPrice,proExplain,proContent,proCate,proImg,proHide,proData)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    with MyComm
       .ActiveConnection = ConnEx          'MyConStr是数据库连接字串
       .CommandText      = "tsk_Insertproject"     '指定存储过程名
       .CommandType      = 4                 '表明这是一个存储过程
       .Prepared         = true              '要求将SQL命令先行编译
	   '声明输入参数时5个参数分别为：参数名、参数数据类型、参数类型、数据长度、参数值。声明输出参数时，没有最后一个参数：参数值。
		.Parameters.append .CreateParameter("@proNo",200,1,50,proNo)
		.Parameters.append .CreateParameter("@proName",200,1,200,proName)
		.Parameters.append .CreateParameter("@proPrice",6,1,8,proPrice)'6是货币
		.Parameters.append .CreateParameter("@proExplain",200,1,300,proExplain)
		.Parameters.append .CreateParameter("@proContent",201,1,2147483647,proContent)
		.Parameters.append .CreateParameter("@proCate",200,1,30,proCate)
		.Parameters.append .CreateParameter("@proImg",200,1,50,proImg)
		.Parameters.append .CreateParameter("@proHide",3,1,4,proHide)
		.Parameters.append .CreateParameter("@proData",135,1,4,proData)'135是日期
       .Parameters.append .CreateParameter("@proId",3,2,4)'output
       .Execute
    end with
    InsertProByStored = MyComm("@proId")
	Set MyComm = Nothing
	End Function
	
'''''''''''''''''''''''''arte''''''''''''''''''''''''''''''
	
	'添加产品
	Function InsertArtelByStored(artelName,principal,artelAddr,artelArea,vegeBreed,asmallImg,abigImg,addDate)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    with MyComm
       .ActiveConnection = ConnEx          'MyConStr是数据库连接字串
       .CommandText      = "tsk_Insertartel"     '指定存储过程名
       .CommandType      = 4                 '表明这是一个存储过程
       .Prepared         = true              '要求将SQL命令先行编译
	   '声明输入参数时5个参数分别为：参数名、参数数据类型、参数类型、数据长度、参数值。声明输出参数时，没有最后一个参数：参数值。
		.Parameters.append .CreateParameter("@artelName",200,1,200,artelName)
		.Parameters.append .CreateParameter("@principal",200,1,50,principal)
		.Parameters.append .CreateParameter("@artelAddr",200,1,200,artelAddr)
		.Parameters.append .CreateParameter("@artelArea",200,1,50,artelArea)
		.Parameters.append .CreateParameter("@vegeBreed",200,1,200,vegeBreed)
		.Parameters.append .CreateParameter("@asmallImg",200,1,100,asmallImg)
		.Parameters.append .CreateParameter("@abigImg",200,1,100,abigImg)
		.Parameters.append .CreateParameter("@addDate",135,1,4,addDate)'135是日期
       .Parameters.append .CreateParameter("@artelId",3,2,4)'output
       .Execute
    end with
    InsertArtelByStored = MyComm("@artelId")
	Set MyComm = Nothing
	End Function
	
	'根据ID获取单个产品内容
	Function SelectartelById(artelId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    MyComm.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
    MyComm.CommandText      = "tsk_Selectartel"     '指定存储过程名
    MyComm.CommandType      = 4                 '表明这是一个存储过程
    MyComm.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    MyComm.Parameters.append MyComm.CreateParameter("@artelId",3,1,4,artelId)
    SelectartelById = MyComm.Execute
	Set MyComm = Nothing
	End Function
	
	'根据ID更新单个产品内容
	Sub Updateartel(artelId,artelName,principal,artelAddr,artelArea,vegeBreed,asmallImg,abigImg,addDate)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_Updateartel"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@artelId",3,1,4,artelId)
    .Parameters.append .CreateParameter("@artelName",200,1,200,artelName)
	.Parameters.append .CreateParameter("@principal",200,1,50,principal)
	.Parameters.append .CreateParameter("@artelAddr",200,1,200,artelAddr)
	.Parameters.append .CreateParameter("@artelArea",200,1,50,artelArea)
	.Parameters.append .CreateParameter("@vegeBreed",200,1,200,vegeBreed)
	.Parameters.append .CreateParameter("@asmallImg",200,1,100,asmallImg)
	.Parameters.append .CreateParameter("@abigImg",200,1,100,abigImg)
	.Parameters.append .CreateParameter("@addDate",135,1,4,addDate)'135是日期
     .Execute
	 end with
	 Set MyComm = Nothing
	End Sub
	
	'根据ID删除单个管理员
	Sub Deleteartel(artelId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_Deleteartel"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@artelId",3,1,4,artelId)
    .Execute
	end with
	Set MyComm = Nothing
	End Sub
	
'''''''''''''''''''''''''vegetable''''''''''''''''''''''''''''''
	'添加产品
	Function InsertVegetableByStored(artelId,vegetableName,vsmallImg,vbigImg,addDate)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    with MyComm
       .ActiveConnection = ConnEx          'MyConStr是数据库连接字串
       .CommandText      = "tsk_Insertvegetable"     '指定存储过程名
       .CommandType      = 4                 '表明这是一个存储过程
       .Prepared         = true              '要求将SQL命令先行编译
	   '声明输入参数时5个参数分别为：参数名、参数数据类型、参数类型、数据长度、参数值。声明输出参数时，没有最后一个参数：参数值。
		.Parameters.append .CreateParameter("@artelId",3,1,4,artelId)
		.Parameters.append .CreateParameter("@vegetableName",200,1,100,vegetableName)
		.Parameters.append .CreateParameter("@vbigImg",200,1,100,vbigImg)
		.Parameters.append .CreateParameter("@vsmallImg",200,1,100,vsmallImg)
		.Parameters.append .CreateParameter("@addDate",135,1,4,addDate)'135是日期
       .Parameters.append .CreateParameter("@vegetableId",3,2,4)'output
       .Execute
    end with
    InsertVegetableByStored = MyComm("@vegetableId")
	Set MyComm = Nothing
	End Function
	
	'根据ID获取单个产品内容
	Function Selectvegetable(vegetableId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    MyComm.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
    MyComm.CommandText      = "tsk_Selectvegetable"     '指定存储过程名
    MyComm.CommandType      = 4                 '表明这是一个存储过程
    MyComm.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    MyComm.Parameters.append MyComm.CreateParameter("@vegetableId",3,1,4,vegetableId)
    Selectvegetable = MyComm.Execute
	Set MyComm = Nothing
	End Function
	
	'根据ID更新单个产品内容
	Sub Updatevegetable(vegetableId,artelId,vegetableName,vsmallImg,vbigImg,addDate)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_Updatevegetable"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@vegetableId",3,1,4,vegetableId)
    .Parameters.append .CreateParameter("@artelId",3,1,4,artelId)
	.Parameters.append .CreateParameter("@vegetableName",200,1,100,vegetableName)
	.Parameters.append .CreateParameter("@vbigImg",200,1,100,vbigImg)'135是日期
	.Parameters.append .CreateParameter("@vsmallImg",200,1,100,vsmallImg)
	.Parameters.append .CreateParameter("@addDate",135,1,4,addDate)'135是日期
     .Execute
	 end with
	 Set MyComm = Nothing
	End Sub
	
	'根据ID删除单个管理员
	Sub Deletvegetable(vegetableId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_Deletevegetable"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@vegetableId",3,1,4,vegetableId)
    .Execute
	end with
	Set MyComm = Nothing
	End Sub
	
	Function GetartelName(artelId)
	name_sql = "select artelName from artel where artelId =" & artelId
	GetartelName = GetValueBySql(name_sql)
	End Function
	
	
	'添加留言
	Function InsertMessage(msgName,msgContent,msgDate,replyId,replyName,replyContent,replyDate,msgEmail)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
    with MyComm
       .ActiveConnection = ConnEx          'MyConStr是数据库连接字串
       .CommandText      = "tsk_InsertMessage"     '指定存储过程名
       .CommandType      = 4                 '表明这是一个存储过程
       .Prepared         = true              '要求将SQL命令先行编译
	   '声明输入参数时5个参数分别为：参数名、参数数据类型、参数类型、数据长度、参数值。声明输出参数时，没有最后一个参数：参数值。
       .Parameters.append .CreateParameter("@msgName",200,1,200,msgName)
	   .Parameters.append .CreateParameter("@msgContent",200,1,200,msgContent)
	   .Parameters.append .CreateParameter("@msgDate",135,1,4,msgDate)
	   .Parameters.append .CreateParameter("@replyId",3,1,4,replyId)
	   .Parameters.append .CreateParameter("@replyName",200,1,200,replyName)
	   .Parameters.append .CreateParameter("@replyContent",200,1,2000,replyContent)
	   .Parameters.append .CreateParameter("@replyDate",135,1,4,replyDate)
	   .Parameters.append .CreateParameter("@msgEmail",200,1,50,msgEmail)
       .Parameters.append .CreateParameter("@msgId",3,2,4)'output
       .Execute
    end with
    InsertMessage = MyComm("@msgId")
	Set MyComm = Nothing
	End Function
	
	'根据ID删除留言
	Sub DeleteMessage(msgId)
	DIM MyComm
    Set MyComm = Server.CreateObject("ADODB.Command")
	with MyComm
	.ActiveConnection = ConnEx          'MyConStr是数据库连接字串
	.CommandText      = "tsk_DeleteMessage"     '指定存储过程名
	.CommandType      = 4                 '表明这是一个存储过程
	.Prepared         = true              '要求将SQL命令先行编译
    '声明参数
    .Parameters.append .CreateParameter("@msgId",3,1,4,msgId)
    .Execute
	end with
	Set MyComm = Nothing
	End Sub
	
End Class
%>