package cn.achero.wechat.bean;

/**
 * 多图文消息
 * 
 * @author yujie
 * 
 */
public class Articles {

	// 标题
	private String Title;
	// 描述
	private String Description;
	// 图片
	private String PicUrl;
	// 链接
	private String Url;

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getPicUrl() {
		return PicUrl;
	}

	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
	}

}
