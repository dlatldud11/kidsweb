package kids.management.st_total.stu_fee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;

public class ListStudentFeeController extends SuperClass {
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	super.doGet(request, response);
	String gotopage = "/stu_fee/stfList.jsp" ;
	super.GotoPage(gotopage);
}
} 
