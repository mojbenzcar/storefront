<jsp:include page="/includes/header.html" />

<!-- begin middle column -->


<h1>Report list</h1>

<p>This page contains a list of the reports that are <br>
available from this site.</p>
    
<form action="displayReport" method="post">
    <input type="hidden" name="reportName" value="userEmail">
    <input type="hidden" name="reportTitle" value="The User Email report">
    <input type="submit" value="User Email Report">
</form>

<form action="parameters.jsp" method="post">
    <input type="hidden" name="reportName" value="invoiceDetail">
    <input type="hidden" name="reportTitle" value="The Invoice Detail report">
    <input type="submit" value="Invoice Detail report">
</form>

<form action="parameters.jsp" method="post">
    <input type="hidden" name="reportName" value="invoiceSummary">
    <input type="hidden" name="reportTitle" value="The Invoice Summary report">
    <input type="submit" value="Invoice Summary report">
</form>


<!-- end middle column -->

<jsp:include page="/includes/footer.jsp" />
