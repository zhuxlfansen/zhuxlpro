package mvc.com.main.action.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testAction {

	@RequestMapping("/test")
	public String test(){
		return "test";
	}
}
