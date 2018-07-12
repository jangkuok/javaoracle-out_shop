package com.outer_shopping.project.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
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
			@RequestParam(value="items") String items,
			@RequestParam(value="handing") String handing, @RequestParam(defaultValue="1") int page) {
		
		orderService.handingUpdateOrder(orderNo,handing);
		
		Map<String, Object> map = new HashMap<>();
		
		map  = orderService.getOrderList(items,page);
		
		model.addAttribute("orderList", map.get("list"));
		
		model.addAttribute("pageBean", map.get("pageBean"));
		
		logger.info("############# 주문 list 페이지 이동 #############");
		
		return "admin/adminOrderListPage";
	}
	
	/**
	 * 상품별 월 판매수량 그래프
	 */
	@RequestMapping(value = "/saleProductGraph.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String saleProductGraph(Model model) throws REngineException, REXPMismatchException  {
		
		
		List<Map<String, Object>> list = orderService.getMonthProduct();
		
		//판매개수
		String count = "";
		
		//상품이름
		String name = "";
		
		for (int i = 0; i < list.size(); i++) {
			
			if(i == list.size()-1) {
				count= count + "" + list.get(i).get("SALE_COUNT").toString() + "";
				name = name + "'" + list.get(i).get("PRODUCT_NAME").toString() + "'";
			}else {
				count= count + "" + list.get(i).get("SALE_COUNT").toString() + ",";
				name = name + "'" + list.get(i).get("PRODUCT_NAME").toString() + "',";
			}			
		}
		
		RConnection connection = null;
		
		String fileName = "salesGraph.png";
		
		String path = "D:\\DEV\\fileUpLoad\\image\\graph";
		
        File file = new File(path + "/"+fileName);
        
        if( file.exists() ){
            if(file.delete()){
                logger.info("############# 파일삭제 성공 #############");
            }else{
            	logger.info("############# 파일삭제 실패 #############");
            }
        }else{
        	logger.info("############# 파일이 존재하지 않습니다. #############");
        }
		
		try {
	        connection = new RConnection();
	        connection.eval("library(ggplot2)");
	        connection.eval("require(ggplot2)");
	        connection.eval("name <- c("+name+")");
	        connection.eval("count <- c("+count+")");
	        connection.eval("pp <- data.frame(상품이름=name,판매개수=count)");
	        connection.eval("pp$pos <- pp$판매개수>=mean(pp$판매개수)");
	        connection.eval("png(filename='D://DEV/fileUpLoad/image/graph/"+fileName+"',width=800,height=600)");
	        connection.parseAndEval("print(ggplot(pp, aes(x = 상품이름, y = 판매개수, fill = pos)) + geom_col(size = .25) + scale_fill_manual(values = c('#F7756B', '#00BEFF')) +labs(fill='평균 이상'))");
	        connection.parseAndEval("print(dev.off());");
	        connection.close(); 
	        
		} catch (Exception e) {
			System.out.println("R 그래프 오류 : ");
			e.getStackTrace();
		}
		
		model.addAttribute("graph", fileName);

		return "admin/saleProductPage";

	}	
	
	
	/**
	 * 월별 판매익 그래프
	 */
	@RequestMapping(value = "/saleMonthProductGraph.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String saleMonthProductGraph(Model model) throws REngineException, REXPMismatchException  {
		
		List<Map<String, Object>> list = orderService.getYearProduct();
		
		//월
		String month = "'01월','02월','03월','04월','05월','06월','07월','08월','09월','10월','11월','12월'";
		
		//판매가격
		String price = "";
	
		for (int i = 1; i <= 12; i++) {
			
			if(i >= 10 && i < 12) {
				price = price + list.get(0).get(i+"월").toString()+ ",";
			}else if(i == 12) {
				price = price + list.get(0).get(i+"월").toString();
			}else {
				price = price + list.get(0).get("0"+i+"월").toString() + ",";
			}			
		}
		
		RConnection connection = null;
		
		String fileName = "salesMonthGraph.png";
		
		String path = "D:\\DEV\\fileUpLoad\\image\\graph";
		
        File file = new File(path + "/"+fileName);
        
        if( file.exists() ){
            if(file.delete()){
                logger.info("############# 파일삭제 성공 #############");
            }else{
            	logger.info("############# 파일삭제 실패 #############");
            }
        }else{
        	logger.info("############# 파일이 존재하지 않습니다. #############");
        }
		
		try {
	        connection = new RConnection();
	        connection.eval("library(ggplot2)");
	        connection.eval("require(ggplot2)");
	        connection.eval("name <- c("+month+")");
	        connection.eval("count <- c("+price+")");
	        connection.eval("pp <- data.frame(월=name,총판매익=count)");
	        connection.eval("pp$pos <- pp$총판매익>=mean(pp$총판매익)");
	        connection.eval("png(filename='D://DEV/fileUpLoad/image/graph/"+fileName+"',width=800,height=600)");
	        connection.parseAndEval("print(ggplot(pp, aes(x = 월, y = 총판매익, fill = pos)) + geom_col(size = .25) + scale_fill_manual(values = c('#F7756B', '#00BEFF')) +labs(fill='평균 이상'))");
	        connection.parseAndEval("print(dev.off());");
	        connection.close(); 
	        
		} catch (Exception e) {
			System.out.println("R 그래프 오류 : ");
			e.getStackTrace();
		}
		
		model.addAttribute("graph", fileName);

		return "admin/saleProductPage";

	}
	
}
