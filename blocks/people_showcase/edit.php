<?php defined('C5_EXECUTE') or die(_("Access Denied.")) ?>
<div class="ccm-ui">
	<div class="alert-message block-message info">
		<?php echo t("This is the edit template for the basic test block.") ?>
	</div>

	<div class="clearfix">
		<?php echo $form->label('content', t('Name')) ?>
		<?php echo $form->text('content', $content, array('style' => 'width: 320px')) ?>
	</div>
<hr>
<p>People</p>
<?php
$db = Loader::db();
$results = $db->query('SELECT * FROM btPersons');
$rows = $results->GetArray();
foreach ($rows as $row) {

		$currID = $row['pID'];
	?>
		<div class="clearfix">
		<?php
			echo $form->label('person-' . $currID, t('Name'));
			echo $form->text('person-' . $currID, $row['name']);
		?>
		</div>

		<div class="clearfix">
		<?php
			echo $form->label('intro-' . $currID, t('Intro'));
			echo $form->text('intro-' . $currID, $row['intro']);
		?>
		</div>

		<div class="clearfix">
		<?php
			echo $form->label('image-' . $currID, t('Image'));
			echo $form->text('image-' . $currID, $row['image']);
		?>
		</div>

		<div class="clearfix">
		<?php
			echo $form->label('link-' . $currID, t('Link'));
			echo $form->text('link-' . $currID, $row['link']);
		?>
		</div>
		<div class="clearfix">
		<?php
			echo $form->label('delete-' . $currID, t('Delete: '));
			echo $form->checkBox('delete-' . $currID, 'delete', 0);
		?>
		</div>
		<hr>
<?php
}

#Find a new unique ID
$found = false;
$currID = 4;
while(!$found) {
		$found = true;
		foreach($rows as $row){
				if($currID == $row['pID']) {
						$found = false;
				}
		}
		if($found == true) {
				break;
		}
		$currID++;
}
?>
<div class="clearfix">
<?php
	echo $form->label('person-' . $currID, t('Name'));
	echo $form->text('person-' . $currID);
?>
</div>


<div class="clearfix">
<?php
	echo $form->label('intro-' . $currID, t('Intro'));
	echo $form->text('intro-' . $currID);
?>
</div>

<div class="clearfix">
<?php
	echo $form->label('image-' . $currID, t('Image'));
	echo $form->text('image-' . $currID);
?>
</div>

<div class="clearfix">
<?php
	echo $form->label('link-' . $currID, t('Link'));
	echo $form->text('link-' . $currID);
?>
</div>







</div>
