package ustc.yzwx.integration.student.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ustc.yzwx.common.integration.dao.annotation.DaoMaster;
import ustc.yzwx.presentation.student.form.Region;
@DaoMaster
public interface RegionDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_region
     *
     * @mbggenerated Wed Feb 26 11:04:33 CST 2014
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_region
     *
     * @mbggenerated Wed Feb 26 11:04:33 CST 2014
     */
    int insert(Region record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_region
     *
     * @mbggenerated Wed Feb 26 11:04:33 CST 2014
     */
    int insertSelective(Region record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_region
     *
     * @mbggenerated Wed Feb 26 11:04:33 CST 2014
     */
    Region selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_region
     *
     * @mbggenerated Wed Feb 26 11:04:33 CST 2014
     */
    int updateByPrimaryKeySelective(Region record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_region
     *
     * @mbggenerated Wed Feb 26 11:04:33 CST 2014
     */
    int updateByPrimaryKey(Region record);
    /**
     * 查询所有省，直辖市
     * @return Region集合
     */
    public List<Region> getProvince();
    /**
     * 根据省id获得该省下的所有市
     * @param parentId
     * @return
     */
    public List<Region> getCity(@Param("parentId")int parentId);
}