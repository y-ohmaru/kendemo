<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入完了</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background-color: #fff;
        border-radius: 5px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        max-width: 500px;
        width: 100%;
    }
    h1 {
        color: #333;
    }
    p {
        color: #555;
    }
    a {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        font-size: 16px;
        color: #fff;
        background-color: #e78f0f;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
    }
    a:hover {
        background-color: #d9780e;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>購入完了しました</h1>
        <p>ご購入ありがとうございました。</p>
        <a href="${pageContext.request.contextPath}/">ホームに戻る</a>
    </div>
</body>
</html>
