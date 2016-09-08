package com.niit.shoppingcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.shoppingcart.dao.CategoryDAO;

import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.util.Util;

@Controller
public class CategoryController {

	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	Category category;
	
	@RequestMapping(value="/category", method=RequestMethod.GET)
	public String listCategory(Model m){
		
		m.addAttribute("Category", category);
		m.addAttribute("Category", this.categoryDAO.list());
		return "category";
		
	}

	@RequestMapping(value="/category/add", method=RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") Category category)
	{
		String newID=Util.removeCommaa(category.getId());
		categoryDAO.save(category);
		
		return "category";
	}
	
	@RequestMapping("/category/remove/{id}")
	public String deleteCategory(@PathVariable("id") String id)
	{
		
		categoryDAO.delete(category);
		return "category";
	}
	@RequestMapping("/category/edit/{id}")
	public String updateCategory(@PathVariable("id") String id)
	{
		categoryDAO.update(category);
		return "category";
	}
	
		
	
}
