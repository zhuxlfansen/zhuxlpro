package com.etyy.presentation.ioc;


import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.ClientAbortException;
import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.etyy.common.constants.MessageCode;
import com.etyy.common.core.i18n.I18nCode;
import com.etyy.common.core.i18n.I18nMessage;
import com.etyy.common.core.i18n.I18nMessageAccessor;
import com.etyy.common.core.util.FWLogger;
import com.etyy.presentation.response.body.JsonResponseBody;
import com.etyy.presentation.response.body.JsonResponseBody.JsonStatus;


/**
 * @author user
 * 
 */
public class ActionExceptionResolver extends SimpleMappingExceptionResolver {

	/**
	 * 系统错误
	 */
	static final I18nCode SYS_ERR_CODE = new I18nCode() {
		@Override
		public String getCode() {
			return "S000002";
		}
	};

	/**
	 * 日志输出通用类
	 */
	@Autowired
	protected transient FWLogger logger;

	@Override
	public ModelAndView resolveException(final HttpServletRequest request,
			final HttpServletResponse response, final Object handler,
			final Exception ex) {

		// 客户端终止的时候
		if (ex instanceof ClientAbortException) {
			logger.debug("ClientAbort");
			return null;
		}

		I18nMessageAccessor accessor = logger.getMessageAccessor();

		Locale locale = Locale.ROOT;
		// 错误信息
		I18nMessage message = null;
		I18nCode msgCode = null;

		msgCode = MessageCode.S000002;
		String msg = ex.getLocalizedMessage();
		if (msg == null || msg.length() == 0) {
			msg = ex.getClass().getName();
		}
		message = new I18nMessage(accessor, locale, msgCode, msg);

		// 输出日志
		logger.fatal(msgCode, ex, message.getParams());

		/* 默认处理 */
		final ModelAndView view = super.resolveException(request, response,
				handler, ex);

		// ajax请求
		if ((request.getHeader("accept") != null && request.getHeader("accept")
				.indexOf("application/json") > -1)
				|| (request.getHeader("X-Requested-With") != null && request
						.getHeader("X-Requested-With")
						.indexOf("XMLHttpRequest") > -1)) {

			view.clear();
			// ResponseBuffer
			response.resetBuffer();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			// 返回json数据
			JsonResponseBody data = new JsonResponseBody();
			data.setStatus(JsonStatus.ERR);
			// 添加信息
			data.addMessage(message);
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			try {
				ObjectMapper jsMaper = new ObjectMapper();
				JsonGenerator jsonGenerator = jsMaper.getJsonFactory()
						.createJsonGenerator(response.getOutputStream(),
								JsonEncoding.UTF8);

				jsMaper.writeValue(jsonGenerator, data);
			} catch (IOException ioe) {
				throw new HttpMessageNotWritableException(
						"Could not write JSON: " + ioe.getMessage(), ioe);
			}
		} else {
			view.addObject("message", message.getText());
		}

		return view;
	}
}
