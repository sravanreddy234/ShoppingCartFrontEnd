package com.niit.shoppingcart;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;
import com.niit.shoppingcart.model.UserDetails;
import com.niit.shoppingcart.util.FileUtil;

@Controller
public class HomeController {

	
	@Autowired
	
	CategoryDAO categoryDAO;
	
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@Autowired
	UserDetails userDetails;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	Product product;
	
	@Autowired
	Category category;
	@Autowired
	Supplier supplier;
	@Autowired
	SupplierDAO supplierDAO;

	/*@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView m = new ModelAndView("Home");
		m.addObject("message", "Hi");
		// get all categories along with products
		// you have to integrate with the backend project
		List<Category> categoryList = categoryDAO.list();
		m.addObject("categoryList", categoryList);
		return m;
	}*/
	
	@RequestMapping("/")
	public ModelAndView home(HttpSession session) {
	ModelAndView m = new ModelAndView("Home");
	m.addObject("image", true);
	session.setAttribute("supplier",supplier);
	session.setAttribute("supplierList",supplierDAO.list());
	session.setAttribute("product",product);
	session.setAttribute("productList",productDAO.list());
	session.setAttribute("category",category);
	session.setAttribute("categoryList",categoryDAO.list());
	return m;
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute("userDetails") UserDetails userDetails) {
		System.out.println("hi");
		ModelAndView mv = new ModelAndView("/Home");
		if(userDetailsDAO.get(userDetails.getId())==null){
			userDetailsDAO.save(userDetails);
			mv.addObject("SuccessMessage","You are successfully register");
		}
		else{
			mv.addObject("failureMessage","user exist  with  this id");
		}
		return mv;
	}
	
	@RequestMapping("/Registration")
	public ModelAndView register(HttpSession session) {
		ModelAndView mv = new ModelAndView("/Home");
		mv.addObject("RegisterMsg", "you are in register page");
		mv.addObject("userDetails", userDetails);
		mv.addObject("userClickedRegisterHere", true);
		session.setAttribute("product",product);
		session.setAttribute("productList",productDAO.list());
		
		session.setAttribute("category",category);
		session.setAttribute("categoryList",categoryDAO.list());
		
		return mv;
	}

	@RequestMapping("/Login")
	public ModelAndView Login(HttpSession session) {
		ModelAndView m = new ModelAndView("/Home");
		m.addObject("LoginMsg", "you are in login page");
		m.addObject("userDetails", userDetails);
		m.addObject("userClickedLoginHere", true);
		session.setAttribute("product",product);
		session.setAttribute("productList",productDAO.list());
		
		session.setAttribute("category",category);
		session.setAttribute("categoryList",categoryDAO.list());
		return m;
	}
	
	@RequestMapping("/403")
	public String denied() {
	
		return "403";
	}
	
	@RequestMapping("/about")
	public ModelAndView about() {
		ModelAndView m = new ModelAndView("/Home");
		m.addObject("LoginMsg", "you are in login page");
		m.addObject("userDetails", userDetails);
		m.addObject("userClickedAboutUs", true);
		return m;
	}
	
	@RequestMapping("/productList")
	public ModelAndView products() {
		ModelAndView m = new ModelAndView("/Home");
		m.addObject("LoginMsg", "you are in login page");
		
		m.addObject("productList", this.productDAO.list());
		m.addObject("userClickedproductList", true);
		
		return m;
	}
	
	 
	
	@RequestMapping(value="/backHome") 
	public String homePage(Model model,HttpSession session){ 
		
		model.addAttribute("image",true);
		//model.addAttribute("clickedQuickBuy", true);
		/*m.addObject("clickedQuickBuy", true);*/
		session.setAttribute("product",product);
		session.setAttribute("productList",productDAO.list());
		
		session.setAttribute("category",category);
		session.setAttribute("categoryList",categoryDAO.list());
		return "Home"; 
				}
	
	@RequestMapping("/cart")
	public ModelAndView cart() {
		ModelAndView m = new ModelAndView("/Home");
		m.addObject("LoginMsg", "you are in login page");
		m.addObject("userDetails", userDetails);
		m.addObject("ifClickedCart", true);
		return m;
	}
	

}

