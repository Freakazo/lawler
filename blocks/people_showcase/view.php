<?php defined('C5_EXECUTE') or die(_("Access Denied.")) ?>

<div id="Slide">
	<ul>

<?php
$db = Loader::db();
$results = $db->query('SELECT * from btPersons');
$rows = $results->GetArray();

#Get all the files in the people fileset
Loader::model("file_list");
Loader::model("file_set");
$fs = FileSet::getByName('people');
$fl = new FileList();
$fl->filterBySet($fs);
$files = $fl->get();

foreach( $rows as $row) {
	$found = false;
	foreach($files as $file) {
		if($file->getFileName() === $row['image']) {
			$imageFile = $file;
			$found = true;
		}
	}
	if(found && $imageFile) {
?>
		<li>
			<img src="<?php echo $imageFile->getDownloadUrl();?>">
			<div class="name"> <h4><?php echo $row['name'] ?> </h4></div>
		</li>

<?php
	}
}
?>

	</ul>
	<!--Controls-->
	<div id=Left>
		<div class="glyphicon glyphicon-chevron-left"></div>
	</div>
	<div id=Right>
		<div class="glyphicon glyphicon-chevron-right"></div>
	</div>
</div>

<script type="text/javascript">
var scrollPos = -150;

$("#Slide li").each(function (index) {
	console.log(index + ": " + scrollPos);
	$(this).css({
		"left": index * 150 - scrollPos
	});
});


$("#Left").click(function () {
	scrollPos -= 150;
	$("#Slide li").each(function (index) {
		console.log(scrollPos);
		$(this).animate({
			"left": index * 150 - scrollPos
		}, 650);
	});
});

$("#Right").click(function () {
	scrollPos += 150;
	$("#Slide li").each(function (index) {
		console.log(scrollPos);
		$(this).animate({
			"left": index * 150 - scrollPos
		}, 650);
	});
});

$("#Slide img").hover(function() {
	$(this).stop(true, false).animate({ "width" : "150px", "left" : "-25px"});
	$(this).parent().find('name').stop(true, false).animate({"left" : "-25px"});

}, function() {
	$(this).stop(true, false).animate({ "width" : "100px", "left" : "0px"});
	$(this).parent().find('name').stop(true, false).animate({"left" : "0px"});
});

$("#Slide #Left").hover(function(){
	$("#Slide #Left .glyphicon").stop(true, false).animate({ "font-size" : "28px", "top" : "44%" });
}, function() {
	$("#Slide #Left .glyphicon").stop(true, false).animate({ "font-size" : "24px", "top": "45%"});
});

$("#Slide #Right").hover(function(){
	$("#Slide #Right .glyphicon").stop(true, false).animate({ "font-size" : "28px" });
}, function() {
	$("#Slide #Right .glyphicon").stop(true, false).animate({ "font-size" : "24px" });
});
</script>
