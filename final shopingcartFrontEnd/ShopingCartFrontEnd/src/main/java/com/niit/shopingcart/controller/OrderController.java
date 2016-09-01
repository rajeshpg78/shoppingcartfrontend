package com.niit.shopingcart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shopingcart.dao.CartDAO;
import com.niit.shopingcart.dao.UserDAO;
import com.niit.shopingcart.dao.UserOrderDAO;
import com.niit.shopingcart.model.Cart;
import com.niit.shopingcart.model.UserDetails;
import com.niit.shopingcart.model.UserOrder;

@Controller
public class OrderController {
	
	
	@Autowired(required = true)
	private UserOrderDAO userOrderDAO;
	
	@Autowired(required=true)
	private UserDAO userDAO;
	
	@Autowired(required=true)
	private CartDAO cartDAO;
	@Autowired
	private UserOrder userOrder; 
	@Autowired
	private UserDetails userDetails;
	
@RequestMapping(value = "/order" ,method=RequestMethod.POST)
	
		public ModelAndView createOrder(@RequestParam("billingAddress") String billingAddress , @RequestParam("shippingAddress") String shippingAddress , @RequestParam("pay_type") String pay_type ,HttpSession session ) {
		System.out.println("");
		UserOrder userOrder=new UserOrder();
		userOrder.setBillingAddress(billingAddress);
		userOrder.setShippingAddress(shippingAddress);
		userOrder.setPay_type(pay_type);
		 String loggedInUser_ID=(String)session.getAttribute("loggedInUser_ID");
		 userOrder.setUserDetails(userDAO.get(loggedInUser_ID));
		userOrderDAO.saveOrUpdate(userOrder);
		ModelAndView mv  = new ModelAndView("/home");
		mv.addObject("isUserClickedPlaceOrder",true);
		mv.addObject( "message","You are order is confirmed");
		mv.addObject("shippingAddress",userOrder.getShippingAddress());
		List<Cart> cartItems = (List<Cart>)this.cartDAO.list();;
         int sum=0;
        for (Cart item : cartItems){
        	int price=item.getPrice();
             sum=sum+price;
        }
        mv.addObject("Totalamount",sum);

		
		 return mv;

	}


@RequestMapping("/proceed")
	
	public String proceed(Model model){
	model.addAttribute("isUserClickedProceed", true);
	
	return "/home";

}
}