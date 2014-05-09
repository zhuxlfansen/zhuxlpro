package ustc.yzwx.common.core.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ustc.yzwx.business.student.SchoolService;
import ustc.yzwx.presentation.student.form.School;

/**
 * @author user
 *
 */
public final class SchoolMst {

	/** 学校用Service */
	private static SchoolService schoolService = null;
	
	/** 学校Map */
	private static Map<String, List<School>> schoolMap = new HashMap<String, List<School>>();
	
	/**
	 * 设置service
	 * 
	 * @param service
	 */
	public static void setSchoolService(SchoolService service) {
		SchoolMst.schoolService = service;
	}
	
	/**
     *  根据place 查询学校
     */
	public static List<School> selectByPlace(String place) {
		return SchoolMst.schoolMap.get(place);
	}
	
	/**
	 * 初始化
	 */
	public static void setup() {
		// 获取所有学校
		List<School> schoolList = schoolService.selectAll();

		List<School> list = null;

		for (School item : schoolList) {
			if (SchoolMst.schoolMap.containsKey(item.getCity())) {
				list = SchoolMst.schoolMap.get(item.getCity());
				list.add(item);
			} else {
				list = new ArrayList<School>();
				list.add(item);
				SchoolMst.schoolMap.put(item.getCity(), list);
			}
		}
	}
}
