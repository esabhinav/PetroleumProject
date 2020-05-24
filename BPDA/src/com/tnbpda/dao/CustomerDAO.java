package com.tnbpda.dao;

import java.util.List;

import com.tnbpda.vo.Customer;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.User;

public interface CustomerDAO {

	public void insertCustomer(Customer guna);

	public List<Customer> deleteCustomer(Customer guna);

	public Customer readCustomer(Customer guna);

	public List<Customer> cutomerList(Customer guna);

	public void updateCustomer(Customer guna);
}
