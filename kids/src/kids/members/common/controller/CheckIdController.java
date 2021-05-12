package kids.members.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.members.parents.model.Parents;
import kids.members.parents.model.ParentsDao;

public class CheckIdController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String pid = request.getParameter("pid");
		
		ParentsDao pdao = new ParentsDao();
		Parents bean = pdao.selectDataByPk(pid);

		String message = "";
		if(bean == null) { // 존재 하지 않는 회원
			message = pid + "은(는) <font color='blue'><b>사용 가능</b></font>한 아이디 입니다.";
			request.setAttribute("message",message);
			request.setAttribute("pid", pid);
		}else { // 일반 사용자
			message = pid + "은(는) <font color='red'><b>사용 중</b></font>인 아이디 입니다.";
			request.setAttribute("message",message);
		}
		
		String gotopage = "/parents/pidCheck.jsp";
		super.GotoPage(gotopage);
	}
}
