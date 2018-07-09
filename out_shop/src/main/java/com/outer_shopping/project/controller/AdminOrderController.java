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

import com.outer_shopping.project.service.OrderProductService;
import com.outer_shopping.project.vo.OrderProductVo;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {

	private static final Logger logger = LoggerFactory.getLogger(AdminOrderController.class);
	
	@Autowired
	private OrderProductService orderService;
	
	
	
	/**
	 * 주문 전체 목록 페이지 이동
	 */
	@RequestMapping(value = "/adminOrderListPage.do", method=RequestMethod.GET)
	public String adminOrderListPage(Model model,@RequestParam("items") String items, @RequestParam(defaultValue="1") int page) {
		
		Map<String, Object> map = new HashMap<>();
		
		map  = orderService.getOrderList(items,page);
		
		model.addAttribute("orderList", map.get("list"));
		
		model.addAttribute("pageBean", map.get("pageBean"));
		
		logger.info("############# 주문 list 페이지 이동 #############");
		
		System.out.println(items);
		
		return "admin/adminOrderListPage";
	}
	
	/**
	 * 주문상세상품 조회
	 */
	@RequestMapping(value = "/adminProductListSearch.do", method = RequestMethod.GET)
	@ResponseBody
	public List<OrderProductVo> adminProductListSearch(Model model,@RequestParam("orderNo") int orderNo) {
		
		List<OrderProductVo> list = orderService.getOrderProductList(orderNo);
	
		logger.info("############# 주문상품 상세 modal #############");
		
		return list;
	}	
	
	/**
	 * 주문 상태 수정
	 */
	@RequestMapping(value = "/haningUpdateOrder.do", method = RequestMethod.POST)
	public String haningUpdateOrder(Model model,@RequestParam("orderNo") int orderNo,
			@RequestParam(value="items",defaultValue="all") String items,
			@RequestParam(value="handing") String handing, @RequestParam(defaultValue="1") int page) {
		
		orderService.handingUpdateOrder(orderNo,handing);
		
		Map<String, Object> map = new HashMap<>();
		
		map  = orderService.getOrderList(items,page);
		
		model.addAttribute("orderList", map.get("list"));
		
		model.addAttribute("pageBean", map.get("pageBean"));
		
		logger.info("############# 주문 list 페이지 이동 #############");
		
		return "admin/adminOrderListPage";
	}
}
