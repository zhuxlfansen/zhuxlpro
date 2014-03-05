package ustc.yzwx.wechat.bean;

import java.io.Serializable;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 接受信息
 * 
 * @author user
 * 
 */
@XStreamAlias("xml")
public class InMessage implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 7020059278682451542L;

	// 发往用户
	@XStreamAlias("ToUserName")
	private String ToUserName;
	// 接收用户
	@XStreamAlias("FromUserName")
	private String FromUserName;
	// 制造时间
	@XStreamAlias("CreateTime")
	private Long CreateTime;
	// 信息类型
	@XStreamAlias("MsgType")
	private String MsgType = "text";
	// msgId
	@XStreamAlias("MsgId")
	private Long MsgId;

	// 内容
	@XStreamAlias("Content")
	private String Content;

	// 图片消息
	@XStreamAlias("PicUrl")
	private String PicUrl;

	// 位置消息
	@XStreamAlias("LocationX")
	private String LocationX;
	@XStreamAlias("LocationY")
	private String LocationY;
	@XStreamAlias("Scale")
	private String Scale;
	@XStreamAlias("Label")
	private String Label;

	// 链接消息
	@XStreamAlias("Title")
	private String Title;
	@XStreamAlias("Description")
	private String Description;
	@XStreamAlias("Url")
	private String Url;

	// 语音信息
	@XStreamAlias("MediaId")
	private String MediaId;
	@XStreamAlias("Format")
	private String Format;
	@XStreamAlias("Recognition")
	private String Recognition;

	// 事件
	@XStreamAlias("Event")
	private String Event;
	@XStreamAlias("EventKey")
	private String EventKey;
	@XStreamAlias("Ticket")
	private String Ticket;

	public String getToUserName() {
		return ToUserName;
	}

	public void setToUserName(String toUserName) {
		this.ToUserName = toUserName;
	}

	public String getFromUserName() {
		return FromUserName;
	}

	public void setFromUserName(String fromUserName) {
		this.FromUserName = fromUserName;
	}

	public Long getCreateTime() {
		return CreateTime;
	}

	public void setCreateTime(Long createTime) {
		CreateTime = createTime;
	}

	public String getMsgType() {
		return MsgType;
	}

	public void setMsgType(String msgType) {
		MsgType = msgType;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getPicUrl() {
		return PicUrl;
	}

	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}

	public String getLocationX() {
		return LocationX;
	}

	public void setLocationX(String locationX) {
		LocationX = locationX;
	}

	public String getLocationY() {
		return LocationY;
	}

	public void setLocationY(String locationY) {
		LocationY = locationY;
	}

	public String getScale() {
		return Scale;
	}

	public void setScale(String scale) {
		Scale = scale;
	}

	public String getLabel() {
		return Label;
	}

	public void setLabel(String label) {
		Label = label;
	}

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

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
	}

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}

	public String getFormat() {
		return Format;
	}

	public void setFormat(String format) {
		Format = format;
	}

	public String getRecognition() {
		return Recognition;
	}

	public void setRecognition(String recognition) {
		Recognition = recognition;
	}

	public String getEvent() {
		return Event;
	}

	public void setEvent(String event) {
		Event = event;
	}

	public String getEventKey() {
		return EventKey;
	}

	public void setEventKey(String eventKey) {
		EventKey = eventKey;
	}

	public String getTicket() {
		return Ticket;
	}

	public void setTicket(String ticket) {
		Ticket = ticket;
	}

	public Long getMsgId() {
		return MsgId;
	}

	public void setMsgId(Long msgId) {
		MsgId = msgId;
	}

}
