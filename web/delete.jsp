<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="DatabaseUtils.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Data</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Basic styling for navigation bar */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Background color for the site */
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
        .header {
            text-align: center;
            padding: 20px;
            background-color: #333;
            color: white;
        }
        .container {
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
    <br>
    <div class="container">
        <h2>Delete Book</h2>
        <form method="post">
            <!-- Form fields for data deletion -->
            <div class="form-group">
                <label for="id">ID to Delete:</label>
                <input type="text" class="form-control" id="id" name="id">
            </div>
            <button type="submit" class="btn btn-danger">Delete</button>
        </form>
        <br>
        <div class="result">
          <%
                if (request.getMethod().equals("POST")) {
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    try {
                        String id = request.getParameter("id");

                        conn = getConnection();
                        String sql = "SELECT DeleteBookByID(?) AS result";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, id);
                        ResultSet rs = pstmt.executeQuery();
                        rs.next();
                        boolean deleteResult = rs.getBoolean("result");

                        if (deleteResult) {
                            out.println("<p class=\"text-success\">Delete successful</p>");
                        } else {
                            out.println("<p class=\"text-danger\">No row deleted. Make sure the ID exists.</p>");
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p class=\"text-danger\">An error occurred during delete</p>");
                    } finally {
                        try {
                            if (pstmt != null) pstmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
