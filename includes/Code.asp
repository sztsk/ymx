<%
Option Explicit
Response.buffer=true
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.cachecontrol = "no-cache"
Call Com_CreatValidCode("CheckCode")

Sub Com_CreatValidCode(pSN)
	'Author: Layen
	'QQ: 84815733
	'E-mail: support@ssaw.net
	Response.ContentType = "Image/BMP"
	
	Randomize
	
	Dim i, ii, iii
	
	Const cOdds = 2.5 ' �ӵ���ֵĻ���
	Const cAmount = 10 ' ��������
	Const cCode = "0123456789"
	
	' ��ɫ������(�ַ�������)
	Dim vColorData(1)
	vColorData(0) = ChrB(Int(Rnd*255)) & ChrB(Int(Rnd*255)) & ChrB(Int(Rnd*255))  ' ��0����0����0����ɫ��
	vColorData(1) = ChrB(255) & ChrB(255) & ChrB(255) ' ��250����236����211��ǳ��ɫ��
	
	' ��������ַ�
	Dim vCode(4), vCodes
	For i = 0 To 3
	  vCode(i) = Int(Rnd * cAmount)
	  vCodes = vCodes & Mid(cCode, vCode(i) + 1, 1)
	Next
	Session(pSN) = vCodes  '��¼��Session
	' �ַ�������
	Dim vNumberData(9)
	vNumberData(0) = "1100001111101111011110111110111010011011101100101110110010111011001011110111101111011110111110000111"
	vNumberData(1) = "1110111111100011111111101111111110111111111101111111110111111111101111111110111111111011111111000001"
	vNumberData(2) = "1100001111101111011110111110111111111011111111011111100011111101111111101111111010111100001000001111"
	vNumberData(3) = "1100000111101111101101111110111111110111111110011111111110111111111101110111111011101111011111000011"
	vNumberData(4) = "1111001111111010111111011011111101101111101110111110111101111000000001111111011111111110111111100001"
	vNumberData(5) = "1100001111110111000111011111111101000111110011101111111110111111111101101111110111011111011110000011"
	vNumberData(6) = "1111000011111011110111011111111101111111110100001111001111011101111011101111101110111101111100001111"
	vNumberData(7) = "1100000011101111101110111101111111101111111110111111110111111110111111110111111111011111111011111111"
	vNumberData(8) = "1100001111101111011111011110111101111011111000011111101101111101111011101111101110111101111100001111"
	vNumberData(9) = "1100001111101111011110111110111011111011110111001111100011011111111101111111110110011110111110000111"
	' ���ͼ���ļ�ͷ
	Response.BinaryWrite ChrB(66) & ChrB(77) & ChrB(230) & ChrB(4) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) &_
	  ChrB(0) & ChrB(0) & ChrB(54) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(40) & ChrB(0) &_
	  ChrB(0) & ChrB(0) & ChrB(40) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(10) & ChrB(0) &_
	  ChrB(0) & ChrB(0) & ChrB(1) & ChrB(0)
	
	' ���ͼ����Ϣͷ
	Response.BinaryWrite ChrB(24) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(176) & ChrB(4) &_
	  ChrB(0) & ChrB(0) & ChrB(18) & ChrB(11) & ChrB(0) & ChrB(0) & ChrB(18) & ChrB(11) &_
	  ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) &_
	  ChrB(0) & ChrB(0)
	
	For i = 9 To 0 Step -1  ' ����������
	  For ii = 0 To 3  ' ����������
	   For iii = 1 To 10 ' ������������
	    ' ���С����֡������ص����ͼ������
	    If Rnd * 99 + 1 < cOdds Then ' ��������ӵ�
	     Response.BinaryWrite vColorData(0)
	    Else
	     Response.BinaryWrite vColorData(Mid(vNumberData(vCode(ii)), i * 10 + iii, 1))
	    End If
	   Next
	  Next
	Next
End Sub
%>
