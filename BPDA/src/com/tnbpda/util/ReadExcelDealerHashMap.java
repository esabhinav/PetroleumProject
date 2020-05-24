package com.tnbpda.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

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

public class ReadExcelDealerHashMap 
{
	static  Map<String,String> disMap = TNBPDAUtil.loadDistrict();
	 static Map<String,String> locMap = TNBPDAUtil.loadSupplyLocation();
	 static Map<String,String> terrMap = TNBPDAUtil.loadTerriority();
	
	public static void main(String[] args) 
	{
		try
		{
			String fileName="DealerDirectory.xls";
			//fileName="Dealers_List.xls";
			FileInputStream file = new FileInputStream(new File(fileName));

			//Create Workbook instance holding reference to .xlsx file
			HSSFWorkbook workbook = new HSSFWorkbook(file);
			 
			//Get first/desired sheet from the workbook
			HSSFSheet sheet = workbook.getSheetAt(0);

			//Iterate through each rows one by one
			Iterator<Row> rowIterator = sheet.iterator();
			List<Dealer> dealerLists = new ArrayList<Dealer>();
			
			TreeMap<String,Dealer> map = new TreeMap<String,Dealer>();
			
			 rowIterator.next();
			 
			 
			while (rowIterator.hasNext()) 
			{
				System.out.println("Row start..s");
				Dealer panneer =  new Dealer();
				Row row = rowIterator.next();
				
				//For each row, iterate through all the columns
				Iterator<Cell> cellIterator = row.cellIterator();
				
				try {
					if(row.getCell(3)!=null) {
					  //	dealerList.add(panneer);
						System.out.println(" XWLL ?"+row.getCell(3).getCellType());
						if(row.getCell(3).getCellType()==0) {
						double ccNo = row.getCell(3).getNumericCellValue();
						panneer.setCcNo((int)ccNo);;
						 
						panneer.setPassword(NumberToTextConverter.toText(row.getCell(3).getNumericCellValue()));
						}
					}
					panneer.setRoName(row.getCell(1).getStringCellValue());
					if(row.getCell(2)!=null)
					panneer.setFirstName(row.getCell(2).getStringCellValue());
					panneer.setLastName("");
					
					panneer.setCity(row.getCell(4).getStringCellValue());
					
					updateDis(panneer,row);
					
					
					if(row.getCell(8)!=null) {
						 String str = NumberToTextConverter.toText(row.getCell(8).getNumericCellValue());
						 System.out.println("mobile "+str);
				/*	double mobileNo = row.getCell(8).getNumericCellValue();
					System.out.println(mobileNo);*/
					 panneer.setMobileNo(str);
					} else {
						panneer.setMobileNo("");
					}
					
					if(row.getCell(9)!=null)
					panneer.setEmailID(row.getCell(9).getStringCellValue());
					
					panneer.setSubscriptinFee((int)row.getCell(10).getNumericCellValue());
					
					
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
					map.put(String.valueOf(panneer.getCcNo()), panneer);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			/*	while (cellIterator.hasNext()) 
				{
					
					Cell cell = cellIterator.next();
					
					//Check the cell type and format accordingly
					switch (cell.getCellType()) 
					{
						case Cell.CELL_TYPE_NUMERIC:
							double cc = Double.valueOf(cell.getNumericCellValue());
							String str = String.valueOf(cell.getNumericCellValue());
							int ccNo = Integer.parseInt(str.substring(0,6));
							dealer.setCcNo(ccNo);
							dealer.setUserName(ccNo+"");
							dealer.setPassword(String.valueOf(ccNo));
							dealer.setFirstTime(true);
							dealer.setFirstName("");
							dealer.setLastName("");
							dealer.setDateOfBirth("");
							dealer.setDistrict("");
							dealer.setEmailID("");
							dealer.setSupplyLocation("");
							dealer.setZipCode(0);
							dealer.setAddress1("");
							dealer.setAddress2("");
							dealer.setAssociation(false);
							dealer.setMobileNo("");
							dealer.setLandLine("");
							dealer.setPost("");
							dealer.setAccessLevel("User");
						//	System.out.print(str.substring(0,6)+ "\t");
							break;
						case Cell.CELL_TYPE_STRING:
							dealer.setRoName(cell.getStringCellValue());
						//	System.out.print(cell.getStringCellValue() + "\t");
							break;
					}
				}*/
				System.out.println("");
			}
			//System.out.println("Dealer Size : "+dealerList.size());
			
			DealerDAOImplHashMap dao = new DealerDAOImplHashMap();
			
		 	 dao.insertAllDealer(map);
			/*for(Dealer  dea : dealerList) {
				dao.insertDealer(dea);
			}*/
		 	// dao.insertAllDealer(map);
			
			file.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	private static void updateDis(Dealer panneer, Row row) {
		String dis = row.getCell(5).getStringCellValue();
 		String terr = row.getCell(6).getStringCellValue();
		String loc = row.getCell(7).getStringCellValue();
		System.out.println("Dis :"+dis +":SL:"+loc + ":terr:"+terr);
		Iterator<Map.Entry<String, String>> it = disMap.entrySet().iterator();
		/*while(it.hasNext()) {
			Map.Entry<String, String> me = it.next();
			if(me.getKey()).equalsIgnoreCase(dis)) {
				 panneer.setDistrict(me.getKey());
			}
		}*/
		if(disMap.containsKey(dis)) {
			 panneer.setDistrict(disMap.get(dis));
		}
		
		  it = locMap.entrySet().iterator();
		while(it.hasNext()) {
			Map.Entry<String, String> me = it.next();
			if(me.getValue().equalsIgnoreCase(loc)) {
				 panneer.setSupplyLocation(me.getKey());
			}
		}
		
		  it = terrMap.entrySet().iterator();
			while(it.hasNext()) {
				Map.Entry<String, String> me = it.next();
				if(me.getValue().equalsIgnoreCase(terr)) {
					 panneer.setTerriority(me.getKey());
				}
			} 
	}
}
