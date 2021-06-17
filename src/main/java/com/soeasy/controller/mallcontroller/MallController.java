package com.soeasy.controller.mallcontroller;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.soeasy.model.ProductBean;
import com.soeasy.repository.mallRepository.ProductDao;

@Controller
@RequestMapping("Mall")
public class MallController {
	
    @Autowired
    private ProductDao productDao;

    /**
     * Description: 產品清單
     */
    @RequestMapping("")
    public ModelAndView mallList(@RequestParam(value = "start", defaultValue = "0") Integer start,
                                    @RequestParam(value = "limit", defaultValue = "5") Integer limit) {
        start = start < 0 ? 0 : start;
        Sort sort = Sort.by(Sort.Direction.DESC, "productId");
        Pageable pageable = PageRequest.of(start, limit, sort);
        Page<ProductBean> page = productDao.findAll(pageable);
        ModelAndView mav = new ModelAndView("Mall/list");
        mav.addObject("page", page);
        return mav;
    }

    /**
     * Description: 根據id取得物件
     */
    @GetMapping("/{productId}")
    public ModelAndView getProduct(@PathVariable("productId") Integer productId)  throws Exception {
        Optional<ProductBean> product = productDao.findById(productId);
        ModelAndView mav = new ModelAndView("Mall/productshow");
        mav.addObject("Product", product);
        return mav;
    }


    /**
     * Description: 新增動作檢視
     */
    @GetMapping("/add")
    public String addProoduct() throws Exception{
        return "Mall/productadd";
    }

    /**
     * Description: 新增儲存方法
     */
    @PostMapping("")
    public String saveArticle(ProductBean model)  throws Exception{
    	productDao.save(model);
        return "redirect:/Mall/";
    }

    /**
     * Description: 移除
     */
    @DeleteMapping("/{productId}")
    public String del(@PathVariable("productId") int productId)  throws Exception{
        productDao.deleteById(productId);
        return "redirect:";
    }


    /**
     * Description: 編輯產品
     */
    @GetMapping("/edit/{productId}")
    public ModelAndView editProduct(@PathVariable("productId") int productId)  throws Exception {
        ProductBean model = productDao.findById(productId);
        ModelAndView mav = new ModelAndView("Mall/productedit");
        mav.addObject("Product", model);
        return mav;
    }

    /**
     * Description: 修改方法
     */
    @PutMapping("/{productId}")
    public String editArticleSave(ProductBean model, int productId)  throws Exception{
        model.setProductId(productId);
        productDao.save(model);
        return "redirect:";
    }

}
