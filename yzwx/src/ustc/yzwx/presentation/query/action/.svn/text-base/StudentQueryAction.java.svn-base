package ustc.yzwx.presentation.query.action;

import java.util.List;

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
@RequestMapping("/mob")
public class StudentQueryAction extends BaseAction {

	@RequestMapping("/studentQuery")
	public String toStudentQuery(Model model) {
		List<Major> majorList = MajorMst.getParentMajor();
		model.addAttribute("majorList", majorList);
		return "studentQuery";
	}
}
