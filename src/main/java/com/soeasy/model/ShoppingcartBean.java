package com.soeasy.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Shoppingcart")
public class ShoppingcartBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shoppingcartId;

	private Integer cartPtoductNumber;

	private Integer cartTotalprice;

	private Boolean cartIsDelete;

	// 會員 透過Id查詢會員 目前不需要
//	private Integer customerId;

	// 商品
	@Transient
	@Column(name = "fk_productId")
	private Integer productId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_productId")
	private ProductBean productBean;

	// ------------------------------------------
	public ShoppingcartBean() {
	}

	// ------------------------------------------
	public Integer getShoppingcartId() {
		return shoppingcartId;
	}

	public void setShoppingcartId(Integer shoppingcartId) {
		this.shoppingcartId = shoppingcartId;
	}

	public Integer getCartPtoductNumber() {
		return cartPtoductNumber;
	}

	public void setCartPtoductNumber(Integer cartPtoductNumber) {
		this.cartPtoductNumber = cartPtoductNumber;
	}

	public Integer getCartTotalprice() {
		return cartTotalprice;
	}

	public void setCartTotalprice(Integer cartTotalprice) {
		this.cartTotalprice = cartTotalprice;
	}

	public Boolean getCartIsDelete() {
		return cartIsDelete;
	}

	public void setCartIsDelete(Boolean cartIsDelete) {
		this.cartIsDelete = cartIsDelete;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}

}
