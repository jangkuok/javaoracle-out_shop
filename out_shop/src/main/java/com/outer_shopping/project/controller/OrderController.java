package com.outer_shopping.project.controller;

import java.util.ArrayList;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.outer_shopping.project.service.MemberService;
import com.outer_shopping.project.service.OrderProductService;
import com.outer_shopping.project.vo.OrderCheckVo;
import com.outer_shopping.project.vo.OrderProductVo;
import com.outer_shopping.project.vo.ProductVo;

@Controller
@RequestMapping("/member")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderProductService orderservice;
	
	/**
	 * 상세페이지 -> 주문하기 page 이동
	 */
	@RequestMapping(value = "/orderPage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String orderPage(Model model,@RequestParam Map<String, Object> map) {
		
		
		List<ProductVo> list = new ArrayList<>();
		
		for(int i = 1; i< map.size(); i++) {			
			
			ProductVo cart = new ProductVo();
			
			cart.setCartNo(Integer.parseInt(map.get("productInfo"+i).toString()));			i++;
			cart.setProductNo(Integer.parseInt(map.get("productInfo"+i).toString())); 		i++;
			cart.setThumbnailName((map.get("productInfo"+i).toString())); 					i++;
			cart.setProductName(map.get("productInfo"+i).toString());						i++;
			cart.setProductColor(map.get("productInfo"+i).toString());						i++;
			cart.setProductSize(map.get("productInfo"+i).toString());						i++;
			cart.setProductPrice(Integer.parseInt(map.get("productInfo"+i).toString()));	
			
			list.add(cart);
		}	
		
		model.addAttribute("orderList", list);
		
		logger.info("############# 주문 페이지 이동 #############");
		return "member/orderPage";
	}
	
	/**
	 * 장바구니 -> 주문하기 page 이동
	 */
	@RequestMapping(value = "/orderPages.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String cartAndOrder(Model model, @RequestParam Map<String, Object> map) {

		List<ProductVo> list = new ArrayList<>();
	
		for(int i = 1; i< map.size(); i++) {			
			
			ProductVo cart = new ProductVo();
			
			cart.setCartNo(Integer.parseInt(map.get("productInfo"+i).toString()));		    i++;
			cart.setProductNo(Integer.parseInt(map.get("productInfo"+i).toString())); 	    i++;
			cart.setThumbnailName((map.get("productInfo"+i).toString())); 					i++;
			cart.setProductName(map.get("productInfo"+i).toString());						i++;
			cart.setProductSize(map.get("productInfo"+i).toString());					    i++;
			cart.setProductColor(map.get("productInfo"+i).toString());						i++;
			cart.setProductPrice(Integer.parseInt(map.get("productInfo"+i).toString()));
			
			list.add(cart);
		}	
		
		
		model.addAttribute("memberVo", memberService.viewMember(map.get("memberId").toString()));
		model.addAttribute("orderList", list);
		
		logger.info("############# 주문 페이지 이동 #############");
		return "member/orderPage";
	}
	/**
	 *	상품주문 
	 */
	@RequestMapping(value = "/orderProduct.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String orderProduct(Model model,@RequestParam Map<String, Object> map) {
		
		//주문에 관한 상품 등록
		int productCount = Integer.parseInt(map.get("productCount").toString());
		
		//주문자 정보 저장
		OrderCheckVo check = new OrderCheckVo();
		
		check.setMemberName(map.get("deliveryInfoArr1").toString());
		check.setThumbnailName(map.get("productInfo3").toString());
		
		if(productCount == 1) {
			check.setOrderName(map.get("productInfo4").toString());
		}else {
			check.setOrderName(map.get("productInfo4").toString() + " 외" + (productCount - 1));
		}
		check.setMemberId(map.get("memberId").toString());
		check.setAddress(map.get("deliveryInfoArr2").toString() + " " + map.get("deliveryInfoArr3").toString() + " " + map.get("deliveryInfoArr4").toString());
		check.setPhoneNum(map.get("deliveryInfoArr5").toString());
		check.setEmail(map.get("deliveryInfoArr6").toString());	
		check.setTotalPrice(Integer.parseInt(map.get("deliveryInfoArr7").toString()));	
		if(map.get("deliveryInfoArr8").toString().equals("")) {
			check.setMessage("");
		}else {
			check.setMessage(map.get("deliveryInfoArr8").toString());
		}
		

		orderservice.addOrderCheck(check);
		logger.info("############# 주문 정보 등록 #############");
		
		
		int count = Integer.parseInt(map.get("count").toString());
		
		List<OrderProductVo> list = new ArrayList<>();

		for (int i = 2; i < count; i++) {

			OrderProductVo product = new OrderProductVo();
			product.setOuterNo(Integer.parseInt(map.get("productInfo"+i).toString())); i++;
			product.setThumbnailName(map.get("productInfo"+i).toString()); i++;
			product.setProductName(map.get("productInfo"+i).toString()); i++;
			product.setProductSize(map.get("productInfo"+i).toString()); i++;
			product.setProductColor(map.get("productInfo"+i).toString()); i++;
			product.setProductPrice(Integer.parseInt(map.get("productInfo"+i).toString()));i++;
			product.setOrderNo(check.getOrderNo());
			
			list.add(product);
		}
		
		
		orderservice.addOrderProduct(list);
		logger.info("############# 주문 상품 등록 #############");


		logger.info("############# 상품 주문 완료 #############");
		return "redirect:/member/orderSuccessPage.do";
	}
	
	/**
	 * 주문 성공 페이지
	 */
	@RequestMapping(value = "/orderSuccessPage.do", method = RequestMethod.GET)
	public String createWishList() {
		logger.info("############# 주문성공 페이지 이동 #############");
		return "member/orderSuccessPage";	
	}
}
