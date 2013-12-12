
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<?php Loader::element('header_required'); ?>
<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap.min.css">
<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/default.css">
	<script src="<?=$this->getThemePath()?>/js/html5shiv.js"></script>
	<script src="<?=$this->getThemePath()?>/js/respond.min.js"></script>
</head>
<body>
<div id="wrap">

		<div id="headSpace">
				<div id="header">
						<div id="menuContainer">
								<span id="logo">
										<a href=""><img src="<?=$this->getThemePath()?>/images/logo.png"></a>
								</span>
								<nav class="navbar navbar-default navbar-right" role="navigation">
										<!-- Brand and toggle get grouped for better mobile display -->
										<div class="nav-header">
												<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
														<span class="sr-only">Toggle navigation</span>
														<span class="icon-bar"></span>
														<span class="icon-bar"></span>
														<span class="icon-bar"></span>
												</button>
										</div>

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse col-md4" id="bs-example-navbar-collapse-1">
												<ul class="nav navbar-nav navbar-right">
														<?php
														$bt = BlockType::getByHandle('autonav');
														$bt->controller->displayPages = 'top';
														$bt->controller->orderBy = 'display_asc';
														$bt->render('templates/bootstrap_autonav');
														?>
												</ul>
										</div><!-- /.navbar-collapse -->
								</nav>
						</div> <!--row -->
				</div>
		</div>
</div>
