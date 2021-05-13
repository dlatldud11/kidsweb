package kids.board.notification_board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;

public class ListNotification_boardController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
//		여기에서 리스트 보기 하고나서 그리스트에 처음으로 올라오는 사람(오른쪽에 오는 사람) 일일메세지 썻는지 값을 담
		String gotopage = "/notification_board/noList.jsp" ;
		super.GotoPage(gotopage);
	}
}
