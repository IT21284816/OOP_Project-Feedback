<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

@charset "ISO-8859-1";
header {
    background-color:#FF7BBD;
    color: #fff;
    height: 80px;
    display: flex;
    align-items: center;
    padding: 0 30px;
}

header h1 {
	color: white;
    margin: 0;
    font-size: 30px;
}

header img {
    height: 50px;
 }

#nav {
    background-color: #ad0c45;
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 50px;
    padding: 0 30px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

#nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
}

#nav li {
    margin-right: 20px;
}

#nav a {
    color: #f5f0f2;
    text-decoration: none;
    font-weight: bold;
    font-size: 16px;
    transition: color 0.2s ease;
}

#nav a:hover {
    color: #4d152f;
}

#nav .active a {
    color: #0a0808;
}


#nav button {
    background-color: #050304;
    color: #f2dce5;
    border: none;
    border-radius: 4px;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.2s ease;
}

#nav button:hover {
    background-color: #e388a8;
}



#deshed{
    color: #6b0136;
}


</style>

</head>
<body>
<header id = "header">
	  <img src="css/logo.jpeg" alt="Site Logo">
      <h1>One Click</h1>
</header>

 <nav id="nav">

      <ul>
        <li><a href="#" class="active">Home</a></li>
        <li><a href="aboutUs.php">About Us</a></li>
		<li><a href="${pageContext.request.contextPath}/allList">Reviews</a></li>
		<li><a href="${pageContext.request.contextPath}/list">Admin</a></li>
      </ul>

      <div>
        <button><a href="reg.php">Register</a></button>
        <button><a href="login.jsp">Login</a></button>
        
      </div>

    </nav>

</body>
</html>