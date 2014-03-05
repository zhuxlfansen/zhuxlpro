package ustc.yzwx.business.student;

import java.util.List;

import ustc.yzwx.presentation.student.form.School;

/**
 * 学校SERVICE
 * @author zcy
 * @version 1.0.0 2014-2-22
 */
public interface SchoolService {
	
	/**
     *  根据place 查询学校
     */
    List<School> selectByPlace(String place);
}
