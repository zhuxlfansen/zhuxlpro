package ustc.yzwx.integration.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ustc.yzwx.common.integration.dao.annotation.DaoMaster;
import ustc.yzwx.presentation.admin.form.Admin;
@DaoMaster
public interface AdminDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_admin
     *
     * @mbggenerated Thu Feb 27 14:13:38 CST 2014
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_admin
     *
     * @mbggenerated Thu Feb 27 14:13:38 CST 2014
     */
    int insert(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_admin
     *
     * @mbggenerated Thu Feb 27 14:13:38 CST 2014
     */
    int insertSelective(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_admin
     *
     * @mbggenerated Thu Feb 27 14:13:38 CST 2014
     */
    Admin selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_admin
     *
     * @mbggenerated Thu Feb 27 14:13:38 CST 2014
     */
    int updateByPrimaryKeySelective(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_admin
     *
     * @mbggenerated Thu Feb 27 14:13:38 CST 2014
     */
    int updateByPrimaryKey(Admin record);
    
    /**
     * 查管理员总数
     * @return int
     */
    int countAll();
    
    /**
     * 分页查管理员信息
     * @param start
     * @param pageSize
     * @return List Admin
     */
    List<Admin> selectByPager(@Param("start") int start ,@Param("size") int pageSize);
    
    /**
     * 根据管理员名查管理员
     * @param name
     * @return Admin
     */
    Admin selectByName(String name);
    
}