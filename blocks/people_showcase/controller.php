<?php defined('C5_EXECUTE') or die(_("Access Denied."));

class PeopleShowcaseBlockController extends BlockController {

	protected $btTable = "btBasicTest";
	protected $btInterfaceWidth = "350";
	protected $btInterfaceHeight = "300";

	public function getBlockTypeName() {
		return t('People Showcase');
	}

	public function getBlockTypeDescription() {
		return t('Showcase employees');
	}

	public function save($args) {
		$this->savePersons($args);
		parent::save($args);
	}

	public function savePersons($args) {
		$db = Loader::db();

		#get pID for all persons
		$keys = array_keys($args);
		foreach( $keys as $key) {
			if(preg_match( '/person\-+[0-9]/', $key)) {
				$key = str_replace("person-", "", $key);
				$persons[] = $key;
			}
		}
		$deleted = array();
		#get pID for all persons deleted
		$deleteIDs = array_keys($args);
		foreach( $persons as $pID) {
			if($args["delete-".$pID] === "delete") {
				$deleted[] = $pID;
				$db->Execute("delete from btPersons where pID=$pID");
			}
		}



		Log::addEntry(implode("','",$args));
		foreach($persons as $pID) {
			if(empty($args["person-".$pID]) || (in_array($pID, $deleted))) {
				continue;
			}
			$query = "insert into btPersons (pID, name, intro, image, link) values (?, ?, ?, ?, ?) on duplicate key update name=values(name), intro=values(intro), image=values(image), link=values(link)";
			$values = array($pID, $args["person-".$pID], $args["intro-".$pID], $args["image-".$pID], $args["link-".$pID]);
			Log::addEntry('Saving data');
			$db->Execute($query, $values);
		}
	}
}
