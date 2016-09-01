package com.niit.shopingcart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shopingcart.dao.CartDAO;
import com.niit.shopingcart.dao.CategoryDAO;
import com.niit.shopingcart.dao.ProductDAO;
import com.niit.shopingcart.dao.UserDAO;
import com.niit.shopingcart.model.Cart;
import com.niit.shopingcart.model.Category;
import com.niit.shopingcart.model.Product;
import com.niit.shopingcart.model.UserDetails;



@Controller
@SessionAttributes("userID")
public class UserController {

   @Autowired
	UserDAO userDAO;
    @Autowired
    UserDetails userDetails;
    @Autowired
    Category category;
    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    CartDAO cartDAO;
    @Autowired
   private ProductDAO productDAO;
    
    
    
    @RequestMapping(value="isValidUser",method=RequestMethod.POST)
	public ModelAndView isValidUser(@RequestParam(value = "name") String userID,
			@RequestParam(value = "password") String password,HttpSession session) {
    	ModelAndView mv ;
    	 mv=new ModelAndView("/home");
    	mv.addObject("product",new Product());
    	mv.addObject("productList", this.productDAO.list());
		System.out.println("in controller");
		
		
		String errormessage;
		

		
		boolean isValidUser = userDAO.isValidUser(userID, password);
		if (isValidUser == true) {
			userDetails = userDAO.get(userID);
			session.setAttribute("UserId", userDetails.getId());
			session.setAttribute("loggedInUser", userDetails.getName());
			if (userDetails.getAdmin() == 1) {
				//mv = new ModelAndView("/main");
			mv.addObject("isAdmin", true);
			
			}
			else
			{
				//mv = new ModelAndView("/productlist");
				UserDetails userDetails=userDAO.get(userID);
				mv.addObject("isAdmin", false);
			}
			
		}else
		{
			mv = new ModelAndView("/home");
			mv.addObject("errorMessage", "Invalid Credentials");
		}
		return mv;
	}
	
	
    
   // USER REGISTER
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute UserDetails userDetails) {
		ModelAndView mv=new ModelAndView("/home");
		if(userDAO.get(userDetails.getId())==null)
		{
			userDAO.saveOrUpdate(userDetails);
		}else{
			mv.addObject("message1", "user Already exist");
		}
		
		mv.addObject("successmessage", "you are successfully registered");
	  return mv;
	 }
	
	
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		 
		List<Cart> cartItems = (List<Cart>)this.cartDAO.list();;

        for (Cart item : cartItems){
        	String id=item.getId();
            cartDAO.delete(id);
        }
        
        ModelAndView mv = new ModelAndView("/home");
		session.invalidate();
		session = request.getSession(true);
//		session.setAttribute("category", category);
//		session.setAttribute("categoryList", categoryDAO.list());
		
		mv.addObject("logoutMessage", "You are successfully logged out");
		mv.addObject("loggedOut", "true");
		
		return mv;

	}

	
}


