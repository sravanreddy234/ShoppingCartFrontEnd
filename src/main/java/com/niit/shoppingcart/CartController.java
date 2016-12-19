package com.niit.shoppingcart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class CartController {
	@Autowired(required = true)
	private Cart cart;

	@Autowired
	Category category;
	
	@Autowired
	Product product;
	
	@Autowired
	UserDetails userDetails;
	
	@Autowired
	UserDetailsDAO userDetailsDAO;

	@Autowired(required = true)
	private CartDAO cartDAO;

	@Autowired(required = true)
	private ProductDAO productDAO;

	@Autowired(required = true)
	private CategoryDAO categoryDAO;

	
	@RequestMapping(value = "myCart", method = RequestMethod.GET)
	public String myCart(Model model, HttpSession session) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String name = auth.getName(); 
		UserDetails userDetails=userDetailsDAO.getCustomerByUserName(name);
		String loggedInUser=userDetails.getId();
		//String loggedInUser=(String) session.getAttribute("loggedInUserID");
		model.addAttribute("cart", new Cart());
		model.addAttribute("product", product);
		model.addAttribute("productList",this.productDAO.list());
		model.addAttribute("category", category);
		model.addAttribute("categoryList",this.categoryDAO.list());
		List<Cart> cartList=cartDAO.getByUser(loggedInUser,"N");
		
		model.addAttribute("cartList", cartList);
	int sum=0;
	if(cartList!=null){
		for(int i=0;i<cartList.size();i++){
			 sum=sum+cartList.get(i).getTotal();
		}
		model.addAttribute("sum",sum);
	}
		model.addAttribute("userclickedcart", true);
		session.setAttribute("loggedInUser", loggedInUser);
		return "/Home";
	
	}

	
	@RequestMapping(value = "/cartadd/{productId}")
	public String addToCart(@PathVariable("productId") String productId,HttpSession session,Model model){
	
		System.out.println(productId);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String name = auth.getName(); 
		UserDetails userDetails=userDetailsDAO.getCustomerByUserName(name);
		String loggedInUser=userDetails.getId();
		//String loggedInUser=(String) session.getAttribute("loggedInUserID");
		Product product = productDAO.get(productId);
		List<Cart> cartList=cartDAO.getByUser(loggedInUser,"N");
		if(loggedInUser==null){
			return "redirect:/Login";
		}
		
		else {
			if (cartList == null) {
				int q = 1;
				cart = new Cart();
				cart.setProductID(product.getProductId());
				cart.setProductName(product.getProductName());
				cart.setProductPrice(product.getPrice());
				cart.setQuantity(q);
				cart.setTotal(cart.getQuantity() * product.getPrice());
				cart.setStatus("N");
				cart.setUserID(loggedInUser);
				boolean flag = cartDAO.save(cart);
				System.out.println(flag);
			} else {
				for (int i = 0; i < cartList.size(); i++) {
					if (product.getProductId() == cartDAO.getByUser(loggedInUser,"N").get(i).getProductID()) {
						cart = cartList.get(i);
						cart.setQuantity(cart.getQuantity() + 1);
						cart.setTotal(cart.getQuantity() * product.getPrice());
						cartDAO.update(cart);
						return "redirect:/Home";
					}
					else{
			int q = 1;
			cart= new Cart();
			cart.setProductID(product.getProductId());
			cart.setProductName(product.getProductName());
			cart.setProductPrice(product.getPrice());
			cart.setQuantity(q);
			cart.setTotal(cart.getQuantity()*product.getPrice());
			cart.setStatus("N");
			cart.setUserID(loggedInUser);
			boolean flag=cartDAO.save(cart);
			System.out.println(flag); 
		return "redirect:/";
		}
				}}
			return "redirect:/";
		}
	}

	
	@RequestMapping(value = "/cart/remove/{cart_id}")
	public String removeCart(@PathVariable("cart_id") String cart_id, Model model) throws Exception {
		System.out.println(cart_id);
		try {
			cart=cartDAO.getCart(cart_id);
			if(cart.getQuantity()>1){
				cart.setQuantity(cart.getQuantity()-1);
				cart.setTotal(cart.getQuantity()*cart.getProductPrice());
				cartDAO.update(cart);
			}else{
				System.out.println("in delete");
			cartDAO.delete(cart);
			model.addAttribute("message", "Successfully removed");
			}
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/myCart";
	}
}




