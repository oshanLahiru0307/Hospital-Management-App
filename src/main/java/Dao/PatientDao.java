package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Connection.ConnectionProvider;
import Model.Patient;

public class PatientDao {
	
	private static Connection connection;
	
	public PatientDao() {
		 connection =  ConnectionProvider.getConnection();
	}
	
	public void addPatient(Patient patient) {

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO patient(name , age, blood_group, phone, email) values (?, ?, ?, ?, ?)");
            preparedStatement.setString(1, patient.getPatient_name());
            preparedStatement.setString(2, patient.getPatient_age());
            preparedStatement.setString(3, patient.getBlood_group());
            preparedStatement.setString(4, patient.getContact());
            preparedStatement.setString(5, patient.getEmail());
            preparedStatement.executeUpdate();
            System.out.println("appointment is added in dao");
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	
	public void updatePatient(Patient patient) {
		
	}
	
	public List<Patient> getAllPatient(){
		ArrayList<Patient> patients= new ArrayList<>();
		return patients;
	}
	
	public void deletePatinet() {
		
	}
	

}
