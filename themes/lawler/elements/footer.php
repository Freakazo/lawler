<div id="footer" class="clearfix">

	<div class="row">
		<div class="col-md-4">
			<div class="footerTitle">
				<h1>Sitemap</h1>
			</div>
		</div>
		<div class="col-md-4">
			<div class="footerTitle">
				<h1>Contact Us</h1>
			</div>
		</div>
		<div class="col-md-4">
			<div class="footerTitle">
				<h1>Legals</h1>
			</div>
		</div>
	</div><!--row-->


	<div class="col-md-4">
		<div>
			<?php $b = new GlobalArea('Sitemap'); $b->display($c); ?>
		</div>
	</div>
	<div class="col-md-4">
			<?php $b = new GlobalArea('ContactUs'); $b->display($c); ?>
	</div>
	<div class="col-md-4">
			<?php $b = new GlobalArea('Legals'); $b->display($c); ?>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    var anchor = window.location.hash.replace("#", "");
    $("#" + anchor).collapse('show');

    function goToByScroll(id){
        $('html,body').animate({scrollTop: $("#"+id).offset().top - 130},'slow');
	}

	setTimeout(function(){
	      goToByScroll(anchor);
	},1000);
});


</script>
