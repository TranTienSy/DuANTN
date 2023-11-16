package com.poly.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "Address", schema = "dbo", catalog = "J6StoreVC")
public class Address implements Serializable {

	private static final long serialVersionUID = 1L;

	// --- ENTITY PRIMARY KEY
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", nullable = false)
	private Long id;

	// --- ENTITY DATA FIELDS
	@Column(name = "TINH", length = 100)
	private String tinh;

	@Column(name = "HUYEN", length = 100)
	private String huyen;

	@Column(name = "XA", length = 100)
	private String xa;

	@Column(name = "CHITIET", length = 100)
	private String chitiet;

	@Column(name = "IDAccounts", nullable = false, length = 50)
	private String idaccounts;

	// --- ENTITY LINKS ( RELATIONSHIP )
	@ManyToOne
	@JoinColumn(name = "IDAccounts", referencedColumnName = "Username", insertable = false, updatable = false)
	private Account accounts;
}
