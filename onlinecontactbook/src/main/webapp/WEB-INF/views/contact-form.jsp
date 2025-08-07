<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>${pageTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body { 
            font-family: 'Lato', sans-serif; 
            background-color: #f4f7f6; 
        }
        .card { 
            border-top: 4px solid #003366; 
            margin-top: 4rem; 
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.07);
        }
        .card-header { 
            background-color: #f8f9fa; 
            font-weight: 700;
        }
        .btn-success { 
            background-color: #198754; 
            border-color: #198754; 
            font-weight: bold;
        }
        .btn-secondary {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>${pageTitle}</h3>
                </div>
                <div class="card-body p-4">
                    <form:form action="/contacts/save" method="post" modelAttribute="contact">
                        <form:hidden path="id"/>
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <form:input path="name" cssClass="form-control" required="true" />
                        </div>
                        <div class="mb-3">
                            <label for="phoneNumber" class="form-label">Phone Number</label>
                            <form:input path="phoneNumber" cssClass="form-control" required="true" />
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <form:input path="email" type="email" cssClass="form-control" />
                        </div>
                        <div class="d-flex justify-content-end mt-4">
                            <button type="submit" class="btn btn-success me-2">Save</button>
                            <a href="/contacts" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>