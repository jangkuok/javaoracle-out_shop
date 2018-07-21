package com.outer_shopping.project.service;

import java.util.List;
import java.util.Map;

import com.outer_shopping.project.vo.OrderCheckVo;
import com.outer_shopping.project.vo.OrderProductVo;

public interface OrderProductService {
	
	/**
	 * 주문 추가
	 * @param check
	 */
	void addOrderCheck(OrderCheckVo check);
	
	/**
	 * 주문 상세정보 추가
	 * @param productList
	 */
	void addOrderProduct(List<OrderProductVo> productList);
	
	
	/**
	 * 주문 취소
	 * @param orderId
	 */
	void handingUpdateOrder(int orderNo, String handing);
	
	
	/**
	 * 전체 주문 목록	 
	 * @param items, page
	 * @return
	 */
	Map<String, Object> getOrderList(String items, int page);
	
	/**
	 * 해당 회원 주문 목록
	 * @param memberId, page
	 * @return
	 */
	Map<String, Object> getMemberOrderList(String memberId, String items, int page); 
	
	/**
	 * 주문 관련 상품 목록 
	 * @param orderId
	 * @return
	 */
	List<OrderProductVo> getOrderProductList(int orderId);
	
	List<Map<String,Object>> getOrderTopThreeList();
	
	List<Map<String, Object>> getMonthProduct();
	
	List<Map<String, Object>> getYearProduct();
}
