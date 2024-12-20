<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, Model.Report, Dao.ReportDao" %>
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
                <li class="active"><a href="Report.jsp"><i class="fas fa-bullhorn"></i> Reports</a></li>
                <li><a href="Inventory.jsp"><i class="fas fa-box"></i> Inventory</a></li>
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
                    <h2>Patient Reports</h2>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addReport"
                        data-bs-whatever="@mdo">Add Report</button>
                        
                    <!--Add Appointment Modal -->    
                    <div class="modal fade" id="addReport" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">New Report</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
                                    <form action="report" method="post">
                                    	<input type="hidden" class="form-control" id="action" name="action" value="add">	
                                        <div class="mb-3">
                                            <label for="patient_name" class="col-form-label">Patient Name:</label>
                                            <input type="text" class="form-control" id="patient_name" name="patient_name">
                                        </div>
                                        <div class="mb-3">
                                            <label for="type" class="col-form-label">Type:</label>
                                            <input type="text" class="form-control" id="type" name="type">
                                        </div>
                                        <div class="mb-3">
                                            <label for="status" class="col-form-label">Status:</label>
                                            <input type="text" class="form-control" id="status" name="status">
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
                            <th scope="col">Patient Name</th>
                            <th scope="col">Type</th>
                            <th scope="col">Status</th>
                            <th scope="col" class="act">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<%
                			ReportDao dao = new ReportDao();
                			List<Report> reports = dao.getAllReports();
                			for (Report report : reports) {
            			%>
                    
            			<tr>
                			<td><%= report.getId()%></td>
                			<td><%= report.getPatient_name()%></td>
                			<td><%= report.getType()%></td>
                			<td><%= report.getStatus()%></td>
                			<td class="act">
                    		<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#<%= report.getId()%>"
                        	data-bs-whatever="@mdo">Edit</button>
                    		<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete<%= report.getId()%>"
                        	data-bs-whatever="@mdo">Cancel</button>
                			</td>
            		</tr>
            		
            		 <!--Edit Appointment Modal -->    
                    <div class="modal fade" id="<%= report.getId()%>" tabindex="-1" aria-labelledby="<%= report.getId()%>"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="<%= report.getId()%>">Edit Report</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
                                    <form action="report" method="post">
                                    	<input type="hidden" class="form-control" id="action" name="action" value="edit">
                                    	<input type="hidden" name="id" value="<%= report.getId()%>">	
                                    	
                                        <div class="mb-3">
                                            <label for="patient_name" class="col-form-label">Patient Name:</label>
                                            <input type="text" class="form-control" id="patient_name" name="patient_name" value="<%= report.getPatient_name()%>" >
                                        </div>
                                        <div class="mb-3">
                                            <label for="type" class="col-form-label">Type:</label>
                                            <input type="text" class="form-control" id="type" name="type" value="<%= report.getType()%>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="status" class="col-form-label">Status:</label>
                                            <input type="text" class="form-control" id="status" name="status" value="<%= report.getStatus()%>">
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
                    
                     <div class="modal fade" id="deletevalue="<%= report.getId()%>"" tabindex="-1" aria-labelledby="value="<%= report.getId()%>""
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="value="<%= report.getId()%>"">Delete Report</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
									<p>Do you want to remove this Report?</p>
                                    <div class="modal-footer">
                                    	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    	<a href="report?&id=value="<%= report.getId()%>""><button type="submit" class="btn btn-danger" name="submit">Confirm</button></a>
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