<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<?php Loader::element('header_required'); ?>
<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap.min.css">
<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/default.css">
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/peoples.css">
</head>
<body>
<div id="wrap">
	<?php $this->inc('header.php'); ?>
</div>
<div id="content">
	<div id="container">
<div id="highlights"> 
		 				<a href="chris-davis"><img src="<?=$this->getThemePath()?>/images/people/People_Group_Photo.jpg"></a>
		 			</div>
		 			<div class="scrollright" style="float: right; cursor: pointer; margin-bottom: 5px; margin-right: 5px;">RIGHT</div>
					<div class="scrollleft" style="float: left; cursor: pointer; margin-bottom: 5px; margin-right: 5px;">LEFT</div>
		 			<script>
						$('.scrollleft').click(function () {
						    console.log('ok')
						    $('#highlights').animate({
						        scrollLeft: '-=153'
						    }, 500, 'easeOutQuad');
						});
						$('.scrollright').click(function () {
						    console.log('ok')
						    $('#highlights').animate({
						        scrollLeft: '+=153'
						    }, 500, 'easeOutQuad');
						});
					</script>

					<div id="welcome"> 
		 				<p>With offices in Newcastle and Tamworth...
</p>
		 				</p>Our experienced team...</p>
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
