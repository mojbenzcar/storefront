<jsp:include page="/includes/header.html" />

<!-- begin middle column -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h1>Your cart</h1>

  <c:choose>
    <c:when test="${empty cart.items}">
      <p>Your cart is empty. click Continue Shopping to continue.</p>

    </c:when>
    <c:otherwise>
    <table cellspacing="5" border="0">
      <tr>
        <th align="left">Qty</th>
        <th align="left">Description</th>
        <th align="left">Price</th>
        <th align="left">Amount</th>
      </tr>
      <c:forEach var="item" items="${cart.items}">
      <form action="<c:url value='/cart/displayCart' />" method="post">
      <tr valign="top">
        <td>
            <input type="hidden" name="productCode" value="${item.product.code}">
            <input type="text" size="2" name="quantity" value="${item.quantity}">
            <input type="submit" value="Update">
        </td>
        <td>${item.product.description}</td>
        <td>${item.product.priceCurrencyFormat}</td>
        <td>${item.totalCurrencyFormat}</td>
        <td><input type="submit" name="removeButton" value="Remove"></td>
      </tr>
      </form>
      </c:forEach>
  <tr>
    <td colspan="3">
      <p><b>To change the quantity for an item</b>, enter the new quantity 
            and click on the Update button.</p>
      <p><b>To remove an item</b>, click on the Remove button.</p>
    </td>
  </tr>
</table>
    </c:otherwise>
  </c:choose>

<form action="<c:url value='/cart/displayQuickOrder' />" method="post">
  <input type="submit" value="Continue Shopping">
</form>

<c:if test="${not empty cart.items}">
<!--
The following form action uses a secure connection. 
To use it, you must configure your development environment 
as described in chapter 16 of this book.
-->
<%-- 
<form action="<c:url 
      value='https://localhost:8444/storefront/cart/checkUser' />"
      method="post">
  <input type="submit" value="Checkout">
</form>
--%>

<!-- The following form action doesn't use a secure connection.
However, it lets you run the application without configuring 
the secure connection in your development environement. 
-->
<form action="<c:url value='/cart/checkUser' />" method="post">
  <input type="submit" value="Checkout">
</form>
</c:if>


<!-- end middle column -->
<jsp:include page="/includes/column_right.jsp" flush="true" />
<jsp:include page="/includes/footer.jsp" />
