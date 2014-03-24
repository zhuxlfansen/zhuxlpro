package mvc.com.main.common.core.util;

import mvc.com.main.common.core.i18n.I18nCode;
import mvc.com.main.common.core.i18n.I18nMessageAccessor;

import org.springframework.beans.factory.annotation.Autowired;


/**
 * @author yujie
 * 
 */
public class MessageUtil {

	@Autowired
	protected I18nMessageAccessor messageAccessor = null;

	/**
	 * 取得信息
	 * 
	 * @param itemLabel
	 *            信息code
	 * @return 信息内容
	 */
	public String getMessage(I18nCode code) {

		return messageAccessor.getMessage(code);

	}

	/**
	 * 取得信息
	 * 
	 * @param itemLabel
	 *            信息code
	 * @param params 参数
	 * @return 信息内容
	 */
	public String getMessage(I18nCode code, String... params) {
		return messageAccessor.getMessage(code, params);
	}
}
