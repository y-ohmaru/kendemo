<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>購入確認</title>
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
        .text-center {
            text-align: center;
        }
        .total {
            font-size: 1.2em;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>購入確認</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>商品名</th>
                    <th>価格</th>
                    <th>数量</th>
                    <th>合計</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td>${item.product.name}</td>
                        <td>¥${item.product.price}</td>
                        <td>${item.quantity}</td>
                        <td>¥${item.product.price * item.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="total text-center">
            <p>小計: ¥${total}</p>
            <p>消費税: ¥${tax}</p>
            <p>合計: ¥${totalWithTax}</p>
        </div>
        <form:form action="${pageContext.request.contextPath}/cart/checkout" method="post" modelAttribute="orderModel" class="text-center">
            <div class="form-group">
                <label for="shippingAddressLine1">住所1</label>
                <form:input path="shippingAddressLine1" id="shippingAddressLine1" required="true"/>
            </div>
            <div class="form-group">
                <label for="shippingAddressLine2">住所2</label>
                <form:input path="shippingAddressLine2" id="shippingAddressLine2"/>
            </div>
            <div class="form-group">
                <label for="shippingCity">市</label>
                <form:input path="shippingCity" id="shippingCity" required="true"/>
            </div>
            <div class="form-group">
                <label for="shippingState">都道府県</label>
                <form:input path="shippingState" id="shippingState" required="true"/>
            </div>
            <div class="form-group">
                <label for="shippingPostalCode">郵便番号</label>
                <form:input path="shippingPostalCode" id="shippingPostalCode" required="true"/>
            </div>
            <div class="form-group">
                <label for="shippingCountry">国</label>
                <form:input path="shippingCountry" id="shippingCountry" required="true"/>
            </div>
            <button type="submit" class="btn">購入確定</button>
        </form:form>
    </div>
</body>
</html>
