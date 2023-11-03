<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Feedback</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

    <jsp:include page="header-old.jsp" />
    <br><br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${user != null}">
                    <form name="userForm" action="update" method="post" onsubmit="return validateForm();">
                </c:if>
                <c:if test="${user == null}">
                    <form name="userForm" action="insert" method="post" onsubmit="return validateForm();">
                </c:if>

                <caption>
                    <h2>
                        <c:if test="${user != null}">
                            Edit Feedback
                        </c:if>
                        <c:if test="${user == null}">
                            Add New Feedback
                        </c:if>
                    </h2>
                </caption>

                <c:if test="${user != null}">
                    <input type="hidden" name="id" value="<c:out value='${user.id}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>User Name</label>
                    <input type="text" value="<c:out value='${user.name}' />" class="form-control" name="name">
                </fieldset>

                <fieldset class="form-group">
                    <label>User Email</label>
                    <input type="text" value="<c:out value='${user.email}' />" class="form-control" name="email">
                </fieldset>

                <fieldset class="form-group">
                    <label>User Address</label>
                    <input type="text" value="<c:out value='${user.address}' />" class="form-control" name="address">
                </fieldset>

                <fieldset class="form-group">
                    <label>User Feedback</label>
                    <textarea class="form-control" name="feedback"><c:out value='${user.feedback}' /></textarea>
                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    function validateForm() {
        var name = document.forms["userForm"]["name"].value;
        var email = document.forms["userForm"]["email"].value;
        var address = document.forms["userForm"]["address"].value; 
        var feedback = document.forms["userForm"]["feedback"].value; 

        if (name === "") {
            alert("User Name must be filled out");
            return false;
        }

        if (email === "") {
            alert("User Email must be filled out");
            return false;
        }

        if (address === "") {
            alert("User Address must be filled out");
            return false;
        }

        if (feedback === "") {
            alert("User Feedback must be filled out"); 
            return false;
        }

        alert("Successfully..!");
        return true;
    }
</script>



<jsp:include page="footer-old.jsp" />

</body>
</html>
