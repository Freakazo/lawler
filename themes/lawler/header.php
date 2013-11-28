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
