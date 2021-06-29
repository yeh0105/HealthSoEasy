package com.soeasy.repository.favoriteRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.FavoriteBean;

public interface FavoriteRepository extends JpaRepository<FavoriteBean, Integer>{
	
	public FavoriteBean findByFavoriteItemIdAndFavoriteCategoryAndCustomerBean(Integer favoriteItemId, String favoriteCategory, CustomerBean customerBean);

	public List<FavoriteBean> findByFavoriteCategory(String favoriteCategory);
}
