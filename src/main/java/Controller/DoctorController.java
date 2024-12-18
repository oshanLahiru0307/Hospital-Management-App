package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DoctorDao;
import Model.Doctor;


@WebServlet("/DoctorController")
public class DoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DoctorDao doctordao;
	
    public DoctorController() {
        super();
        doctordao = new DoctorDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			
			doctordao.deleteDoctor(id);
			
	        RequestDispatcher view = request.getRequestDispatcher("/Doctor.jsp");
	        request.setAttribute("message", "success");
	        view.forward(request, response);
	        
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action.equals("edit")) {
			
			try {
				Doctor doctor = new Doctor();
				
				doctor.setDoctorId(request.getParameter("id"));
				doctor.setName(request.getParameter("name"));
				doctor.setRefNo(request.getParameter("refno"));
				doctor.setSpecialization(request.getParameter("specialization"));
				doctor.setContact(request.getParameter("phone"));
				doctor.setEmail(request.getParameter("email"));
				
				doctordao.updateDoctor(doctor);
				
				RequestDispatcher view = request.getRequestDispatcher("/Doctor.jsp");
		        request.setAttribute("message", "success");
		        view.forward(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			try {
				
				Doctor doctor = new Doctor();
				
				doctor.setName(request.getParameter("name"));
				doctor.setRefNo(request.getParameter("refno"));
				doctor.setSpecialization(request.getParameter("specialization"));
				doctor.setContact(request.getParameter("phone"));
				doctor.setEmail(request.getParameter("email"));
				
				doctordao.addDoctor(doctor);
				
				RequestDispatcher view = request.getRequestDispatcher("/Doctor.jsp");
		        request.setAttribute("message", "success");
		        view.forward(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
