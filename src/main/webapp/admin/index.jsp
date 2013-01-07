<jsp:include page="/includes/header.html" />

<!-- begin middle column -->
<!-- note that all /admin/* files are protected with container authorization -->


<h1>storefront (working title) - Administration</h1>

<!-- these Form tags dont force a secure connection -->
<form action="displayInvoices" method="post">
   <input type="submit" value="Process Invoices">
</form>
<form action="reports.jsp" method="post">
    <input type="submit" value="Display Reports">
</form>

<!-- these Form tags force a secure connection -->
<!--
<form action="https://localhost:8444/storefront/admin/displayInvoices"
      method="post">
   <input type="submit" value="Process Invoices">
</form>
<form action="https://localhost:8444/storefront/admin/reports.jsp" 
    method="post">
    <input type="submit" value="Display Reports">
</form>
-->


<!-- end middle column -->

<jsp:include page="/includes/footer.jsp" />
