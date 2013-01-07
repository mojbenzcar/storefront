<jsp:include page="/includes/header.html" />

<!-- start the middle column -->
<div id="main-wrap">
<div id="main"> 

<!-- ultimately this page should probably be generated from the database, but
for development its easier to leave it as html and mash refresh for changes.-->

<h1>storefront (working title) Catalog</h1>

<h4>product 1</h4>
<p><a href="displayProduct?productCode=pr01">product 01</a></p>
<p>Description: <script> loremIpsumParagraph(25)</script></p>

<h4>product 2</h4>
<p><a href="displayProduct?productCode=pr02">product 02</a></p>
<p>Description: <script> loremIpsumParagraph(25)</script></p>

<h4>product 3</h4>
<p><a href="displayProduct?productCode=pr03">product 03</a></p>
<p>Description: <script> loremIpsumParagraph(25)</script></p>

</div>
</div>
<!-- end the middle column -->

<jsp:include page="/includes/column_right.jsp" flush="true" />
<jsp:include page="/includes/footer.jsp" />
