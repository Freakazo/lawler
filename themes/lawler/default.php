<?php $this->inc('header.php'); ?>

<div id="content">
	<div id="container">
		<div id="content"> 
			<?php $b = new Area('Content'); $b->display($c); ?>
		</div>
		<?php $this->inc('elements/footer.php'); ?>
	</div>
	<?php $this->inc('elements/footer.php'); ?>
</div>
<?php Loader::element('footer_required'); ?>
</body>
</html>
