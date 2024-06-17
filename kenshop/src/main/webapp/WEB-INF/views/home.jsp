<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
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

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

.product-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.product-list li {
    border-bottom: 1px solid #ddd;
    padding: 20px 0;
    display: flex;
    align-items: center;
}

.product-list img {
    max-width: 150px;
    margin-right: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.product-list div {
    flex-grow: 1;
}

.product-list h2 {
    margin: 0;
    font-size: 1.5em;
    color: #333;
}

.product-list p {
    margin: 5px 0;
    color: #555;
}

.product-list p.price {
    font-weight: bold;
    color: #000;
}
</style>
</head>
<body>
    <div class="container">
        <h1>商品List</h1>
        <ul class="product-list">
            <c:forEach var="product" items="${products}">
                <li>
                    <img src="${pageContext.request.contextPath}/resources${product.imageUrl}" alt="${product.name}" />
                    <div>
                        <h2>${product.name}</h2>
                        <p>${product.description}</p>
                        <p class="price">金額: ${product.price}円</p>
                        <a href="${pageContext.request.contextPath}/product/${product.productId}">詳細を見る</a> <!-- 詳細リンク -->
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>
