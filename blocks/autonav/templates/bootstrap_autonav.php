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
	<?php if ($ni->name === "Home" || $ni->url === "/~freakazo/Lawler/#nope") {
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
	<li class="dropdown <?php echo $classes?>">
		<a href="<?php echo $realUrl?>" class="dropdown-toggle disabled" data-toggle="dropdown">Services<b class="caret"></b></a>
		<ul class="dropdown-menu">
		<?php
			$db = Loader::db();
			$results = $db->query('SELECT * from btDCServiceBox');
			$rows = $results->GetArray();
			foreach( $rows as $row) {
				echo "<li><a href=\"";
				echo $realUrl;
				echo "#";
				echo $row['field_2_textbox_text'];
				echo "\" title=\"Go to the ";
				echo $row['field_3_textbox_text'];
				echo " page\">";
				echo $row['field_3_textbox_text'];
				echo "</a></li>";
			}
		?>
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
	<a href="http://www.linkedin.com/company/2983812" target="linkedin" style="padding-top:13px;
															padding-left:10px;
															padding-right:10px;">
		<img src="<?=$this->getThemePath()?>/images/linkedIn.png" width="26" height="26"></img>
	</a>
</li>
