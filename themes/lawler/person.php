<?php $this->inc('header.php'); ?>
<div id="content">
	<div id="container">
		<div id="highlights"> 
			<video width="100%" controls poster="<?=$this->getThemePath()?>/images/Chris_Video_Image.png">
				<source src="<?=$this->getThemePath()?>/videos/Chris_Video.mov" type="video/mp4">
					<source src="<?=$this->getThemePath()?>/videos/Chris_Video.ogg" type="video/ogg">
						Your browser does not support the video tag.
					</video>
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
