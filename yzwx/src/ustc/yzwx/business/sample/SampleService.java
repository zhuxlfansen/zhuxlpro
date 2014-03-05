package ustc.yzwx.business.sample;

import java.util.List;

import ustc.yzwx.presentation.sample.form.SampleForm;

public interface SampleService {

	List<SampleForm> search(String code);
}
