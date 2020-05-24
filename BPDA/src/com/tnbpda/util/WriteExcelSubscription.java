package com.tnbpda.util;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Header;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.tnbpda.vo.CMS;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Generator;
import com.tnbpda.vo.MPD;
import com.tnbpda.vo.POS;
import com.tnbpda.vo.Pump;
import com.tnbpda.vo.RO;
import com.tnbpda.vo.Solar;
import com.tnbpda.vo.Tank;

public class WriteExcelSubscription implements TNBPDAConstants {

	private static final String FILE_NAME = "C:\\tnbpda\\MyExcelVeify1.xlsx";

	public static HSSFWorkbook writingToExcel(HSSFWorkbook workbook,List<Dealer> listDealer) {
	//	XSSFWorkbook workbook = new XSSFWorkbook();
		//XSSFSheet sheet = workbook.createSheet("Dealers Information");
		HSSFSheet sheet = workbook.createSheet("Dealers Information");
		int rowNum = 0;
		CellStyle style = setStyle(sheet);

		Row row = sheet.createRow(rowNum++);
		int colNum = 0;

		setHeaderValue(row, colNum++, style, "CCNo");
		setHeaderValue(row, colNum++, style, "RO Name");
		setHeaderValue(row, colNum++, style, "LifeLong Membership");
		setHeaderValue(row, colNum++, style, "Yearly Membership");
		setHeaderValue(row, colNum++, style, "Amount");

		/***** ENd ****/

		for (Dealer panneer : listDealer) {
			colNum = 0;
			row = sheet.createRow(rowNum++);
			Cell cell = row.createCell(colNum++);
			setValue(panneer.getCcNo(), cell);
			cell = row.createCell(colNum++);
			setValue(panneer.getRoName(), cell);
			cell = row.createCell(colNum++);
			setValue(panneer.getFirstName(), cell);

			cell = row.createCell(colNum++);
			setValue(panneer.getLastName(), cell);
			cell = row.createCell(colNum++);
			setValue(panneer.getEmailID(), cell);
			cell = row.createCell(colNum++);
			setValue(panneer.getOfficialEmailId(), cell);

			cell = row.createCell(colNum++);
			setValue(panneer.getDateOfBirth(), cell);
			cell = row.createCell(colNum++);
			setValue(panneer.getMobileNo(), cell);
			cell = row.createCell(colNum++);
			setValue(panneer.getLandLine(), cell);

			cell = row.createCell(colNum++);
			setValue(panneer.getAddress1(), cell);
			cell = row.createCell(colNum++);
			setValue(panneer.getAddress2(), cell);
			cell = row.createCell(colNum++);
			setValue(panneer.getCity(), cell);

			cell = row.createCell(colNum++);
			setValue(panneer.getDistrict(), cell);
			cell = row.createCell(colNum++);
			setValue(panneer.getSupplyLocation(), cell);
			cell = row.createCell(colNum++);
			setValue(panneer.getTerriority(), cell);

		}

		 
		return workbook;
	}

	private static void setTankDetails(Tank tank,RO ro, int colNum, Cell cell, Row row) {
		tank  = ro.getTankList().get("MS");
		cell = row.createCell(colNum++);
		setValue(tank.getCapacity(), cell);
		cell = row.createCell(colNum++);
		setValue(tank.getNoOfTanks(), cell);
	}
	public static CellStyle setStyle(HSSFSheet sheet) {
		CellStyle cellStyle = sheet.getWorkbook().createCellStyle();
		Font font = sheet.getWorkbook().createFont();
		font.setFontName("Calibri");
		// font.setBold(true);
		font.setFontHeightInPoints((short) 11);
		cellStyle.setFont(font);
		cellStyle.setFillBackgroundColor((short) 8);
		cellStyle.setWrapText(true);
		cellStyle.setFillForegroundColor(IndexedColors.AQUA.getIndex());
		cellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
		return cellStyle;
	}

	public static void setValue(Object field, Cell cell) {
		if (field instanceof String) {
			cell.setCellValue((String) field);
		} else if (field instanceof Integer) {
			cell.setCellValue((Integer) field);
		}
	}

	public static void setHeaderValue(Row row, int colNum, CellStyle style,
			String headerName) {
		Cell cell = row.createCell(colNum++);
		cell.setCellStyle(style);
		cell.setCellValue(headerName);
	}

	public static void main(String[] args) {
		System.out.println("isnde main");
		//bothSheet();
		// List<Dealer> dl = (List<Dealer>)TNBPDAUtil.readFromStream("dealer");
		// writingToExcel(dl);
		//HashMap<String, RO> listRO = (HashMap<String, RO>) TNBPDAUtil.readFromStream("ro");
		//writingROToExcel(listRO);
	}
}
