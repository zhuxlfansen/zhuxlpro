package ustc.yzwx.wechat.bean;

/**
 * @author yujie
 *
 */
public class WechatQueryBean {

	public static enum QueryStep {
		STEP_SELECT, STEP_INPUT, STEP_COMPLETE;
	}

	private QueryStep step = QueryStep.STEP_SELECT;

	private String inputContent;

	public QueryStep getStep() {
		return step;
	}

	public void setStep(QueryStep step) {
		this.step = step;
	}

	public String getInputContent() {
		return inputContent;
	}

	public void setInputContent(String inputContent) {
		this.inputContent = inputContent;
	}

}
