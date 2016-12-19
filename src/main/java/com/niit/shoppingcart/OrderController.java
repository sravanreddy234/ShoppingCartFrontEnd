/*package com.niit.shoppingcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.shoppingcart.dao.CartService;
import com.niit.shoppingcart.dao.CustomerOrderService;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.CustomerOrder;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class OrderController {

    @Autowired
    private CartService cartService;

    @Autowired
    private CustomerOrderService customerOrderService;

    @RequestMapping("/order/{cartId}")
    public String createOrder(@PathVariable("cartId") int cartId){
        CustomerOrder customerOrder = new CustomerOrder();
        Cart cart = cartService.getCartById(cartId);
        customerOrder.setCart(cart);

        UserDetails userDetails = cart.getUserDetails();
        customerOrder.setUserDetails(userDetails);
        customerOrder.setBillingAddress(userDetails.getBillingAddress());
        userDetails.setShippingAddress(userDetails.getShippingAddress());

        customerOrderService.addCustomerOrder(customerOrder);

        return "redirect:/checkout?cartId=" + cartId;

    }

} // The End of Class;
*/