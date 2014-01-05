<?php  defined('C5_EXECUTE') or die("Access Denied.");
Loader::element('editor_config');
?>

<style type="text/css" media="screen">
	.ccm-block-field-group h2 { margin-bottom: 5px; }
	.ccm-block-field-group td { vertical-align: middle; }
</style>

<div class="ccm-block-field-group">
	<h2>Service Link (For example: retirement-planning)</h2>
	<?php  echo $form->text('field_2_textbox_text', $field_2_textbox_text, array('style' => 'width: 95%;')); ?>
</div>

<div class="ccm-block-field-group">
	<h2>Service Title (For example: "Retirement Planning")</h2>
	<?php  echo $form->text('field_3_textbox_text', $field_3_textbox_text, array('style' => 'width: 95%;')); ?>
</div>

<div class="ccm-block-field-group">
	<h2>Content</h2>
	<?php  Loader::element('editor_controls'); ?>
	<textarea id="field_6_wysiwyg_content" name="field_6_wysiwyg_content" class="ccm-advanced-editor"><?php  echo $field_6_wysiwyg_content; ?></textarea>
</div>

<div class="ccm-block-field-group">
	<h2>Embedded content area?</h2>
	<?php 
	$options = array(
		'1' => 'Add content area inside block',
		'2' => 'Don&#039;t add content area inside block',
	);
	echo $form->select('field_8_select_value', $options, $field_8_select_value);
	?>
</div>


