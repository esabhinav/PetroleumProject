package com.tnbpda.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.NumberToTextConverter;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.tnbpda.dao.objImpl.DealerDAOImpl;
import com.tnbpda.vo.Dealer;

public class ReadExcelRemainingDealer {
	public static void main(String[] args) {
		try {
			TreeMap<String,Dealer> extmap = (TreeMap<String,Dealer>) TNBPDAUtil
					.readFromStream("dealer");

			TreeMap<Integer, Dealer> map = new TreeMap<Integer, Dealer>();
			for (Dealer de : extmap.values()) {
				map.put(de.getCcNo(), de);
			}
			System.out.println("Original Dealer List :" + map.size());

			String fileName = "Dealers_List.xls";
			// fileName="Dealers_List.xls";
			FileInputStream file = new FileInputStream(new File(fileName));

			// Create Workbook instance holding reference to .xlsx file
			// XSSFWorkbook workbook = new XSSFWorkbook(file);
			HSSFWorkbook workbook = new HSSFWorkbook(file);

			// Get first/desired sheet from the workbook
			// XSSFSheet sheet = workbook.getSheetAt(0);
			HSSFSheet sheet = workbook.getSheetAt(0);
			// Iterate through each rows one by one
			Iterator<Row> rowIterator = sheet.iterator();
			List<Dealer> dealerList = new ArrayList<Dealer>();
			Dealer panneer = null;
			rowIterator.next();
			while (rowIterator.hasNext()) {
			//	System.out.println("Row start..s");
				  panneer = new Dealer();
				Row row = rowIterator.next();

				// For each row, iterate through all the columns
				Iterator<Cell> cellIterator = row.cellIterator();

				try {
 
					if (row.getCell(0).getCellType() == 0) {
						double ccNo = row.getCell(0).getNumericCellValue();
						panneer.setCcNo((int) ccNo);
		                panneer.setPassword(NumberToTextConverter.toText(row
								.getCell(0).getNumericCellValue()));
		                panneer.setFirstTime(true);
		               // System.out.println(panneer.getCcNo());
						 if (!map.containsKey(panneer.getCcNo())) {
							dealerList.add(panneer);
						 }
					}
					panneer.setLastName("");
					panneer.setMobileNo("");
	          	    panneer.setLifeMember(false);
			 		panneer.setFirstTime(true);
					panneer.setDateOfBirth("");
					panneer.setZipCode(0);
					panneer.setAddress1("");
					panneer.setAddress2("");
					panneer.setAssociation(false);
					panneer.setLandLine("");
					panneer.setPost("");
					panneer.setAccessLevel("User");

				} catch (Exception e) {
					e.printStackTrace();
				}

				//System.out.println("");
			}
			System.out.println("Excel Dealer Size Except list: " + dealerList.size());

			for(Dealer de : dealerList) {
			extmap.put(String.valueOf(de.getCcNo()), de);
			}
			DealerDAOImpl dao = new DealerDAOImpl();
			
			//listDealer.addAll(dealerList);
			 System.out.println("extmap " + extmap.size());
		  dao.insertAllDealer(extmap);
		 	 
			/*
			 * for(Dealer dea : dealerList) { dao.insertDealer(dea); }
			 */

			file.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
