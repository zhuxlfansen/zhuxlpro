<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.net.*"%>
<%@ page language="java" import="java.io.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	response.reset();//可以加也可以不加
	response.setContentType("application/x-download");

	String filedisplay = "";

	if ((request.getParameter("img").substring(0, 1)).equals("1")) {
		filedisplay = request.getParameter("name") + ".jpg";
	} else {
		filedisplay = request.getParameter("name") + ".jpg";
	}
	//filedisplay = URLEncoder.encode(filedisplay,"UTF-8");
	response.addHeader("Content-Disposition", "attachment;filename="
			+ filedisplay);
	response.setContentType("application/jpeg");// 定义输出类型

	OutputStream outp = null;
	FileInputStream in = null;
	try {
		outp = response.getOutputStream();
		in = new FileInputStream(request.getSession()
				.getServletContext().getRealPath("/")
				+ "static/ticket/" + request.getParameter("img"));

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
		}
	}
%>
