package ustc.etyy.common.util;

import java.util.List;

public class Pager<T> {
	public static final int DEFAULT_PAGE_SIZE = 10;

	private int rowCount;
	private int pageIndex;
	private int pageSize;
	private int pageCount;

	private List<T> datas;

	public Pager(int rowCount, int pageIndex, int pageSize, List<T> datas) {
		this.rowCount = rowCount;
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.datas = datas;
	}

	public Pager(int rowCount, int pageIndex, List<T> datas) {
		this.rowCount = rowCount;
		this.pageIndex = pageIndex;
		this.pageSize = DEFAULT_PAGE_SIZE;
		this.datas = datas;
	}


	public int getPageCount() {
		if (rowCount == 0) {
            pageCount = 1;
            return pageCount;
        }
        boolean isZero = rowCount % pageSize == 0;
        pageCount = rowCount / pageSize;
        pageCount = isZero ? pageCount : pageCount + 1;
        return pageCount;
	}

	public int getRowCount() {
		return rowCount;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public List<T> getDatas() {
		return datas;
	}
}
