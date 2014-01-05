<?php $this->inc('header.php'); ?>

<div id="content">
	<div id="container">
		<div id="highlights">
			<div class="cycle-slideshow">
				<?php
				Loader::model("file_set");
				Loader::model('file_list');
				$fs = FileSet::getByName('highlights');
				$fl = new FileList();
				$fl->filterBySet($fs);
				$files = $fl->get();
				$images = array();
				foreach($files as $f) {
					echo "<img id=\"highlightImage\" src=\"";
					echo $f->getDownLoadUrl();
					echo "\" >\n";
				}?>
			</div><!-- cycle slideshow -->

<!-- 			<div id="webelieve">
				<img src="<?=$this->getThemePath()?>/images/frontpage/Frontpage_1_Color_tagline.jpg">
			</div> -->
		</div><!-- highlights -->

		<div id="welcome"> 
			<?php $b = new Area('Introduction'); $b->display($c); ?>
		</div>

		<div id="expando">
			<ul class="nav nav-pills nav-justified" id="tabs" data-tabs="tabs">
				<li class="active"><a href="#services" data-toggle="tab">Our services</a></li>
				<li><a data-toggle="tab" href="#news" >News</a></li>
			</ul>
			<div class="tab-content" id="my-tab-content">
				<div class="tab-pane fade in" id="news">            
					<div id="publications">
						<p><span id="date">16 Oct 2013</span> Transfer your assets to Superannuation: SMSFs and Related Party Transfers</p>
						<p><span id="date">28 Jun 2012</span> BT Federal Budget Update 2012</p>
					</div>
				</div>

				<div class="tab-pane fade in active" id="services">
					<?php $b = new Area('Services'); $b->display($c); ?>
				</div><!-- tab-content -->
			</div>
		</div><!-- expando -->
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
</div>
</div>
</div>
</body>
</html>
