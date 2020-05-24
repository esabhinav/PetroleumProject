package com.tnbpda.dao;

import java.util.List;

import com.tnbpda.vo.Calibration;
import com.tnbpda.vo.Message;
import com.tnbpda.vo.Reminder;

public interface ReminderDAO {

	public void updateDetails(Reminder cali);

	public List<Reminder> readDetails(Reminder cali);

	 
}
