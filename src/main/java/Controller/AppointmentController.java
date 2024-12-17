package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AppointmentDao;
import Model.Appointment;


@WebServlet("/AppointmentController")
public class AppointmentController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private static AppointmentDao appointmentDao;

    public AppointmentController() {
        super();
        appointmentDao = new AppointmentDao();
        System.out.println("appointmentDao is created");
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int appId = Integer.parseInt(request.getParameter("id"));
        appointmentDao.deleteAppointment(appId);
        
        RequestDispatcher view = request.getRequestDispatcher("/Appoinment.jsp");
        request.setAttribute("appointments", appointmentDao.getAllAppointments());
        view.forward(request, response); 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");
		 System.out.println(action);
		 if("edit".equals(action)) { 
			 try {
	                // Retrieve appointment data from form
	                String id = request.getParameter("id");
	                String time = request.getParameter("time");
	                String date = request.getParameter("date");
	                String name = request.getParameter("name");
	                String age = request.getParameter("age");
	                String phone = request.getParameter("phone");
	                String doctor = request.getParameter("doctor");

	                // Create Appointment object and update details
	                Appointment appointment = new Appointment(id, time, date, name, age, doctor, phone );
	                appointmentDao.updateAppointment(appointment); // Call DAO to perform DB update

	                // Redirect back to the appointment list
	    	        RequestDispatcher view = request.getRequestDispatcher("/Appoinment.jsp");
	    	        view.forward(request, response); 
	                
	            } catch (Exception e) {
	                e.printStackTrace();
	                request.setAttribute("error", "Failed to update appointment.");
	                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
	                dispatcher.forward(request, response);
	            }
			 
		 }else {
			 
			 Appointment appointment = new Appointment();
			 
			 appointment.setTime(request.getParameter("time"));
			 appointment.setDate(request.getParameter("date"));
			 appointment.setPatient_name(request.getParameter("name"));
			 appointment.setPateint_age(request.getParameter("age"));
			 appointment.setDoctor(request.getParameter("doctor"));
			 appointment.setContact(request.getParameter("phone"));
			 
			 appointmentDao.addAppointment(appointment);
			 
		 }
		 
	        RequestDispatcher view = request.getRequestDispatcher("/Appoinment.jsp");
	        request.setAttribute("appointments", appointmentDao.getAllAppointments());
	        view.forward(request, response);
		 
	}

}
