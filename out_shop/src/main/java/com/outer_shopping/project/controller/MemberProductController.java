package com.outer_shopping.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class MemberProductController {

	private static final Logger logger = LoggerFactory.getLogger(MemberProductController.class);
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private WishListSerice wishListService;
	
	@Autowired
	private OrderProductService orderService;
	
	@Autowired
	private AuthorityService authorityService;

	/**
	 * 관심상품 조회
	 */
	@RequestMapping(value = "/wishListSearch.do", method = {RequestMethod.GET ,RequestMethod.POST})
	public String wishListSearch(Model model,@RequestParam(value="memberId",required=false) String memberId,
			@RequestParam(defaultValue="1") int page) {
		
		Map<String, Object> map = new HashMap<>();
		
		map  = wishListService.getWishList(memberId,page);
		
		model.addAttribute("list", map.get("list"));
		
		model.addAttribute("pageBean", map.get("pageBean"));
	 
		//List<WishListVo> list = wishListService.getWishList(id);
		//model.addAttribute("list", list);

		logger.info("############# 관심상품페이지 이동 #############");
		return "member/wishListPage";
	}
	
	/**
	 * 관심상품 삭제
	 */
	@RequestMapping(value = "/deleteWishList.do", method = RequestMethod.POST)
	@ResponseBody
	public void deleteWishList(@RequestParam(value="checkList[]",required=false) List<String> checkList) {
		
		for(int i = 0; i < checkList.size(); i++) {
			wishListService.removeWishList(Integer.parseInt(checkList.get(i).toString()));
			logger.info("############# 관심상품 삭제 완료  #############");
		}
	}
	
	/**
	 * 주문목록 조회
	 */
	@RequestMapping(value = "/orderListSearch.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String orderListSearch(Model model,@RequestParam(value="id",required=false) String memberId) {
		
		List<OrderCheckVo> list = orderService.getMemberOrderList(memberId);
		
		model.addAttribute("list", list);

		logger.info("############# 주문목록 이동 #############");
		return "member/orderListPage";
	}	
	
	/**
	 * 주문상세상품 조회
	 */
	@RequestMapping(value = "/productListSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderProductVo> productListSearch(Model model,@RequestParam(value="orderNo",required=false) int orderNo) {
		
		List<OrderProductVo> list = orderService.getOrderProductList(orderNo);
	
		logger.info("############# 주문상품 상세 modal #############");
		
		return list;
	}	
	
	
	/**
	 * 주문 상태 수정
	 */
	@RequestMapping(value = "/haningUpdateOrder.do", method = RequestMethod.POST)
	public String haningUpdateOrder(Model model,@RequestParam(value="orderNo",required=false) int orderNo,
			@RequestParam(value="handing",required=false) String handing,
			@RequestParam(value="memberId",required=false) String memberId) {
		
		orderService.handingUpdateOrder(orderNo,handing);
		
		List<OrderCheckVo> list = orderService.getMemberOrderList(memberId);
		
		model.addAttribute("list", list);
		
		logger.info("############# 주문 취소 #############");
		return "member/orderListPage";
	}
}
