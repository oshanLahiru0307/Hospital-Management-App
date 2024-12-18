package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.PatientDao;
import Model.Patient;

@WebServlet("/PatientController")
public class PatientController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private PatientDao patientdao;

    public PatientController() {
        super();
        patientdao = new PatientDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int patientId = Integer.parseInt(request.getParameter("id"));
		patientdao.deletePatinet(patientId);
        
        RequestDispatcher view = request.getRequestDispatcher("/Patient.jsp");
        request.setAttribute("message", "success");
        view.forward(request, response); 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		
		if(action.equals("edit")) {
			
			try {
				
				Patient patient = new Patient();
				patient.setPatientId(request.getParameter("id"));
				patient.setPatient_name(request.getParameter("name"));
				patient.setPatient_age(request.getParameter("age"));
				patient.setBlood_group(request.getParameter("blood_grp"));
				patient.setContact(request.getParameter("phone"));
				patient.setEmail(request.getParameter("email"));
				
				patientdao.updatePatient(patient);
				
				RequestDispatcher view = request.getRequestDispatcher("/Patient.jsp");
		        request.setAttribute("message", "success");
		        view.forward(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}else {
			
			try {
				
				Patient patient = new Patient();
				patient.setPatient_name(request.getParameter("name"));
				patient.setPatient_age(request.getParameter("age"));
				patient.setBlood_group(request.getParameter("blood_grp"));
				patient.setContact(request.getParameter("phone"));
				patient.setEmail(request.getParameter("email"));
				
				patientdao.addPatient(patient);
				
		        RequestDispatcher view = request.getRequestDispatcher("/Patient.jsp");
		        request.setAttribute("message", "success");
		        view.forward(request, response); 
		        
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
		}
	}

}
