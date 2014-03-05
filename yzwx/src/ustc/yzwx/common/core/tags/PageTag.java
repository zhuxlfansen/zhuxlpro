package ustc.yzwx.common.core.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PageTag extends SimpleTagSupport {
	private int curPage;
	private int count;
	private int pageCount;
	private String url;

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.SimpleTagSupport#doTag()
	 */
	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out=getJspContext().getOut();
		out.write("<div class=\"LoopPage\">");
		out.write("\r\n");
		out.write("<p>第<strong>"+curPage+"</strong>页<strong>"+"</strong>共<strong>"+pageCount+"</strong>页<strong>"+count+"</strong>条记录&nbsp;&nbsp;转到第<input type=\"text\" class=\"TxtInp\" value=\""+curPage+"\" name=\"curPage\" id=\"curPage\"/>页<input type=\"submit\" class=\"goTo\" value=\"go\" name=\"\" class=\"Btn\" onclick=\"gopage("+pageCount+");\" /></p>");
		out.write("\r\n");
		out.write("<ul>");
		out.write("\r\n");
		out.write("<li><a href=\"javascript:goPage(1,"+pageCount+");\" title=\"第一页\">&lt;&lt;</a></li>");
		out.write("\r\n");
		out.write("<li><a href=\"javascript:goPage("+(curPage-1)+","+pageCount+");\" title=\"上一页\">&lt;</a></li>");
		out.write("\r\n");
//		out.write("<dd><a href=\"javascript:goPage("+(curPage-1)+","+pageCount+");\" title=\"上一页\" class=\"Prev\">上一页</a></dd>");
//		out.write("\r\n");
		if(pageCount<=6){
			//全部显示
			printNum(out,1,pageCount);
		}else{
			if(curPage<=3){
				printNum(out,1,6);
				out.write("\r\n");
			}else if(curPage>3&&curPage<pageCount-3){
				printNum(out,curPage-2,curPage+3);
				out.write("\r\n");
			}else{
				printNum(out,pageCount-6,pageCount);
			}
		}
		out.write("<li><a href=\"javascript:goPage("+(curPage+1)+","+pageCount+");\" title=\"下一页\">&gt;</a></li>");
		out.write("\r\n");
		out.write("<li><a href=\"javascript:goPage("+pageCount+","+pageCount+");\" title=\"末页\">&gt;&gt;</a></li>");
		out.write("\r\n");
		out.write("</ul>");
		out.write("</div>");
		out.write("\r\n");
		
	}


	private void printNum(JspWriter out,int beginNum,int endNum) throws IOException {
		for(int i=beginNum;i<=endNum;i++){
			if(i==curPage){
				out.write("<li><a href=\"javascript:goPage("+i+","+pageCount+");\" title=\""+i+"\" class=\"ExtLoopLink\">"+i+"</a></li>");
			}else{
				out.write("<li><a href=\"javascript:goPage("+i+","+pageCount+");\" title=\""+i+"\">"+i+"</a></li>");
			}
			out.write("\r\n");
		}
	}


	/**
	 * @return the curPage
	 */
	public int getCurPage() {
		return curPage;
	}


	/**
	 * @param curPage the curPage to set
	 */
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}


	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}


	/**
	 * @param count the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}


	/**
	 * @return the pageCount
	 */
	public int getPageCount() {
		return pageCount;
	}


	/**
	 * @param pageCount the pageCount to set
	 */
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}

}
