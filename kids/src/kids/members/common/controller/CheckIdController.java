package kids.members.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
<<<<<<< Upstream, based on test
import kids.members.employees.model.Employees;
import kids.members.employees.model.EmployeesDao;

public class CheckIdController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String id = request.getParameter("id") ;
		EmployeesDao dao = new EmployeesDao();
		
		Employees bean = dao.SelectDataByPk(id) ;
		
		if (bean == null) { // 존재 하지 않는 회원
			request.setAttribute("message", id + "은(는) <font color='blue'><b>사용 가능</b></font>한 아이디입니다.");
			request.setAttribute("isCheck", true);
			 
		}else {
			if (bean.getTid().equals("admin")) { // for 관리자
				request.setAttribute("message", "admin은 <font color='red'><b>사용 불가능</b></font>한 아이디입니다.<br><font color='blue'><b>관리자</b></font>를 위한 아이디입니다.");
				request.setAttribute("isCheck", false);
				
			} else { //일반 사용자
				request.setAttribute("message", id + "은(는) 이미 <font color='red'><b>사용중</b></font>인 아이디입니다.");
				request.setAttribute("isCheck", false);
			}
		}
	
		String gotopage = "/employees/idCheck.jsp" ;
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
}

=======
import kids.members.parents.model.Parents;
import kids.members.parents.model.ParentsDao;

public class CheckIdController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String pid = request.getParameter("pid");
		
		ParentsDao pdao = new ParentsDao();
		Parents bean = pdao.selectDataByPk(pid);

		System.out.println("상태확인");
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
