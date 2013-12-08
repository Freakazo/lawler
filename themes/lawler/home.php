<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<?php Loader::element('header_required'); ?>
<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap.min.css">
<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/default.css">
<!--[if lt IE 9]>  
    <script src="<?=$this->getThemePath()?>/js/css3-mediaqueries.js"></script>
<![endif]-->
</head>
<body>
<div id="wrap">
	<?php $this->inc('header.php'); ?>
</div>
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

			<div id="webelieve">
				<img src="<?=$this->getThemePath()?>/images/frontpage/Frontpage_1_Color_tagline.jpg">
			</div>
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
           </div><h1><p>News here</p></h1> <h1><p>News here</p></h1></div>

					 <div class="tab-pane fade in active" id="services">

							 <div class=row>
               <div class="col-md-6">
                 <h4> Superannuation & Wealth Creation Strategies</h4>
                 <p>Superannuation is one of the most tax-effective ways of saving for your retirement.</p>
               </div>
               <div class="col-md-6">
                 <h4> Retirement Planning</h4>
								 <p>Having a financial plan for your retirement years is essential to help you achieve the life you want to live in retirement.</p></div>
               </div>
							 <div class=row>
               <div class=col-md-6>
                 <h4> Investment Advice</h4>
                 <p> The principles of investing are simple when you know the best way to reach your accumulation goals.</p>
               </div>
               <div class=col-md-6>
                 <h4> Protected Loans </h4>
                 <p>Having a Protected Loan attached to an investment portfolio allows you to enjoy the benefits of a rising stock market without the risk of capital loss when markets fall.</p>
							 </div>
								</div>
							 <div class=row>
               <div class=col-md-6>
                 <h4> Margin Lending </h4>
                 <p>Margin lending, also known as 'gearing', enables you borrow money to invest in shares, managed funds, master trusts and wraps.
               </div>
               </div>
           </div><!-- services -->
			</div><!-- tab-content -->

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
</body>
</html>
