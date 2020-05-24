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

public class DealerExcelWrite implements TNBPDAConstants {

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
		setHeaderValue(row, colNum++, style, "DealerShipStatus");

		setHeaderValue(row, colNum++, style, "Commision Date");
		setHeaderValue(row, colNum++, style, "Personal Email");
		setHeaderValue(row, colNum++, style, "Official Email");
		setHeaderValue(row, colNum++, style, "Date Of Birth");

		setHeaderValue(row, colNum++, style, "Mobile No");
		setHeaderValue(row, colNum++, style, "Land Line");
		setHeaderValue(row, colNum++, style, "Address 1");
		setHeaderValue(row, colNum++, style, "Address 2");

		setHeaderValue(row, colNum++, style, "City");
		setHeaderValue(row, colNum++, style, "District");
		setHeaderValue(row, colNum++, style, "Supply Location");

		setHeaderValue(row, colNum++, style, "Terriority");

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

	public static HSSFWorkbook writingROToExcel(HSSFWorkbook workbook, List<RO> roList) {
		//XSSFWorkbook workbook = new XSSFWorkbook();
	//	XSSFSheet sheet = workbook.createSheet("RO Information");
		HSSFSheet sheet = workbook.createSheet("RO Information");
		int rowNum = 0;
		CellStyle style = setStyle(sheet);

		Row row = sheet.createRow(rowNum++);
		int colNum = 0;

	//	Iterator<Map.Entry<String, RO>> it = mapRO.entrySet().iterator();

		setHeaderValue(row, colNum++, style, "CCNo");
		// setHeaderValue(row,colNum++,style,"RO Name");

		setHeaderValue(row, colNum++, style, "RO Type");
		setHeaderValue(row, colNum++, style, "RO Level");

		setHeaderValue(row, colNum++, style, "Date Of Commission");
		setHeaderValue(row, colNum++, style, "Status of Dealer ship");
		
		//setHeaderValue(row, colNum++, style, "ExplosiveLic");

		setHeaderValue(row, colNum++, style, "MS Tank Capacity");
		setHeaderValue(row, colNum++, style, "Number of MS Tank ");
		setHeaderValue(row, colNum++, style, "Speed Tank Capacity");
		setHeaderValue(row, colNum++, style, "Number of Speed Tank ");
		setHeaderValue(row, colNum++, style, "Speed97 Tank Capacity");
		setHeaderValue(row, colNum++, style, "Number of Speed97 Tank ");
		setHeaderValue(row, colNum++, style, "HSD Tank Capacity");
		setHeaderValue(row, colNum++, style, "Number of HSD Tank "); 
		setHeaderValue(row, colNum++, style, "HiSpeed Tank Capacity");
		setHeaderValue(row, colNum++, style, "Number of HiSpeed Tank ");

		setHeaderValue(row, colNum++, style, "MS Nozzle");
		setHeaderValue(row, colNum++, style, "MS Avg Sales");
		setHeaderValue(row, colNum++, style, "Speed Nozzle");
		setHeaderValue(row, colNum++, style, "Speed Avg Sales");
		setHeaderValue(row, colNum++, style, "Speed97 Nozzle");
		setHeaderValue(row, colNum++, style, "Speed97 Avg Sales");
		setHeaderValue(row, colNum++, style, "HSD Nozzle");
		setHeaderValue(row, colNum++, style, "HSD Avg Sales");
		setHeaderValue(row, colNum++, style, "HiSpeed Nozzle");
		setHeaderValue(row, colNum++, style, "HiSpeed Avg Sales");
	
		setHeaderValue(row, colNum++, style, "Midco");
		setHeaderValue(row, colNum++, style, "Midco Yr");
		setHeaderValue(row, colNum++, style, "L&T");
		setHeaderValue(row, colNum++, style, "L&T Yr");
		setHeaderValue(row, colNum++, style, "Gilbergo");
		setHeaderValue(row, colNum++, style, "Gilbergo Yr");
		setHeaderValue(row, colNum++, style, "Wayne");
		setHeaderValue(row, colNum++, style, "Wayne Yr");
		setHeaderValue(row, colNum++, style, "Tokheim");
		setHeaderValue(row, colNum++, style, "Tokheim Yr");
		
		setHeaderValue(row, colNum++, style, "Canopy (Y/N)");

		setHeaderValue(row, colNum++, style, "Canopylights");
		setHeaderValue(row, colNum++, style, "Streetlights");
		
		setHeaderValue(row, colNum++, style, "Automated (Y/N)");
		setHeaderValue(row, colNum++, style, "PayOver(Y/N)");
		setHeaderValue(row, colNum++, style, "CMS ");
		setHeaderValue(row, colNum++, style, "CMS Machine Type ");
		
		setHeaderValue(row, colNum++, style, "POS ");
		setHeaderValue(row, colNum++, style, "Quantity(No of POS)");
		setHeaderValue(row, colNum++, style, "Banks ");
		
		setHeaderValue(row, colNum++, style, "ATM ");
		
		setHeaderValue(row, colNum++, style, "Generator");
		setHeaderValue(row, colNum++, style, "Capacity(KVA)");
		setHeaderValue(row, colNum++, style, "Make ");
		
		setHeaderValue(row, colNum++, style, "Solar");
		setHeaderValue(row, colNum++, style, "Capacity(KVA)");
		setHeaderValue(row, colNum++, style, "Make");
		setHeaderValue(row, colNum++, style, "12 KL Tank Lorry");
		setHeaderValue(row, colNum++, style, "20 KL Tank Lorry");
		setHeaderValue(row, colNum++, style, "24 KL Tank Lorry");
		setHeaderValue(row, colNum++, style, "EDFS(Bank Name)");
		setHeaderValue(row, colNum++, style, "General Comments ");
		setHeaderValue(row, colNum++, style, "updated ");
		/***** ENd ****/
		//if(false)
		System.out.println("List sixe "+roList.size());
 for(RO ro :roList) {
		//while (it.hasNext()) {
		/*	Map.Entry<String, RO> me = it.next();
			RO ro = me.getValue();*/
		 
			colNum = 0;
			row = sheet.createRow(rowNum++);
			Cell cell = row.createCell(colNum++);
			setValue(ro.getCcNo(), cell);
			cell = row.createCell(colNum++);
			setValue(ro.getRot(), cell);
			cell = row.createCell(colNum++);
			setValue(ro.getRoType(), cell);
			
			cell = row.createCell(colNum++);
			setValue(ro.getCommisionDate(), cell);
			cell = row.createCell(colNum++);
			setValue(ro.getDealShipStatus(), cell);
			
		//	cell = row.createCell(colNum++);
			//setValue(ro.getExplosiveLic(), cell);
			Tank tank  = ro.getTankList().get(MS);
		 	cell = row.createCell(colNum++);
	 		setValue(tank.getCapacity(), cell);
			cell = row.createCell(colNum++);
			setValue(tank.getNoOfTanks(), cell);
			
			tank  = ro.getTankList().get(SPEED);
			cell = row.createCell(colNum++);
			setValue(tank.getCapacity(), cell);
			cell = row.createCell(colNum++);
			setValue(tank.getNoOfTanks(), cell);
			
			tank  = ro.getTankList().get(SPEED97);
			cell = row.createCell(colNum++);
			setValue(tank.getCapacity(), cell);
			cell = row.createCell(colNum++);
			setValue(tank.getNoOfTanks(), cell);
			
			
			tank  = ro.getTankList().get(HSD);
			cell = row.createCell(colNum++);
			setValue(tank.getCapacity(), cell);
			cell = row.createCell(colNum++);
			setValue(tank.getNoOfTanks(), cell);
			
			tank  = ro.getTankList().get(HISPEED);
			cell = row.createCell(colNum++);
			setValue(tank.getCapacity(), cell);
			cell = row.createCell(colNum++);
			setValue(tank.getNoOfTanks(), cell);
			
			 
			MPD mpd = ro.getMpdList().get(MS);
			cell = row.createCell(colNum++);
			setValue(mpd.getNoOfNozzle(), cell);
			cell = row.createCell(colNum++);
			setValue(mpd.getAverageSales(), cell);
			
			mpd = ro.getMpdList().get(SPEED);
			cell = row.createCell(colNum++);
			setValue(mpd.getNoOfNozzle(), cell);
			cell = row.createCell(colNum++);
			setValue(mpd.getAverageSales(), cell);
			
			mpd = ro.getMpdList().get(SPEED97);
			cell = row.createCell(colNum++);
			setValue(mpd.getNoOfNozzle(), cell);
			cell = row.createCell(colNum++);
			setValue(mpd.getAverageSales(), cell);
			
			mpd = ro.getMpdList().get(HSD);
			cell = row.createCell(colNum++);
			setValue(mpd.getNoOfNozzle(), cell);
			cell = row.createCell(colNum++);
			setValue(mpd.getAverageSales(), cell);
			
			mpd = ro.getMpdList().get(HISPEED);
			cell = row.createCell(colNum++);
			setValue(mpd.getNoOfNozzle(), cell);
			cell = row.createCell(colNum++);
			setValue(mpd.getAverageSales(), cell);
			
		 
			
			Pump pump = ro.getPumpList().get(MIDCO);
			cell = row.createCell(colNum++);
			setValue(pump.getUnit(), cell);
			cell = row.createCell(colNum++);
			setValue(pump.getYear(), cell);
			
			pump = ro.getPumpList().get(LT);
			cell = row.createCell(colNum++);
			setValue(pump.getUnit(), cell);
			cell = row.createCell(colNum++);
			setValue(pump.getYear(), cell);
			
			pump = ro.getPumpList().get(GILBERGO);
			cell = row.createCell(colNum++);
			setValue(pump.getUnit(), cell);
			cell = row.createCell(colNum++);
			setValue(pump.getYear(), cell);
			
			pump = ro.getPumpList().get(WAYNE);
			cell = row.createCell(colNum++);
			setValue(pump.getUnit(), cell);
			cell = row.createCell(colNum++);
			setValue(pump.getYear(), cell);
			
			pump = ro.getPumpList().get(TOKHEIM);
			cell = row.createCell(colNum++);
			setValue(pump.getUnit(), cell);
			cell = row.createCell(colNum++);
			setValue(pump.getYear(), cell);
			
			cell = row.createCell(colNum++);
			if (ro.isCanopy()) {
				setValue("Y", cell);
			} else {
				setValue("N", cell);
			}
			cell = row.createCell(colNum++);
			setValue(ro.getCanopyLights(), cell);
			
			cell = row.createCell(colNum++);
			setValue(ro.getStreetLights(), cell);
			
			cell = row.createCell(colNum++);
			if (ro.isAutomated()) {
				setValue("Y", cell);
			} else {
				setValue("N", cell);
			}

			cell = row.createCell(colNum++);

			if (ro.isPayOver()) {
				setValue("Y", cell);
			} else {
				setValue("N", cell);
			}

			cell = row.createCell(colNum++);
			CMS cms = ro.getFleet();
			if (cms.isAvaialble()) {
				setValue("Y", cell);
				cell = row.createCell(colNum++);
				setValue(cms.getMacType(), cell);
			} else {
				setValue("N", cell);
				cell = row.createCell(colNum++);
				setValue("-NA-", cell);
			}

			cell = row.createCell(colNum++);
			POS pos = ro.getPos();
			if (pos.isAvailable()) {
				setValue("Y", cell);
				cell = row.createCell(colNum++);
				setValue(pos.getQuantity(), cell);
				cell = row.createCell(colNum++);
				setValue(pos.getBanks(), cell);
			} else {
				setValue("N", cell);
				cell = row.createCell(colNum++);
				setValue("-NA-", cell);
				cell = row.createCell(colNum++);
				setValue("-NA-", cell);
			}

			cell = row.createCell(colNum++);
			if (ro.isATM()) {
				setValue("Y", cell);
			} else {
				setValue("N", cell);
			}
			cell = row.createCell(colNum++);
			Generator gen = ro.getGenerator();
			if(gen.isAvailable()) {
				setValue("Y", cell);
				cell = row.createCell(colNum++);
				setValue(gen.getCapacity(), cell);
				cell = row.createCell(colNum++);
				setValue(gen.getMake(), cell);
			} else {
				setValue("N", cell);
				cell = row.createCell(colNum++);
		 		setValue("-NA-", cell);
				cell = row.createCell(colNum++);
				setValue("-NA-", cell);
			}
			cell = row.createCell(colNum++);
			Solar solar= ro.getSolar();
			if(solar.isAvailable()) {
				setValue("Y", cell);
				cell = row.createCell(colNum++);
				setValue(solar.getCapacity(), cell);
				cell = row.createCell(colNum++);
				setValue(solar.getMake(), cell);
			} else {
				setValue("N", cell);
				cell = row.createCell(colNum++);
		 		setValue("-NA-", cell);
				cell = row.createCell(colNum++);
				setValue("-NA-", cell);
			}
			
			cell = row.createCell(colNum++);
			setValue(ro.getLorry12kl(), cell);
			cell = row.createCell(colNum++);
			setValue(ro.getLorry20kl(), cell);
			cell = row.createCell(colNum++);
			setValue(ro.getLorry24kl(), cell);
			cell = row.createCell(colNum++);
			if(ro.getEdfs()!=null) {
			setValue(ro.getEdfs().getBank(), cell);
			} else {
			setValue("-NA-", cell);
			}
			cell = row.createCell(colNum++);
			setValue(ro.getGeneralComments(), cell);
			cell = row.createCell(colNum++);
			setValue(ro.isUpdated(), cell);
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
	
	public static  HSSFWorkbook bothSheet(List<Dealer> listDealer, List<RO> roList) {
		//XSSFWorkbook workbook = new XSSFWorkbook(); // excel 2003
		HSSFWorkbook workbook = new HSSFWorkbook(); // excel 2007
	  	writingToExcel(workbook, listDealer) ;
		writingROToExcel(workbook,roList);
		
		try {
			FileOutputStream outputStream = new FileOutputStream(FILE_NAME);
			 workbook.write(outputStream);
			// workbook.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return workbook;
		//System.out.println("done");
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
