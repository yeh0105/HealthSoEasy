package com.soeasy.repository.mallRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.soeasy.model.ProductBean;
import com.soeasy.model.ShopBean;

public interface ProductRepository extends JpaRepository<ProductBean, Integer>{
	
	List<ProductBean> findById(int productId);

	
	
//	@Query("SELECT DISTINCT category FROM ProductBean")
//	List<String> findDistinctCategory();
//
//	@Query("UPDATE ProductBean SET productAmount = productAmount - ?1 WHERE productId = ?2")
//	@Modifying
//	void updateAmount1(Integer orderAmount, Integer productId);
//	 
//	 ///////////////////////////
//	@Query("UPDATE ProductBean SET productAmount = stock - :orderAmount WHERE productId = :bookId")
//	@Modifying
//	void updateStock2(
//			 @Param("orderAmount") Integer orderAmount, 
//			 @Param("bookId") Integer bookId);
//	 
//	@Modifying
//    @Query(value = "UPDATE Book b Set b.companyId = ?1 WHERE bookId = ?2", nativeQuery = true)
//    void updateTableModifyingForeignKey(Integer companyId, Integer bookId);
//	
//	
//     //--------------------------------------------------------------------
//     @Modifying
//     @Query(value = "ALTER TABLE Book DROP FOREIGN KEY FKplls4q2kf2e10pasbh34md6ta",
//     nativeQuery = true)
//     void alterBookTableDropForeign1();
//
//     @Modifying
//     @Query(value = "truncate table Book", nativeQuery = true)
//     void truncateBookTable();
//     
// 	// 執行Native SQL Command：加回Book表格的外鍵一    
//     @Modifying
//     @Query(value = "ALTER TABLE Book add constraint FKplls4q2kf2e10pasbh34md6ta foreign key (companyId) references BookCompany (id)",
//     	    nativeQuery = true)
//     void alterMemberTableAddForeign1();
//     
//	

}
