package kids.management.st_total.st_manage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;

public class InsertStudentManagerController extends SuperClass {
 @Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	super.doGet(request, response);
	System.out.println("일일기록폼");
	String gotopage = "/st_manage/st_manageForm.jsp" ;
	super.GotoPage(gotopage);
}
}
