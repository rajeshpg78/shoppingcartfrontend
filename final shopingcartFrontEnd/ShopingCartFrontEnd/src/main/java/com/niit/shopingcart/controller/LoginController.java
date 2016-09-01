package com.niit.shopingcart.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.shopingcart.dao.ProductDAO;
import com.niit.shopingcart.model.Product;


@Controller
public class LoginController {
	@Autowired
	ProductDAO productDAO;
	@RequestMapping(value="/userInfo",method=RequestMethod.GET)
	public String printwelcome(ModelMap model,Principal principal)
	{
		System.out.println("********login controller ");
		String name=principal.getName();
		model.addAttribute("username",name);
		model.addAttribute("product",new Product());
    	model.addAttribute("productList", this.productDAO.list());
		model.addAttribute("message","Spring security custom form example");
		return "/productlist";
	}
	@RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {
         
        if (principal != null) {
            model.addAttribute("message", "Hi " + principal.getName()
                    + "<br> You do not have permission to access this page!");
        } else {
            model.addAttribute("msg",
                    "You do not have permission to access this page!");
        }
        return "403Page";
    }
	@RequestMapping(value="/admin", method= RequestMethod.GET)
	public String admin()
	{
		return "/adminHome";
	}
}
