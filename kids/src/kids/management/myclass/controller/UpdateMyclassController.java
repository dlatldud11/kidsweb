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
		
		int myclass_id = Integer.parseInt(request.getParameter("myclass_id")) ;
		
		MyclassDao dao = new MyclassDao();
		int bean = dao.DeleteData(myclass_id) ;
				
		request.setAttribute("bean", bean);
		
		String gotopage = "/myclass/myclUpdate.jsp" ;
		super.GotoPage(gotopage);
	}
	
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		Myclass bean = new Myclass() ;
		
		bean.setClass_id(Integer.parseInt(request.getParameter("class_id")));
		bean.setClass_name(request.getParameter("classs_name"));
		bean.setRemark(request.getParameter("remark"));
		
		
	}
}
