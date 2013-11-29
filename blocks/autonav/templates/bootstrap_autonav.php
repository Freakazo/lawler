<?php  defined('C5_EXECUTE') or die("Access Denied.");
$navItems = $controller->getNavItems();
?>


<?php  foreach ($navItems as $ni) {
	
	$classes = array();
	if ($ni->isCurrent) {
		$classes[] = 'active';
	}
	if ($ni->inPath) {
		$class[] = 'active';
	}
	$classes = implode(" ", $classes);
	?>
	<?php if ($ni->url === "/Lawler/" || $ni->url === "/~freakazo/Lawler/#nope") {
		echo "<li class=\"". $classes ."\"> <a href=\"". $ni->url ."\"><span class=\"glyphicon glyphicon-home\"></span></a></li>";
		continue;
	}
	if ($ni->name == "Services"){
		if(substr($ni->url, -1) == '/') {
			$realUrl = substr($ni->url, 0, -1);
		}
		else {
			$realUrl = $ni->url;
		}
	?>	
	<li class="dropdown <?php echo $classes ?>">
		<a href="<?php echo $realUrl?>" class="dropdown-toggle" data-toggle="dropdown">Services<b class="caret"></b></a>
		<ul class="dropdown-menu">
<li><a href="<?php echo $realUrl?>#retirement-planning" title="Go to the Retirement Planning page">Retirement Planning</a></li> 

<li><a href="<?php echo $realUrl?>#investment-advice" title="Go to the Investment Advice page">Investment Advice</a></li> 
	
<li><a href="<?php echo $realUrl?>#superannuation-wealth-creation-strategies" title="Go to the Superannuation &amp; Wealth Creation Strategies page">Superannuation &amp; Wealth Creation Strategies</a>
</li> 

<li><a href="<?php echo $realUrl?>#self-managed-super-funds" title="Go to the Self Managed Super Funds page">Self Managed Super Funds</a>
</li> 
	
<li><a href="<?php echo $realUrl?>#tax-effective-planning" title="Go to the Tax Effective Planning page">Tax Effective Planning</a></li> 
	
<li><a href="<?php echo $realUrl?>#direct-equities" title="Go to the Direct Equities page">Direct Equities</a></li> 
	
<li><a href="<?php echo $realUrl?>#protected-loans" title="Go to the Protected Loans page">Protected Loans</a></li> 
	
<li><a href="<?php echo $realUrl?>#insurance" title="Go to the Insurance page">Insurance</a></li> 
	
	    
<li><a href="<?php echo $realUrl?>#estate-planning" title="Go to the Estate Planning page">Estate Planning</a></li> 
	
<li><a href="<?php echo $realUrl?>#margin-lending" title="Go to the Margin Lending page">Margin Lending</a></li> 
	
<li><a href="<?php echo $realUrl?>#negative-gearing" title="Go to the Negative Gearing page">Negative Gearing</a></li> 
	
<li><a href="<?php echo $realUrl?>#instalment-gearing" title="Go to the Instalment Gearing page">Instalment Gearing</a></li>
</ul>
</li>

<?php
		continue;
	}
?>
	<li class="<?php echo $classes?>">
		<a href="<?php echo $ni->url?>" target="<?php echo $ni->target?>"><?php echo $ni->name?></a>
	</li>
	
<?php  } ?>
<li style="height:50px;">
	<a href="http://linkedin.com" target="linkedin" style="padding-top:13px;
															padding-left:10px;
															padding-right:10px;">
		<img src="<?=$this->getThemePath()?>/images/linkedIn.png" width="26" height="26"></img>
	</a>
</li>
