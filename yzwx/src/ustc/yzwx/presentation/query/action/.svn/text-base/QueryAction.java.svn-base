package ustc.yzwx.presentation.query.action;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ustc.yzwx.common.core.util.MajorMst;
import ustc.yzwx.presentation.common.action.BaseAction;
import ustc.yzwx.presentation.student.form.Major;

/**
 * @author yujie
 *
 */
@Controller
public class QueryAction extends BaseAction {

	@RequestMapping("/toQueryList")
	public String toQueryList(String majorCode,Model model) {
		if(StringUtils.isEmpty(majorCode)) {
			
			List<Major> majorList = MajorMst.getParentMajor();
			model.addAttribute("majorList", majorList);
			
			return "queryMajor";
		} else {
			return "queryList";
		}
	}
}
