package kids.management.myclass.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.management.myclass.model.Myclass;
import kids.management.myclass.model.MyclassDao;

public class UpdateMyclassController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		Myclass bean = null ;
		MyclassDao dao = new MyclassDao();
		String data = dao.toString() ;
		
		int myclass = Integer.parseInt(request.getParameter("myclass")) ;
		
		List<Myclass> lists = new ArrayList<Myclass>() ;
		
		request.setAttribute("bean", bean);
		
		String gotopage = "/member/main.jsp" ;
		super.GotoPage(gotopage);
	}
	
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
}
