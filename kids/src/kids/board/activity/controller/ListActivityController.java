package kids.board.activity.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.board.activity.model.Activity;
import kids.board.activity.model.ActivityDao;
import kids.common.controller.SuperClass;

public class ListActivityController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		
		
		 ActivityDao dao = new ActivityDao(); List<Activity> lists =
		 dao.SelectDataList(0, 0);
		 
		 
		
		String gotopage = "/activity/acList.jsp" ;
		super.GotoPage(gotopage);
	}
	
	
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
}
