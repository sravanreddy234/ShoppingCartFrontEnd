package com.niit.shoppingcart;




import javax.servlet.http.HttpSession;

import org.h2.engine.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	private Supplier supplier;

	@Autowired
	private SupplierDAO supplierDAO;
	
	

	@RequestMapping(value = "/supplier", method = RequestMethod.GET)
	public String listSupplier(Model model) {
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", supplierDAO.list());
		return "supplier";
	}

	@RequestMapping(value = "supplier/add", method = RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier) {
		//check if the record exist with this id
		//if exist, display error message to the admin record already  exist
		//else save the record
		
		ModelAndView mv = new ModelAndView("/supplier");
		if (supplierDAO.get(supplier.getSupplierId()) == null) {
			supplierDAO.save(supplier);
		} else {
		 
				supplierDAO.update(supplier);
		}
		return "redirect:/manageSuppliers";

	}
	/*@RequestMapping(value="supplier/edit/{id}")
	public ModelAndView editSupplier(@PathVariable("id") String id,HttpSession session){
		System.out.println(id);
		ModelAndView mv=new ModelAndView("/Home");
		Supplier supplier=supplierDAO.get(id);
		session.setAttribute("supplier", supplier);
		System.out.println(id);
		mv.addObject("userClickedEdit", "true");
		
		return mv;
	}
	*/
	
	@RequestMapping(value= "supplier/Update/{id}")
	public String updateSupplier(@PathVariable("id") String id ) {
		//check whether supplier exist with this id?
		//if exists, update the existing supplier
		//if doesnot exist display error message
		System.out.println("updateSupplier method");
		//String id=supplier.getId();
		 supplier=supplierDAO.get(id);
			System.out.println(supplier.getSupplierId());
		ModelAndView mv = new ModelAndView();

		if (supplierDAO.get(supplier.getSupplierId()) != null) {
			supplierDAO.update(supplier);
			System.out.println("updated");
		} else {
			mv.addObject("ErrorMessage", "couldnot update the record");
		}
		return "redirect:/supplier";
	}

	@RequestMapping("supplier/Remove/{id}")
	public String  deleteSupplier(@PathVariable("id") String id)
			throws Exception {
		//if id exist in supplier delete it
		//else display error message
		System.out.println("deleteSupplier method");
		System.out.println(id);
		Supplier supplier=supplierDAO.get(id);
		ModelAndView mv = new ModelAndView("supplier");
	
	boolean flag=	supplierDAO.delete(supplier);
		if(flag==true){
			System.out.println("i am in delete operation");
		}
		else{
			mv.addObject("ErrorMessage", "could not delete the record");
		}
		return "redirect:/manageSuppliers";
	}
}