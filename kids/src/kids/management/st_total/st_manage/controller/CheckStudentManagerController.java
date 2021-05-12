package kids.management.st_total.st_manage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;

public class CheckStudentManagerController extends SuperClass {
 @Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	super.doGet(request, response);
	
	String gotopage = "/st_manage/stmCheck.jsp" ;
	super.GotoPage(gotopage);
}
 
 @Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		String sid = (String)session.getAttribute("sid");
		System.out.println(sid);
		String gotopage = "/st_manage/stmCheck.jsp" ;
		super.GotoPage(gotopage);
	}
}
