package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Connection.ConnectionProvider;
import Model.Doctor;
import Model.Patient;

public class DoctorDao {
	
	private static Connection connection;
	
	public DoctorDao() {
		connection =  ConnectionProvider.getConnection();
	}
	
	public void updateDoctor(Doctor doctor) {
		
		 try {
	        	
	            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE doctor SET name = ?, refno = ?,  specialization = ?, phone = ?, email = ? WHERE id = ?");
	            preparedStatement.setString(1, doctor.getName());
	            preparedStatement.setString(2, doctor.getRefNo());
	            preparedStatement.setString(3, doctor.getSpecialization());
	            preparedStatement.setString(4, doctor.getContact());
	            preparedStatement.setString(5, doctor.getEmail());
	            preparedStatement.setString(6, doctor.getDoctorId());
	            preparedStatement.executeUpdate();
	            System.out.println("doctor is updated in dao");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	}
	

	public void addDoctor(Doctor doctor) {
		
		 try {
	            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO doctor(name , refno, specialization, phone, email) values (?, ?, ?, ?, ?)");
	            preparedStatement.setString(1, doctor.getName());
	            preparedStatement.setString(2, doctor.getRefNo());
	            preparedStatement.setString(3, doctor.getSpecialization());
	            preparedStatement.setString(4, doctor.getContact());
	            preparedStatement.setString(5, doctor.getEmail());
	            preparedStatement.executeUpdate();
	            System.out.println("doctor is added in dao");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		
	}
	
	public List<Doctor> getAllDoctors(){
		
		ArrayList<Doctor> doctors = new ArrayList<>();
		
		String query = "SELECT * FROM doctor";
		
        try (Statement statement = connection.createStatement();
        		ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                Doctor doctor = new Doctor();
                doctor.setDoctorId(resultSet.getString("id"));
                doctor.setName(resultSet.getString("name"));
                doctor.setRefNo(resultSet.getString("refno"));
                doctor.setSpecialization(resultSet.getString("specialization"));
                doctor.setContact(resultSet.getString("phone"));
                doctor.setEmail(resultSet.getString("email"));
                doctors.add(doctor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		
		return doctors;
	}

	public void deleteDoctor(int id) {
		try{
            String query = "DELETE FROM doctor WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

}
