<?php $this->inc('header.php'); ?>
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/contact.css">
<div id="content">
	<div id="container">
		<div id="content"> 
			<div id="welcome"> 
				<?php $b = new Area('Introduction'); $b->display($c); ?>
			</div>
			<?php $b = new Area('Content'); $b->display($c); ?>

			<div class=row>
				<div class="col-md-4">
					<?php $b = new Area('one'); $b->display($c); ?>
				</div>
				<div class="col-md-8">
					<?php $b = new Area('map'); $b->display($c); ?>
				</div>
			</div>
			<hr>

			<div class=row>
				<div class="col-md-4">
					<?php $b = new Area('two'); $b->display($c); ?>
				</div>
				<div class="col-md-8">
					<?php $b = new Area('mapTwo'); $b->display($c); ?>
				</div>
			</div>
			<hr>

			<div class=row>
				<div class="col-md-4">
					<?php $b = new Area('three'); $b->display($c); ?>
				</div>
				<div class="col-md-8">
					<?php $b = new Area('mapThre'); $b->display($c); ?>
				</div>
			</div>
			<div id="welcome"> 
				<?php $b = new Area('contactForm'); $b->display($c); ?>
			</div>
			<?php $this->inc('elements/footer.php'); ?>
		</div>
	</div>
</div>
</body>
</html>
