<%@page import="org.apache.log4j.BasicConfigurator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Zvandiri Login</title>
        <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" /> " rel="stylesheet">
        <link href="<c:url value="/resources/jquery.mobile/jquery.mobile-1.4.5.css" /> " rel="stylesheet">
        <link href="<c:url value="/resources/font-awesome-4.1.0/css/font-awesome.min.css" /> " rel="stylesheet">
        <link href="<c:url value="/resources/datatables/css/jquery.dataTables.min.css" /> " rel="stylesheet">
        <link href="<c:url value="/resources/datatables/bootstrap/3/dataTables.bootstrap.css" /> " rel="stylesheet">
        <link href="<c:url value="/resources/jquery-ui-1.11.4/jquery-ui.min.css" /> " rel="stylesheet">
        <link href="<c:url value="/resources/css/jquery-validate/jquery-validate.css" /> " rel="stylesheet">
</head>
<body>


	<div class="container" align="center">
	<%
	
		BasicConfigurator.configure();
	%>
	
		<form action="/zvandirireports/login" method="POST"   style="margin-top:50px; width: 400px; border: 2px green solid; padding : 15px; border-radius: 15px;">
	            <u><h4 class="form-signin-heading text-success">Enter Your Login Details</h4></u>
	             	
	             	<div>
	                    <span class="text-danger" style="text-decoration: blink; margin:50px 0px;">
	                    <c:if test="${param.error!=null}">
	                    	<c:out value='Incorrect username/password. Try again!' default="" ></c:out> </span>
	                    </c:if>
	                    
	                </div>
	                
	                <div class="form-group">
	                    <input type="text" name="username" class="form-control" placeholder="Username" autofocus="true"></input>
	                </div>
	            
	
	           
	                <div class="form-group">
	                    <input type="password" name="password" class="form-control" placeholder="Password"></input>
	                    
	                </div>
	            
	            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
	        </form>
	
		
	</div>

<jsp:include page="template/footer.jspf"></jsp:include>