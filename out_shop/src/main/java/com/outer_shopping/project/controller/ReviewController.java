package com.outer_shopping.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.outer_shopping.project.service.ReviewService;
import com.outer_shopping.project.vo.OuterVo;
import com.outer_shopping.project.vo.ReviewVo;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/member")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private FileSystemResource uploadDirResource;
	
	/**
	 * 리뷰 페이지 등록페이지 이동 
	 */
	@RequestMapping(value="/addReviewPage.do", method = RequestMethod.GET)
	public String addReviewPage(Model model) {
		
		if(!model.containsAttribute("reviewVo")) 
			model.addAttribute("reviewVo", new ReviewVo());
		
		logger.info("############# 리뷰 등록 페이지 이동 #############");
		
		return "member/addReviewPage";
	}
	
	
	
	@RequestMapping(value = "/test.do", method = RequestMethod.POST)
	@ResponseBody
	/*public String test(@RequestParam Map<String, Object> map,Model model) {*/
	public String test(@Valid @ModelAttribute("reviewVo") ReviewVo reviewVo, Model model,BindingResult rs) {
		System.out.println("=============================================");	
		/*System.out.println(map.get("subject").toString());
		System.out.println(map.get("outerNo").toString());
		System.out.println(map.get("imageFile"));
		System.out.println(map.get("star").toString());
		System.out.println(map.get("content").toString());*/
		
/*		for(Entry<String,Object> entry : map.entrySet()) {
			System.out.println(entry.getKey() + " = " + entry.getValue());
		}*/
		
		if(rs.hasErrors()) {
			System.out.println("####################");
			System.out.println(rs.getAllErrors().toString());
		}
		
		
		System.out.println(reviewVo);
		return "완료";
	}
	
	
	/**
	 * 리뷰 작성
	 */
	@RequestMapping(value = "/addMemberReview.do", method = RequestMethod.POST)
    public String addMemberReview(Model model, @ModelAttribute("reviewVo") ReviewVo reviewVo,
    		RedirectAttributes ra){
		System.out.println("=============================================");	
		System.out.println(reviewVo);
		
		/*if(reviewVo.getPictureName() != null) {
	        reviewVo.setPictureName("");
	        reviewVo.setThumbnailName("");
	        
	        reviewService.createReview(reviewVo);
	        
	        logger.info("############# 리뷰등록 완료 #############");
			
		 
			logger.info("############# 리뷰 페이지 이동 #############");
			
			return "redirect:/member/reviewSuccessPage.do";
		}

		MultipartFile file = reviewVo.getImageFile(); // 업로드 파일
		
		
		FileOutputStream fos = null;
		
		// 업로드 파일 처리
		if (!reviewVo.getImageFile().isEmpty() && file != null) {
			
			String fileName = file.getOriginalFilename();
			 
			String newFileName ="";
            try{
            	byte[] bytes = file.getBytes();
            	
            	newFileName = System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
    
            	File outFileName =  new File(uploadDirResource.getPath() + newFileName);
              
            	reviewVo.setPictureName(newFileName);
                
              	fos = new FileOutputStream(outFileName);
              
              	fos.write(bytes);
                  
              	// 썸네일(thumbnail) path : PNG 형식으로 저장	               
	          
	            String thumbPath = uploadDirResource.getPath() + "thumbnail/";
	            String thumbPathFileName = "thumb_"
	           		 				  + newFileName.split("\\.")[0]
	   		 						  +".png";
	            reviewVo.setThumbnailName(thumbPathFileName);
	            
	            // 썸네일 200*100 크기의 썸네일 작성
	            File thumbnail = new File(thumbPathFileName); 

	            Thumbnails.of(outFileName)
	         	 		   .size(200, 100)
	 	 				   .outputFormat("png")
	         	 		   .toFile(thumbPath + thumbnail);
            }catch(IOException e) {
            	
            	logger.info("############# 이미지 등록 에러 #############");
                e.printStackTrace();
                
            }finally{           	
                  try{    
                     if (fos !=null) fos.close();
                  }catch (IOException e) {
                     e.printStackTrace();
                  }
            }
            logger.info("############# 이미지 등록 #############");
		}

		reviewService.createReview(reviewVo);
		
		ra.addAttribute("zzzz", "zzzzz");*/
        
        logger.info("############# 리뷰등록 완료 #############");
		
		logger.info("############# 리뷰 페이지 이동 #############");
        
        return "member/reviewSuccessPage";
	}
	
	/**
	 * 리뷰  작성 성공 패이지
	 */
	@RequestMapping(value = "/reviewSuccessPage.do", method = RequestMethod.POST)
    public String reviewSuccessPage(Model model){
	   				 
		logger.info("############# 리뷰 페이지 이동 #############");
		
		return "member/reviewSuccessPage";
	
	}
	
	/**
	 * 회원별 리뷰 목록
	 */
	@RequestMapping(value = "/memberReviewList.do", method = {RequestMethod.GET,RequestMethod.POST})
    public String memberReviewList(Model model, @RequestParam("memberId") String memberId, 
    		@RequestParam(defaultValue="1") int page){
	   	
		Map<String, Object> map = new HashMap<>();
		
		map  = reviewService.getMemberReview(memberId, page);
		
		model.addAttribute("list", map.get("list"));
		
		model.addAttribute("pageBean", map.get("pageBean"));
		
		logger.info("############# 회원 리뷰 페이지 이동 #############");
		
		return "member/memberReviewListPage";
	
	}
}

