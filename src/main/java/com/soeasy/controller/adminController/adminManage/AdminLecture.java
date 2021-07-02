package com.soeasy.controller.adminController.adminManage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.soeasy.model.LectureBean;
import com.soeasy.model.NutritionistBean;
import com.soeasy.model.NutritionistCategoryBean;
import com.soeasy.service.lectureService.LectureService;
import com.soeasy.validator.lectureValidator.LectureBeanValidator;
import com.soeasy.validator.nutritionistValidator.NutritionistValidator;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminLecture {

	@Autowired
	LectureService lectureService;

	@Autowired
	ServletContext context;

	// 後台講座首頁
	@GetMapping("/adminLecture")
	public String adminLectureIndex(Model model) {
		model.addAttribute("lecture", lectureService.getAllByLectureId());
		return "/admin/adminLecture/adminLecture";
	}

	// 讀圖轉成位元組陣列
	@RequestMapping(value = "/getImage/{lectureId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImage(HttpServletRequest resp, @PathVariable Integer lectureId) {
		String filePath = "/image/NoImage.jpg";
		byte[] media = null;
		String filename = "";
		int len = 0;
		LectureBean lectureBean = lectureService.getOneByLectureId(lectureId);
		if (lectureBean != null) {
			Blob blob = lectureBean.getLectureImg();
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

	// 新增講座
	@PostMapping(value = "/adminLecture/addLecture")
	public String addLecture(@ModelAttribute("lectureBean") LectureBean lectureBean, BindingResult result, Model model,
			HttpServletRequest request) {

		// 檢測不正當欄位並回傳提示訊息
		LectureBeanValidator validator = new LectureBeanValidator();
		validator.validate(lectureBean, result);
		if (result.hasErrors()) {
			return "/admin/adminLecture/adminAddLecture";
		}

		// 取得addnutritionist.jsp所送來的圖片資訊
		MultipartFile lectureImg = lectureBean.getLectureMultiImg();

		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (lectureImg != null && !lectureImg.isEmpty()) {
			try {
				byte[] b = lectureImg.getBytes();
				Blob blob = new SerialBlob(b);
				lectureBean.setLectureImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		// 判斷講座時間
		long miliseconds = System.currentTimeMillis();
		Date Date = new Date(miliseconds);
		lectureBean.setLectureDate(Date);

		try {
			lectureService.addLecture(lectureBean);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			return "/admin/adminLecture/adminAddLecture";

		}

		return "redirect:/admin/adminManage/adminLecture";
	}

	// 刪除單筆講座
	@PostMapping("/adminLecture/deleteLecture/{lectureId}")
	public String deleteLecture(@PathVariable("lectureId") Integer lectureId) {
		lectureService.deleteLecture(lectureId);
		return "redirect:/admin/adminManage/adminLecture";
	}

	// 查詢修改單筆講座表單
	@GetMapping(value = "/adminLecture/updateLecture/{lectureId}")
	public String getOneByLectureId(@PathVariable("lectureId") Integer lectureId, Model model) {
		LectureBean lectureBean = lectureService.getOneByLectureId(lectureId);
		model.addAttribute("lectureBean", lectureBean);

		return "/admin/adminLecture/adminUpdateLecture"; // 帶出修改資料

	}

	// 查詢修改單筆講座表單
	@PostMapping("/adminLecture/updateLecture/{lectureId}")
		public String emptyLecture (@ModelAttribute("lectureBean")LectureBean lectureBean,
				BindingResult result,Model model,@PathVariable("lectureId") Integer lectureId,
				HttpServletRequest request) {
			LectureBeanValidator validator = new LectureBeanValidator();
			validator.validate(lectureBean, result);
			if (result.hasErrors()) {
				return "/admin/adminLecture/adminUpdateLecture";
			}

			// 取得addnutritionist.jsp所送來的圖片資訊
			MultipartFile lectureImg = lectureBean.getLectureMultiImg();

			// 建立Blob物件，交由 Hibernate 寫入資料庫
			if (lectureImg != null && !lectureImg.isEmpty()) {
				try {
					byte[] b = lectureImg.getBytes();
					Blob blob = new SerialBlob(b);
					lectureBean.setLectureImg(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			
			// 講座時間
			long miliseconds = System.currentTimeMillis();
			Date Date = new Date(miliseconds);
			lectureBean.setLectureDate(Date);
			
			try {
				lectureService.updateLecture(lectureBean);
			} catch (org.hibernate.exception.ConstraintViolationException e) {
				return "/admin/adminLecture/adminUpdateLecture";
			}
			return "redirect:/admin/adminManage/adminLecture";
	}

}
