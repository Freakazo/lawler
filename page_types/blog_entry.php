<?php  defined('C5_EXECUTE') or die("Access Denied."); ?>
<div id="intro">
	<style> font-size: inherit; </style>
	<p><?php  $ai = new Area('Blog Post Header'); $ai->display($c); ?></p>
</div>
<div class="ccm-spacer"></div>
<div class="row no-pad">
	<div class="col-md-3">
		<?php  $an = new Area('Blog archive'); $an->display($c); ?>
	</div>
	<div class="col-md-9">
		<div class="pageSection">
			
		</div>
		<div class="pageSection">
			<h3><?php  echo $c->getCollectionName(); ?></h3>
			<i><p class="meta"><?php  echo t('Posted on')?> on <?php  echo $c->getCollectionDatePublic('F j, Y'); ?></p></i>	
		</div>
		<div class="pageSection">
			<?php  $as = new Area('Main'); $as->display($c); ?>
		</div>
		<div class="pageSection">
			<?php  $a = new Area('Blog Post More'); $a->display($c); ?>
		</div>
		<div class="pageSection">
			<?php  $ai = new Area('Blog Post Footer'); $ai->display($c); ?>
		</div>
	</div>
</div>