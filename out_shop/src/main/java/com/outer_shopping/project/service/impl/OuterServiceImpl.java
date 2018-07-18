package com.outer_shopping.project.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.outer_shopping.project.dao.OuterDao;
import com.outer_shopping.project.service.OuterService;
import com.outer_shopping.project.util.OuterPagingBean;
import com.outer_shopping.project.util.PagingBean;
import com.outer_shopping.project.vo.OuterVo;


@Service("OuterService")
public class OuterServiceImpl implements OuterService {

	@Autowired
	private OuterDao dao;
	
	/**
	 * 아웃터 등록
	 */
	@Override
	public void createOuter(OuterVo outer) {
		try {
			dao.insertOuter(outer);
		}catch (Exception e) {
			System.out.println("createOuter(service) : ");
			e.printStackTrace();
		}
	}
	

	/**
	 * 아웃터 수정
	 */
	@Override
	public void modifyOuter(OuterVo outer) {
		try {
			dao.updateOuter(outer);
		}catch (Exception e) {
			System.out.println("modifyOuter(service) : ");
			e.printStackTrace();
		}
	}

	
	/**
	 * 아웃터 삭제
	 */	
	@Override
	public void removeOuter(int outerNo) {
		try {
			dao.deleteOuter(outerNo);
		}catch (Exception e) {
			System.out.println("removeOuter(service) : ");
			e.printStackTrace();
		}
	}


	/**
	 * 아웃터 목록
	 */
	@Override
	public List<OuterVo> findOuterList() {
		
		List<OuterVo> list = null;
		
		try {
			list = dao.selectListOuter();
		}catch (Exception e) {
			System.out.println("findOuterList(service) : ");
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	@Override
	public List<OuterVo> findItemOuterList(String items) {
		List<OuterVo> list = null;
		
		try {
			list = dao.selectItemsOuterListNotPage(items);
		}catch (Exception e) {
			System.out.println("findOuterItemList(service) : ");
			e.printStackTrace();
		}
		
		return list;
	}


	/**
	 * 카테고리별 아웃터 목록 
	 */
	@Override
	public Map<String, Object> findItemsOuterList(String items, int page) {
		
		List<OuterVo> list = new ArrayList<>();
		
		HashMap<String, Object> map = new HashMap<>();
		
		try {
			int totalCount = dao.selectOuterListCount(items);
			OuterPagingBean pageBean = new OuterPagingBean(totalCount, page);
			map.put("pageBean", pageBean);
			list = dao.selectItemsOuterList(items, pageBean.getBeginItemInPage(), pageBean.getEndItemInPage());
			map.put("list", list);
			
		}catch (Exception e) {
			System.out.println("findItemsOuterList(service) : ");
			e.printStackTrace();
		}	
		
		return map;
	}
	

	@Override
	public Map<String, Object> findItemsOuterList2(String items, int page) {
		List<Map<Object,String>> list = new ArrayList<>();
		
		HashMap<String, Object> map = new HashMap<>();
		
		try {
			int totalCount = dao.selectOuterListCount(items);
			
			OuterPagingBean pageBean = new OuterPagingBean(totalCount, page);
			
			map.put("pageBean", pageBean);
			
			////////////////////////////////////////////////////////////////////
			
			List<OuterVo> outerList = dao.selectItemsOuterListNotPage(items);
			
			
			List<Map<Object , String>> mapList = new ArrayList<>();
			
			String color = "";
			String size = "";
			int amount = 0;
			
			for (int i = 0; i < outerList.size(); i++) {
				
				OuterVo outerVo = dao.selectOuterId(outerList.get(i).getOuterNo());
				
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
				
				
				Map<Object , String> obMap = new HashMap<>();
				
				obMap.put("outerNo", Integer.toString(outerList.get(i).getOuterNo()));
				obMap.put("imageName", outerList.get(i).getImageName());
				obMap.put("name", outerList.get(i).getName());
				obMap.put("price", Integer.toString(outerList.get(i).getPrice()));
				obMap.put("size", size);
				obMap.put("color", color);
				obMap.put("amount", Integer.toString(amount));
				
				list.add(obMap);
				
				size = "";
				color = "";
				amount = 0;
			}	
			

			Object ob = new Object();
			
			
			
			
			//list = dao.selectItemsOuterList(items, pageBean.getBeginItemInPage(), pageBean.getEndItemInPage(),,,,);
			
			map.put("list", list);
			
		}catch (Exception e) {
			System.out.println("findItemsOuterList(service) : ");
			e.printStackTrace();
		}	
		
		return map;
	}


	/**
	 * 아웃터 상세 정보
	 */
	@Override
	public OuterVo getOuter(int outerNo) {
		
		OuterVo outer = new OuterVo();
		
		try {
			outer = dao.selectOuterId(outerNo);
		}catch (Exception e) {
			System.out.println("getOuter(service) : ");
			e.printStackTrace();
		}
		
		return outer;
	}


	@Override
	public Map<String, Object> findOuterAmountList(int page) {
		List<OuterVo> list = new ArrayList<>();
		
		HashMap<String, Object> map = new HashMap<>();
		
		try {
			int totalCount = dao.selectOuterListCount();
			PagingBean pageBean = new PagingBean(totalCount, page);
			map.put("pageBean", pageBean);
			list = dao.selectOuterAmountList(pageBean.getBeginItemInPage(), pageBean.getEndItemInPage());
			map.put("list", list);
			
		}catch (Exception e) {
			System.out.println("findOuterAmountList(service) : ");
			e.printStackTrace();
		}	
		
		return map;
	}
	
	
	
}
