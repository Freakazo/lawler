<?php  defined('C5_EXECUTE') or die("Access Denied.");
?>

<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">

<?php  if (!empty($field_2_textbox_text)): ?>
	<a href="#<?php  echo htmlentities($field_2_textbox_text, ENT_QUOTES, APP_CHARSET); ?>" data-toggle="collapse" data-parent="#accordion">
<?php  endif; ?>

<?php  if (!empty($field_3_textbox_text)): ?>
	<?php  echo htmlentities($field_3_textbox_text, ENT_QUOTES, APP_CHARSET); ?></a></h4>
</div>
<?php  endif; ?>

<?php  if (!empty($field_2_textbox_text)): ?>
	<div id="<?php  echo htmlentities($field_2_textbox_text, ENT_QUOTES, APP_CHARSET); ?>" class="panel-collapse collapse">
<?php  endif; ?>

<div class="panel-body">

<?php  if (!empty($field_6_wysiwyg_content)): ?>
	<?php  echo $field_6_wysiwyg_content; ?>
<?php  endif; ?>

</div>
</div>
</div>

<?php  if ($field_8_select_value == 1): ?>
	<!-- ENTER MARKUP HERE FOR FIELD "Embedded content area?" : CHOICE "Add content area inside block?" -->
<?php  endif; ?>

<?php  if ($field_8_select_value == 2): ?>
	<!-- ENTER MARKUP HERE FOR FIELD "Embedded content area?" : CHOICE "Don't add content area inside block" -->
<?php  endif; ?>


