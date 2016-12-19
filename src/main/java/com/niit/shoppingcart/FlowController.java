/*package com.niit.shoppingcart;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.niit.shoppingcart.dao.BillingAddressDAO;
import com.niit.shoppingcart.dao.CardDetailDAO;
import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.OrderDetailDAO;
import com.niit.shoppingcart.dao.OrderedItemsDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.ShippingAddressDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.BillingAddress;
import com.niit.shoppingcart.model.CardDetail;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.CheckoutDetails;
import com.niit.shoppingcart.model.OrderDetail;
import com.niit.shoppingcart.model.OrderedItems;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.ShippingAddress;
import com.niit.shoppingcart.model.UserDetails;

@Component
public class FlowController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	ShippingAddress shippingAddress;

	@Autowired
	BillingAddress billingAddress;

	@Autowired
	OrderDetail orderDetail;

	@Autowired
	OrderedItems orderedItems;

	@Autowired
	CardDetail cardDetail;

	@Autowired
	ShippingAddressDAO shippingAddressDAO;

	@Autowired
	BillingAddressDAO billingAddressDAO;

	@Autowired
	OrderedItemsDAO orderedItemsDAO;

	@Autowired
	OrderDetailDAO orderDetailDAO;

	@Autowired
	CardDetailDAO cardDetailDAO;
	
	@Autowired
	UserDetails userDetails;
	@Autowired
	UserDetailsDAO userDetailsDAO;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	Cart cart;

	
	@Autowired
	HttpSession httpSession;
	@Autowired
	Product product;
	CheckoutDetails checkoutDetails = new CheckoutDetails();

	public CheckoutDetails initFlow() {
		userDetails = userDetailsDAO.getCustomerByUserName(SecurityContextHolder.getContext()
				.getAuthentication().getName());
		checkoutDetails.setCart((Cart) cartDAO.getByUser(userDetails.getId()));
		checkoutDetails.setUserDetails(userDetailsDAO.getCustomerByUserName(userDetails.getName()));
		return checkoutDetails;
	}

	public String addShippingAddress(CheckoutDetails checkoutDetails, ShippingAddress shippingAddress) {
		userDetails = userDetailsDAO.getCustomerByUserName(SecurityContextHolder.getContext()
				.getAuthentication().getName());

		shippingAddress.setUserId(userDetails.getId());
		checkoutDetails.setShippingAddress(shippingAddress);

		this.shippingAddress.setUserId(userDetails.getId());
		this.shippingAddress.setApartmentNumber(shippingAddress.getApartmentNumber());
		this.shippingAddress.setStreetName(shippingAddress.getStreetName());
		this.shippingAddress.setCity(shippingAddress.getCity());
		this.shippingAddress.setState(shippingAddress.getState());
		this.shippingAddress.setCountry(shippingAddress.getCountry());
		this.shippingAddress.setZipCode(shippingAddress.getZipCode());

		return "success";
	}

	public String addBillingAddress(CheckoutDetails checkoutDetails, BillingAddress billingAddress) {
		userDetails = userDetailsDAO.getCustomerByUserName(SecurityContextHolder.getContext().getAuthentication().getName());
		billingAddress.setUserId(userDetails.getId());
		checkoutDetails.setBillingAddress(billingAddress);

		this.billingAddress.setUserId(userDetails.getId());
		this.billingAddress.setApartmentNumber(billingAddress.getApartmentNumber());
		this.billingAddress.setStreetName(billingAddress.getStreetName());
		this.billingAddress.setCity(billingAddress.getCity());
		this.billingAddress.setState(billingAddress.getState());
		this.billingAddress.setCountry(billingAddress.getCountry());
		this.billingAddress.setZipCode(billingAddress.getZipCode());

		return "success";
	}

	public String addCardDetails(CheckoutDetails checkoutDetails, CardDetail cardDetail) {
		userDetails = userDetailsDAO.getCustomerByUserName(SecurityContextHolder.getContext().getAuthentication().getName());

		cardDetail.setUserId(userDetails.getId());
		//cardDetail.setTotalCost(cartDAO.getByUser(userDetails.getId()));
		cardDetailDAO.saveOrUpdate(cardDetail);

		List<Cart> listOfCartItems = cartDAO.getByUser(userDetails.getId());

		listOfCartItems = cartDAO.getByUser(userDetails.getId());

		//cart = cartDAO.getByUser(userDetails.getId());

		cart.setCart_id(cart.getCart_id());
		cart.setUserID(cart.getUserID());
		//cart.setNoOfProducts(listOfCartItems.size());

		shippingAddressDAO.saveOrUpdate(checkoutDetails.getShippingAddress());
		billingAddressDAO.saveOrUpdate(checkoutDetails.getBillingAddress());
		cartDAO.update(cart);

		//httpSession.setAttribute("noOfProducts", cart.getNoOfProducts());

		return "success";
	}

}*/



package com.niit.shoppingcart;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.niit.shoppingcart.dao.BillingAddressDAO;
import com.niit.shoppingcart.dao.CardDetailDAO;
import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.OrderDetailDAO;
import com.niit.shoppingcart.dao.OrderedItemsDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.ShippingAddressDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.BillingAddress;
import com.niit.shoppingcart.model.CardDetail;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.CheckoutDetails;
import com.niit.shoppingcart.model.OrderDetail;
import com.niit.shoppingcart.model.OrderedItems;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.ShippingAddress;
import com.niit.shoppingcart.model.UserDetails;



@Component(value="flowController")
public class FlowController {
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ShippingAddress shippingAddress;

	@Autowired
	private BillingAddress billingAddress;

	@Autowired
	private OrderDetail orderDetail;

	@Autowired
	private OrderedItems orderedItems;

	@Autowired
	private CardDetail cardDetail;

	@Autowired
	private ShippingAddressDAO shippingAddressDAO;

	@Autowired
	private BillingAddressDAO billingAddressDAO;

	@Autowired
	private OrderedItemsDAO orderedItemsDAO;

	@Autowired
	private OrderDetailDAO orderDetailDAO;

	@Autowired
	private CardDetailDAO cardDetailDAO;
	@Autowired
	UserDetails userDetails;
	
	@Autowired
	UserDetailsDAO  userDetailsDAO ;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	List<Cart> cart;

	
	@Autowired
	HttpSession httpSession;
	@Autowired
	Product product;
	
	
	public ShippingAddress init() {
		
		return new ShippingAddress();
	}

	public String saveDetails(ShippingAddress shippingAddress){
		
		/* Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      String name = auth.getName();
			UserDetails userDetails=userDetailsDAO.getCustomerByUserName(name);
			String loggedInUser = userDetails.getId();
	      shippingAddress.setUserId(loggedInUser);*/
		shippingAddressDAO.saveOrUpdate(shippingAddress);

		return "success";
	}
	public String saveDetails(BillingAddress billingAddress){
		
		/* Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      String name = auth.getName();
			UserDetails userDetails=userDetailsDAO.getCustomerByUserName(name);
			String loggedInUser = userDetails.getId();
	      billingAddress.setUserId(loggedInUser);*/
		billingAddressDAO.saveOrUpdate(billingAddress);
		return "success";
	}
	public String saveDetails(CardDetail cardDetail){
		/*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      String name = auth.getName();
			UserDetails userDetails=userDetailsDAO.getCustomerByUserName(name);
			String loggedInUser = userDetails.getId();
	      cardDetail.setUserId(loggedInUser);*/
		cardDetailDAO.saveOrUpdate(cardDetail);
		return "success";	
	}
	
	
	public String remove(){
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      String name = auth.getName();
			UserDetails userDetails=userDetailsDAO.getCustomerByUserName(name);
			String loggedInUser = userDetails.getId();
			List<Cart> cartList = cartDAO.getByUser(loggedInUser, "N");
			if (cartList != null) {
				for (int i = 0; i < cartList.size(); i++) {
				//cartList.get(i).setStatus("O");
				cartDAO.update(cartList.get(i));
				}
				
			}
			return "success";
	
}
}