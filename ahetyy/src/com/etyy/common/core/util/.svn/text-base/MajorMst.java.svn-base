package ustc.yzwx.common.core.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ustc.yzwx.business.student.MajorService;
import ustc.yzwx.presentation.student.form.Major;

/**
 * @author user
 * 
 */
public final class MajorMst {

	/** 专业用Service */
	private static MajorService majorService = null;

	/** 专业Map */
	private static Map<String, List<Major>> majorMap = new HashMap<String, List<Major>>();

	/** 专业List */
	private static List<Major> majorList = null;
	
	/** 院系List */
	private static List<Major> parentMajorList = null;

	/**
	 * 设置service
	 * 
	 * @param service
	 */
	public static void setMajorService(MajorService service) {
		MajorMst.majorService = service;
	}

	/**
	 * 获得所有专业
	 * 
	 * @return
	 */
	public static List<Major> getAllMajor() {
		return MajorMst.majorList;
	}
	
	/**
	 * 获得所有院系
	 * 
	 * @return
	 */
	public static List<Major> getParentMajor() {
		return MajorMst.parentMajorList;
	}

	/**
	 * 根据parent_code查专业集合
	 * 
	 * @param parentCode
	 * @return
	 */
	public static List<Major> selectByParentCode(String parentCode) {
		return MajorMst.majorMap.get(parentCode);
	}

	/**
	 * 初始化
	 */
	public static void setup() {
		// 获取所有专业
		MajorMst.majorList = majorService.getAllMajor();

		MajorMst.parentMajorList = majorService.getParentMajor();

		for (Major item : parentMajorList) {
			MajorMst.majorMap.put(item.getCode(),
					majorService.selectByParentCode(item.getCode()));
		}
	}
}
