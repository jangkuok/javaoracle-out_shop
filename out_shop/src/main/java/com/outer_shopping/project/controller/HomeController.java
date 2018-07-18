package com.outer_shopping.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.outer_shopping.project.service.OuterService;
import com.outer_shopping.project.service.ReviewService;
import com.outer_shopping.project.vo.AuthorityVo;
import com.outer_shopping.project.vo.MemberVo;
import com.outer_shopping.project.vo.OrderCheckVo;
import com.outer_shopping.project.vo.OrderProductVo;
import com.outer_shopping.project.vo.OuterSizeVo;
import com.outer_shopping.project.vo.OuterVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AuthorityService authorityService;
	
	@Autowired
	private OuterService outerService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private OrderProductService orderProductService;
	/**
	 * 메인페이지
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage(Model model) {
	
		List<OuterVo> outerList = outerService.findOuterList();
		
		List<Map<Object , String>> list2 = new ArrayList<>();
		
		String color = "";
		String size = "";
		int amount = 0;
		
		for (int i = 0; i < outerList.size(); i++) {
			
			OuterVo outerVo = outerService.getOuter(outerList.get(i).getOuterNo());
			
			for (int j = 0; j < outerVo.getSizeList().size(); j++) {
				
				//사이즈
				if(size.contains(outerVo.getSizeList().get(j).getType())) {
		            size = size + "";
				}else if(j == outerVo.getSizeList().size()-1) {
					size = size + outerVo.getSizeList().get(j).getType();
				}else {
					size = size + outerVo.getSizeList().get(j).getType() + " ";
		        }
				
				//색상
				if(color.contains(outerVo.getSizeList().get(j).getColor())) {
					color = color + "";
				}else {
					color = color + outerVo.getSizeList().get(j).getColor() + ",";
		        }
				
				//수량
				amount = amount + outerVo.getSizeList().get(j).getAmount();
			}
			
/*			if(color.charAt(color.length()-1)==','){
				color = color.replace(color.substring(color.length()-1), "");
			}*/
			
			
			Map<Object , String> map = new HashMap<>();
			
			map.put("outerNo", Integer.toString(outerList.get(i).getOuterNo()));
			map.put("imageName", outerList.get(i).getImageName());
			map.put("name", outerList.get(i).getName());
			map.put("price", Integer.toString(outerList.get(i).getPrice()));
			map.put("size", size);
			map.put("color", color);
			map.put("amount", Integer.toString(amount));
			
			list2.add(map);
			
			size = "";
			color = "";
		}
		
		
		model.addAttribute("list",list2);
		
		
		
		
		
		List<OrderCheckVo> orderList = orderProductService.getOrderTopThreeList();
		
		List<Object> topList = new ArrayList<>();
		
		for (int i = 0; i < orderList.size(); i++) {
		
			for (int j = 0; j < orderList.get(i).getProductList().size(); j++) {
				OuterVo outer = new OuterVo();
				outer = outerService.getOuter(orderList.get(i).getProductList().get(j).getOuterNo());
				topList.add(outer);
			}
		}
		
		model.addAttribute("top",topList);
		
		logger.info("############# 메인페이지 이동 #############");
		
		return "main/mainPage";
	}
	
	/**
	 * 카테로리별 아웃터 페이징
	 */
	@RequestMapping(value = "/kategorieOuterList.do", method = RequestMethod.GET)
	public String kategorieOuterList(Model model,@RequestParam("items") String items,
			@RequestParam(defaultValue="1") int page) {
	
		Map<String, Object> map = outerService.findItemsOuterList(items, page);
		
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("items", items);
		model.addAttribute("pageBean", map.get("pageBean"));
		
		
		logger.info("############# "+ items +"페이지 이동 #############");
		
		return "kategorieOuterPage";
	}
	
	
	/**
	 * 회원가입 페이지 이동
	 */
	@RequestMapping(value = "/joinPage.do", method = RequestMethod.GET)
	public String joinPage(Model model) {
		
		if(!model.containsAttribute("memberVo")) 
			model.addAttribute("memberVo", new MemberVo());
		
		logger.info("############# 회원가입페이지 이동 #############");
		
		return "joinPage";
	}	
	

	/**
	 * 아이디 중복확인
	 */
	@RequestMapping(value="/checkMember.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String memberIdCheck(@RequestParam(value="joinId",required=false) String joinId) {
		
		logger.info("############# 아이디 중복확인 #############");
		int cnt = 3;
		
		if(joinId.length() >= 8 ) {
			cnt = memberService.checkMemberId(joinId);
		}

		return Integer.toString(cnt);
	}
	
	
	/**
	 * 회원가입
	 */
	@RequestMapping(value = "/joinCheck.do", method = RequestMethod.POST)
	public ModelAndView joinForm(Model model,@Valid @ModelAttribute("memberVo") MemberVo memberVo,
								BindingResult errors) {
	
		ModelAndView mv = new ModelAndView();
	        
		//에러 발생시 
		if(errors.hasErrors()) {
			logger.info("############# 회원가입 에러 #############");
			
			mv.addObject("error","error");
			mv.addObject("memberVo", memberVo);
			mv.setViewName("joinPage");
			
			return mv;
		}else{
			AuthorityVo authority = new AuthorityVo();
			
			authority.setLoginId(memberVo.getId());
			authority.setLoginPw(memberVo.getPw());
			authority.setLoginAuthority("ROLE_USER");

			authorityService.createAuthority(authority);
			
			memberService.joinMember(memberVo,memberVo.getId(),memberVo.getPw());
			
			mv.addObject("member", memberVo);
			mv.setViewName("member/successJoinPage");
	       
			logger.info("############# 회원가입 완료 #############");
		}
			
		return mv;
	}	

	/**
	 * 로그인 페이지 이동
	 */
	@RequestMapping(value = "/loginFormPage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String loginFormPage(Model model) {
		
		logger.info("############# 로그인 페이지 이동 #############");
		
		return "loginFormPage";
	}
	
	/**
	 * 리뷰 페이지 이동 
	 */
	@RequestMapping(value="/reviewPage.do", method = RequestMethod.GET)
	public String myPage(Model model,@RequestParam(defaultValue="1") int page) {
		
		Map<String, Object> map = new HashMap<>();
		
		map  = reviewService.getListReview(page);
		
		model.addAttribute("list", map.get("list"));
		
		model.addAttribute("pageBean", map.get("pageBean"));
	 
		logger.info("############# 리뷰 페이지 이동 #############");
		
		return "reviewListPage";
	}
}
