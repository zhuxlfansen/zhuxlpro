package ustc.yzwx.wechat.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ustc.yzwx.common.core.util.FWLogger;
import ustc.yzwx.wechat.util.WeChat;

/**
 * @author user
 * 
 */
public class WeChatFilter implements Filter {

	private final FWLogger LOGGER = new FWLogger();

	@Override
	public void destroy() {
		LOGGER.info("WeChatFilter已经销毁");
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
			// doPost(request, response);
			chain.doFilter(req, res);
		}
	}

	// private void doPost(HttpServletRequest request, HttpServletResponse
	// response)
	// throws IOException {
	// response.setCharacterEncoding("UTF-8");
	// response.setContentType("text/xml");
	// ServletInputStream in = request.getInputStream();
	// String xmlMsg = Tools.inputStream2String(in);
	// LOGGER.debug("输入消息:[" + xmlMsg + "]");
	// String xml = WeChat.processing(xmlMsg);
	// response.getWriter().write(xml);
	// }

	/**
	 * 微信请求验证
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String outPut = "error";
		String signature = request.getParameter("signature");// 微信加密签名
		String timestamp = request.getParameter("timestamp");// 时间戳
		String nonce = request.getParameter("nonce");// 随机数
		String echostr = request.getParameter("echostr");//
		// 验证
		if (WeChat.checkSignature(signature, timestamp, nonce)) {
			outPut = echostr;
		}
		response.getWriter().write(outPut);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		LOGGER.info("WeChatFilter已经启动！");
	}
}
