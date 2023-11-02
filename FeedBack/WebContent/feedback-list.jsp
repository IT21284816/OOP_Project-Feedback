<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Feedback</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
   
</head>
<body>

    <jsp:include page="header.jsp" />
    <br>

    <div class="container">
        <h3 class="text-center">List of Feedback</h3>
        <hr>
        <div class="container text-left">
            <a href="${pageContext.request.contextPath}/new" class="btn btn-success">Add New Feedback</a>
        </div>
        <br>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Feedback</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${listUser}">
                    <tr>
                        <td><c:out value="${user.id}" /></td>
                        <td><c:out value="${user.name}" /></td>
                        <td><c:out value="${user.email}" /></td>
                        <td><c:out value="${user.address}" /></td>
                        <td><c:out value="${user.feedback}" /></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/edit?id=<c:out value='${user.id}' />"
                                class="btn btn-primary">Edit</a>
                            <a href="${pageContext.request.contextPath}/delete?id=<c:out value='${user.id}' />"
                                class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <br><br><br><br>

    <jsp:include page="footer.jsp" />
</body>
</html>
