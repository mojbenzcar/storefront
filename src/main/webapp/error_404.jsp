<jsp:include page="/includes/header.html" />

<!-- start the middle column -->

<%@ page isErrorPage="true" %>


<h1>404 Error</h1>
<p>The server was not able to find the file you requested.</p>
<p>To continue, click the Back button or select a link from this page.</p>
<br>

<h2>Details</h2>
<p>Requested URI: ${pageContext.errorData.requestURI}</p>

</td>

<!-- end the middle column -->

<jsp:include page="/includes/footer.jsp" />
