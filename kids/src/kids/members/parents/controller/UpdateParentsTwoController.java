package kids.members.parents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.members.parents.model.Parents;
import kids.members.parents.model.ParentsDao;

public class UpdateParentsTwoController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);

		
//		
//		String page = request.getParameter("page");
//		if(!(page == null || page.equals("null") || page.equals(""))) {
//			if(page.equals("update")) {
////				request.setAttribute("pid", pid);
//				request.setAttribute("page", "result");
////				if(cnt == 1) {
////					request.setAttribute("message", "수정이 완료되었습니다");
///					new UpdateParentsController().doGet(request, response);
//				}else {
//					request.setAttribute("message", "수정이 실패하였습니다");
//					new UpdateParentsController().doGet(request, response);
//				}
//			}
//		}
		
		
		String page = request.getParameter("page");
		if(page == "result") {
			String message = request.getParameter("message");
			request.setAttribute("message", message);
			
			String gotopage = "parents/updateOK.jsp";
			super.GotoPage(gotopage);
		}
		
		String gotopage = "parents/paUpdate.jsp";
		super.GotoPage(gotopage);
	}
} 
