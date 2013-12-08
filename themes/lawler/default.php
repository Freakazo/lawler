<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/default.css">
	<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap-theme.css">
	<link rel="stylesheet" href="<?=$this->getThemePath()?>/js/respond.min.js">


	<?php Loader::element('header_required'); ?>
  
  </head>
  <body>
	<div id="wrap">
	<?php $this->inc('header.php'); ?>
    </div>
      <div id="content">
         <div id="container">
		   <div id="content"> 
			<?php $b = new Area('Content'); $b->display($c); ?>
           </div>
         </div>
	   </div>
	<?php Loader::element('footer_required'); ?>
	</div>
  </body>
</html>
