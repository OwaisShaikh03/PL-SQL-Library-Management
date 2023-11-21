<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="DatabaseUtils.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Data</title>
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
        <h2>Insert Book</h2>
        <form method="post">
            <!-- Form fields for data insertion -->
            <div class="form-group">
                <label for="bookname">Book Name:</label>
                <input type="text" class="form-control" id="bookname" name="bookname">
            </div>
            <div class="form-group">
                <label for="authorname">Author Name:</label>
                <input type="text" class="form-control" id="authorname" name="authorname">
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" class="form-control" id="price" name="price">
            </div>
            <button type="submit" class="btn btn-primary">Insert</button>
        </form>
        <br>
        <div class="result">
           <%
                if (request.getMethod().equals("POST")) {
                    Connection conn = null;
                    CallableStatement cstmt = null;
                    ResultSet rs = null;
                    try {
                        conn = getConnection();
                        String bookname = request.getParameter("bookname");
                        String authorname = request.getParameter("authorname");
                        int price = Integer.parseInt(request.getParameter("price"));

                        String sql = "{CALL InsertBookWithSeq(?, ?, ?)}"; // Assuming you have a stored procedure for insertion with a sequence-generated ID
                        cstmt = conn.prepareCall(sql);
                        cstmt.setString(1, bookname);
                        cstmt.setString(2, authorname);
                        cstmt.setInt(3, price);
                        cstmt.executeUpdate();

                        // Get the last inserted ID using the same connection
                        rs = cstmt.executeQuery("SELECT LAST_INSERT_ID() AS inserted_id");
                        if (rs.next()) {
                            int lastInsertedId = rs.getInt("inserted_id");
                            if (lastInsertedId > 0) {
                                out.println("<p class=\"text-success\">Insertion successful</p>");
                            } else {
                                out.println("<p class=\"text-danger\">Insertion failed</p>");
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p class=\"text-danger\">An error occurred during insertion</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
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
