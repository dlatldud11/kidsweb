package kids.management.myclass.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.board.emplo_board.controller.ListEmpBoardController;
import kids.common.controller.SuperClass;
import kids.common.utility.FlowParameters;
import kids.management.myclass.model.MyclassDao;

public class DeleteMyclassController extends SuperClass {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int class_id = Integer.parseInt(request.getParameter("class_id")) ;
		
		FlowParameters parameters = new FlowParameters(request.getParameter("pageNumber"), request.getParameter("mode"), request.getParameter("keyword"));
		System.out.println(parameters.toString());
		
		MyclassDao dao = new MyclassDao();
		
		int cnt = -99999 ;
		cnt = dao.DeleteData(class_id) ;
		
		new ListMyclassController().doGet(request, response);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		super.doPost(request, response);
	}
}
