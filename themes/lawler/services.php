<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/services.css">
<?php $this->inc('header.php'); ?>
<div id="content">
	<div id="container">
		<div id="intro">
			<?php $b = new Area('Content'); $b->display($c); ?>
		</div>
		<div class="panel-group" id="accordion">
			<?php $b = new Area('Accordion'); $b->display($c); ?>
		</div><!-- row -->
		<?php $this->inc('elements/footer.php'); ?>
	</div><!-- content -->
	<?php Loader::element('footer_required'); ?>
	<script src="<?=$this->getThemePath()?>/js/bootstrap.js"></script>
</div>
</body>
</html>

<script type="text/javascript">
$(document).ready(function() {
    var anchor = window.location.hash.replace("#", "");
    $("#" + anchor).collapse('show');

    if(anchor !== "")
    {
	    function goToByScroll(id){
	        $('html,body').animate({scrollTop: $("#"+id).offset().top - 130},'slow');
		}

		setTimeout(function(){
		      goToByScroll(anchor);
		},1000);    	
    }

});


</script>


