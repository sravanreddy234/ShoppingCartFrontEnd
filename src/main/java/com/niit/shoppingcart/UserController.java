package com.niit.shoppingcart;



import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CartDAO;
/*import com.niit.shoppingcart.dao.CartDAO;*/
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.Cart;
/*import com.niit.shoppingcart.model.Cart;*/
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class UserController {
	

	@Autowired
	UserDetailsDAO userDetailsDAO;

	@Autowired
	UserDetails userDetails;

	@Autowired
	Category category;

	@Autowired
	Supplier supplier;
	@Autowired
	Product product;
	@Autowired
	ProductDAO productDAO;

	@Autowired
	SupplierDAO supplierDAO;
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	Cart cart;
	
	@Autowired
	CartDAO cartDAO;

	@RequestMapping(value="login"  , method=RequestMethod.POST)
	public ModelAndView login(@RequestParam(value = "name") String name,@RequestParam(value = "password") String password,HttpSession session) {
		System.out.println("xxxxxxxxxxxxxxxx");
		ModelAndView mv = new ModelAndView("/Home");
		boolean isValidUser = userDetailsDAO.isValidUser(name, password);
		
		if (isValidUser == true) {
		userDetails=userDetailsDAO.get(name);
		session.setAttribute("loggedInUser", userDetails.getName());
		session.setAttribute("loggedInUserID", userDetails.getId());
		session.setAttribute("userDetails", userDetails);
		
			// find out whether the user is admin or not
			if (userDetails.getRole().equals("ROLE_ADMIN")) {
				mv.addObject("isAdmin", "true");
				session.setAttribute("supplier",supplier);
				session.setAttribute("supplierList",supplierDAO.list());
				session.setAttribute("product",product);
				session.setAttribute("productList",productDAO.list());
				
				session.setAttribute("category",category);
				session.setAttribute("categoryList",categoryDAO.list());
				
			}
			
			else{
				mv.addObject("isAdmin", "false");
	
				session.setAttribute("product",product);
				session.setAttribute("productList",productDAO.list());
				
				session.setAttribute("category",category);
				session.setAttribute("categoryList",categoryDAO.list());
		
			
			}
		}
		else{
			
				mv.addObject("InvalidCredentials", "true");
			mv.addObject("errorMessage", "Invalid UserId or UserName");
			session.setAttribute("supplier",supplier);
			session.setAttribute("supplierList",supplierDAO.list());
			session.setAttribute("product",product);
			session.setAttribute("productList",productDAO.list());
			
			session.setAttribute("category",category);
			session.setAttribute("categoryList",categoryDAO.list());
		}
		return mv;
		}
	

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("/Home");
		session.invalidate();
		session = request.getSession(true);
		session.setAttribute("supplier",supplier);
		session.setAttribute("supplierList",supplierDAO.list());
		
		session.setAttribute("category",category);
		session.setAttribute("categoryList",categoryDAO.list());
		
		session.setAttribute("product",product);
		session.setAttribute("productList",productDAO.list());
		
		mv.addObject("logoutMsg", "LOGOUT SUCCESSFUL");
		mv.addObject("loggedout", "true");
		
		return mv;

	}
}
