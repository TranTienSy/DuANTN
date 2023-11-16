package com.poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Orders")
public class Order implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;

	@Column(name = "Tinh", length = 100)
	private String tinh;

	@Column(name = "Huyen", length = 100)
	private String huyen;

	@Column(name = "Xa", length = 100)
	private String xa;

	@Column(name = "chitiet", length = 100)
	private String chitiet;

	@Column(name = "Phone", length = 30)
	private String phone;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Createdate")
	Date createDate = new Date();

	@ManyToOne
	@JoinColumn(name = "Username")
	Account account;

	@JsonIgnore
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
	List<OrderDetail> orderDetails;

	@Column(name = "status", nullable = true)
	String status;
	
}