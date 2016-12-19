package com.niit.shoppingcart;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Category;
import com.niit.shoppingcart.model.Product;
import com.niit.shoppingcart.model.Supplier;
import com.niit.shoppingcart.util.FileUtil;

@Controller
public class ProductController {

	@Autowired
	private Category category;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private Supplier supplier;

	@Autowired
	private SupplierDAO supplierDAO;

	@Autowired
	private Product product;

	@Autowired
	private ProductDAO productDAO;

	private String path = "D:\\Reddy\\ShoppingCartFrontEnd\\src\\main\\resources\\images\\";

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String listProducts(Model model) {
		model.addAttribute("product", product);
		model.addAttribute("productList", this.productDAO.list());
		model.addAttribute("category", category);
		model.addAttribute("categoryList", this.categoryDAO.list());
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", this.supplierDAO.list());
		return "Product";
	}

	@RequestMapping(value = "product/add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, @RequestParam("imageUrl") MultipartFile file) {
		
		ModelAndView mv = new ModelAndView("/product");
		if (productDAO.get(product.getProductId()) == null) {
			productDAO.save(product);
			/*file = product.getImageUrl();*/
			System.out.println("Saved");
			mv.addObject("SavedMsg", "Saved successfully");
		} else {
			productDAO.update(product);
			mv.addObject("errorMessage", "The record exist with this id" + product.getProductId());
		}

		/*if (file != null && !file.isEmpty()) {
			try {
				System.out.println("Image Saving Start");
				file.transferTo(new File(path.toString()));
				System.out.println("Image Saved");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error");
				throw new RuntimeException("item image saving failed.", e);
			}
		}*/

		FileUtil.upload(path, file, product.getProductId() + ".jpg");
		return "redirect:/manageProducts";

	}

	@RequestMapping(value = "product/Update/{id}")
	public String updateCategory(@PathVariable("id") String id) {
		// check whether category exist with this id?
		// if exists, update the existing category
		// if doesnot exist display error message
		System.out.println("i am in update method");
		System.out.println(product.getProductId());
		product = productDAO.get(id);
		ModelAndView mv = new ModelAndView();

		/* mv.addObject("clickedEdit", true); */
		if (productDAO.get(product.getProductId()) != null) {
			productDAO.update(product);
			mv.addObject("updateMsg", "successfully updated");
		} else {
			mv.addObject("ErrorUpdateMsg", "couldnot update the record");
		}
		return "redirect:/product";
	}

	
	@RequestMapping(value="product/Remove/{productId}")
	public String removeProduct(@PathVariable("productId") String productId, ModelMap model) throws Exception{
		
		System.out.println(productId);
		System.out.println("i am in delete method");
		product=productDAO.get(productId);
		ModelAndView mv = new ModelAndView("product");
	    
		boolean flag = productDAO.delete(product);
		String msg = "The operation is successfully done";
		if (flag == false) {
			msg = "The operation  could not success";
		}
		else{
		mv.addObject("msg", msg);
		}
		return "redirect:/manageProducts";
	
		

	}
	

	
	@RequestMapping("/selectedProduct/{productId}")
	public String getSelectedProduct(@PathVariable("productId") String productId, Model model) {
		System.out.println(productId);
		System.out.println("getSelectedProduct");
		model.addAttribute("selectedProduct", this.productDAO.get(productId));
		model.addAttribute("singleProduct", true);
		System.out.println("Retreiving Category");
		model.addAttribute("categoryList", this.categoryDAO.list());
		System.out.println("category retrieved");
		//System.out.println(this.productDAO.get(productId));
		return "viewProduct";
	}
	
	
		
}
	
	

