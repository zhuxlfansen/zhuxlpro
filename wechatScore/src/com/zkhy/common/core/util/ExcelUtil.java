package com.zkhy.common.core.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;

public class ExcelUtil {
	public static void downLoadFile(String filePath,
			HttpServletResponse response, String fileName, String fileType)
			throws Exception {
		File file = new File(filePath); // 根据文件路径获得File文件
		// 设置文件类型(这样设置就不止是下Excel文件了，一举多得)
		if ("pdf".equals(fileType)) {
			response.setContentType("application/pdf;charset=GBK");
		} else if ("xls".equals(fileType)) {
			response.setContentType("application/msexcel;charset=GBK");
		} else if ("doc".equals(fileType)) {
			response.setContentType("application/msword;charset=GBK");
		}
		// 文件名
		response.setHeader("Content-Disposition", "attachment;filename=\""
				+ new String(fileName.getBytes(), "ISO8859-1") + "\"");
		response.setContentLength((int) file.length());
		byte[] buffer = new byte[4096];// 缓冲区
		BufferedOutputStream output = null;
		BufferedInputStream input = null;
		try {
			output = new BufferedOutputStream(response.getOutputStream());
			input = new BufferedInputStream(new FileInputStream(file));
			int n = -1;

			// 遍历，开始下载
			while ((n = input.read(buffer, 0, 4096)) > -1) {
				output.write(buffer, 0, n);
			}
			output.flush(); // 不可少
			response.flushBuffer();// 不可少
		} catch (Exception e) {
			// 异常自己捕捉
			e.printStackTrace();
		} finally {

			// 关闭流，不可少
			if (input != null)
				input.close();
			if (output != null)
				output.close();
		}

	}
	
	/**
	 * 根据单元格不同属性返回字符串值
	 * @param cell
	 * @return
	 */
	public static String getCellStringValue(HSSFCell cell) {

		String cellValue = "";

		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_STRING:
			cellValue = cell.getStringCellValue();
			if (StringUtils.isEmpty(cellValue.trim())) {
				cellValue = "";
			}
			break;
		case HSSFCell.CELL_TYPE_NUMERIC:
			cellValue = String.valueOf(cell.getNumericCellValue());
			break;
		case HSSFCell.CELL_TYPE_FORMULA:
			cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			cellValue = String.valueOf(cell.getNumericCellValue());
			break;
		case HSSFCell.CELL_TYPE_BLANK:
		case HSSFCell.CELL_TYPE_BOOLEAN:
		case HSSFCell.CELL_TYPE_ERROR:
			break;
		default:
			break;
		}

		return cellValue;
	}
}
