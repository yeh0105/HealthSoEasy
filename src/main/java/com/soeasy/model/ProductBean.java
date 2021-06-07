package com.soeasy.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="Product")
public class ProductBean  implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;
		
	private String productName;
	
	private String productDescription;
	
	private Integer productPrice;
	
	private Integer productAmount;
	
	private Integer productCalories;
	
	private Blob productImg;
	
	@Transient
	private MultipartFile productMultiImg;
	
	@JsonFormat(pattern ="yyyy-MM-dd",timezone = "GMT+8")
	private Date productDate;
	
	private Integer productCost;
	//廠商
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="fk_shopId")
    private ShopBean shopBean;
	
	
//	購物車	商品不需找回購物車	單向關聯	
	
	
	// ------------------------------------------
	public ProductBean() {	
	}
	// ------------------------------------------

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(Integer productAmount) {
		this.productAmount = productAmount;
	}

	public Integer getProductCalories() {
		return productCalories;
	}

	public void setProductCalories(Integer productCalories) {
		this.productCalories = productCalories;
	}

	public Blob getProductImg() {
		return productImg;
	}

	public void setProductImg(Blob productImg) {
		this.productImg = productImg;
	}

	public MultipartFile getProductMultiImg() {
		return productMultiImg;
	}

	public void setProductMultiImg(MultipartFile productMultiImg) {
		this.productMultiImg = productMultiImg;
	}

	public Date getProductDate() {
		return productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	public Integer getProductCost() {
		return productCost;
	}

	public void setProductCost(Integer productCost) {
		this.productCost = productCost;
	}

	public ShopBean getShopBean() {
		return shopBean;
	}

	public void setShopBean(ShopBean shopBean) {
		this.shopBean = shopBean;
	}
	
	
}
