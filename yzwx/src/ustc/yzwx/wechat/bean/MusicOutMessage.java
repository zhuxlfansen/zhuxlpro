package ustc.yzwx.wechat.bean;

/**
 * @author user
 * 
 */
public class MusicOutMessage extends OutMessage {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 6966107049097511645L;
	private String msgType = "music";
	private String musicUrl;
	private String hQMusicUrl;

	public String getMsgType() {
		return msgType;
	}

	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}

	public String getMusicUrl() {
		return musicUrl;
	}

	public void setMusicUrl(String musicUrl) {
		this.musicUrl = musicUrl;
	}

	public String gethQMusicUrl() {
		return hQMusicUrl;
	}

	public void sethQMusicUrl(String hQMusicUrl) {
		this.hQMusicUrl = hQMusicUrl;
	}

}
