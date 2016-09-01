package com.niit.shopingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shopingcart.dao.SupplierDAO;
import com.niit.shopingcart.model.Supplier;
import com.niit.shopingcart.util.Util;

@Controller
public class SupplierController  {
	
	private SupplierDAO supplierDAO;
	
	@Autowired(required=true)
	@Qualifier(value="supplierDAO")
	public void setSupplierDAO(SupplierDAO ps){
		this.supplierDAO = ps;
	}
	
	@RequestMapping(value = "/suppliers", method = RequestMethod.GET)
	public String listSuppliers(Model model) 
	{
		model.addAttribute("isAdminClickedSuppliers", true);
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("supplierList", this.supplierDAO.list());
		model.addAttribute("isAdminClickedSuppliers", true);
		return "home";
	}
	
	//For add and update supplier both
	@RequestMapping(value= "/supplier/add", method = RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier){
		Util util=new Util();
		String id=  util.replace(supplier.getId(), ",", "");
		supplier.setId(id);
	
			supplierDAO.saveOrUpdate(supplier);
		
		return "redirect:/suppliers";
		
	}
	
	@RequestMapping("supplier/remove/{id}")
    public String removeSupplier(@PathVariable("id") String id,ModelMap model) throws Exception{
		
       try {
		supplierDAO.delete(id);
		model.addAttribute("message","Successfully Added");
	} catch (Exception e) {
		model.addAttribute("myjsp", "hello");
		e.printStackTrace();
	}
       //redirectAttrs.addFlashAttribute(arg0, arg1)
        return "redirect:/suppliers";
    }
////	@RequestMapping("supplier/remove/{id}")
////    public ModelAndView removeSupplier(@PathVariable("id") String id,ModelMap model) throws Exception{
////		ModelAndView mv=new ModelAndView(  "redirect:/suppliers");
////       try {
////		supplierDAO.delete(id);
////		model.addAttribute("message","Successfully Added");
////		 
////		 
////	} catch (Exception e) {
////		//return new ModelAndView("myjsp","exception",e);
////		mv.addObject("deletemessage", "uuuuuuuuuuu");
////		return mv;
////	}
//       //redirectAttrs.addFlashAttribute(arg0, arg1)
//        return mv;
//    }
 
    @RequestMapping("supplier/edit/{id}")
    public String editSupplier(@PathVariable("id") String id, Model model){
    	System.out.println("editSupplier");
        model.addAttribute("supplier", this.supplierDAO.get(id));
        model.addAttribute("listSuppliers", this.supplierDAO.list());
        return "supplier";
    }
	}
