package kids.board.activity.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kids.board.activity.model.Activity;
import kids.board.activity.model.ActivityDao;
import kids.board.timetable.controller.ListTimeTableController;
import kids.board.timetable.model.TimetableDao;
import kids.common.controller.SuperClass;

public class InsertActivityController extends SuperClass {
	private Activity bean = null ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		String gotopage = "/activity/acInsert.jsp" ;
		super.GotoPage(gotopage);
	}
	
		@Override
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			super.doPost(request, response);
	
			MultipartRequest multi = (MultipartRequest)request.getAttribute("multi") ;
			
			bean = new Activity() ;
			bean.setTitle("title") ;
			bean.setContent("content");
			bean.setImage("image");
//			bean.setDate("date");
//			bean.setRemark("remark");
			bean.setTid("tid");
			
			if (multi.getParameter("actino") != null && multi.getParameter("actino").equals("") == false) {
				bean.setActino(Integer.parseInt(multi.getParameter("actino")));	
			}
			
			if (multi.getParameter("subject_code") != null && multi.getParameter("subject_code").equals("") == false) {
				bean.setSubject_code(Integer.parseInt(multi.getParameter("subject_code")));	
			}
			
			if (multi.getParameter("class_id") != null && multi.getParameter("class_id").equals("") == false) {
				bean.setClass_id(Integer.parseInt(multi.getParameter("class_id")));	
			}		
			
			if (multi.getParameter("readhit") != null && multi.getParameter("readhit").equals("") == false) {
				bean.setReadhit(Integer.parseInt(multi.getParameter("readhit")));	
			}
			if (this.validate(request) == true) {
				System.out.println("activity insert validation check success");
				ActivityDao dao = new ActivityDao() ;
				
				int cnt = -99999 ;
				cnt = dao.InsertData(bean) ;
				
				new ListActivityController().doGet(request, response);
				
			} else {
				System.out.println("activity insert validation check failure");			
				request.setAttribute("bean", bean); 			
				super.doPost(request, response);			
				String gotopage = "/activity/acList.jsp" ;
				super.GotoPage(gotopage);
			}
		}
	}