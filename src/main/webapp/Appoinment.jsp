<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, Model.Appointment, Dao.AppointmentDao" %>
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
                <li class="active"><a href="Appoinment.jsp"><i class="fas fa-calendar-check"></i> Appointments</a>
                </li>
                <li><a href="Patient.jsp"><i class="fas fa-user"></i> Patients</a></li>
                <li><a href="Doctors.jsp"><i class="fas fa-user-md"></i> Doctors</a></li>
                <li><a href="Announcement.jsp"><i class="fas fa-bullhorn"></i> Announcements</a></li>
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
                    <h2>Appointments</h2>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAppointment"
                        data-bs-whatever="@mdo">Add Appointment</button>
                        
                    <!--Add Appointment Modal -->    
                    <div class="modal fade" id="addAppointment" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">New Appointment</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
                                    <form action="app" method="post">
                                    	<input type="hidden" class="form-control" id="action" name="action" value="add">	
                                        <div class="mb-3">
                                            <label for="time" class="col-form-label">Time:</label>
                                            <input type="time" class="form-control" id="time" name="time">
                                        </div>
                                        <div class="mb-3">
                                            <label for="date" class="col-form-label">Date:</label>
                                            <input type="date" class="form-control" id="date" name="date">
                                        </div>
                                        <div class="mb-3">
                                            <label for="patient_name" class="col-form-label">Patient Name:</label>
                                            <input type="text" class="form-control" id="patient_name" name="name">
                                        </div>
                                        <div class="mb-3">
                                            <label for="patient_age" class="col-form-label">Patient Age:</label>
                                            <input type="text" class="form-control" id="patient_age" name="age">
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone" class="col-form-label">Phone:</label>
                                            <input type="phone" class="form-control" id="phone" name="phone">
                                        </div>
                                        <div class="mb-3">
                                            <label for="Doctor" class="col-form-label">Doctor:</label>
                                            <input type="text" class="form-control" id="Doctor" name="doctor">
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
                            <th scope="col">Time</th>
                            <th scope="col">Date</th>
                            <th scope="col">Patient Name</th>
                            <th scope="col">Patient Age</th>
                            <th scope="col">Doctor</th>
                            <th scope="col">Contact</th>
                            <th scope="col" class="act">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<%
                			AppointmentDao dao = new AppointmentDao();
                			List<Appointment> appointments = dao.getAllAppointments();
                			for (Appointment appointment : appointments) {
            			%>
                    
            			<tr>
                			<td><%= appointment.getId() %></td>
                			<td><%= appointment.getTime() %></td>
                			<td><%= appointment.getDate() %></td>
                			<td><%= appointment.getPatient_name() %></td>
                			<td><%= appointment.getPateint_age() %></td>
                			<td><%= appointment.getDoctor() %></td>
                			<td><%= appointment.getContact() %></td>
                			<td class="act">
                    		<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#<%= appointment.getId() %>"
                        	data-bs-whatever="@mdo">Edit</button>
                    		<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete<%= appointment.getId() %>"
                        	data-bs-whatever="@mdo">Cancel</button>
                			</td>
            		</tr>
            		
            		 <!--Edit Appointment Modal -->    
                    <div class="modal fade" id="<%= appointment.getId() %>" tabindex="-1" aria-labelledby="<%= appointment.getId() %>"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="<%= appointment.getId() %>">Edit Appointment</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
                                    <form action="app" method="post">
                                    	<input type="hidden" class="form-control" id="action" name="action" value="edit">
                                    	<input type="hidden" name="id" value="<%= appointment.getId() %>">	
                                        <div class="mb-3">
                                            <label for="time" class="col-form-label">Time:</label>
                                            <input type="time" class="form-control" id="time" name="time" value="<%= appointment.getTime() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="date" class="col-form-label">Date:</label>
                                            <input type="date" class="form-control" id="date" name="date" value="<%= appointment.getDate() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="patient_name" class="col-form-label">Patient Name:</label>
                                            <input type="text" class="form-control" id="patient_name" name="name" value="<%= appointment.getPatient_name() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="patient_age" class="col-form-label">Patient Age:</label>
                                            <input type="text" class="form-control" id="patient_age" name="age" value="<%= appointment.getPateint_age() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone" class="col-form-label">Phone:</label>
                                            <input type="phone" class="form-control" id="phone" name="phone" value="<%= appointment.getContact() %>">
                                        </div>
                                        <div class="mb-3">
                                            <label for="Doctor" class="col-form-label">Doctor:</label>
                                            <input type="text" class="form-control" id="Doctor" name="doctor" value="<%= appointment.getDoctor() %>">
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
                    
                     <div class="modal fade" id="delete<%= appointment.getId() %>" tabindex="-1" aria-labelledby="<%= appointment.getId() %>"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="<%= appointment.getId() %>">Delete Appointment</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                
                                <div class="modal-body">
									<p>Do you want to cancel this appointment?</p>
                                    <div class="modal-footer">
                                    	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    	<a href="app?&id=<%= appointment.getId() %>"><button type="submit" class="btn btn-danger" name="submit">Confirm</button></a>
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