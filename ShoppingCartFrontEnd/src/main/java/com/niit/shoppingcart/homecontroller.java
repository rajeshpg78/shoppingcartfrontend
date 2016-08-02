package com.niit.shoppingcart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.model.User;

@Controller
public class homecontroller {

	@Autowired
	User user;

	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("message", "success");
		System.out.println("working c");
		return mv;
	}

	@RequestMapping("/newuser")
	public ModelAndView registerhere() {
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("user", user);
		mv.addObject("message", "successfully registered");
		mv.addObject("isUserClickedRegisterHere", "true");
		return mv;
	}

	@RequestMapping("/loginhere")
	public ModelAndView loginuserhere() {
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("user", user);
		mv.addObject("message", "successfully registered");
		mv.addObject("isUserClickedLoginUserHere", "true");
		return mv;
	}
}
/*
 * @RequestMapping("/login") public ModelAndView
 * login(@RequestParam(value="name")String
 * userId,@RequestParam(value="password") String password,HttpSession session) {
 * Public Boolean isValidUser() {
 * 
 * } }
 */
