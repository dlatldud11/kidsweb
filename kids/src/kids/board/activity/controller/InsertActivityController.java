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
import kids.management.myclass.controller.ListMyclassController;

public class InsertActivityController extends SuperClass {
	private Activity bean = null ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		
		
//		request.setAttribute("lists", lists);
		
		String gotopage = "/activity/acInsert.jsp" ;
		super.GotoPage(gotopage);
	}
	
		@Override
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			super.doPost(request, response);
	
			//MultipartRequest multi = (MultipartRequest)request.getAttribute("multi") ;
			
			bean = new Activity() ;
			String title = request.getParameter("title");
			bean.setTitle(title);
			
			bean.setTitle(request.getParameter("title")) ;
			bean.setContent("content");
			bean.setImage("image");
			bean.setTid("tid");
			bean.setImage("image");
			
			System.out.println(bean);
			ActivityDao dao = new ActivityDao() ;
			int cnt = -99999;
			cnt = dao.InsertData(bean);

			System.out.println("activity입력 완료");
	        new ListActivityController().doGet(request, response);
		}
	}