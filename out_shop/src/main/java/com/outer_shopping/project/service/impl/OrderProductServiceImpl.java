package com.outer_shopping.project.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outer_shopping.project.dao.OrderProductDao;
import com.outer_shopping.project.service.OrderProductService;
import com.outer_shopping.project.util.PagingBean;
import com.outer_shopping.project.vo.OrderCheckVo;
import com.outer_shopping.project.vo.OrderProductVo;

@Service("OrderProductService")
public class OrderProductServiceImpl implements OrderProductService {
	
	@Autowired
	private OrderProductDao dao;

		
	/**
	 * 상품 주문
	 */
	@Override
	public void addOrderCheck(OrderCheckVo check) {
		try {
			dao.insertOrderCheck(check);
		}catch (Exception e) {
			System.out.println("addOrderProduct(service) : ");
			e.printStackTrace();
		}
	}

	/**
	 * 상품 주문 상세 정보 
	 */
	@Override
	public void addOrderProduct(List<OrderProductVo> productList) {
		try {
			for (int i = 0; i < productList.size(); i++) {
				dao.insertOrderProduct(productList.get(i));
			}
		}catch (Exception e) {
			System.out.println("addOrderProduct(service) : ");
			e.printStackTrace();
		}
		
	}

	/**
	 * 주문 상태 정보
	 */
	@Override
	public void handingUpdateOrder(int orderNo, String handing) {
		try {
			dao.handingUpdateOrder(orderNo,handing);
		}catch (Exception e) {
			System.out.println("handingUpdateOrder(service) : ");
			e.printStackTrace();
		}	
	}
	
	/**
	 * 전체 주문 목록
	 */
	@Override
	public Map<String, Object> getOrderList(String items, int page) {
		List<OrderCheckVo> list = new ArrayList<>();
		
		HashMap<String, Object> map = new HashMap<>();
		
		try {
			
			int totalCount = dao.selectOrderListCount();
			int handingCount = dao.selectOrderHandingListCount(items);

			PagingBean pageBean = null;
			
			if(items.equals("전체보기")) {
				pageBean = new PagingBean(totalCount, page);
			}else {
				pageBean = new PagingBean(handingCount, page);
			}
						
			map.put("pageBean", pageBean);
			list = dao.selectOrderList(items,pageBean.getBeginItemInPage(), pageBean.getEndItemInPage());
			map.put("list", list);
			
		}catch (Exception e) {
			System.out.println("getMemberOrderList(service) : ");
			e.printStackTrace();
		}	
		
		return map;
	}

	/**
	 * 회원별 주문 목록
	 */
	@Override
	public Map<String, Object> getMemberOrderList(String memberId, String items, int page) {
		
		List<OrderCheckVo> list = new ArrayList<>();
		
		HashMap<String, Object> map = new HashMap<>();
		
		try {
			int totalCount = dao.selectOrderMemberIdDateListCount(memberId,items);
			PagingBean pageBean = new PagingBean(totalCount, page);
			map.put("pageBean", pageBean);
			list = dao.selectMemberOrderList(memberId, items, pageBean.getBeginItemInPage(), pageBean.getEndItemInPage());
			map.put("list", list);
			
		}catch (Exception e) {
			System.out.println("getMemberOrderList(service) : ");
			e.printStackTrace();
		}	
		
		return map;
	}

	/**
	 * 주문 상세정보 목록
	 */
	@Override
	public List<OrderProductVo> getOrderProductList(int orderId) {
		List<OrderProductVo> list = new ArrayList<>();
		
		try {
			list = dao.selectOrderProductList(orderId);
		}catch (Exception e) {
			System.out.println("getOrderProductList(service) : ");
			e.printStackTrace();
		}	
		
		return list;
	}

	@Override
	public List<Map<String,Object>> getOrderTopThreeList() {
		
		List<Map<String,Object>> list = new ArrayList<>();
		
		try {
			list = dao.selectTopThreeList();
		}catch (Exception e) {
			System.out.println("getOrderTopThreeList(service) : ");
			e.printStackTrace();
		}	
		
		return list;
	}

	@Override
	public List<Map<String, Object>> getMonthProduct() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		try {
			list = dao.selectMonthProduct();
		}catch (Exception e) {
			System.out.println("getMonthProduct(service) : ");
			e.printStackTrace();
		}	
		
		return list;
	}

	@Override
	public List<Map<String, Object>> getYearProduct() {
		List<Map<String, Object>> list = new ArrayList<>();
		
		try {
			list = dao.selectYearProduct();
		}catch (Exception e) {
			System.out.println("getMonthProduct(service) : ");
			e.printStackTrace();
		}	
		
		return list;
	}

	
}
