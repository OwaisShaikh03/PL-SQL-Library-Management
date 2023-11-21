<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Management System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Basic styling for navigation bar */
        body {
            font-family: Arial, sans-serif;
            
        }
        .navbar {
            background-color: #333;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        /* Additional styles for cleaner look */
        .header {
            text-align: center;
            padding: 20px;
            background-color: #333;
            color: white;
        }
        .content {
            padding: 20px;
            background-color: #f4f4f4;
            min-height: calc(100vh - 90px); /* Subtract header and navbar heights */
            box-sizing: border-box;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        p {
            text-align: center;
        }
        .about-paragraph {
            font-size: 18px;
            font-family: "Times New Roman", Times, serif;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Library Management System</h1>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="view.jsp">View</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="delete.jsp">Delete</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="update.jsp">Update</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="insert.jsp">Insert</a>
                </li>
            </ul>
        </div>
    </nav>
   <div class="content">
        <h1>About Page</h1>
        <p class="about-paragraph">Welcome to the Library Management System, a platform designed to manage the library's collection of books. With this system, administrators can efficiently organize and keep track of various aspects of the books, including book names, author names, and prices. This tool streamlines library operations and ensures accurate book information. Please note that this system is intended for admin access only.</p>
    </div>
</body>
</html>
</body>
</html>
