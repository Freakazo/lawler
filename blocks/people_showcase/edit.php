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
usort($rows, function ($item1, $item2){
	return $item1['display_order'] - $item2['display_order'];
});
$orderNums = array();
for($i = 1; $i < count($rows) + 1; ++$i) {
	$orderNums[$i] = $i;
}
foreach ($rows as $row) {

		$currID = $row['pID'];
	?>
		<div class="ccm-block-field-group">

			<h3> Name: </h3>
			<?php
				echo $form->text('person-' . $currID, $row['name']);
			?>

			<h3> Introduction: </h3>
			<?php
				echo $form->text('intro-' . $currID, $row['intro'], array('style' => 'width: 100%'));
			?>

			<h3> Image file name: </h3>
			<?php
				echo $form->text('image-' . $currID, $row['image']);
			?>

			<h3> URL: </h3>
			<?php
				echo $form->text('link-' . $currID, $row['link']);
			?>

			<h3> Order: </h3>
			<?php
				echo $form->select('display_order-' . $currID, $orderNums, $row['display_order']);
			?>

			<h3> Flip image horizontally?: </h3>
			<?php
				echo $form->checkBox('flip-' . $currID, 'flip', $row["hor_flip"]);
			?>


			<h3> Delete person? </h3>
			<?php
				echo $form->checkBox('delete-' . $currID, 'delete', 0);
			?>

		</div>
<?php
}

#Find a new unique ID
$found = false;
$currID = 1;
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
<div class="ccm-block-field-group">
	<h2> Add new person: </h3>
	<div class="clearfix">

	<h3> Name: </h3>
	<?php
		echo $form->text('person-' . $currID);
	?>
	</div>

	<div class="clearfix">
	<h3> Introduction: </h3>
	<?php
		echo $form->text('intro-' . $currID);
	?>
	</div>

	<div class="clearfix">
	<h3> Image file name: </h3>
	<?php
		echo $form->text('image-' . $currID);
	?>
	</div>

	<div class="clearfix">
	<h3> URL: </h3>
	<?php
		echo $form->text('link-' . $currID);
	?>
	</div>
</div>







</div>
