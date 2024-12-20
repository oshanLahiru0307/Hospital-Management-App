<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, Model.Inventory, Dao.InventoryDao" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>

<body>
    <div class="dashboard">
   
        <!-- Sidebar -->
        <nav class="sidebar">
            <h2 class="sidebar-title">MEDICARE</h2>
            <ul class="menu">
                <li><a href="Appoinment.jsp"><i class="fas fa-calendar-check"></i> Appointments</a>
                </li>
                <li><a href="Patient.jsp"><i class="fas fa-user"></i> Patients</a></li>
                <li><a href="Doctors.jsp"><i class="fas fa-user-md"></i> Doctors</a></li>
                <li><a href="Report.jsp"><i class="fas fa-bullhorn"></i> Reports</a></li>
                <li class="active"><a href="Inventory.jsp"><i class="fas fa-box"></i> Inventory</a></li>
            </ul>
            <div class="logout">
                <a href="#logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
            <button class="toggle-btn close-sidebar"><i class="fas fa-bars"></i></button>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
        
            <header class="header">
                <button class="toggle-btn open-sidebar hidden"><i class="fas fa-bars"></i></button>
            </header>
            
            <section class="content">
                <div class="content-header">
                    <h2>Medicine Inventory</h2>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addItem"
                        data-bs-whatever="@mdo">Add Item</button>
                        
                    <!--Add Appointment Modal -->    
                    <div class="modal fade" id="addItem" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">New Doctor</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
                                    <form action="inventory" method="post">
                                    	<input type="hidden" class="form-control" id="action" name="action" value="add">	
                                        <div class="mb-3">
                                            <label for="product_name" class="col-form-label">Product Name:</label>
                                            <input type="text" class="form-control" id="product_name" name="name">
                                        </div>
                                        <div class="mb-3">
                                            <label for="type" class="col-form-label">Type:</label>
                                            <input type="text" class="form-control" id="type" name="type">
                                        </div>
                                        <div class="mb-3">
                                            <label for="price" class="col-form-label">Price:</label>
                                            <input type="text" class="form-control" id="price" name="price">
                                        </div>                                        
                                        <div class="mb-3">
                                            <label for="stock" class="col-form-label">In Stock(pcs):</label>
                                            <input type="text" class="form-control" id="stock" name="stock">
                                        </div>
                                        <div class="mb-3">
                                            <label for="exp_date" class="col-form-label">Exp Date:</label>
                                            <input type="date" class="form-control" id="exp_date" name="exp_date">
                                        </div>
                                        <div class="mb-3">
                                            <label for="manufacturer" class="col-form-label">Manufacturer:</label>
                                            <input type="text" class="form-control" id="manufacturer" name="manufacturer">
                                        </div>                                       
                                        <div class="modal-footer">
                                    		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    		<button type="submit" class="btn btn-primary" name="submit">Confirm</button>
                                		</div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table">
                    <thead class="table-dark">
                        <tr>
                        	<th scope="col">Id</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Type</th>
                            <th scope="col">Price</th>
                            <th scope="col">InStock(pcs)</th>
                           	<th scope="col">Exp Date</th>
                           	<th scope="col">Manufacturer</th>
                            <th scope="col" class="act">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<%
                			InventoryDao dao = new InventoryDao();
                			List<Inventory> inventories = dao.getAllItems();
                			for (Inventory inventory : inventories) {
            			%>
                    
            			<tr>
                			<td><%= inventory.getId()%></td>
                			<td><%= inventory.getProduct_name()%></td>
                			<td><%= inventory.getType()%></td>
                			<td><%= inventory.getPrice()%></td>
                			<td><%= inventory.getInstock()%></td>
                			<td><%= inventory.getExp_date()%></td>
                			<td><%= inventory.getManufacturer()%></td>
                			<td class="act">
                    		<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#<%= inventory.getId() %>"
                        	data-bs-whatever="@mdo">Edit</button>
                    		<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete<%= inventory.getId() %>"
                        	data-bs-whatever="@mdo">Delete</button>
                			</td>
            		</tr>
            		
            		 <!--Edit Appointment Modal -->    
                    <div class="modal fade" id="<%= inventory.getId() %>" tabindex="-1" aria-labelledby="<%= inventory.getId() %>"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="<%= inventory.getId() %>">Edit Item</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
                                    <form action="inventory" method="post">
                                    	<input type="hidden" class="form-control" id="action" name="action" value="edit">
                                    	<input type="hidden" name="id" value="<%= inventory.getId() %>">	
                                    	
                                        <div class="mb-3">
                                            <label for="product_name" class="col-form-label">Product Name:</label>
                                            <input type="text" class="form-control" id="product_name" name="name" value="<%= inventory.getProduct_name() %>" >
                                        </div>
                                        <div class="mb-3">
                                            <label for="type" class="col-form-label">Type:</label>
                                            <input type="text" class="form-control" id="type" name="type" value="<%= inventory.getType() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="price" class="col-form-label">Price:</label>
                                            <input type="text" class="form-control" id="price" name="price" value="<%= inventory.getPrice() %>">
                                        </div>                                        
                                        <div class="mb-3">
                                            <label for="stock" class="col-form-label">In Stock(pcs):</label>
                                            <input type="text" class="form-control" id="stock" name="stock" value="<%= inventory.getInstock() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="exp_date" class="col-form-label">Exp Date:</label>
                                            <input type="date" class="form-control" id="exp_date" name="exp_date" value="<%= inventory.getExp_date() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="manufacturer" class="col-form-label">Manufacturer:</label>
                                            <input type="text" class="form-control" id="manufacturer" name="manufacturer" value="<%= inventory.getManufacturer() %>">
                                        </div> 
                                        <div class="modal-footer">
                                    		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    		<button type="submit" class="btn btn-primary" name="submit">Confirm</button>
                                		</div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!--delete Appointment Modal --> 
                    
                     <div class="modal fade" id="delete<%= inventory.getId() %>" tabindex="-1" aria-labelledby="<%= inventory.getId() %>"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="<%= inventory.getId() %>">Delete Item</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
									<p>Do you want to remove this Doctor?</p>
                                    <div class="modal-footer">
                                    	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    	<a href="inventory?&id=<%= inventory.getId() %>"><button type="submit" class="btn btn-danger" name="submit">Confirm</button></a>
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>
            		
            		<%
                	}
           			 %>
                </table>
            </section>
             
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const toggleBtnClose = document.querySelector('.close-sidebar');
            const toggleBtnOpen = document.querySelector('.open-sidebar');
            const sidebar = document.querySelector('.sidebar');

            // Close Sidebar
            toggleBtnClose.addEventListener('click', () => {
                sidebar.classList.add('hidden');
                toggleBtnOpen.classList.remove('hidden');
            });

            // Open Sidebar
            toggleBtnOpen.addEventListener('click', () => {
                sidebar.classList.remove('hidden');
                toggleBtnOpen.classList.add('hidden');
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>