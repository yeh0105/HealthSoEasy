package com.soeasy.service.favoriteService;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.FavoriteBean;


public interface FavoriteService {
	public void addFavorite(FavoriteBean favoriteBean);
	
	public FavoriteBean checkFavoriteBean(Integer favoriteItemId, String favoriteCategory, CustomerBean customerBean);
	
	public void removeFavorite(Integer favoriteId);
}
