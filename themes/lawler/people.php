<?php $this->inc('header.php'); ?>
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/peoples.css">
<div id="content">
	<div id="container">
			<?php $b = new Area('Showcase'); $b->display($c); ?>

		<div id="welcome"> 
			<?php $b = new Area('Introduction'); $b->display($c); ?>
		</div><!-- welcome -->

		<?php $this->inc('elements/footer.php'); ?>
	</div><!-- container -->
</div><!-- conent -->
	<script>
$("#tabs a").click(function (e) {
		e.preventDefault();
		$(this).tab("show");
		});
	</script>
</body>
</html>
