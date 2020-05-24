package com.tnbpda.dao.objImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.tnbpda.dao.ReminderDAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Calibration;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Message;
import com.tnbpda.vo.Reminder;

public class ReminderDAOImpl implements ReminderDAO, TNBPDAConstants {

	String fName = "reminder";
	

	@Override
	public void updateDetails(Reminder cali) {
		System.out.println("going to update details calibration : ");
		try {
			HashMap<String, Calibration> calibrationMap = (HashMap<String, Calibration>) TNBPDAUtil
					.readFromStream(fName);
			if (calibrationMap == null) {
				calibrationMap = new HashMap<String, Calibration>();
			}

			TNBPDAUtil.writeToStream(calibrationMap, fName);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Reminder> readDetails(Reminder cali) {
		List<Reminder> showList = new ArrayList<Reminder>();
		try {
			List<Reminder> reminderList = (List<Reminder>) TNBPDAUtil
					.retrieveItems(cali.getCcNo());

			Date currentDate = new Date();
			for (Reminder re : reminderList) {
				int remDay = re.getReminder();
				Date expDate = TNBPDAUtil.getFormat(re.getExpDate(),FORMAT);
				long remainingDate = (expDate.getTime() - currentDate.getTime()) / 86400000;
				if (remainingDate < remDay) {
					Date date = TNBPDAUtil.getFormat(re.getExpDate(),FORMAT); 
					re.setExpDate(TNBPDAUtil.convertDateToString(date, MONTH_FORMAT));
					showList.add(re);
					System.out.println(re.getRenewalType() + re.getPeriod()
							+ " : " + re.getExpDate() + " : "
							+ re.getReminder());
					System.out.println("------------------" + expDate
							+ "------------------------");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return showList;
	}

}
