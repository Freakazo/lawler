<?php 
defined('C5_EXECUTE') or die("Access Denied."); ?>
<?php $this->inc('header.php'); ?>

<div id="content">
	<div id="container">
		<div id="content"> 
			<?php 

			print $innerContent;

			?>
		</div>
		<?php $this->inc('elements/footer.php'); ?>
	</div>
</div>
<?php Loader::element('footer_required'); ?>
</body>
</html>
