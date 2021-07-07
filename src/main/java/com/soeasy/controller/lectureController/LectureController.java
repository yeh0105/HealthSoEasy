package com.soeasy.controller.lectureController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;

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

import com.soeasy.model.LectureBean;
import com.soeasy.service.lectureService.LectureService;

@Controller
@RequestMapping("/lectureController")
public class LectureController {

	@Autowired
	LectureService lectureService;

	@Autowired
	ServletContext servletContext;

	// 查詢所有講座
	@GetMapping("/getAllLectures")
	public String getAllLectures(Model model) {
		model.addAttribute("lectures", lectureService.getAllByLectureId());

		return "lecture/getAllLectures";
	}

	// 查詢單筆講座
	@GetMapping(value = "/lecture/{lectureId}")
	public String getOneByLectureId(@PathVariable("lectureId") Integer lectureId, Model model) {
		LectureBean lectureBean = lectureService.getOneByLectureId(lectureId);
		model.addAttribute("lectureBean", lectureBean);
		return "/lecture/lectureIndex";
	}

	// 讀圖轉成位元組陣列
	@RequestMapping(value = "/getLectureImage/{lectureId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImage(HttpServletRequest resp, @PathVariable Integer lectureId) {
		LectureBean lectureBean = lectureService.getOneByLectureId(lectureId);

		Blob customerImg = lectureBean.getLectureImg();

		InputStream is = null;
		String fileName = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;

		try {
			if (customerImg != null) {
				is = customerImg.getBinaryStream();
			}
			// 如果圖片的來源有問題，就送回預設圖片(/images/salad.png)
			if (is == null) {
				fileName = "salad.png";
				is = servletContext.getResourceAsStream("/images/" + fileName);
			}

			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[8192];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}

			media = baos.toByteArray();
			responseEntity = new ResponseEntity<>(media, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
		}
		return responseEntity;
	}

//	// 新增講座，先送一個空白表單，並給予初值
//	@GetMapping("/addLecture")
//	public String showEmptyForm(Model model) {
//		LectureBean lectureBean = new LectureBean();
//		// 預設表單資料
//		lectureBean.setLectureTitle("");
//		lectureBean.setLectureContent("");
//
//		model.addAttribute("lectureBean", lectureBean);
//
//		return "lecture/addLecture";
//	}

//	// 新增講座
//	@PostMapping(value = "/addLecture")
//	public String addLecture(@ModelAttribute("lectureBean") LectureBean lectureBean, BindingResult result, Model model,
//			HttpServletRequest request) {
//
//		// 檢驗欄位內容(空白未填)
//		LectureBeanValidator validator = new LectureBeanValidator();
//		validator.validate(lectureBean, result);
//		if (result.hasErrors()) {
//			return "redirect:/lectureController/addLecture";
//		}
//
//		// 取得addlecture.jsp所送來的圖片資訊
//		MultipartFile lectureImg = lectureBean.getLectureMultiImg();
//
//		// 建立Blob物件，交由 Hibernate 寫入資料庫
//		if (lectureImg != null && !lectureImg.isEmpty()) {
//			try {
//				byte[] b = lectureImg.getBytes();
//				Blob blob = new SerialBlob(b);
//				lectureBean.setLectureImg(blob);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}
//
//		// 如果新增成功就跳轉至查詢所有講師
//		return "redirect:/lectureController/getAllLectures";
//	}
//	
//	// 讀圖轉成位元組陣列
//		@RequestMapping(value = "/getImage/{lectureId}", method = RequestMethod.GET)
//		public ResponseEntity<byte[]> getImage(HttpServletRequest resp,@PathVariable Integer lectureId ){
//			String filePath="/image/NoImage.jpg";
//			byte[] media = null;
//			String filename = "";
//			int len = 0;
//			LectureBean lectureBean = lectureService.getOneByLectureId(lectureId);
//			if(lectureBean !=null) {
//				Blob blob=lectureBean.getLectureImg();
//				if(blob!=null) {
//					try {
//						len=(int)blob.length();
//						media = blob.getBytes(1, len);
//					}catch(SQLException e) {
//						throw new RuntimeException("StudentController的getPicture()發生SQLException: " + e.getMessage());
//					}
//				}else {
//					media = toByteArray(filePath);
//					filename = filePath;
//				}
//			}else {
//				media = toByteArray(filePath);
//				filename = filePath;
//			}
//			ResponseEntity<byte[]> re= new ResponseEntity<>(media, HttpStatus.OK);
//			
//			return re;
//		}
//		
//		// 方法toByteArray
//		private byte[] toByteArray(String filePath) {
//			byte[] b = null;
//			String realPath = context.getRealPath(filePath);
//			try {
//				File file = new File(realPath);
//				long size = file.length();
//				b = new byte[(int) size];
//				InputStream fis = context.getResourceAsStream(filePath);
//				fis.read(b);
//			} catch (FileNotFoundException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			return b;
//		}
//
//	// 刪除講座
//	@PostMapping("/deleteLecture/{lectureId}")
//	public String delete(@PathVariable("lectureId") Integer lectureId) {
//		lectureService.deleteLecture(lectureId);
//
//		// 跳轉至查詢所有講師
//		return "redirect:/lectureController/getAllLectures";
//	}
}
