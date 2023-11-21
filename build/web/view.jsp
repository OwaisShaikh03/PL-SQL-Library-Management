<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="DatabaseUtils.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Data</title>
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
    <br>
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Book Name</th>
                    <th>Author Name</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    CallableStatement cstmt = null;
                    ResultSet rs = null;
                    try {
                        conn = getConnection();
                        String sql = "{CALL GetAllBooks()}";
                        cstmt = conn.prepareCall(sql);
                        rs = cstmt.executeQuery();

                        while (rs.next()) {
                            int id = rs.getInt(1);
                            String bookName = rs.getString(2);
                            String authorName = rs.getString(3);
                            double price = rs.getDouble(4);

                            out.println("<tr>");
                            out.println("<td>" + id + "</td>");
                            out.println("<td>" + bookName + "</td>");
                            out.println("<td>" + authorName + "</td>");
                            out.println("<td>" + price + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (cstmt != null) cstmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
