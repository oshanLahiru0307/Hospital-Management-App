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

public class InventoryDao {
	
private static Connection connection;
	
	public InventoryDao() {
		connection =  ConnectionProvider.getConnection();
	}
	
	public void updateItem(Inventory inventory) {
		
		 try {
	        	
	            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE inventory SET product_name = ?, type = ?,  price = ?, instock = ?, exp_date = ?, manufacturer = ? WHERE id = ?");
	            preparedStatement.setString(1, inventory.getProduct_name());
	            preparedStatement.setString(2, inventory.getType());
	            preparedStatement.setString(3, inventory.getPrice());
	            preparedStatement.setString(4, inventory.getInstock());
	            preparedStatement.setString(5, inventory.getExp_date());
	            preparedStatement.setString(6, inventory.getManufacturer());
	            preparedStatement.setString(7, inventory.getId());
	            preparedStatement.executeUpdate();
	        
	            System.out.println("inventory is updated in dao");
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	}
	

	public void addItem(Inventory inventory) {
		
		 try {
	            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO inventory(product_name , type, price, instock, exp_date, manufacturer) values (?, ?, ?, ?, ?, ?)");
	            preparedStatement.setString(1, inventory.getProduct_name());
	            preparedStatement.setString(2, inventory.getType());
	            preparedStatement.setString(3, inventory.getPrice());
	            preparedStatement.setString(4, inventory.getInstock());
	            preparedStatement.setString(5, inventory.getExp_date());
	            preparedStatement.setString(6, inventory.getManufacturer());
	            preparedStatement.executeUpdate();
	            System.out.println("doctor is added in dao");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		
	}
	
	public List<Inventory> getAllItems(){
		
		ArrayList<Inventory> inventories = new ArrayList<>();
		
		String query = "SELECT * FROM inventory";
		
        try (Statement statement = connection.createStatement();
        		ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
            	Inventory inventory = new Inventory();
            	inventory.setId(resultSet.getString("id"));
            	inventory.setProduct_name(resultSet.getString("product_name"));
            	inventory.setType(resultSet.getString("type"));
            	inventory.setPrice(resultSet.getString("price"));
            	inventory.setInstock(resultSet.getString("instock"));
            	inventory.setExp_date(resultSet.getString("exp_date"));
            	inventory.setManufacturer(resultSet.getString("manufacturer"));
            	inventories.add(inventory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		
		return inventories;
	}

	public void deleteItem(int id) {
		try{
            String query = "DELETE FROM inventory WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

}
