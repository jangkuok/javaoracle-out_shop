package com.outer_shopping.project.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.outer_shopping.project.dao.OuterSizeDao;
import com.outer_shopping.project.vo.OuterSizeVo;



@Repository
public class OuterSizeDaoImpl implements OuterSizeDao {
	
	@Autowired
	private SqlSession session;
	
	/**
	 * mapper SQL_ID 메소드
	 * @param id
	 * @return
	 */
	private String makeSqlId(String id){
		return "com.outer_shopping.project.mapper.OuterSizeMapper."+id;
	}
	

	/**
	 * 사이즈 등록
	 */
	@Override
	public void insertSize(OuterSizeVo size) {
		try {
			session.insert(makeSqlId("insertSize"), size);
		}catch (Exception e) {
			System.out.println("insertSize(dao) : ");
			e.printStackTrace();
		}	
		
	}

	
	
	/**
	 * 사이즈 삭제
	 */
	@Override
	public void deleteOuterSize(int outerNo) {
		try {
			session.delete(makeSqlId("deleteOuterSize"), outerNo);
		}catch (Exception e) {
			System.out.println("deleteOuterSize(dao) : ");
			e.printStackTrace();
		}
	}

	
	
	/**
	 * 상품 사이즈 목록
	 */
	@Override
	public List<OuterSizeVo> selectOuterSizeProduct(int outerNo) {
		List<OuterSizeVo> list = null;
		
		try {
			list = session.selectList(makeSqlId("selectSizeProductCheck"), outerNo);
		}catch (Exception e) {
			System.out.println("selectSizeProductCheck(dao) : ");
			e.printStackTrace();
		}	
		
		return list;
	}


	/**
	 * 사이즈 목록
	 */
	@Override
	public List<OuterSizeVo> selectListOuterSizeColor(int outerNo, String type) {
		
		List<OuterSizeVo> list = null;
		
		try {
			
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("outerNo",outerNo);
			input.put("type",type);
			
			list = session.selectList(makeSqlId("selectSizeColorCheck"), input);
		}catch (Exception e) {
			System.out.println("selectListOuterSizeColor(dao) : ");
			e.printStackTrace();
		}	
		
		return list;
	}


	@Override
	public OuterSizeVo outerSizeAmountPlusCnt(int outerNo, String type, String color) {
		OuterSizeVo outerSize = null;
		
		try {
			
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("outerNo",outerNo);
			input.put("type",type);
			input.put("color",color);
			
			outerSize = session.selectOne(makeSqlId("outerSizeAmountPlusCnt"), input);
		}catch (Exception e) {
			System.out.println("outerSizeAmountPlusCnt(dao) : ");
			e.printStackTrace();
		}	
		
		return outerSize;
	}


	@Override
	public OuterSizeVo outerSizeAmountMinusCnt(int outerNo, String type, String color) {
		OuterSizeVo outerSize = null;
		
		try {
			
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("outerNo",outerNo);
			input.put("type",type);
			input.put("color",color);
			
			outerSize = session.selectOne(makeSqlId("outerSizeAmountMinusCnt"), input);
		}catch (Exception e) {
			System.out.println("outerSizeAmountMinusCnt(dao) : ");
			e.printStackTrace();
		}	
		
		return outerSize;
	}

	
	
	
}
