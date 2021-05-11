package kids.common.controller ;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		String gotopage = "/common/hello.jsp" ;
		super.GotoPage(gotopage);
	}
}
