<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
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

.product-detail {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.product-detail img {
	max-width: 300px;
	margin-bottom: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.product-detail h2 {
	margin: 0;
	font-size: 2em;
	color: #333;
}

.product-detail p {
	margin: 10px 0;
	color: #555;
}

.product-detail p.price {
	font-weight: bold;
	color: #000;
	font-size: 1.5em;
}

.add-to-cart {
	background-color: #e78f0f;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	text-decoration: none;
	margin-top: 20px;
}

.add-to-cart:hover {
	background-color: #d77f0f;
}

.back-link {
	display: block;
	margin: 20px 0;
	text-align: center;
	color: #e78f0f;
	text-decoration: none;
	font-weight: bold;
}

.back-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<div class="product-detail">
			<img
				src="${pageContext.request.contextPath}/resources${product.imageUrl}"
				alt="${product.name}" />
			<h2>${product.name}</h2>
			<p>${product.description}</p>
			<p class="price">金額: ${product.price}円</p>
			<form action="${pageContext.request.contextPath}/cart/add"
				method="post" style="margin-top: 20px;">
				<input type="hidden" name="productId" value="${product.productId}" />
				<!-- 未ログインは押せない -->
				<c:if test="${not empty userModel}">
					<label for="quantity">数量:</label>
					<input type="number" id="quantity" name="quantity" value="1"min="1" style="margin-right: 10px;" />
					<button type="submit" class="add-to-cart">カートに追加</button>
				</c:if>
			</form>
			<a href="${pageContext.request.contextPath}/" class="back-link">商品リストに戻る</a>
		</div>
	</div>
</body>
</html>
