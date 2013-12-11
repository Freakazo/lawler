<?php $this->inc('header.php'); ?>
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/peoples.css">
<div id="content">
	<div id="container">
			<?php $b = new Area('Showcase'); $b->display($c); ?>

		<div id="welcome"> 
			<?php $b = new Area('Introduction'); $b->display($c); ?>
		</div><!-- welcome -->

	</div><!-- container -->
</div><!-- conent -->
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
