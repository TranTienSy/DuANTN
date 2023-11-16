package com.poly.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductWithVariants {
	private Product product;
	private List<Productvariants> listOfProductvariants;
}
