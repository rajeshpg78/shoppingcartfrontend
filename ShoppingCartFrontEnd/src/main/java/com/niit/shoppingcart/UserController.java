package com.niit.shoppingcart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.User;

@Controller
public class UserController {
	@Autowired
	Category category;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	User user;
	@Autowired
	UserDAO userDAO;
	@Autowired
	Cart cart;
	@Autowired
	CartDAO cartDAO;

	@RequestMapping(value = "userregister", method = RequestMethod.POST)
	public ModelAndView saveUser(User user) {
		System.out.println("usercontroller");
		ModelAndView mv = new ModelAndView("/home");
		userDAO.saveOrUpdate(user);
		mv.addObject("message", "successfully registered");
		return mv;
	}

	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(value = "name") String userID,
			@RequestParam(value = "password") String password, HttpSession session) {
		/*
		 * log.debug("Starting of the method login");
		 * log.info("userID is {}  password is {}", userID, password);
		 */

		ModelAndView mv;
		boolean isValidUser = userDAO.isValidUser(userID, password);
		if (isValidUser == true) {
			user = userDAO.get(userID);
			session.setAttribute("loggedInUser", user.getName());
			if (user.getAdmin() == 1) {
				mv = new ModelAndView("/adminHome");

				mv.addObject("isAdmin", "true");
				System.out.println("this is admin");
				

			} else {
				mv = new ModelAndView("/home");

				User user = userDAO.get(userID);
				String uname = user.getName();
				

				//mv.addObject("isAdmin", "false");
				System.out.println("end user");
				cart = cartDAO.get(userID);
				mv.addObject("cart", cart);
				List<Cart> cartList = cartDAO.list();
				mv.addObject("cartList", cartList);
				mv.addObject("cartSize", cartList.size());
			}

		} else {
			mv = new ModelAndView("/signin");
			// mv.addObject("invalidCredentials", "true");
			mv.addObject("errorMessage", "Invalid Credentials");
		}
		/* log.debug("Ending of the method login"); */
		return mv;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("/home");
		session.invalidate();
		session = request.getSession(true);
		session.setAttribute("category", category);
		session.setAttribute("categoryList", categoryDAO.list());

		mv.addObject("logoutMessage", "You successfully logged out");
		mv.addObject("loggedOut", "true");

		return mv;
	}

}
