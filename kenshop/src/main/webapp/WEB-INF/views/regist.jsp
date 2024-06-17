<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }
        .register-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .register-container h1 {
            margin-bottom: 20px;
        }
        .register-container .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .register-container .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .register-container .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .register-container .form-group .error {
            color: red;
            font-size: 12px;
        }
        .register-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .register-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .register-container .error {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h1>新規会員登録</h1>
        <form:form modelAttribute="userModel">
            <div class="form-group">
                <form:label path="username">ユーザー名:</form:label>
                <form:input path="username"/>
                <form:errors path="username" cssClass="error"/>
            </div>
            <div class="form-group">
                <form:label path="password">パスワード:</form:label>
                <form:password path="password"/>
                <form:errors path="password" cssClass="error"/>
            </div>
            <div class="form-group">
                <input type="submit" value="登録"/>
            </div>
            <c:if test="${not empty registerError}">
                <div class="error">${registerError}</div>
            </c:if>
        </form:form>
    </div>
</body>
</html>
