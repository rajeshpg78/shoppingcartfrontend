package com.niit.shopingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shopingcart.dao.CategoryDAO;
import com.niit.shopingcart.dao.ProductDAO;
import com.niit.shopingcart.dao.SupplierDAO;
import com.niit.shopingcart.model.Category;
import com.niit.shopingcart.model.Product;
import com.niit.shopingcart.model.Supplier;
import com.niit.shopingcart.util.Util;


@Controller
public class ProductController {

	@Autowired(required=true)
	private ProductDAO productDAO;

	@Autowired(required = true)
	private CategoryDAO categoryDAO;

	@Autowired(required = true)
	private SupplierDAO supplierDAO;
	private String path="H:\\shoppingcart\\img";

	/*
	 * @Autowired(required=true)
	 * 
	 * @Qualifier(value="productDAO") public void setProductDAO(ProductDAO ps){
	 * this.productDAO = ps; }
	 */

	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String listProducts(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("category", new Category());
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("productList", this.productDAO.list());
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("supplierList", this.supplierDAO.list());
		model.addAttribute("isAdminClickedProducts", true);
		return "/home";
	}

	@RequestMapping("product/get/login")
	public ModelAndView orderlogin()
	{
		ModelAndView mv=new ModelAndView("redirect:/loginhere");
		return mv;
	}
	@RequestMapping("product/get/membership")
	public ModelAndView ordersignup()
	{
		ModelAndView mv=new ModelAndView("membership");
		return mv;
	}
	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product) {
		System.out.println("enter into addproduct");
		Category category = categoryDAO.getByName(product.getCategory().getName());
		categoryDAO.saveOrUpdate(category);  // why to save??

		Supplier supplier = supplierDAO.getByName(product.getSupplier().getName());
		supplierDAO.saveOrUpdate(supplier); // Why to save??
		
		
		
		product.setCategory(category);
		product.setSupplier(supplier);
		
		product.setCategory_id(category.getId());
		product.setSupplier_id(supplier.getId());
		Util util=new Util();
		String id=util.replace(product.getId(), ",", "");
		product.setId(id);
		System.out.println("before save");
		productDAO.saveOrUpdate(product);
		MultipartFile file=product.getImage();
		
		FileUtil.upload(path, file, product.getId()+".jpg");
		
		
		return "redirect:/products";
		//return "redirect:/uploadFile";

	}

	@RequestMapping("product/remove/{id}")
	public String removeProduct(@PathVariable("id") String id, ModelMap model) throws Exception {

		try {
			productDAO.delete(id);
			model.addAttribute("message", "Successfully Added");
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
		}
		// redirectAttrs.addFlashAttribute(arg0, arg1)
		return "redirect:/products";
	}

	@RequestMapping("product/edit/{id}")
	public String editProduct(@PathVariable("id") String id, Model model) {
		System.out.println("editProduct");
		model.addAttribute("product", this.productDAO.get(id));
		model.addAttribute("listProducts", this.productDAO.list());
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("supplierList", this.supplierDAO.list());
	
		return "product";
	}
	
//	@RequestMapping("product/get/{id}")
//	public String getSelectedProduct(@PathVariable("id") String id, Model model) {
//		System.out.println("getSelectedProduct");
//		model.addAttribute("selectedProduct", this.productDAO.get(id));
//		model.addAttribute("categoryList", this.categoryDAO.list());
//	
//		return "redirect:/backtohome";
//	
//	}
	@RequestMapping(value="product/get/{id}")
	public String getSelectedProduct(@PathVariable("id") String id, Model model,RedirectAttributes redirectAttributes){
		redirectAttributes.addFlashAttribute("selectedProduct", productDAO.get(id));
		return "redirect:/backToHome";
	}
	@RequestMapping(value="/backToHome",method=RequestMethod.GET)
	public String backtohome(@ModelAttribute("selectedProduct")final Object selectedProduct,final Model model)
	{
		model.addAttribute("selectedProduct", selectedProduct);
		model.addAttribute("categoryList",this.categoryDAO.list());
		return "/home";
		
	}
}
