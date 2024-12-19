package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.InventoryDao;
import Model.Inventory;


@WebServlet("/InventoryController")
public class InventoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private InventoryDao inventorydao;
	
    public InventoryController() {
        super();
        inventorydao = new InventoryDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			
			inventorydao.deleteItem(id);
			
			RequestDispatcher view = request.getRequestDispatcher("/Inventory.jsp");
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
				
				Inventory inventory = new Inventory();
				
				inventory.setProduct_name(request.getParameter("id"));
				inventory.setProduct_name(request.getParameter("name"));
				inventory.setType(request.getParameter("type"));
				inventory.setPrice(request.getParameter("price"));
				inventory.setInstock(request.getParameter("stock"));
				inventory.setExp_date(request.getParameter("exp_date"));
				inventory.setManufacturer(request.getParameter("manufacturer"));
				
				inventorydao.addItem(inventory);
				
				RequestDispatcher view = request.getRequestDispatcher("/Inventory.jsp");
				request.setAttribute("message", "success");
				view.forward(request, response);
				
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 	
			
		}else {
			
			try {
				Inventory inventory = new Inventory();
				
				inventory.setProduct_name(request.getParameter("name"));
				inventory.setType(request.getParameter("type"));
				inventory.setPrice(request.getParameter("price"));
				inventory.setInstock(request.getParameter("stock"));
				inventory.setExp_date(request.getParameter("exp_date"));
				inventory.setManufacturer(request.getParameter("manufacturer"));
				
				inventorydao.addItem(inventory);
				
				RequestDispatcher view = request.getRequestDispatcher("/Inventory.jsp");
				request.setAttribute("message", "success");
				view.forward(request, response);
				
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
	}

}
