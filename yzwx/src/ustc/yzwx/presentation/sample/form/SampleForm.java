package ustc.yzwx.presentation.sample.form;

import java.io.Serializable;

public class SampleForm implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5613067171104774332L;

	private String code;

	private String name;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
