/*
 * Created on 2023-11-16 ( 08:55:25 )
 * Generated by Telosys ( http://www.telosys.org/ ) version 3.3.0
 */
package com.poly.entity;

import java.io.Serializable;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Productvariants", schema = "dbo", catalog = "J6StoreVC")
public class Productvariants implements Serializable {

	private static final long serialVersionUID = 1L;

	// --- ENTITY PRIMARY KEY
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", nullable = false)
	private Integer id;

	// --- ENTITY DATA FIELDS
	@Column(name = "Productid", nullable = false)
	private Integer productid;

	@Column(name = "Color", nullable = false, length = 20)
	private String color;

	@Column(name = "Size", nullable = false, length = 20)
	private String size;

	@Column(name = "Quantity", nullable = false)
	private Integer quantity;

	// --- ENTITY LINKS ( RELATIONSHIP )
	@ManyToOne
	@JoinColumn(name = "Productid", referencedColumnName = "Id", insertable = false, updatable = false)
	private Product products;

}
