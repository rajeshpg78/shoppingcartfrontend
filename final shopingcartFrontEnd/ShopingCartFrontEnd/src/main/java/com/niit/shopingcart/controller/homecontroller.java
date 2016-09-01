package com.niit.shopingcart.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shopingcart.model.UserDetails;


@Controller
public class homecontroller {
	
	
	private Logger log=LoggerFactory.getLogger("homecontroller.class");

	@Autowired
	UserDetails user;

	@RequestMapping("./")
	public ModelAndView home() {
		log.debug("Starting of the method home");
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("message", "success");
		System.out.println("working c");
		log.debug("End of the method home");
		return mv;
	}

	@RequestMapping("/newuser")
	public ModelAndView registerhere() {
		log.debug("Starting of the method RegisterHere");
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("user", user);
		mv.addObject("message", "successfully registered");
		mv.addObject("isUserClickedRegisterHere", "true");
		log.debug("Endof the method RegisterHere");
		return mv;
	}

	@RequestMapping("/loginhere")
	public ModelAndView loginuserhere() {
		log.debug("Starting of the method loginuserhere");
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("user", user);
		mv.addObject("message", "successfully registered");
		mv.addObject("isUserClickedLoginUserHere","true");
		log.debug("End of the method RegisterHere");
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
