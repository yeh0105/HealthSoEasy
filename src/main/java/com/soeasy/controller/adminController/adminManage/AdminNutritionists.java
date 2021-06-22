package com.soeasy.controller.adminController.adminManage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soeasy.model.NutritionistBean;
import com.soeasy.service.nutritionistService.NutritionistCategoryService;
import com.soeasy.service.nutritionistService.NutritionistService;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminNutritionists {

	@Autowired
	NutritionistService nutritionistService;

	@Autowired
	NutritionistCategoryService nutritionistCategoryService;

	@Autowired
	ServletContext context;

	// 後台查詢全部營養師
	@GetMapping("/adminNutritionist")
	public String DisplayNutritionist(Model model) {
		model.addAttribute("nutritionists", nutritionistService.findAllByNutritionistId());
		return "/admin/adminNutritionist/adminNutritionist";
	}

	// 讀圖轉成位元組陣列
	@RequestMapping(value = "/getImage/{nutritionistId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImage(HttpServletRequest resp, @PathVariable Integer nutritionistId) {
		String filePath = "/image/NoImage.jpg";
		byte[] media = null;
		String filename = "";
		int len = 0;
		NutritionistBean nutritionistBean = nutritionistService.findByNutritionistId(nutritionistId);
		if (nutritionistBean != null) {
			Blob blob = nutritionistBean.getNutritionistImage();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("StudentController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		ResponseEntity<byte[]> re = new ResponseEntity<>(media, HttpStatus.OK);

		return re;
	}

	// 方法toByteArray
	private byte[] toByteArray(String filePath) {
		byte[] b = null;
		String realPath = context.getRealPath(filePath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filePath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
}
