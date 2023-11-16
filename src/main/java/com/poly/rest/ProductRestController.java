package com.poly.rest;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poly.dao.ProductvariantsDAO;
import com.poly.dto.ProductDTO;
import com.poly.entity.Product;
import com.poly.entity.ProductWithVariants;
import com.poly.entity.Productvariants;
import com.poly.service.ProductService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/products")
public class ProductRestController {
	@Autowired
	ProductService productService;

	@Autowired
	ProductvariantsDAO productvariantsDAO;

	@GetMapping
	public List<ProductDTO> getAll() {
		List<ProductDTO> list = productService.findAllDTO();
		return list;
	}

	@GetMapping("{id}")
	public ProductDTO getOne(@PathVariable("id") Integer id) {
		Product product =  productService.findById(id);
		ProductDTO productDTO = new ProductDTO();
		productDTO.setId(product.getId());
		productDTO.setName(product.getName());
		productDTO.setImage(product.getImage());
		productDTO.setPrice(product.getPrice());
		productDTO.setCreateDate(product.getCreateDate());
		productDTO.setAvailable(product.getAvailable());
		productDTO.setListOfProductVariants(product.getListOfProductvariants());
		productDTO.setCategoryId(Integer.parseInt(product.getCategory().getId().trim()));
		productDTO.setCategory(product.getCategory());
		return productDTO;
	}

	@PostMapping
	public ProductDTO create(@RequestBody ProductWithVariants productWithVariants) {
		// Thêm product
		Product productNew =  productService.create(productWithVariants.getProduct());

		// Thêm chi tiết product
		for (Productvariants productvariants : productWithVariants.getListOfProductvariants()) {
			productvariants.setProductid(productNew.getId());
			productvariantsDAO.save(productvariants);
		}
		
		Product product = productService.findById(productNew.getId());
		ProductDTO productDTO = new ProductDTO();
		productDTO.setId(product.getId());
		productDTO.setName(product.getName());
		productDTO.setImage(product.getImage());
		productDTO.setPrice(product.getPrice());
		productDTO.setCreateDate(product.getCreateDate());
		productDTO.setAvailable(product.getAvailable());
		productDTO.setListOfProductVariants(product.getListOfProductvariants());
		productDTO.setCategoryId(Integer.parseInt(product.getCategory().getId().trim()));
		return productDTO;
	}

	@Transactional
	@PutMapping("{id}")
	public ProductDTO update(@PathVariable("id") Integer id, @RequestBody ProductWithVariants productWithVariants) {
		Product productOld = productWithVariants.getProduct();

		productOld.setId(id);

		productService.update(productOld);

		productvariantsDAO.deleteByProductid(id);
		for (Productvariants productvariants : productWithVariants.getListOfProductvariants()) {
			productvariants.setProductid(id);
			productvariantsDAO.save(productvariants);
		}
		Product product = productService.findById(id);
		ProductDTO productDTO = new ProductDTO();
		productDTO.setId(product.getId());
		productDTO.setName(product.getName());
		productDTO.setImage(product.getImage());
		productDTO.setPrice(product.getPrice());
		productDTO.setCreateDate(product.getCreateDate());
		productDTO.setAvailable(product.getAvailable());
		productDTO.setListOfProductVariants(product.getListOfProductvariants());
		productDTO.setCategoryId(Integer.parseInt(product.getCategory().getId().trim()));
		return productDTO;
	}

	@DeleteMapping("{id}")
	public void delete(@PathVariable("id") Integer id) {
		productService.delete(id);
	}
}
