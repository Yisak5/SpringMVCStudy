<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	/* Test_ok.jsp */
	
	//String root = request.getRealPath("/");		//-- 예전 방식
	String root = pageContext.getServletContext().getRealPath("/");
	//String savePath = root + File.separator + "pds" + "\\" + "saveFile";
	String savePath = root + "pds" + "\\" + "saveFile";
	File dir = new File(savePath);
	
	
	// 테스트
	System.out.println(savePath);
	//--==>> C:\SpringMVCStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\fileSystemApp06\pds\saveFile
	
	if(!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";		//-- 인코딩 방식
	int maxFileSize = 5*1024*1024;	//-- 최대 업로드 크기(5MB)
	
	try
	{
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, savePath, maxFileSize
									,encType, new DefaultFileRenamePolicy());
	
		out.println("작성자 : " + multi.getParameter("userName") + "<br>");
		out.println("제목 : " + multi.getParameter("subject") + "<br>");
		out.println("서버에 저장된 파일명 : " + multi.getFilesystemName("uploadFile") + "<br>");
		out.println("업로드한 파일명 : " + multi.getOriginalFileName("uploadFile") + "<br>");
		
		File file = multi.getFile("uploadFile");
		
		if(file != null)
		{
		out.println("파일 크기 : " + file.length() + "<br>");
		}	
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
	
	
%>
