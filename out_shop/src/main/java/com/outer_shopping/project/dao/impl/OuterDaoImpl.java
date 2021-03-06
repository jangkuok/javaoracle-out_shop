package com.outer_shopping.project.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.outer_shopping.project.dao.OuterDao;
import com.outer_shopping.project.vo.OrderCheckVo;
import com.outer_shopping.project.vo.OuterVo;

import lombok.extern.slf4j.Slf4j;


@Repository
public class OuterDaoImpl implements OuterDao {

	@Autowired
	private SqlSession session;
	
	/**
	 * mapper SQL_ID 메소드
	 * @param id
	 * @return
	 */
	private String makeSqlId(String id){
		return "com.outer_shopping.project.mapper.OuterMapper."+id;
	}
	
	/**
	 * 아웃터 등록
	 */
	@Override
	public void insertOuter(OuterVo outer) {
		
		try {
			session.insert(makeSqlId("insertOuter"), outer);
		}catch (Exception e) {
			System.out.println("insertOuter(dao) : ");
			e.printStackTrace();
		}	
	}

	
	
	/**
	 * 아웃터 수정
	 */
	@Override
	public void updateOuter(OuterVo outer) {
		try {
			session.update(makeSqlId("updateOuter"), outer);
		}catch (Exception e) {
			System.out.println("updateOuter(dao) : ");
			e.printStackTrace();
		}	
	}
	
	
	
	/**
	 * 아웃터 삭제
	 */
	@Override
	public void deleteOuter(int outerNo) {
		try {
			session.delete(makeSqlId("deleteOuter"), outerNo);
		}catch (Exception e) {
			System.out.println("deleteOuter(dao) : ");
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 아웃터 전체 목록 카운트
	 */
	@Override
	public int selectOuterListCount() {
		int count = 0;
		
		try {
			count = session.selectOne(makeSqlId("selectOuterAmountCount"));
		} catch (Exception e) {
			System.out.println("selectOuterListCount(dao) : ");
			e.printStackTrace();
		}
		return count;
	}
	
	
	@Override
	public int selectOuterListCount(String items) {
		int count = 0;
		
		try {
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("items",items);			
			count = session.selectOne(makeSqlId("selectOuterListCount"),input);
		} catch (Exception e) {
			System.out.println("selectOuterListCount(dao) : ");
			e.printStackTrace();
		}
		return count;
	}
	
	/**
	 * 아웃터 목록
	 */
	@Override
	public List<OuterVo> selectListOuter() {
		
		List<OuterVo> list = null;

		try {
			list = session.selectList(makeSqlId("selectOuterList"));
		}catch (Exception e) {

			System.out.println("selectListOuter(dao) : ");
			e.printStackTrace();
		}	
		return list;
	}

	
	/**
	 * 카테고리별 상품목록
	 */
	@Override
	public List<OuterVo> selectItemsOuterList(String items, int startIndex, int endIndex) {
		
		List<OuterVo> list = new ArrayList<>();
		
		try {
		
			Map<String, Object> input = new HashMap<String, Object>();
			
			input.put("items",items);
			input.put("startIndex",startIndex);
			input.put("endIndex",endIndex);
		
			
			list = session.selectList(makeSqlId("selectItemsOuterList"), input);
		}catch (Exception e) {
			System.out.println("selectItemsOuterList(dao) : ");
			e.printStackTrace();
		}	
		
		return list;
	}
	

	/**
	 * 아웃터 상세 정보
	 */
	@Override
	public OuterVo selectOuterId(int outerNo) {
		
		OuterVo outer = new OuterVo();
		
		try {
			outer = session.selectOne(makeSqlId("selectOuterId"),outerNo);
		}catch (Exception e) {

			System.out.println("selectOuterId(dao) : ");
			e.printStackTrace();
		}	
		
		return outer;
	}

	
	@Override
	public List<OuterVo> selectOuterAmountList(int startIndex, int endIndex) {
		List<OuterVo> list = new ArrayList<>();
		
		try {
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("startIndex",startIndex);
			input.put("endIndex",endIndex);
		
			
			list = session.selectList(makeSqlId("selectOuterAmountList"), input);
		}catch (Exception e) {
			System.out.println("selectOuterAmountList(dao) : ");
			e.printStackTrace();
		}	
		
		return list;
	}
	
	
	
	
}
