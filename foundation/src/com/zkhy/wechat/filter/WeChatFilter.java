package com.zkhy.wechat.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zkhy.fw.core.util.FWLogger;
import com.zkhy.wechat.util.WeChat;



/**
 * @author user
 * 
 */
public class WeChatFilter implements Filter {

	private final FWLogger LOGGER = new FWLogger();

	@Override
	public void destroy() {
		LOGGER.info("WeChatFilter销毁");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		Boolean isGet = request.getMethod().equals("GET");

		if (isGet) {
			doGet(request, response);
		} else {
			chain.doFilter(req, res);
		}
	}

	/**
	 * ΢��������֤
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String outPut = "error";
		String signature = request.getParameter("signature");// ΢�ż���ǩ��
		String timestamp = request.getParameter("timestamp");// ʱ���
		String nonce = request.getParameter("nonce");// �����
		String echostr = request.getParameter("echostr");//
		// ��֤
		if (WeChat.checkSignature(signature, timestamp, nonce)) {
			outPut = echostr;
		}
		response.getWriter().write(outPut);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		LOGGER.info("WeChatFilter�Ѿ�������");
	}
}
