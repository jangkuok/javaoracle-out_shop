package com.outer_shopping.project.r;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;

public class Test1 {
    public static void main(String[] args) {
		RConnection connection = null;
		
		String fileName = System.currentTimeMillis()+"graph";
		REXP x = null;
		try {
	        connection = new RConnection();
	        connection.eval("library(ggplot2)");
	        connection.eval("require(ggplot2)");
	        connection.eval("name <- c('제닉스','제닉스2','g950','g340')");
	        connection.eval("count <- c(100,33,21,87)");
	        connection.eval("pp <- data.frame(이름=name,판매수입=payment)");
	        connection.eval("pp$pos <- pp$판매수입>=mean(pp$판매수입)");
	        connection.eval("png(filename='D://DEV/fileUpLoad/image/graph"+fileName+"',width=800,height=600)");
	        connection.parseAndEval("print(ggplot(pp, aes(x = 이름, y = 판매수입, fill = pos)) + geom_col(size = .25) + scale_fill_manual(values = c('#F7756B', '#00BEFF')) +labs(fill='평균 이상'))");
	        connection.parseAndEval("print(dev.off());");
	        connection.close(); 
		} catch (Exception e) {
			// TODO: handle exception
		}

	}
}
