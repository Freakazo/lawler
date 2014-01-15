<?php $this->inc('header.php'); ?>

<div id="container">
	<div id="content" class="no-pad">
		<div id="intro">
			<?php $f = new Area('introduction'); $f->display($c); ?>
		</div>
		<div class="row">
			<div class="col-md-3">
				<?php $a = new Area('sideBar'); $a->display($c); ?>
			</div>
			<div class="col-md-9">
				<?php $b = new Area('Content'); $b->display($c); ?>
			</div>
		</div>
	</div>
	<?php $this->inc('elements/footer.php'); ?>
</div>
<?php Loader::element('footer_required'); ?>
</body>
</html>
