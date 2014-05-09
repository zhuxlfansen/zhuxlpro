package ustc.yzwx.integration.student.dao;

import ustc.yzwx.common.integration.dao.annotation.DaoMaster;
import ustc.yzwx.presentation.student.form.Subscribe;

@DaoMaster
public interface SubscribeDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_subscribe
     *
     * @mbggenerated Fri Mar 14 10:28:41 CST 2014
     */
    int insert(Subscribe record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wx_subscribe
     *
     * @mbggenerated Fri Mar 14 10:28:41 CST 2014
     */
    int insertSelective(Subscribe record);
    
    int countByWxCode(String wxCode);
    
    void deleteByWxCode(String wxCode);
}