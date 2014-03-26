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
<script>
	$("#tabs a").click(function (e) {
		e.preventDefault();
		$(this).tab("show");
	});
</script>
</body>
</html>
