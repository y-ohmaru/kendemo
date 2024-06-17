<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ショッピングカート</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .table th, .table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .table th {
            background-color: #f2f2f2;
            color: #333;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            color: #fff;
            background-color: #e74c3c;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #c0392b;
        }
        .btn-warning {
            background-color: #f39c12;
        }
        .btn-warning:hover {
            background-color: #e67e22;
        }
        .product-img {
            max-width: 100px;
            height: auto;
        }
        .product-name {
            text-align: left;
        }
        .product-description {
            text-align: left;
            font-size: 12px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>ショッピングカート</h1>

        <c:if test="${empty cartItems}">
            <div class="alert">カートに商品がありません。</div>
        </c:if>

        <c:if test="${not empty cartItems}">
            <table class="table">
                <thead>
                    <tr>
                        <th>商品画像</th>
                        <th>商品名</th>
                        <th>価格</th>
                        <th>数量</th>
                        <th>合計</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cartItems}">
                        <tr>
                            <td><img src="${pageContext.request.contextPath}/resources/${item.product.imageUrl}" alt="${item.product.name}" class="product-img" /></td>
                            <td class="product-name">
                                ${item.product.name}
                                <div class="product-description">${item.product.description}</div>
                            </td>
                            <td>¥${item.product.price}</td>
                            <td>${item.quantity}</td>
                            <td>¥${item.product.price * item.quantity}</td>
                            <td>
                                <form action="cart/remove" method="post">
                                    <input type="hidden" name="productId" value="${item.product.productId}">
                                    <button type="submit" class="btn">削除</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <form action="cart/clear" method="get" class="text-center">
                <button type="submit" class="btn btn-warning">カートを空にする</button>
            </form>
            <form action="cart/checkout" method="get" class="text-center" style="margin-top: 20px;">
                <button type="submit" class="btn">購入確認</button>
            </form>
        </c:if>
    </div>
</body>
</html>
