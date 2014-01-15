<?php 
defined('C5_EXECUTE') or die("Access Denied.");

$url       = parse_url($videoURL);
$pathParts = explode('/', rtrim($url['path'], '/'));
$videoID   = end($pathParts);

if (isset($url['query'])) {
	parse_str($url['query'], $query);
	$videoID = (isset($query['v'])) ? $query['v'] : $videoID;
}

if (Page::getCurrentPage()->isEditMode()) { ?>

	<div class="ccm-edit-mode-disabled-item">
		<div style="padding:8px 0px; padding-top: <?php echo  round($vHeight/2)-10; ?>px;"><?php echo  t('YouTube Video disabled in edit mode.'); ?></div>
	</div>
	
<?php  } elseif ($vPlayer == 1) { ?>
	<div class="videoWrapper">
			<iframe src="http://www.youtube.com/embed/<?php echo  $videoID; ?>" frameborder="0" allowfullscreen></iframe>
	</div>
	
<?php  } else { ?>

	<div id="youtube<?php echo  $bID; ?>" class="youtubeBlock"><div id="youtube<?php echo  $bID; ?>_video"><?php echo  t('You must install Adobe Flash to view this content.'); ?></div></div>
	<script type="text/javascript">
	//<![CDATA[
	params = {
		wmode: "transparent"
	};
	flashvars = {};
	swfobject.embedSWF('http://www.youtube.com/v/<?php echo  $videoID; ?>&amp;hl=en', 'youtube<?php echo  $bID; ?>_video', '8.0.0', false, flashvars, params);
	//]]>
	</script>
	
<?php  } ?>
