<jsp:include page="/includes/header.html" />

<!-- start the middle column -->
<div id="main-wrap">
<div id="main"> 

<h1>Login Form</h1>
<p>Please enter a username and password to continue.</p>
<form action="j_security_check" method="get">
<table cellspacing="5" border="0">
    <tr>
        <td align="right"><p>Username:</p> </td>
        <td><input type="text" name="j_username"></td>
    </tr>
    <tr>
        <td align="right"><p>Password:</p> </td>
        <td><input type="password" name="j_password"></td>
    </tr>
    <tr>
      <td><input type="submit" value="Login"></td>
    </tr>
</table>
</form>

</div>
</div>

<!-- end the middle column -->

<jsp:include page="/includes/column_right.jsp" />
<jsp:include page="/includes/footer.jsp" />
