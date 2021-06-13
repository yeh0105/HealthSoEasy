package com.soeasy.repository.sportmapRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.soeasy.model.SportMapBean;


public interface SportMapRepository extends JpaRepository<SportMapBean, Integer> {

	@Query("SELECT DISTINCT sportMapCategory FROM SportMapBean")
	List<String> findDistinctCategory();
	
	
	
	
}
