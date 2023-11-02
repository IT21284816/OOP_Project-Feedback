<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Feedback</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <style>
        /* Add your custom CSS styles here */
        .user-card {
            border: 1px solid #e5e5e5;
            border-radius: 5px;
            margin: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .user-card:hover {
            transform: scale(1.02);
             background-color: #cfcfcf; 
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <br>

    <div class="container">
        <h3 class="text-center">Feedbacks</h3>
        <hr>
        <div class="container text-left">
        </div>
        <br>

        <div class="row">
            <c:forEach var="user" items="${listUser}">
                <div class="col-md-4">
                    <div class="user-card">
                        <h4><c:out value="${user.name}" /></h4>
                        <p><strong>Email:</strong> <c:out value="${user.email}" /></p>
                        <p><strong>Address:</strong> <c:out value="${user.address}" /></p>
                        <p><strong>Feedback:</strong> <c:out value="${user.feedback}" /></p>
                        <!-- Add additional user information here -->
                    </div>
                </div>
            </c:forEach>
        </div>
    </div><br><br>
    
    <jsp:include page="footer.jsp" />
</body>
</html>
