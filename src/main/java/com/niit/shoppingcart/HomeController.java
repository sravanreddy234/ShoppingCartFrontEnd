package com.niit.shoppingcart;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class HomeController {
	
	Logger log=LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	
	@Autowired
	UserDetails userDetails;
	
	//If you want to navigate to other page with out carrying the data.
	
	/*@RequestMapping("/")
	public String home(){
		
		return "Home";
	}*/
	
	//If you want navigate to other page with carrying the data.
	
	@RequestMapping("/")
	public ModelAndView home(HttpSession session)
	{
		log.debug("Starting of the method onLoad");
		ModelAndView mv= new ModelAndView("Home");
		session.setAttribute("category",category);
		session.setAttribute("categoryList",categoryDAO.list());
		mv.addObject("message","Thank you for visiting this url");
		
		//Get all the categories along with products
		//you have to integrate front project to backend project
		List<Category> categoryList=   categoryDAO.list();
		mv.addObject("categoryList",categoryList);
		System.out.println("Size:"+categoryList.size());
		log.debug("Ending of the method onLoad");
		
		return mv;
	}
	//SPA-Single Page Application
	
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public ModelAndView registration(@ModelAttribute UserDetails userDetails)
	{
		ModelAndView mv= new ModelAndView("Home");
		
/*		if(userDetailsDAO.get(userDetails.getId())== null){*/
			userDetailsDAO.save(userDetails);
			return mv;
		/*}
		return mv;*/
		
		
	
	}
	
	@RequestMapping("/Login")
	public ModelAndView login()
	{
		ModelAndView mv= new ModelAndView("Login");
		mv.addObject("userClickLoginHere","true");
		return mv;
		
	}
	@RequestMapping("/Registration")
	public ModelAndView register(){
		ModelAndView mv=new ModelAndView("Registration");
		return mv.addObject("userClickedRegisterHere", true);
	}
}

