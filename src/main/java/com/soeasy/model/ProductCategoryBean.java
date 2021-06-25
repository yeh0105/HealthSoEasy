package com.soeasy.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
	
	
	@Entity
	@Table(name = "ProductCategory")
	public class ProductCategoryBean implements Serializable {
		private static final long serialVersionUID = 1L;

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer productCategoryId;

		private String productCategoryName;

		// ------------------------------------------
		
		
		public ProductCategoryBean() {
		}

		// ------------------------------------------
		
		
		public Integer getProductCategoryId() {
			return productCategoryId;
		}

		public void setProductCategoryId(Integer productCategoryId) {
			this.productCategoryId = productCategoryId;
		}

		public String getProductCategoryName() {
			return productCategoryName;
		}

		public void setProductCategoryName(String productCategoryName) {
			this.productCategoryName = productCategoryName;
		}


}
