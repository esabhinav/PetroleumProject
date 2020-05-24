package com.tnbpda.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javafx.scene.SubScene;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.NumberToTextConverter;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.tnbpda.dao.objImpl.DealerDAOImpl;
import com.tnbpda.dao.objImpl.DealerDAOImplHashMap;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Subscription;
import com.tnbpda.vo.SubscriptionPayment;

public class ReadExcelSubscription {

	static String FOLDER_PATH = "D:\\tnpds\\Excel\\";
	static String FILE_NAME = "SubsReceiptMemberWise.xls";

	public static void main(String[] args) {
		try {

			// fileName="Dealers_List.xls";
			FileInputStream file = new FileInputStream(new File(FOLDER_PATH
					+ FILE_NAME));

			// Create Workbook instance holding reference to .xlsx file
			HSSFWorkbook workbook = new HSSFWorkbook(file);

			// Get first/desired sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(0);

			// Iterate through each rows one by one
			Iterator<Row> rowIterator = sheet.iterator();
			// List<Subscription> dealerLists = new ArrayList<Subscription>();

			TreeMap<String, Subscription> map = new TreeMap<String, Subscription>();

			rowIterator.next();
			rowIterator.next();

			List<Subscription> youTubeList = new ArrayList<Subscription>();
			while (rowIterator.hasNext()) {
				/* System.out.println("Row start..s"); */
				Subscription subScribe = new Subscription();
				Row row = rowIterator.next();

				// For each row, iterate through all the columns
				Iterator<Cell> cellIterator = row.cellIterator();

				try {
					// System.out.println("CC NO "+row.getCell(2));
					/*
					 * System.out.print(" :: :Life Long :  "+row.getCell(7));
					 * System.out.println(": Annual: "+row.getCell(8));
					 */
					String str = row.getCell(2).getStringCellValue();

					double ccNo = Double.parseDouble(str.substring(0,
							str.length()));
					if (ccNo != 0) {
						subScribe.setCcNo((int) ccNo);
					}
					/* String life = row.getCell(7).getStringCellValue(); */
					/* if(life!=null){ */



					// System.out.println(row.getCell(8).getCellType());
					List<SubscriptionPayment> listSub = new ArrayList<SubscriptionPayment>();
					if (row.getCell(8).getCellType() == 1) {

						// String annAmount =
						// NumberToTextConverter.toText(row.getCell(8).getNumericCellValue());
						String annAmount = row.getCell(8).getStringCellValue();
						// System.out.println("annAmount ;: "+annAmount);
						SubscriptionPayment sub = new SubscriptionPayment();
						listSub.add(sub);
						sub.setAmount(Math.round(Float.valueOf(annAmount)));
						sub.setSubscriptionYear(2017);
						sub.setSubSciptionDate(new Date());
						subScribe.setYearlySubscription(true);
						Calendar cal = Calendar.getInstance();
						Date expDate = new Date();
						cal.setTime(expDate);
						cal.add(Calendar.YEAR, 1); // Where n is int
						expDate = cal.getTime();
						expDate = cal.getTime();
						subScribe.setSubsEndDate(expDate);
						/*
						 * double mobileNo =
						 * row.getCell(8).getNumericCellValue();
						 * System.out.println(mobileNo);
						 */

					}
					if (row.getCell(7) != null) {

						// dealerList.add(panneer);
						// System.out.println(row.getCell(7).getCellType());
						if (row.getCell(7).getCellType() == 1) {
							double life = Double.parseDouble(row.getCell(7)
									.getStringCellValue());
							// System.out.println("--> "+life);
							if (life > 0) {
								subScribe.setLifeLongSubscription(true);
								Calendar cal = Calendar.getInstance();
								Date expDate = new Date();
								cal.setTime(expDate);
								cal.add(Calendar.YEAR, 10); // Where n is int
								expDate = cal.getTime();
								expDate = cal.getTime();
								subScribe.setSubsEndDate(expDate);
							}
							// panneer.setPassword(NumberToTextConverter.toText(row.getCell(3).getNumericCellValue()));

						}
					}
					subScribe.setAnnualPayment(listSub);
					Date currentDate = new Date();
					subScribe.setSubscriptionDate(currentDate);
					map.put(String.valueOf(subScribe.getCcNo()), subScribe);
					youTubeList.add(subScribe);
				} catch (Exception e) {
					e.printStackTrace();
				}

				System.out.println("see this--" + subScribe.getSubsEndDate());

			}
			TNBPDAUtil.writeToStream(youTubeList, "subscribers");

			System.out.println("GAmes starts..");
			Iterator<Map.Entry<String, Subscription>> its = map.entrySet()
					.iterator();
			int count = 1;
			while (its.hasNext()) {
				Map.Entry<String, Subscription> me = its.next();
				if (me.getValue().isLifeLongSubscription()) {
					System.out.println(me.getKey() + " : "
							+ me.getValue().isLifeLongSubscription());
					count++;
				}
				for (SubscriptionPayment sp : me.getValue().getAnnualPayment()) {
					// System.out.println(sp.getAmount() );
				}
			}
			TNBPDAUtil.writeToStream(youTubeList, "subscribers");
			System.out.println("Dealer Size : " + count);

			/*
			 * for(Dealer dea : dealerList) { dao.insertDealer(dea); }
			 */
			// dao.insertAllDealer(map);

			file.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
