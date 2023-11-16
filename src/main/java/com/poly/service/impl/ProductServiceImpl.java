package com.poly.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.ProductDAO;
import com.poly.dto.ProductDTO;
import com.poly.entity.Product;
import com.poly.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDAO pdao;

	@Override
	public List<Product> findAll() {
		return pdao.findAll();
	}

	@Override
	public Product findById(Integer id) {
		return pdao.findById(id).get();
	}

	@Override
	public List<Product> findByCategoryId(String cid) {
		return pdao.findByCategoryId(cid);
	}

	public Product create(Product product) {
		return pdao.save(product);
	}

	@Override
	public Product update(Product product) {
		return pdao.save(product);
	}

	@Override
	public void delete(Integer id) {
		pdao.deleteById(id);
	}

	@Override
	public List<ProductDTO> findAllDTO() {
		List<Product> p = pdao.findAll();
		
		List<ProductDTO> listProductDTOs =  p.stream().map(product ->{
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
		}).collect(Collectors.toList());
		return listProductDTOs;
	}

}
