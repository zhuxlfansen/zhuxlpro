package ustc.yzwx.presentation.admin.action;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import unis.base.util.StringUtil;
import unis.base.util.ValidateUtil;
import ustc.yzwx.business.admin.AdminService;
import ustc.yzwx.common.constants.MessageCode;
import ustc.yzwx.common.core.i18n.I18nMessage;
import ustc.yzwx.common.core.util.PageResult;
import ustc.yzwx.presentation.admin.form.Admin;
import ustc.yzwx.presentation.common.action.BaseAction;

/**
 * 系统管理员Controller
 * 
 * @author zcy
 * @version 1.0.0 2014-2-27
 */
@Controller
@RequestMapping("/admin")
public class AdminAction extends BaseAction {

	/**
	 * spring注入的 AdminService
	 */
	@Autowired
	private AdminService adminService;

	/**
	 * 每页包含信息条数
	 */
	private int pageSize = 8;

	/**
	 * 当前页
	 */
	private int curPage = 1;

	/**
	 * 跳转增加管理员页面
	 * 
	 * @return String
	 */
	@RequestMapping("/add")
	public String addAdmin() {

		return "adminAdd";
	}

	/**
	 * 增加一个管理员
	 * 
	 * @param admin
	 * @return String
	 */
	@RequestMapping("submitAdd")
	public String submitAdd(Admin admin, ModelMap model) {
		// 判断管理员名是否有重复
		Admin existAdmin = adminService.selectByName(admin.getName());

		if (existAdmin != null) {
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.E000070));
			return "adminAdd";
		} else {
			// 生成加密盐
			admin.setSalt(new SecureRandomNumberGenerator().nextBytes().toHex());

			// MD5加密
			SimpleHash hash = new SimpleHash("MD5", admin.getPassword(),
					admin.getSalt(), 1);
			String md5Password = hash.toHex();

			admin.setPassword(md5Password);
			adminService.addAdmin(admin);
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.I000006));
		}

		return "adminInfo";
	}

	/**
	 * 分页查管理员列表
	 * 
	 * @param curpage
	 * @param model
	 * @return
	 */
	@RequestMapping("selectAll")
	public String selectAll(String curpage, Model model) {
		if (ValidateUtil.isNotNull(curpage)) {
			curPage = StringUtil.parseInteger(curpage);
		}
		PageResult adminList = adminService.findByPager(curPage, pageSize);
		model.addAttribute("adminList", adminList);

		return "adminList";
	}

	/**
	 * 根据ID删除系统管理员
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("delete")
	public String deleteById(int id, ModelMap model) {
		int delCoulmn = adminService.deleteById(id);
		if (delCoulmn > 0) {
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.I000007));
		} else {
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.E000071));
		}
		return "adminInfo";
	}

	/**
	 * 根据ID查详情
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("detail")
	public String selectById(int id, ModelMap model) {
		Admin admin = adminService.selectById(id);
		model.addAttribute("admin", admin);
		return "adminUpdate";
	}

	/**
	 * 根据ID更新管理员信息
	 * 
	 * @param admin
	 * @param model
	 * @return
	 */
	@RequestMapping("update")
	public String updateById(Admin admin, ModelMap model) {
		Admin oldAdmin = adminService.selectById(admin.getId());

		// MD5加密
		SimpleHash hash = new SimpleHash("MD5", admin.getPassword(),
				oldAdmin.getSalt(), 1);

		String md5Pwd = hash.toHex();
		admin.setPassword(md5Pwd);

		int column = adminService.updateById(admin);
		if (column > 0) {
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.I000008));
		} else {
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.E000072));
		}
		return "adminInfo";
	}
}
