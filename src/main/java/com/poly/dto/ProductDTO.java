package com.poly.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.poly.entity.Productvariants;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO implements Serializable {

    private Integer id;
    private String name;
    private String image;
    private Double price;
    private Date createDate;
    private Boolean available;
    private Integer categoryId;
    private List<Integer> orderDetailIds; 
    private List<Productvariants> listOfProductVariants;

}