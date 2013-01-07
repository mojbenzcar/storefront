<div id="sidebar">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="<c:url value='/cart/displayCart?productCode=${product.code}'/>">
	<p>Add To Cart</p>
</a><br><br>
<a href="<c:url value='/cart/displayCart'/>">
	<p>Show Cart</p>
</a><br><br>
</div>
