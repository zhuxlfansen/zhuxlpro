package ustc.yzwx.wechat.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * @author user
 * 
 */
public class NewsOutMessage extends OutMessage {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4076340452335015695L;
	private String msgType = "news";
	private int articleCount;

	private List<Articles> articles;

	public String getMsgType() {
		return msgType;
	}

	public int getArticleCount() {
		return articleCount;
	}

	public List<Articles> getArticles() {
		return articles;
	}

	public void setArticles(List<Articles> articles) {
		if (articles != null) {
			if (articles.size() > 10)
				articles = new ArrayList<Articles>(articles.subList(0, 10));

			articleCount = articles.size();
		}
		this.articles = articles;
	}
}
