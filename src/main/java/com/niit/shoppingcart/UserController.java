package com.niit.shoppingcart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class UserController {
	
	//when the user clicked login
	//based on the credentials,i want to find whether he is admin or not
	//if the user exist,i want to navigate to home page
	//if the user does not exist with his credentials, i want to give error message
    
	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@Autowired
	UserDetails userDetails;
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(value="id") String id,
			@RequestParam(value="password") String password,HttpSession session){
		
		ModelAndView mv = new ModelAndView("home");
		String msg;
		userDetails = userDetailsDAO.isValidUser(id,password);
		if(userDetails==null)
		{
			msg="Invalid user.....please try again";
		}
		else
		{
			//find whether the user is admin or not
			if(userDetails.getRole().equals("ROLE_ADMIN")){
				mv = new ModelAndView("adminHome");
			} 
			
			session.setAttribute("Welcomemsg",userDetails.getName());
			session.setAttribute("userID",userDetails.getId());
			
		}
		return mv;
		
	}
}
