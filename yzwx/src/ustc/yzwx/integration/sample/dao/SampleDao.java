package ustc.yzwx.integration.sample.dao;

import java.util.List;

import ustc.yzwx.common.integration.dao.annotation.DaoMaster;
import ustc.yzwx.presentation.sample.form.SampleForm;

@DaoMaster
public interface SampleDao {

	List<SampleForm> search(String code);
}
