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
                    <h2>Announcements Records</h2>
                    <button class="btn btn-primary action-btn">Add Announcement</button>
                </div>
                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">Num</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Specialist</th>
                            <th scope="col">Doctor Name</th>
                            <th scope="col">Contact</th>
                            <th scope="col" class="act">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>Neurology</td>
                            <td>Jhoen</td>
                            <td>0711122233</td>
                            <td class="action-column">
                                <button type="button" class="btn btn-outline-primary">Approve</button>
                                <button type="button" class="btn btn-outline-danger">Cancel</button>
                                <button type="button" class="btn btn-outline-warning">Edit</button>

                            </td>
                        </tr>
                    </tbody>
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
</body>

</html>