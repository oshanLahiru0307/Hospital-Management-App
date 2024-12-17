package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import Connection.ConnectionProvider;
import Model.Appointment;


public class AppointmentDao {

	 private Connection connection;

	 public AppointmentDao() {
	        connection = ConnectionProvider.getConnection();
	 }
	 
	 

	 public void addAppointment(Appointment appointment) {
	        try {
	            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO appointment(time, date, patient_name, pateint_age, doctor, phone) values (?, ?, ?, ?, ?, ?)");
	            preparedStatement.setString(1, appointment.getTime());
	            preparedStatement.setString(2, appointment.getDate());
	            preparedStatement.setString(3, appointment.getPatient_name());
	            preparedStatement.setString(4, appointment.getPateint_age());
	            preparedStatement.setString(5, appointment.getDoctor());
	            preparedStatement.setString(6, appointment.getContact());
	            preparedStatement.executeUpdate();
	            System.out.println("appointment is added in dao");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	 
	 public void updateAppointment(Appointment appointment) {
	        try {
	            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE appointment SET time = ?, date = ?, patient_name = ?, pateint_age = ?, doctor = ?, phone = ? WHERE app_id = ?");
	            preparedStatement.setString(1, appointment.getTime());
	            preparedStatement.setString(2, appointment.getDate());
	            preparedStatement.setString(3, appointment.getPatient_name());
	            preparedStatement.setString(4, appointment.getPateint_age());
	            preparedStatement.setString(5, appointment.getDoctor());
	            preparedStatement.setString(6, appointment.getContact());
	            preparedStatement.setString(7, appointment.getId());
	            preparedStatement.executeUpdate();
	            System.out.println("appointment is updated in dao");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    public List<Appointment> getAllAppointments() {
	        List<Appointment> appointments = new ArrayList<>();
	        String query = "SELECT * FROM appointment";
	        try (Statement statement = connection.createStatement();
	        		ResultSet resultSet = statement.executeQuery(query)) {
	            while (resultSet.next()) {
	                Appointment appointment = new Appointment();
	                appointment.setappId(resultSet.getString("app_id"));
	                appointment.setTime(resultSet.getString("time"));
	                appointment.setDate(resultSet.getString("date"));
	                appointment.setPatient_name(resultSet.getString("patient_name"));
	                appointment.setPateint_age(resultSet.getString("pateint_age"));
	                appointment.setDoctor(resultSet.getString("doctor"));
	                appointment.setContact(resultSet.getString("phone"));
	                appointments.add(appointment);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return appointments;
	    }
	    
	    public void deleteAppointment(int appId) {
	        try{
	            String query = "DELETE FROM appointment WHERE app_id = ?";
	            PreparedStatement preparedStatement = connection.prepareStatement(query);
	            preparedStatement.setInt(1, appId);
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	 
	 
}
