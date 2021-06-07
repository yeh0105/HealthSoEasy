package com.soeasy.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ShopMap")
public class ShopMapBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shopMapId;
	
	private String shopMapName;
	
	private String shopMapAddress;
	
	@Column(length = 600)
	private String shopMapInfo;
	
	private String shopMapMap;
	
	private Integer shopMapCategory;
	
	//----------------------------------------
	public ShopMapBean() {
	}
	//----------------------------------------

	public Integer getShopMapId() {
		return shopMapId;
	}

	public void setShopMapId(Integer shopMapId) {
		this.shopMapId = shopMapId;
	}

	public String getShopMapName() {
		return shopMapName;
	}

	public void setShopMapName(String shopMapName) {
		this.shopMapName = shopMapName;
	}

	public String getShopMapAddress() {
		return shopMapAddress;
	}

	public void setShopMapAddress(String shopMapAddress) {
		this.shopMapAddress = shopMapAddress;
	}

	public String getShopMapInfo() {
		return shopMapInfo;
	}

	public void setShopMapInfo(String shopMapInfo) {
		this.shopMapInfo = shopMapInfo;
	}

	public String getShopMapMap() {
		return shopMapMap;
	}

	public void setShopMapMap(String shopMapMap) {
		this.shopMapMap = shopMapMap;
	}

	public Integer getShopMapCategory() {
		return shopMapCategory;
	}

	public void setShopMapCategory(Integer shopMapCategory) {
		this.shopMapCategory = shopMapCategory;
	}

}
