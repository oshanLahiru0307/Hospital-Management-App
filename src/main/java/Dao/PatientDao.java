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
		
        try {
        	
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE patient SET name = ?, age = ?, blood_group = ?, phone = ?, email = ? WHERE id = ?");
            preparedStatement.setString(1, patient.getPatient_name());
            preparedStatement.setString(2, patient.getPatient_age());
            preparedStatement.setString(3, patient.getBlood_group());
            preparedStatement.setString(4, patient.getContact());
            preparedStatement.setString(5, patient.getEmail());
            preparedStatement.setString(6, patient.getPatientId());
            preparedStatement.executeUpdate();
            System.out.println("appointment is updated in dao");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
	}
	
	public List<Patient> getAllPatient(){
        List<Patient> patients = new ArrayList<>();
        String query = "SELECT * FROM patient";
        try (Statement statement = connection.createStatement();
        		ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                Patient patinet = new Patient();
                patinet.setPatientId(resultSet.getString("id"));
                patinet.setPatient_name(resultSet.getString("name"));
                patinet.setPatient_age(resultSet.getString("age"));
                patinet.setBlood_group(resultSet.getString("blood_group"));
                patinet.setContact(resultSet.getString("phone"));
                patinet.setEmail(resultSet.getString("email"));
                patients.add(patinet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patients;
	}
	
	public void deletePatinet(int patientId) {
		
		try{
            String query = "DELETE FROM patient WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, patientId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}