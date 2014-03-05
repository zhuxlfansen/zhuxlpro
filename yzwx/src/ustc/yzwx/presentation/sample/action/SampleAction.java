package ustc.yzwx.presentation.sample.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ustc.yzwx.business.sample.SampleService;
import ustc.yzwx.common.constants.MessageCode;
import ustc.yzwx.common.core.i18n.I18nMessage;
import ustc.yzwx.presentation.common.action.BaseAction;
import ustc.yzwx.presentation.response.body.JsonResponseBody;

@Controller
@RequestMapping("/sample")
public class SampleAction extends BaseAction {

	@Autowired
	private SampleService sampleServiece;

	@RequestMapping("/init")
	public String init(ModelMap model) {

		addMessage(model, new I18nMessage(messageAccessor, MessageCode.E000001));

		return "sample";
	}

	@RequestMapping("/search")
	@ResponseBody
	public JsonResponseBody search(String code, ModelMap model) {
		
		JsonResponseBody res = new JsonResponseBody();
		
		res.addMessage(new I18nMessage(messageAccessor, MessageCode.I000001));
		
		res.setData(sampleServiece.search(code));


		return res;
	}
}
