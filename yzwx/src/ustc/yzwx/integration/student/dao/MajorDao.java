package ustc.yzwx.integration.student.dao;

import java.util.List;

import ustc.yzwx.common.integration.dao.annotation.DaoMaster;
import ustc.yzwx.presentation.student.form.Major;

@DaoMaster
public interface MajorDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_major
     *
     * @mbggenerated Wed Feb 19 15:45:12 CST 2014
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_major
     *
     * @mbggenerated Wed Feb 19 15:45:12 CST 2014
     */
    int insert(Major record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_major
     *
     * @mbggenerated Wed Feb 19 15:45:12 CST 2014
     */
    int insertSelective(Major record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_major
     *
     * @mbggenerated Wed Feb 19 15:45:12 CST 2014
     */
    Major selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_major
     *
     * @mbggenerated Wed Feb 19 15:45:12 CST 2014
     */
    int updateByPrimaryKeySelective(Major record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_major
     *
     * @mbggenerated Wed Feb 19 15:45:12 CST 2014
     */
    int updateByPrimaryKey(Major record);
    
    /**
	 * 根据parent_code查专业集合
	 * @param parentCode
	 * @return List Major 
	 */
    List<Major> selectByParentCode(String parentCode);
    
    public List<Major> getAllMajor();
    
    List<Major> getParentMajor();
    
    Major selectByMajorCode(String majorCode);
}