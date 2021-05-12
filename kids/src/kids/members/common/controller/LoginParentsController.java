<<<<<<< HEAD
package kids.members.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.members.parents.model.Parents;
import kids.members.parents.model.ParentsDao;

public class LoginParentsController extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		//로그인 폼에서 전달 받음(
		String pid = request.getParameter("id");
		String password = request.getParameter("password");
		
		ParentsDao pdao = new ParentsDao();
		
		Parents bean = pdao.selectData(pid,password);
		
		if(bean==null) {
			String message = "아이디 혹은 비밀번호가 일치하지 않습니다.";
			super.setErrorMessage(message);
			super.session.setAttribute("loginfo", bean);
		}else {
			request.setAttribute("id", pid);
			request.setAttribute("password", password);
			
			String gotopage = "common/main.jsp";
			super.GotoPage(gotopage);
		}
	}
}
=======
package kids.members.common.controller;

import kids.common.controller.SuperClass;

public class LoginParentsController extends SuperClass {

}
>>>>>>> branch 'hoon' of https://github.com/dlatldud11/kidsweb
 