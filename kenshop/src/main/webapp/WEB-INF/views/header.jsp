<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Common Header</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        header {
            background-color: #e78f0f; /* 背景色 */
            color: #fff;
            padding: 10px 0;
            margin-bottom: 20px;
        }
        header nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
        }
        header nav ul li {
            margin: 0 15px;
        }
        header nav ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
        header nav ul li a:hover {
            text-decoration: underline;
        }
        .login-link {
            display: block;
            text-align: center;
            margin: 10px 0;
            color: #fff;
            font-weight: bold;
        }
        .login-link:hover {
            text-decoration: underline;
        }
        .welcome-message {
            text-align: center;
            color: #fff;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/">ホーム</a></li>
                <!-- 他のリンク -->
                <!-- カートの中身に遷移するリンクを追加 -->
                <c:if test="${not empty userModel}">
                    <li><a href="${pageContext.request.contextPath}/cart">カート</a></li>
                </c:if>
                <!-- ユーザーがログインしている場合にログアウトリンクを表示 -->
                <c:if test="${not empty userModel}">
                    <li><a href="${pageContext.request.contextPath}/user/logout">ログアウト</a></li>
                </c:if>
            </ul>
        </nav>
        <!-- ユーザーがログインしていない場合にログインリンクを表示 -->
        <c:if test="${empty userModel}">
            <a class="login-link" href="${pageContext.request.contextPath}/user/login">ログインはこちら</a>
        </c:if>
        <!-- ユーザーがログインしている場合に歓迎メッセージを表示 -->
        <c:if test="${not empty userModel}">
            <p class="welcome-message">ようこそ、${userModel.username}さん！</p>
        </c:if>
    </header>
</body>
</html>
