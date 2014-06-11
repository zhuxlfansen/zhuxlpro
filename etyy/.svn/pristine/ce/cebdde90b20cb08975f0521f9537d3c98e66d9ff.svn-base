package ustc.etyy.presentation.common.action;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

import ustc.etyy.common.core.i18n.I18nMessage;
import ustc.etyy.common.core.i18n.I18nMessageAccessor;


/**
 * @author yujie
 * 
 */
public abstract class BaseAction {

	public static final String ATTR_NAME_MSG_AREA_DATA = "pageMsgAreaData";

	@Autowired
	protected I18nMessageAccessor messageAccessor = null;

	/**
	 * ModelMap中取出数据
	 * 
	 * @param model
	 * @param key
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected final <T> T getModelData(ModelMap model, String key) {
		return (T) model.get(key);
	}

	/**
	 * 加入message
	 * 
	 * @param model
	 * @param msgObject
	 */
	protected final void addMessage(ModelMap model, I18nMessage msgObject) {

		// messageList取得
		List<I18nMessage> msgList = getModelData(model, ATTR_NAME_MSG_AREA_DATA);

		if (msgList == null) {
			msgList = new ArrayList<I18nMessage>();

			model.addAttribute(ATTR_NAME_MSG_AREA_DATA, msgList);
		}

		msgList.add(msgObject);
	}
}
