package ustc.etyy.wechat.bean;


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
	private String MsgType = "news";
	private int ArticleCount;

	private List<Articles> Articles;

	public String getMsgType() {
		return MsgType;
	}

	public int getArticleCount() {
		return ArticleCount;
	}

	public List<Articles> getArticles() {
		return Articles;
	}

	public void setArticles(List<Articles> articles) {
		if (articles != null) {
			if (articles.size() > 10)
				articles = new ArrayList<Articles>(articles.subList(0, 10));

			ArticleCount = articles.size();
		}
		this.Articles = articles;
	}
}
