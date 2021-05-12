package kids.members.parents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.common.utility.MailSend;
import kids.members.parents.model.Parents;
import kids.members.parents.model.ParentsDao;

public class SearchParentsIdController extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		
		ParentsDao pdao = new ParentsDao();
		Parents bean = pdao.searchId(name, birth, email);
		
		if(bean == null) { //입력받은 정보와 일치하는 아이디가 없다
			
		}else { //일치하는 아이디가 있다.
			MailSend ms = new MailSend();
			String code = ms.mailSend(email);
			
			request.setAttribute("code", code);
			String gotopage ="/parents/paIdSearch.jsp";
			super.GotoPage(gotopage);
		}
		
	}
}
