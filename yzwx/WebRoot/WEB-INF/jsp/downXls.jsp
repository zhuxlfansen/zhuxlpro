<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.net.*"%>
<%@ page language="java" import="java.io.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String fileName = (String)request.getAttribute("fileName");
	response.reset();//可以加也可以不加
	response.setContentType("application/x-download");
	response.setContentType("application/vnd.ms-excel;charset=utf-8");// 定义输出类型
	response.addHeader("Content-Disposition", "attachment;filename="+fileName+".xls");
	

	OutputStream outp = null;
	FileInputStream in = null;
	String filePath=request.getSession().getServletContext().getRealPath("/")+"static/upload/"+fileName+".xls";
	try {
		outp = response.getOutputStream();
		in = new FileInputStream(filePath);
		byte[] b = new byte[1024];
		int i = 0;
		while ((i = in.read(b)) > 0) {
			outp.write(b, 0, i);
		}
		outp.flush();
	} catch (Exception e) {
		System.out.println("Error!");
		e.printStackTrace();
	} finally {
		if (in != null) {
			in.close();
			in = null;
		}
		if (outp != null) {
			outp.close();
			outp = null;
			response.flushBuffer();  
			out.clear();  
			out = pageContext.pushBody();  
		}
		File file = new File(filePath);
		file.delete();
	}
%>
