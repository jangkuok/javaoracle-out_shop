package com.outer_shopping.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.outer_shopping.project.service.AuthorityService;
import com.outer_shopping.project.service.MemberService;
import com.outer_shopping.project.service.OrderProductService;
import com.outer_shopping.project.service.WishListSerice;
import com.outer_shopping.project.vo.AuthorityVo;
import com.outer_shopping.project.vo.MemberVo;
import com.outer_shopping.project.vo.OrderCheckVo;
import com.outer_shopping.project.vo.OrderProductVo;
import com.outer_shopping.project.vo.WishListVo;

@Controller
@RequestMapping("/member")
public class MemberInfoController {

	private static final Logger logger = LoggerFactory.getLogger(MemberInfoController.class);
	
	@Autowired
	private MemberService service;
		
	@Autowired
	private AuthorityService authorityService;
	
	//회원가입 성공
	@RequestMapping("/successJoinPage.do")
	public String successPage() {
		
		return "/member/successJoinPage";
	}	

	/**
	 * 회원 정보 확인(마이페이지) 
	 */
	@RequestMapping(value="/myPage.do", method = RequestMethod.GET	)
	public String myPage(Model model,@RequestParam(value="id",required=false) String id) {
		
		model.addAttribute("memberVo", service.viewMember(id));
		
		logger.info("############# 마이페이지 이동 #############");
		return "member/myPage";
	}
	
	/**
	 * 수정페이지 이동 
	 */
	@RequestMapping(value="/modifyPage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String modifyPage(Model model,@RequestParam(value="memberId",required=false) String memberId) {
		
		model.addAttribute("memberVo", service.viewMember(memberId));
		
		logger.info("############# 수정페이지 이동 #############");
		return "member/modifyPage";
	}
	
	/**
	 * 회원정보 수정하기
	 */
	@RequestMapping(value = "/modifyCheck.do", method = RequestMethod.POST)
	public ModelAndView modifyCheck(Model model,@Valid @ModelAttribute("memberVo") MemberVo memberVo,
								BindingResult errors) {
	
		ModelAndView mv = new ModelAndView();
	        
		//에러 발생시 
		if(errors.hasErrors()) {
			logger.info("############# 회원수정 에러 #############");
			mv.addObject("error","error");
			mv.addObject("memberVo", memberVo);
			mv.setViewName("member/modifyPage");
			
		}else{
			service.modifyMember(memberVo);
			
			AuthorityVo authority = authorityService.findAuthority(memberVo.getId());
			
			authority.setLoginPw(memberVo.getPw());
			
			authorityService.modifyAuthority(authority);
			
			mv.addObject("memberVo", memberVo);
			mv.setViewName("member/myPage");
			
			logger.info("############# 회원수정 완료 #############");
		}
			
		return mv;
	}	
	
	/**
	 * 회원주소 수정하기
	 */
	@RequestMapping(value = "/modifyAddress.do", method = RequestMethod.POST)
	@ResponseBody
	public String modifyAddress(Model model,@RequestParam(value="memberId",required=false) String memberId,
			@RequestParam(value="zipcode",required=false) String zipcode,
			@RequestParam(value="address",required=false) String address,
			@RequestParam(value="address2",required=false) String address2) {
	
		MemberVo member = new MemberVo();
		
		member.setId(memberId);
		member.setZipcode(zipcode);
		member.setAddress(address);
		member.setAddress2(address2);
		
		service.modifyMemberAddress(member);
			
		return "변경완료";
	}
	
	/**
	 * 회원정보 삭제
	 */
	@RequestMapping(value = "/deleteMember.do", method = RequestMethod.POST)
	public String deleteMember(Model model,@RequestParam(value="id",required=false) String id,
			@RequestParam(value="pw",required=false) String pw, @RequestParam(value="password",required=false) String password,
			HttpSession session) {		
		if(pw.equals(password)) {
			service.deleteMember(id);
			authorityService.removeAuthority(id);

			logger.info("############# 회원탈퇴 완료 #############");
		}else {

			logger.info("############# 회원삭제 비밀번호 불일치 #############");
			model.addAttribute("msg", "deleteError");
			model.addAttribute("memberVo", service.viewMember(id));
			
			return "member/myPage";
		}
		logger.info("############# 메인페이지 이동 #############");
		return "redirect:/logoutButton.do";
	}
}
