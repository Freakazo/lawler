<?php $this->inc('header.php'); ?>
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/Chris.css">
<div id="content">
	<div id="container">
		<div id="highlights"> 
			<?php $a = new Area('Highlight'); $a->display($c); ?>
		</div>

		<div id="welcome"> 
			<?php $b = new Area('Introduction'); $b->display($c); ?>
		</div>
		<?php $this->inc('elements/footer.php'); ?>
	</div><!-- container -->
</div><!-- content -->


<?php Loader::element('footer_required'); ?>
<!-- include Cycle plugin -->
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script src="<?=$this->getThemePath()?>/js/bootstrap.js"></script>
<script>
	$("#tabs a").click(function (e) {
		e.preventDefault();
		$(this).tab("show");
	});
</script>
</body>
</html>
