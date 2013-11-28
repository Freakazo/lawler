<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<?php Loader::element('header_required'); ?>
<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap.min.css">
<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/default.css">
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/peoples.css">
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/Chris.css">

<style>
body {
	margin: 0;
	background: #C0C0C0 URL(<?=$this->getThemePath()?>/images/Chris_Background.jpg);
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-position: 5% 140px;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: auto 80%;
}</style>

</head>
<body>
<div id="wrap">
	<?php $this->inc('header.php'); ?>
</div>
<div id="content">
	<div id="container">
		 			<div id="highlights"> 
		 				<video width="100%" controls poster="<?=$this->getThemePath()?>/images/Chris_Video_Image.png">
  								<source src="<?=$this->getThemePath()?>/videos/Chris_Video.mov" type="video/mp4">
  								<source src="<?=$this->getThemePath()?>/videos/Chris_Video.ogg" type="video/ogg">
								Your browser does not support the video tag.
							</video>
		 			</div>

					<div id="welcome"> 
						<?php $b = new Area('Introduction'); $b->display($c); ?>
					</div>
		 			</div>
		 		</div>
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
</body>
</html>
