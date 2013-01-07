<jsp:include page="/includes/header.html" />
<!-- start the middle column -->
<div id="main-wrap">
<div id="main">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.3/jquery.min.js"></script>
<script>
$(document).ready(function() {
		
$('#gallery img').each(function(i) {
	var imgFile = $(this).attr('src');
	var preloadImage = new Image();
  var imgExt = /(\.\w{3,4}$)/;
  preloadImage.src = imgFile.replace(imgExt,'_h$1');
		
	$(this).hover(
		function() {
			$(this).attr('src', preloadImage.src);
		},
		function () {
		var currentSource=$(this).attr('src');
			$(this).attr('src', imgFile);
	}); // end hover
}); // end each
	
	$('#gallery a').click(function(evt) {
		//don't follow link
		 evt.preventDefault();
		 //get path to new image
	   var imgPath = $(this).attr('href');
		 //get reference to old image
		 var oldImage = $('#photo img');
		 			
			 //create HTML for new image
			 var newImage = $('<img src="' + imgPath +'">');
			 //make new image invisible
			 newImage.hide();
			 //add to the #photo div
			 $('#photo').prepend(newImage);
			 //fade in new image
			 newImage.fadeIn(1000);
			 
			 //fade out old image and remove from DOM
			 oldImage.fadeOut(1000,function(){
		     $(this).remove();
				});
			 
		 
	}); // end click
		
		$('#gallery a:first').click();
}); // end ready
</script>

<h1>main page</h1>
<p><script>loremIpsumParagraph(15);</script></p>
<div id="gallery">
  <a href="/storefront/images/pr01_image.jpg">
    <img src="/storefront/images/small/slide1.jpg" width="90" height="90" alt="">
  </a>
  <a href="/storefront/images/pr02_image.jpg">
    <img src="/storefront/images/small/slide2.jpg" width="90" height="90" alt="">
  </a>
  <a href="/storefront/images/pr03_image.jpg">
    <img src="/storefront/images/small/slide3.jpg" width="90" height="90" alt="">
  </a>
  <a href="/storefront/images/pr04_image.jpg">
    <img src="/storefront/images/small/slide4.jpg" width="90" height="90" alt="">
  </a>
</div>
<div id="photo"></div>
<div style="clear:both;"></div>
<br/>
<script> loremIpsumParagraph(25); </script>


</div><!-- main -->
</div><!-- main wrapper -->
<!-- end the middle column -->
<jsp:include page="/includes/column_right.jsp" flush="true" />
<jsp:include page="/includes/footer.jsp" />
