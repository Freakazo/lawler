<div id="footer" class="clearfix">

	<div class="row">
		<div class="col-md-4">
			<div class="footerTitle">
				<h1>Sitemap</h1>
			</div>
		</div>
		<div class="col-md-4">
			<div class="footerTitle">
				<h1>Contact Us</h1>
			</div>
		</div>
		<div class="col-md-4">
			<div class="footerTitle">
				<h1>Legals</h1>
			</div>
		</div>
	</div><!--row-->


	<div class="col-md-4">
		<div>
			<?php $b = new GlobalArea('Sitemap'); $b->display($c); ?>
		</div>
	</div>
	<div class="col-md-4">
			<?php $b = new GlobalArea('ContactUs'); $b->display($c); ?>
	</div>
	<div class="col-md-4">
			<?php $b = new GlobalArea('Legals'); $b->display($c); ?>
	</div>
</div>
	<?php Loader::element('footer_required'); ?>
	<!-- include Cycle plugin -->
	<script src="http://malsup.github.com/jquery.cycle2.js"></script>
	<script src="<?=$this->getThemePath()?>/js/bootstrap.js"></script>
