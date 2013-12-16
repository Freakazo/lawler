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

		global $c;

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
					<a id="pop" href="<?php echo $row['link'];?>" data-toggle="popover" data-content="<?php echo $row['intro'] ?>" data-title="<?php echo $row['name'] ?>" > 
						<img src="<?php echo $imageFile->getDownloadUrl();?>">
					</a>
					<div class="name"> <h4><?php echo $row['name'] ?> </h4></div>

				</li>
				

				<?php
			}
		}
		?>

	</ul>
	<div id=Bottom>
	</div>
	<!--Controls-->
	<div id=Left>
		<div class="glyphicon glyphicon-chevron-left"></div>
	</div>
	<div id=Right>
		<div class="glyphicon glyphicon-chevron-right"></div>
	</div>

	
</div>
