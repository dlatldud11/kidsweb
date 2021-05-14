package kids.board.diet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.board.diet.model.Diet;
import kids.board.diet.model.DietDao;
import kids.common.controller.SuperClass;

public class InsertDietController extends SuperClass{
	Diet bean = null;
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		bean.setBf(request.getParameter("bf"));
		bean.setBffiles(request.getParameter("bffiles"));
		
		DietDao dao = new DietDao();
		int cnt = -99999;
		cnt = dao.InsertDietData(bean);
		
		request.setAttribute("bean", bean);
		
		String gotopage = "/diet/dietList.jsp";
		super.GotoPage(gotopage);
		
	}
} 
