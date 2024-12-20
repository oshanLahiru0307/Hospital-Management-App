package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Connection.ConnectionProvider;
import Model.Inventory;
import Model.Report;

public class ReportDao {
	
	private static Connection connection;

	public ReportDao() {
		connection =  ConnectionProvider.getConnection();
	}
	
	public void updateReport(Report report) {
		
		 try {
	        	
	            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE report SET patient_name = ?, type = ?,  status = ? WHERE id = ?");
	            preparedStatement.setString(1, report.getPatient_name());
	            preparedStatement.setString(2, report.getType());
	            preparedStatement.setString(3, report.getStatus());
	            preparedStatement.setString(4, report.getId());
	            preparedStatement.executeUpdate();
	        
	            System.out.println("report is updated in dao");
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	}
	

	public void addReport(Report report) {
		
		 try {
	            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO report (patient_name , type, status) values (?, ?, ?)");
	            preparedStatement.setString(1, report.getPatient_name());
	            preparedStatement.setString(2, report.getType());
	            preparedStatement.setString(3, report.getStatus());
	            preparedStatement.executeUpdate();
	            System.out.println("report is added in dao");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		
	}
	
	public List<Report> getAllReports(){
		
		ArrayList<Report> reports = new ArrayList<>();
		
		String query = "SELECT * FROM report";
		
        try (Statement statement = connection.createStatement();
        		ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
            	Report report = new Report();
            	report.setId(resultSet.getString("id"));
            	report.setPatient_name(resultSet.getString("patient_name"));
            	report.setType(resultSet.getString("type"));
            	report.setStatus(resultSet.getString("status"));
            	reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		
		return reports;
	}

	public void deleteReport(int id) {
		try{
            String query = "DELETE FROM report WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}
	
}
