<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="DatabaseUtils.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Data</title>
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
        <h2>Update Book</h2>
        <form method="post">
            <!-- Form fields for data updating -->
            <div class="form-group">
                <label for="id">ID to Update:</label>
                <input type="text" class="form-control" id="id" name="id">
            </div>
            <div class="form-group">
                <label for="newBookName">New Book Name:</label>
                <input type="text" class="form-control" id="newBookName" name="newBookName">
            </div>
            <div class="form-group">
                <label for="newAuthorName">New Author Name:</label>
                <input type="text" class="form-control" id="newAuthorName" name="newAuthorName">
            </div>
            <div class="form-group">
                <label for="newPrice">New Price:</label>
                <input type="text" class="form-control" id="newPrice" name="newPrice">
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
        <br>
        <div class="result">
            <%
                if (request.getMethod().equals("POST")) {
                    Connection conn = null;
                    CallableStatement cstmt = null;
                    try {
                        String id = request.getParameter("id");
                        String newBookName = request.getParameter("newBookName");
                        String newAuthorName = request.getParameter("newAuthorName");
                        int newPrice = Integer.parseInt(request.getParameter("newPrice"));

                        conn = getConnection();
                        String sql = "{CALL UpdateBook(?, ?, ?, ?)}";
                        cstmt = conn.prepareCall(sql);
                        cstmt.setString(1, id);
                        cstmt.setString(2, newBookName);
                        cstmt.setString(3, newAuthorName);
                        cstmt.setInt(4, newPrice);
                        int rowsUpdated = cstmt.executeUpdate();

                        if (rowsUpdated > 0) {
                            out.println("<p class=\"text-success\">Update successful</p>");
                        } else {
                            // Check if update failed due to invalid ID
                            sql = "SELECT COUNT(*) FROM books WHERE id = ?";
                            cstmt = conn.prepareCall(sql);
                            cstmt.setString(1, id);
                            ResultSet rs = cstmt.executeQuery();
                            rs.next();
                            int rowCount = rs.getInt(1);
                            if (rowCount == 0) {
                                out.println("<p class=\"text-danger\">Update failed: Invalid ID</p>");
                            } else {
                                out.println("<p class=\"text-danger\">Update failed</p>");
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p class=\"text-danger\">An error occurred during update</p>");
                    } finally {
                        try {
                            if (cstmt != null) cstmt.close();
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
