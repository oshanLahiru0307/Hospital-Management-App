<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, Model.Doctor, Dao.DoctorDao" %>
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
                <li class="active"><a href="Announcement.jsp"><i class="fas fa-bullhorn"></i> Announcements</a></li>
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
                    <h2>Announcements</h2>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDoctor"
                        data-bs-whatever="@mdo">Add Doctor</button>
                        
                    <!--Add Appointment Modal -->    
                    <div class="modal fade" id="addDoctor" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">New Doctor</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
                                    <form action="doctor" method="post">
                                    	<input type="hidden" class="form-control" id="action" name="action" value="add">	
                                        <div class="mb-3">
                                            <label for="doctor_name" class="col-form-label">Doctor Name:</label>
                                            <input type="text" class="form-control" id="doctor_name" name="name">
                                        </div>
                                        <div class="mb-3">
                                            <label for="refno" class="col-form-label">Ref No:</label>
                                            <input type="text" class="form-control" id="refno" name="refno">
                                        </div>
                                        <div class="mb-3">
                                            <label for="specialization" class="col-form-label">Specialization:</label>
                                            <input type="text" class="form-control" id="specialization" name="specialization">
                                        </div>                                        
                                        <div class="mb-3">
                                            <label for="phone" class="col-form-label">Phone:</label>
                                            <input type="phone" class="form-control" id="phone" name="phone">
                                        </div>
                                        <div class="mb-3">
                                            <label for="email" class="col-form-label">Email:</label>
                                            <input type="email" class="form-control" id="email" name="email">
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
                            <th scope="col">Doctor Name</th>
                            <th scope="col">Ref No</th>
                            <th scope="col">Specialization</th>
                            <th scope="col">Contact</th>
                           	<th scope="col">Email</th>
                            <th scope="col" class="act">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<%
                			DoctorDao dao = new DoctorDao();
                			List<Doctor> doctors = dao.getAllDoctors();
                			for (Doctor doctor : doctors) {
            			%>
                    
            			<tr>
                			<td><%= doctor.getDoctorId()%></td>
                			<td><%= doctor.getName()%></td>
                			<td><%= doctor.getRefNo()%></td>
                			<td><%= doctor.getSpecialization()%></td>
                			<td><%= doctor.getContact()%></td>
                			<td><%= doctor.getEmail()%></td>
                			<td class="act">
                    		<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#<%= doctor.getDoctorId() %>"
                        	data-bs-whatever="@mdo">Edit</button>
                    		<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete<%= doctor.getDoctorId() %>"
                        	data-bs-whatever="@mdo">Cancel</button>
                			</td>
            		</tr>
            		
            		 <!--Edit Appointment Modal -->    
                    <div class="modal fade" id="<%= doctor.getDoctorId() %>" tabindex="-1" aria-labelledby="<%= doctor.getDoctorId() %>"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="<%= doctor.getDoctorId() %>">Edit Doctor</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
                                    <form action="doctor" method="post">
                                    	<input type="hidden" class="form-control" id="action" name="action" value="edit">
                                    	<input type="hidden" name="id" value="<%= doctor.getDoctorId() %>">	
                                    	
                                        <div class="mb-3">
                                            <label for="doctor_name" class="col-form-label">Doctor Name:</label>
                                            <input type="text" class="form-control" id="doctor_name" name="name" value="<%= doctor.getDoctorId()  %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="refno" class="col-form-label">Ref No:</label>
                                            <input type="text" class="form-control" id="refno" name="refno" value="<%= doctor.getRefNo() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="specialization" class="col-form-label">Specialization:</label>
                                            <input type="text" class="form-control" id="specialization" name="specialization" value="<%= doctor.getSpecialization()%>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone" class="col-form-label">Phone:</label>
                                            <input type="phone" class="form-control" id="phone" name="phone" value="<%= doctor.getContact() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="email" class="col-form-label">Email:</label>
                                            <input type="email" class="form-control" id="email" name="email" value="<%= doctor.getEmail() %>">
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
                    
                     <div class="modal fade" id="delete<%= doctor.getDoctorId() %>" tabindex="-1" aria-labelledby="<%= doctor.getDoctorId() %>"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="<%= doctor.getDoctorId() %>">Delete Doctor</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
									<p>Do you want to remove this Doctor?</p>
                                    <div class="modal-footer">
                                    	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    	<a href="doctor?&id=<%= doctor.getDoctorId() %>"><button type="submit" class="btn btn-danger" name="submit">Confirm</button></a>
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