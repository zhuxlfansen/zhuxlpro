package ustc.yzwx.business.student;

import java.util.List;

import ustc.yzwx.presentation.student.form.Major;

/**
 * 专业SERVICE
 * @author zcy
 * @version 1.0.0 2014-2-26
 */
public interface MajorService {

	/**
	 * 根据parent_code查专业集合
	 * @param parentCode
	 * @return List Major
	 */
	List<Major> selectByParentCode(String parentCode);
	
	/**
	 * 查询所有专业
	 * @return
	 */
	public List<Major> getAllMajor();
	
}
