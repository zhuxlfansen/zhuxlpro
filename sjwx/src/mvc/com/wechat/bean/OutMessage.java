package mvc.com.wechat.bean;

import java.io.Serializable;

/**
 * @author user
 * 
 */
public class OutMessage implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5128079870271098871L;
	// 发送用户
	private String ToUserName;
	// 接收用户
	private String FromUserName;
	// 时间
	private Long CreateTime;
	// 星标
	private int FuncFlag;

	public String getToUserName() {
		return ToUserName;
	}

	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}

	public String getFromUserName() {
		return FromUserName;
	}

	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}

	public Long getCreateTime() {
		return CreateTime;
	}

	public void setCreateTime(Long createTime) {
		CreateTime = createTime;
	}

	public int getFuncFlag() {
		return FuncFlag;
	}

	public void setFuncFlag(int funcFlag) {
		FuncFlag = funcFlag;
	}

}
