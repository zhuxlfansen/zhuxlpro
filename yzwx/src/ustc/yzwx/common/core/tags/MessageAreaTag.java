package ustc.yzwx.common.core.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

/**
 * 画面message表示区域标签
 * 
 * @author yujie
 * 
 */
public class MessageAreaTag extends RequestContextAwareTag {

	/**
	 * 自动生成
	 */
	private static final long serialVersionUID = -1811422218689059476L;

	/**
	 * 画面message区域ID
	 */
	private static final String MESSAGE_AREA_ID = "divErrorMessage";

	/**
	 * 画面message区域class
	 */
	private static final String MESSAGE_AREA_CLASS = "info1-3";

	/**
	 * 画面message区域UI的ID
	 */
	private static final String MESSAGE_AREA_UL_ID = "ulErrorMessage";

	@Override
	protected int doStartTagInternal() throws Exception {
		JspWriter out = this.pageContext.getOut();
		out.write("<div id=\"" + MESSAGE_AREA_ID
				+ "\" style=\"display:none\" class=\"" + MESSAGE_AREA_CLASS
				+ "\">");
		out.write("<ul id=\"" + MESSAGE_AREA_UL_ID + "\">");
		return EVAL_BODY_INCLUDE;
	}

	/**
	 * 标签结束
	 * 
	 * @see javax.servlet.jsp.tagext.TagSupport#doEndTag()
	 * @throws JspException
	 *             例外
	 * @return int
	 */
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		try {
			out.write("</ul></div>");
		} catch (IOException e) {
			throw new JspException(e);
		}

		return super.doEndTag();
	}

}
