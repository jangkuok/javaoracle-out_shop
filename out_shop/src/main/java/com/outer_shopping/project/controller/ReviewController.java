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
		
		logger.info("############# 리뷰 등록 페이지 이동 #############");
		
		return "member/addReviewPage";
	}
	
	/**
	 * 리뷰 작성
	 */
	@RequestMapping(value = "/addMemberReview.do", method = RequestMethod.POST)
    public String addMemberReview(Model model, @RequestParam("subject") String subject,
    		@RequestParam("outerNo") int outerNo, @RequestParam("imageFile") MultipartFile imageFile,
    		@RequestParam("star") int star,	@RequestParam("content") String content, @RequestParam("memberId") String memberId,
    		RedirectAttributes ra){
		
		ReviewVo review = new ReviewVo();
		FileOutputStream fos = null;
		
		if(imageFile.getOriginalFilename().isEmpty()|| imageFile == null) {
						
			review.setPictureName("");
			review.setThumbnailName("");
		}		
		// 업로드 파일 처리
		else if(!imageFile.getOriginalFilename().isEmpty() && imageFile != null) {
			
			String fileName = imageFile.getOriginalFilename();
			 
			String newFileName ="";
            try{
            	byte[] bytes = imageFile.getBytes();
            	
            	newFileName = System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
    
            	File outFileName =  new File(uploadDirResource.getPath() + newFileName);
              
            	review.setPictureName(newFileName);
                
              	fos = new FileOutputStream(outFileName);
              
              	fos.write(bytes);
                  
              	// 썸네일(thumbnail) path : PNG 형식으로 저장	               
	          
	            String thumbPath = uploadDirResource.getPath() + "thumbnail/";
	            String thumbPathFileName = "thumb_"
	           		 				  + newFileName.split("\\.")[0]
	   		 						  +".png";
	            review.setThumbnailName(thumbPathFileName);
	            
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
		
		review.setSubject(subject);
		review.setStar(star);
		review.setContent(content);
		review.setMemberId(memberId);
		review.setOuterNo(outerNo);
		
        reviewService.createReview(review);
        
        ReviewVo reviewInfo = reviewService.getReviewNo(review.getReviewNo());

        ra.addFlashAttribute("review", reviewInfo);

        logger.info("############# 리뷰등록 완료 #############");
		
		logger.info("############# 리뷰 페이지 이동 #############");
        
        return "redirect:/member/reviewSuccessPage.do";
	}
	
	/**
	 * 리뷰  작성 성공 패이지
	 */
	@RequestMapping(value = "/reviewSuccessPage.do", method = {RequestMethod.GET,RequestMethod.POST})
    public String reviewSuccessPage(Model model){
	   				 
		logger.info("############# 리뷰 페이지 이동 #############");
		
		return "member/reviewSuccessPage";
	
	}
	
	
	/**
	 * 리뷰 수정 페이지 이동
	 */
	@RequestMapping(value="/modifyReviewPage.do", method = RequestMethod.GET)
	public String modifyReviewPage(Model model,@RequestParam("reviewNo") int reviewNo) {
		
		model.addAttribute("reviewVo", reviewService.getReviewNo(reviewNo));
		
		logger.info("############# 리뷰 수정 페이지 이동 #############");
		
		return "member/modifyReviewPage";
	}
	
	/**
	 * 리뷰 수정
	 */
	@RequestMapping(value = "/modifyMemberReview", method = RequestMethod.POST)
    public String modifyMemberReview(Model model,@ModelAttribute("reviewVo") ReviewVo review,
    		RedirectAttributes ra){
		
		MultipartFile file = review.getImageFile(); // 업로드 파일
			
		FileOutputStream fos = null;
		
		if(review.getImageFile().isEmpty() || file == null) {						
			review.setPictureName("");
			review.setThumbnailName("");	
			
			reviewService.modifyReview(review);
		}	
		else if(review.getPictureName() != null) {
			reviewService.modifyReview(review);
		}
		// 업로드 파일 처리
		else if(!review.getImageFile().isEmpty() && file != null) {
			
			String fileName = file.getOriginalFilename();
			 
			String newFileName ="";
            try{
            	byte[] bytes = file.getBytes();
            	
            	newFileName = System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
    
            	File outFileName =  new File(uploadDirResource.getPath() + newFileName);
              
            	review.setPictureName(newFileName);
                
              	fos = new FileOutputStream(outFileName);
              
              	fos.write(bytes);
                  
              	// 썸네일(thumbnail) path : PNG 형식으로 저장	               
	          
	            String thumbPath = uploadDirResource.getPath() + "thumbnail/";
	            String thumbPathFileName = "thumb_"
	           		 				  + newFileName.split("\\.")[0]
	   		 						  +".png";
	            review.setThumbnailName(thumbPathFileName);
	            
	            // 썸네일 200*100 크기의 썸네일 작성
	            File thumbnail = new File(thumbPathFileName); 

	            Thumbnails.of(outFileName)
	         	 		   .size(200, 100)
	 	 				   .outputFormat("png")
	         	 		   .toFile(thumbPath + thumbnail);
	            
	            reviewService.modifyReview(review);
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

		//ra.addAttribute("outerNo",reviewService.getReviewNo(review.getReviewNo()));
		logger.info("############# 리뷰수정 등록 #############");
		
		//return "redirect:/outer/outerView.do";
		return "redirect:/.do";
	}
	
	/**
	 * 리뷰 삭제 이동
	 */
	@RequestMapping(value="/removeMemberReview.do", method = RequestMethod.GET)
	public String removeMemberReview(Model model,@RequestParam("reviewNo") int reviewNo,
			@RequestParam(defaultValue="1") int page) {		
		reviewService.removeReview(reviewNo);
		
		logger.info("############# 리뷰 삭제 완료 #############");
		
		Map<String, Object> map = new HashMap<>();
		
		map  = reviewService.getListReview(page);
		
		model.addAttribute("list", map.get("list"));
		
		model.addAttribute("pageBean", map.get("pageBean"));
	 
		logger.info("############# 리뷰 페이지 이동 #############");
		
		return "reviewListPage";
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

