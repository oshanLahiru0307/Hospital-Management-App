package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ReportDao;
import Model.Inventory;
import Model.Report;


@WebServlet("/ReportsController")
public class ReportsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ReportDao reportdao;
	
    public ReportsController() {
        super();
        reportdao = new ReportDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			
			reportdao.deleteReport(id);
			
			RequestDispatcher view = request.getRequestDispatcher("/Report.jsp");
			request.setAttribute("message", "success");
			view.forward(request, response);
			
		} catch (ServletException e) {
			
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action.equals("edit")) {
			
			try {
				
				Report report = new Report();
				
				report.setId(request.getParameter("id"));
				report.setPatient_name(request.getParameter("patient_name"));
				report.setType(request.getParameter("type"));
				report.setStatus(request.getParameter("status"));

								
				reportdao.updateReport(report);
				
				RequestDispatcher view = request.getRequestDispatcher("/Report.jsp");
				request.setAttribute("message", "success");
				view.forward(request, response);
				
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 	
			
		}else {
			
			try {
				
				Report report = new Report();
				
				report.setPatient_name(request.getParameter("patient_name"));
				report.setType(request.getParameter("type"));
				report.setStatus(request.getParameter("status"));

								
				reportdao.addReport(report);
				
				RequestDispatcher view = request.getRequestDispatcher("/Report.jsp");
				request.setAttribute("message", "success");
				view.forward(request, response);
				
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
	}
	


}
