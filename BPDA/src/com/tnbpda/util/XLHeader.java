package com.tnbpda.util;

import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Header;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.CreationHelper;

public class XLHeader {
	 private static final String FILE_NAME = "C:\\tnbpda\\Excel.xlsx";

	public static void main(String args[]) throws IOException {
		Workbook wb = new HSSFWorkbook();
		CreationHelper createHelper = wb.getCreationHelper();
		Sheet sheet = wb.createSheet("new sheet");

		Row row = sheet.createRow((short) 0);
		// Create a cell and put a value in it.
		row.createCell(0)
				.setCellValue(
						createHelper
								.createRichTextString("Take Print Preview to View Headers"));
		Header header = sheet.getHeader();
		header.setCenter("Center Header");
		header.setLeft("Left Header");
		header.setRight(HSSFHeader.font("Stencil-Normal", "Italic")
				+ HSSFHeader.fontSize((short) 10) + "Right Header");

		FileOutputStream fileOut = new FileOutputStream(
				FILE_NAME);
		wb.write(fileOut);
		fileOut.close();
	}
}