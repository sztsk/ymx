<%
'置顶
Sub zd_isTop
%>
<select name="isTop">
    <option value="0">不置顶</option>
    <option value="1">类型置顶</option>
    <option value="2">地域置顶</option>
    <option value="3">年份置顶</option>
</select>

<%
End Sub
%>


<%
'类型
Sub lx_isRecommend
%>
<select name="isRecommend">
	<option value="0">--非项目--</option>
    <option value="1">公共艺术</option>
    <option value="2">高尚住宅</option>
    <option value="3">酒店会所</option>
    <option value="4">商业空间</option>
    <option value="5">主题公园</option>
    <option value="6">旧城改造</option>
    <option value="7">公园社区</option>
    <option value="8">旅游名胜</option>
    <option value="9">居家饰品</option>
    <option value="10">宗教题材</option>
    <option value="11">企业礼品</option>
    <option value="12">特色定制</option>
    <option value="13">艺术原创</option>
    <option value="14">新材料实践</option>
    <option value="0" style="color:#F00">-----以上类型属于【雕塑·饰品】-----</option>
    <option value="0" style="color:#F00">-----以下类型属于【园境·展示】-----</option>
    <option value="15">商业展示</option>
    <option value="16">旅游项目</option>
    <option value="17">地产豪宅</option>
    <option value="18">旧城改造</option>
    
</select>

<%
End Sub

Function ShowLeiXin(leixinId)
	select case leixinId
	case 0
	ShowLeiXin =""
	case 1
	ShowLeiXin ="公共艺术"
	case 2
	ShowLeiXin = "高尚住宅"
	case 3
	ShowLeiXin = "酒店会所"
	case 4
	ShowLeiXin = "商业空间"
	case 5
	ShowLeiXin = "主题公园"
	case 6
	ShowLeiXin = "旧城改造"
	case 7
	ShowLeiXin = "公园社区"
	case 8
	ShowLeiXin = "旅游名胜"
	case 9
	ShowLeiXin = "居家饰品"
	case 10
	ShowLeiXin = "宗教题材"
	case 11
	ShowLeiXin = "企业礼品"
	case 12
	ShowLeiXin = "特色定制"
	case 13
	ShowLeiXin = "艺术原创"
	case 14
	ShowLeiXin = "新材料实践"
	case 15
	ShowLeiXin = "商业展示"
	case 16
	ShowLeiXin = "旅游项目"
	case 17
	ShowLeiXin = "地产豪宅"
	case 18
	ShowLeiXin = "旧城改造"
	case 19
	ShowLeiXin = "星级酒店"
	
	case else
	ShowLeiXin = ""
	end select
End Function


%>


<%
'地域
Sub dy_isReview
%>
<select name="isReview">
	<option value="0">--非项目--</option>
    <option value="1">港澳台</option>
    <option value="2">广东省</option>
    <option value="3">北京</option>
    <option value="4">上海</option>
    <option value="5">天津</option>
    <option value="6">重庆</option>
    <option value="7">华南地区</option>
    <option value="8">华东地区</option>
    <option value="9">华北地区</option>
    <option value="10">华中地区</option>
    <option value="11">西南地区</option>
    <option value="12">西北地区</option>
    <option value="13">国外</option>
</select>



<%
End Sub

Function ShowDiYu(diyuId)
	select case diyuId
	case 0
	ShowDiYu =""
	case 1
	ShowDiYu ="港澳台"
	case 2
	ShowDiYu = "广东省"
	case 3
	ShowDiYu = "北京"
	case 4
	ShowDiYu = "上海"
	case 5
	ShowDiYu = "天津"
	case 6
	ShowDiYu = "重庆"
	case 7
	ShowDiYu ="华南地区"
	case 8
	ShowDiYu = "华东地区"
	case 9
	ShowDiYu = "华北地区"
	case 10
	ShowDiYu = "华中地区"
	case 11
	ShowDiYu = "西南地区"
	case 12
	ShowDiYu = "西北地区"
	case 13
	ShowDiYu = "国外"
	
	case else
	ShowDiYu = ""
	end select
End Function
%>

<%
'年份
Sub nf_click
longer = Year(Now) - 1999
%>
<select name="click">
	<option value="0">--非项目--</option>
      <%
For i = 1 to longer 
response.Write("<option value="& i &">"& 1999 + i &"</option>")
Next 
	  %>
      </select>

<%
End Sub


Function ShowNainFen(nianfenId)
IF nianfenId <> 0 Then
	ShowNainFen = ( nianfenId + 1999 )&"年"
ELSE
	ShowNainFen =""
END IF
End Function
%>