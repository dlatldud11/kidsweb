package kids.board.activity_comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kids.board.activity_comment.model.Activity_comment;
import kids.board.activity_comment.model.Activity_commentDao;
import kids.common.controller.SuperClass;

public class InsertAcCommentController extends SuperClass{
	private Activity_comment bean = null ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		String gotopage = "/activity/accoInsert.jsp" ;
		super.GotoPage(gotopage);
	}
	
		@Override
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			super.doPost(request, response);
	
			MultipartRequest multi = (MultipartRequest)request.getAttribute("multi") ;
			
			bean = new Activity_comment() ;
			bean.setContent("content") ;
//			bean.setDate("date");
//			bean.setRemark("remark");
			bean.setTid("tid");
			bean.setPid("pid");
			
			if (multi.getParameter("activity_cmid") != null && multi.getParameter("activity_cmid").equals("") == false) {
				bean.setActivity_cmid(Integer.parseInt(multi.getParameter("activity_cmid")));	
			}
			
			if (multi.getParameter("actino") != null && multi.getParameter("actino").equals("") == false) {
				bean.setActino(Integer.parseInt(multi.getParameter("actino")));	
			}
			
			if (multi.getParameter("groupno") != null && multi.getParameter("groupno").equals("") == false) {
				bean.setGroupno(Integer.parseInt(multi.getParameter("groupno")));	
			}		
			
			if (multi.getParameter("orderno") != null && multi.getParameter("orderno").equals("") == false) {
				bean.setOrderno(Integer.parseInt(multi.getParameter("orderno")));	
			}
			if (multi.getParameter("depth") != null && multi.getParameter("depth").equals("") == false) {
				bean.setDepth(Integer.parseInt(multi.getParameter("depth")));	
			}
			if (this.validate(request) == true) {
				System.out.println("activity insert validation check success");
				Activity_commentDao dao = new Activity_commentDao() ;
				
				int cnt = -99999 ;
				cnt = dao.InsertData(bean) ;
				
				new ListAcCommentController().doGet(request, response);
				
			} else {
				System.out.println("activity insert validation check failure");			
				request.setAttribute("bean", bean); 			
				super.doPost(request, response);			
				String gotopage = "/activity/accoList.jsp" ;
				super.GotoPage(gotopage);
			}
		}
	}

