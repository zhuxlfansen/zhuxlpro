package ustc.yzwx.common.core.util;

import java.util.ArrayList;

public class PageResult {

	private Object Result;
	private int count;
	private int pageSize;
	private int curPage;

	public PageResult(Object result, int rowCount, int pageSize, int curPage) {
		count = 0;
		Result = result;
		count = rowCount;
		this.pageSize = pageSize;
		this.curPage = curPage;
	}

	public void setResult(Object result) {
		if (result instanceof ArrayList)
			Result = (ArrayList<?>) result;
		else
			Result = result;
	}

	public ArrayList<?> geResult() {
		if (Result instanceof ArrayList)
			return (ArrayList<?>) Result;
		else
			return null;
	}

	public Object geResultObject() {
		return Result;
	}

	public PageResult() {
		count = 0;
	}

	public Object getResult() {
		return Result;
	}

	public int getPageCount() {
		return (count - 1) / pageSize + 1;
	}

	public int getCount() {
		return count;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getCurPage() {
		return curPage;
	}
}