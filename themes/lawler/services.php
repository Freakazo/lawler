<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
	<?php Loader::element('header_required'); ?>
	<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?=$this->getThemePath()?>/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/default.css">
	<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/services.css">

 
  </head>
  <body data-spy="scroll" data-target="#side-nav">
	<div id="wrap">
		<?php $this->inc('header.php'); ?>
  </div>
  <div id="content">
   <div id="container">
			<?php $b = new Area('Content'); $b->display($c); ?>
		<div class="panel-group" id="accordion">
		  <div class="panel panel-default">
			<div class="panel-heading">
			  <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#retirement-planning">Retirement Planning
				</a>
			  </h4>
			</div>    
			<div id="retirement-planning" class="panel-collapse collapse in">
				  <div class="panel-body">
<p>Having a financial plan for your retirement years is essential to help you achieve the life you want to live in retirement.</p>

<p>There is a growing trend that Australians are retiring earlier from full time employment and generally living much longer than previous generations. People are now spending more than a quarter of their lives in retirement, but how far will their accumulated savings last, and what kind of lifestyle will be available to them?</p>

<p>This is where Lawler Financial Services can assist you with a strategy to help you live the lifestyle you'd like when you reach retirement.</p>

<p>Make an enquiry with one of our Authorised Financial Planners.</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#investment-advice">
Investment Advice
        </a>
      </h4>
    </div>
    <div id="investment-advice" class="panel-collapse collapse">
      <div class="panel-body"><p>
The principles of investing are simple when you know the best way to reach your accumulation goals. Principles of dollar cost averaging, compounding interest, a regular savings plan, as well as placing your money in an appropriate investment facility to suit your unique needs can reap rewards when you stick to the plan.</p>

<p>Our investment recommendations are customised to your specific requirements and can extend to any or all of the following asset classes:</p>

    <p class=tabbed>Australian Equities - Direct, Index Funds or Actively Managed Funds</p>
    <p class=tabbed>International Equities - Index Funds or Actively Managed Funds</p>
    <p class=tabbed>Emerging Markets - Actively Managed Funds</p>
    <p class=tabbed>Property Securities - Index Funds or Actively Managed Funds</p>
    <p class=tabbed>Government Bonds - Direct, Index Funds or Actively Managed Funds</p>
    <p class=tabbed>Corporate Bonds - Direct, Index Funds or Actively Managed Funds</p>
    <p class=tabbed>Term Deposits</p>

<p>Our team works with you to provide advice on how to best meet your investment goals.</p>

<p>Make an enquiry with one of our Authorised Financial Planners.</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#superannuation-wealth-creation-strategies">
Superannuation & Wealth Creation Strategies
        </a>
      </h4>
    </div>
    <div id="superannuation-wealth-creation-strategies" class="panel-collapse collapse">
      <div class="panel-body">
<p>Superannuation is one of the most tax-effective ways of saving for your retirement. The maximum rate of tax you’ll pay on your earnings in your super fund is 15% and you’re not charged tax on withdrawals from super once you turn 60, whereas earnings on your normal savings outside super are taxed at your marginal tax rate, which can be anywhere up to 46.5% including Medicare levy.</p>

<p>While you can shift your super between super funds, remember that contributions to super are almost always compulsorily preserved. This means that you generally can’t withdraw the funds until you are over 55 (increasing to age 60 if you were born after 1 July 1964) and meet a condition of release.</p>

<p>Make an enquiry with one of our Authorised Financial Planners.</p>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#self-managed-super-funds">Self Managed Super Funds
        </a>
      </h4>
    </div>
    <div id="self-managed-super-funds" class="panel-collapse collapse">
      <div class="panel-body">
<p>An SMSF is a trust where money or assets are held and managed on behalf of up to four members to provide benefits for their retirement. It's the most flexible of superannuation options with investment choices limited only to the investment strategy of the superannuation fund.</p>

<p>Subject to certain exceptions, all members of an SMSF must be trustees of the SMSF or directors of the SMSF’s corporate trustee. </p>

<p>The investment strategy must comply with the provisions of the Superannuation Industry (Supervision) Act 1993. Therefore, in addition to the wide selection of managed funds, you may also have real property in your superannuation fund and the universe of CHESS listed securities, provided the investment strategy of the fund allows this.</p>

<p>Like all super funds, an SMSF receives concessional tax treatment. The top tax rate for the investment earnings of your SMSF is 15%. This tax concession is only available if your fund complies with all the rules and regulations that apply to SMSFs. In other words, it's a ‘complying fund’.</p>

<p>Advising the trustees of an SMSF is a specialised area and our Financial Advisers have extensive training and experience in advising those who have or would like to establish an SMSF.</p>

<p>Make an enquiry with one of our Authorised Financial Planners.</p>
      </div>
    </div>
  </div>






</div>


		 </div><!-- services-->
    </div><!-- row -->
	</div><!-- content -->
		<?php Loader::element('footer_required'); ?>
<script src="<?=$this->getThemePath()?>/js/bootstrap.js"></script>
	</div>
	</body>
</html>
