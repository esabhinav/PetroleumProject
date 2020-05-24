package com.tnbpda.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.TreeMap;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;

import com.tnbpda.vo.Message;
import com.tnbpda.vo.Reminder;

public class TNBPDAUtil implements TNBPDAConstants {
	public static final String DATE_FORMAT_NOW = "yyyy-MM-dd HH:mm:ss";
	public static String FILEPATH = "C:\\tnbpda\\_obj\\";
	public static String FILE_REMINDER_PATH = "C:\\tnbpda\\reminder\\";

	public static List<Reminder> retrieveItems(String ccNo) {
		String fileName = FILE_REMINDER_PATH + ccNo + ".xls";
		// fileName="Dealers_List.xls";
		List<Reminder> excelReminderList = new ArrayList<Reminder>();
		try {
			FileInputStream file = new FileInputStream(new File(fileName));

			// Create Workbook instance holding reference to .xlsx file
			HSSFWorkbook workbook = new HSSFWorkbook(file);

			// Get first/desired sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(0);

			// Iterate through each rows one by one
			Iterator<Row> rowIterator = sheet.iterator();
			rowIterator.next();
			rowIterator.next();

			while (rowIterator.hasNext()) {
				Reminder reminder = new Reminder();
				Row row = rowIterator.next();
				if (row.getCell(0) != null) {

					reminder.setRenewalType(row.getCell(0).getStringCellValue());
				}
				if (row.getCell(1) != null) {
					double period = row.getCell(1).getNumericCellValue();
					reminder.setPeriod((int) period);
					;
				}
				if (row.getCell(3) != null) {
					double days = row.getCell(3).getNumericCellValue();
					reminder.setReminder((int) days);
					;

				}
				if (row.getCell(2) != null) {
					DataFormatter dataFormatter = new DataFormatter();
					String cellStringValue = dataFormatter.formatCellValue(row
							.getCell(2));
					reminder.setExpDate(cellStringValue);
					// reminder.setExpDate(String.valueOf(row.getCell(2).getDateCellValue()));
				}
				excelReminderList.add(reminder);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return excelReminderList;
	}

	public static void main(String[] args) {
		List<Reminder> reminderList = retrieveItems("173813");
		List<Reminder> showList = new ArrayList<Reminder>();
		try {
			Date currentDate = new Date();
			System.out.println(currentDate);
			long ltime = currentDate.getTime() + 15 * 24 * 60 * 60 * 1000;
			Date expDatee = new Date(ltime);
			long x = (expDatee.getTime() - currentDate.getTime()) / 86400000;
			System.out.println(x);
			System.out.println(currentDate.compareTo(expDatee));
			/*
			 * for (Reminder re : reminderList) { int remDay = re.getReminder();
			 * Date expDate = getFormat(re.getExpDate(),"dd/MM/yyyy"); long
			 * remainingDate = (expDate.getTime() - currentDate.getTime()) /
			 * 86400000; if (remainingDate < remDay) { showList.add(re);
			 * System.out.println(re.getRenewalType() + re.getPeriod() + " : " +
			 * re.getExpDate() + " : " + re.getReminder());
			 * System.out.println("------------------" + expDate +
			 * "------------------------");
			 * System.out.println("Now            : " + currentDate.getTime());
			 * } }
			 */
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static Date getFormat(String strExpDate, String strFormat) {
		Date expDate = null;
		try {
			DateFormat format = new SimpleDateFormat(strFormat);
			expDate = format.parse(strExpDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return expDate;
	}

	public static String convertDateToString(Date date, String format) {
		DateFormat dateFormat = new SimpleDateFormat(format);
		String strDate = dateFormat.format(date);
		return strDate;
	}

	/**
	 * 
	 * @return
	 */
	public static Map<String, String> loadDistrict() {
		TreeMap<String, String> district = new TreeMap<String, String>();
		ResourceBundle rb = ResourceBundle
				.getBundle("com.tnbpda.prop.district");
		Enumeration<String> en = rb.getKeys();
		while (en.hasMoreElements()) {
			String key = en.nextElement();
			district.put(rb.getString(key), key);
		}
		return district;
	}

	public static List<String> fetchAdminUsers() {
		List<String> userList = new ArrayList<String>();
		ResourceBundle rb = ResourceBundle
				.getBundle("com.tnbpda.prop.user_access");
		String strUserList = rb.getString("Admin");
		for (String ccNo : strUserList.split(",")) {
			userList.add(ccNo);
		}
		System.out.println(userList);
		return userList;
	}

	/**
	 * 
	 * @return
	 */
	public static Map<String, String> loadSupplyLocation() {
		HashMap<String, String> suuplyLocation = new HashMap<String, String>();
		ResourceBundle rb = ResourceBundle.getBundle("com.tnbpda.prop.supply");
		Enumeration<String> en = rb.getKeys();
		while (en.hasMoreElements()) {
			String key = en.nextElement();
			suuplyLocation.put(key, rb.getString(key));
		}
		return suuplyLocation;
	}

	/**
	 * 
	 * @return
	 */
	public static Map<String, String> loadTerriority() {
		HashMap<String, String> terriority = new HashMap<String, String>();
		ResourceBundle rb = ResourceBundle
				.getBundle("com.tnbpda.prop.terriority");
		Enumeration<String> en = rb.getKeys();
		while (en.hasMoreElements()) {
			String key = en.nextElement();
			terriority.put(key, rb.getString(key));
		}
		return terriority;
	}

	/**
	 * 
	 * @return
	 */
	public static Map<String, String> loadAccess() {
		Map<String, String> userAccess = new HashMap<String, String>();
		ResourceBundle rb = ResourceBundle
				.getBundle("com.tnbpda.prop.user_access");
		Enumeration<String> en = rb.getKeys();
		while (en.hasMoreElements()) {
			String key = en.nextElement();
			userAccess.put(key, rb.getString(key));
		}
		return userAccess;
	}

	public static void maind(String[] args) {
		Map<String, String> map = loadSupplyLocation();// loadDistrict();
		Iterator<Map.Entry<String, String>> it = map.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry me = it.next();
			System.out.println(me.getKey() + ": " + me.getValue());
		}
	}

	public static void writeToStream(Object list, String fileName) {
		try {
			FileOutputStream fos = new FileOutputStream(FILEPATH + fileName
					+ ".ser");
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(list);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Object readFromStream(String fileName) {
		try {
			FileInputStream fos = new FileInputStream(FILEPATH + fileName
					+ ".ser");
			ObjectInputStream oos = new ObjectInputStream(fos);
			return oos.readObject();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void main1(String[] args) {
		List<Message> list = new ArrayList<Message>();
		for (int i = 0; i < 1; i++) {
			Message msg = new Message();
			msg.setCategory((byte) 1);
			msg.setMessage(i + "First Message" + i);
			msg.setPriority((byte) 4);
			msg.setSupplyLocation((byte) 4);
			msg.setTerriority((byte) 5);
			list.add(msg);
		}
		writeToStream(list, "msg");
		list = (List<Message>) readFromStream("msg");
		for (Message msg : list) {
			System.out.println(msg.getMessage());
		}

	}

	public static void mains(String[] args) {
		// System.out.println(now());
		String futureString = "11-01-2018";
		// String futureString = "29-12-2017";
		Date date = stringToDate(futureString);
		/*
		 * System.out.println("date : "+date); String str = dateToString(date);
		 * System.out.println("str : "+str);
		 */
		Date currentDate = new Date();
		System.out.println(isReminder(date));
		System.out.println("Now            : " + currentDate.getTime());
		System.out.println("Specific DATE : " + date.getTime());
		long remainingDate = (date.getTime() - currentDate.getTime()) / 86400000;
		System.out.println("Difference  : " + remainingDate);
	}

	public static boolean isReminder(Date ipDate) {
		Date currentDate = new Date();
		long remainingDate = (ipDate.getTime() - currentDate.getTime()) / 86400000;
		System.out.println(remainingDate);
		if (remainingDate < 31) {
			return true;
		} else {
			return false;
		}
	}

	public static String now() {
		String DATE_FORMAT_NOW = "dd-MMM-yyyy";
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
		return sdf.format(cal.getTime());
	}

	public static Date stringToDate(String string) {
		// String string = "28-12-2017";
		try {

			if (string == null || string.equals("")) {
				string = "17.08.2018";
			}
			System.out.println("SRIGN >>" + string);
			DateFormat format = new SimpleDateFormat("dd.MM.yyyy");
			Date date = format.parse(string);
			return date;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String dateToString(Date date) {
		String dateString = null;
		SimpleDateFormat sdfr = new SimpleDateFormat("dd-MM-yyyy");

		try {
			dateString = sdfr.format(date);
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return dateString;
	}

}
