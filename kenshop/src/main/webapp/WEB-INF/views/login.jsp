<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
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
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .login-container h1 {
            margin-bottom: 20px;
        }
        .login-container .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .login-container .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .login-container .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .login-container .form-group .error {
            color: red;
            font-size: 12px;
        }
        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .login-container .error {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
        .login-container .register-link {
            margin-top: 15px;
        }
        .login-container .register-link a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .login-container .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login</h1>
        <form:form modelAttribute="userModel">
            <div class="form-group">
                <form:label path="username">ユーザーID:</form:label>
                <form:input path="username"/>
                <form:errors path="username" cssClass="error"/>
            </div>
            <div class="form-group">
                <form:label path="password">パスワード:</form:label>
                <form:password path="password"/>
                <form:errors path="password" cssClass="error"/>
            </div>
            <div class="form-group">
                <input type="submit" value="Login"/>
            </div>
            <c:if test="${not empty loginError}">
                <div class="error">${loginError}</div>
            </c:if>
        </form:form>
        <div class="register-link">
            <a href="${pageContext.request.contextPath}/user/regist">新規会員登録</a>
        </div>
    </div>
</body>
</html>
