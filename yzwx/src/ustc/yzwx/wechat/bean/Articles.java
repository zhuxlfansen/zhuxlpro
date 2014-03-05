package ustc.yzwx.wechat.bean;

/**
 * 多图文消息
 * 
 * @author yujie
 * 
 */
public class Articles {

	// 标题
	private String title;
	// 描述
	private String description;
	// 图片
	private String picUrl;
	// 链接
	private String url;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
