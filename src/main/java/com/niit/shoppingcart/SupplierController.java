package com.niit.shoppingcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Supplier;

public class SupplierController {
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	Supplier supplier;
	
	@RequestMapping("/login")
	public String listSupplier(Model m){
	m.addAttribute("Supplier", supplier);
	m.addAttribute("Supplier", this.supplierDAO.list());
	return "supplier";
	}
	
	@RequestMapping(value="/supplier/add", method=RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier)
	{
		
		supplierDAO.save(supplier);
		return "supplier";
	}
	
	
	@RequestMapping("/supplier/remove/{id}")
	public String deleteSupplier(@PathVariable("id") String id){
		
		supplierDAO.delete(supplier);
		
		return "supplier";
	}
	
	@RequestMapping("/supplier/edit/{id}")
	public String updateSupplier(@PathVariable("id") String id)
	{
		 
		supplierDAO.update(supplier);
		return "supplier";
	}
}
