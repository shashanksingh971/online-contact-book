<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Online Contact Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body { 
            font-family: 'Lato', sans-serif; 
            background-color: #f4f7f6; 
        }
        .contact-container { 
            background-color: #ffffff; 
            padding: 2.5rem; 
            border-radius: 8px; 
            box-shadow: 0 2px 10px rgba(0,0,0,0.07); 
            margin-top: 3rem; 
            margin-bottom: 3rem; 
            border-top: 4px solid #003366; 
        }
        .table thead th { 
            background-color: #003366; 
            color: #ffffff; 
            text-transform: uppercase; 
            letter-spacing: 0.5px; 
        }
        .table tbody tr:hover { 
            background-color: #e8f4ff; 
        }
        h1 { 
            font-weight: 700; 
            color: #FF9933; 
        }
        .header-section { 
            border-bottom: 2px solid #dee2e6; 
            padding-bottom: 1rem; 
            margin-bottom: 2rem; 
        }
        .btn-primary { 
            background-color: #FF9933; 
            border-color: #FF9933; 
            font-weight: bold; 
        }
        .btn-primary:hover { 
            background-color: #e68a2e; 
            border-color: #e68a2e; 
        }
    </style>
</head>
<body>
<div class="container contact-container">
    <div class="d-flex justify-content-between align-items-center header-section">
        <h1>Online Contact Book</h1>
        <a href="/contacts/new" class="btn btn-primary">Add New Contact</a>
    </div>
    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="contact" items="${contacts}">
                <tr>
                    <td>${contact.id}</td>
                    <td>${contact.name}</td>
                    <td>${contact.phoneNumber}</td>
                    <td>${contact.email}</td>
                    <td>
                        <a href="/contacts/edit/${contact.id}" class="btn btn-sm btn-warning">Edit</a>
                        <a href="/contacts/delete/${contact.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this contact?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty contacts}">
                <tr>
                    <td colspan="5" class="text-center text-muted">Your contact book is empty.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>
</body>
</html>