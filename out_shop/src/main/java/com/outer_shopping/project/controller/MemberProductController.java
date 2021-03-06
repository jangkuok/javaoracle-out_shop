package com.outer_shopping.project.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.outer_shopping.project.service.AuthorityService;
import com.outer_shopping.project.service.MemberService;
import com.outer_shopping.project.service.OrderProductService;
import com.outer_shopping.project.service.OuterSizeService;
import com.outer_shopping.project.service.WishListSerice;
import com.outer_shopping.project.vo.OrderProductVo;


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
	public String wishListSearch(Model model,@RequestParam(value="memberId") String memberId,
			@RequestParam(defaultValue="1") int page) {
		
		Map<String, Object> map = new HashMap<>();
		
		map  = wishListService.getWishList(memberId,page);
		
		model.addAttribute("list", map.get("list"));
		
		model.addAttribute("pageBean", map.get("pageBean"));
	 
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
	public String orderListSearch(Model model,@RequestParam(value="memberId") String memberId,
			@RequestParam(value="items") String items,
			@RequestParam(defaultValue="1") int page) {
		
		
		Map<String, Object> map = orderService.getMemberOrderList(memberId,items,page);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageBean", map.get("pageBean"));
		
		logger.info("############# 주문목록 이동 #############");
		return "member/orderListPage";
	}	
	
	/**
	 * 주문상세상품 조회
	 */
	@RequestMapping(value = "/productListSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderProductVo> productListSearch(Model model,@RequestParam(value="orderNo") int orderNo) {
		
		List<OrderProductVo> list = orderService.getOrderProductList(orderNo);
	
		logger.info("############# 주문상품 상세 modal #############");
		
		return list;
	}	
	
	
	/**
	 * 주문 상태 수정
	 */
	@RequestMapping(value = "/haningUpdateOrder.do", method = RequestMethod.POST)
	public String haningUpdateOrder(Model model,@RequestParam(value="orderNo") int orderNo,
			@RequestParam(value="items") String items,
			@RequestParam(value="handing") String handing,
			@RequestParam(value="memberId") String memberId,@RequestParam(defaultValue="1") int page) {
		
		orderService.handingUpdateOrder(orderNo,handing);
		
		Map<String, Object> map = orderService.getMemberOrderList(memberId,items,page);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageBean", map.get("pageBean"));
		
		logger.info("############# 주문 취소 #############");
		return "member/orderListPage";
	}
}
