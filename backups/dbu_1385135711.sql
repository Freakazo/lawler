DROP TABLE IF EXISTS AreaPermissionAssignments;

CREATE TABLE IF NOT EXISTS `AreaPermissionAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`arHandle`,`pkID`,`paID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS AreaPermissionBlockTypeAccessList;

CREATE TABLE IF NOT EXISTS `AreaPermissionBlockTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS AreaPermissionBlockTypeAccessListCustom;

CREATE TABLE IF NOT EXISTS `AreaPermissionBlockTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`btID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Areas;

CREATE TABLE IF NOT EXISTS `Areas` (
  `arID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `arOverrideCollectionPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `arInheritPermissionsFromAreaOnCID` int(10) unsigned NOT NULL DEFAULT '0',
  `arIsGlobal` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arID`),
  KEY `arIsGlobal` (`arIsGlobal`),
  KEY `cID` (`cID`),
  KEY `arHandle` (`arHandle`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

INSERT INTO Areas VALUES(1,105,'Header',0,0,0)
 ,(2,105,'Column 1',0,0,0)
 ,(3,105,'Column 2',0,0,0)
 ,(4,105,'Column 3',0,0,0)
 ,(5,105,'Column 4',0,0,0)
 ,(6,106,'Primary',0,0,0)
 ,(7,106,'Secondary 1',0,0,0)
 ,(8,106,'Secondary 2',0,0,0)
 ,(9,106,'Secondary 3',0,0,0)
 ,(10,106,'Secondary 4',0,0,0)
 ,(11,106,'Secondary 5',0,0,0)
 ,(12,1,'Header Nav',0,0,0)
 ,(13,1,'Header',0,0,0)
 ,(14,1,'Sidebar',0,0,0)
 ,(15,1,'Main',0,0,0)
 ,(16,1,'highlights',0,0,0)
 ,(17,1,'Introduction',0,0,0)
 ,(18,123,'highlights',0,0,0)
 ,(19,123,'Introduction',0,0,0)
 ,(20,122,'highlights',0,0,0)
 ,(21,122,'Introduction',0,0,0)
 ,(22,124,'Introduction',0,0,0)
 ,(23,125,'Introduction',0,0,0)
 ,(24,126,'Introduction',0,0,0)
 ,(25,124,'Content',0,0,0)
 ,(26,1,'Content',0,0,0);

DROP TABLE IF EXISTS AttributeKeyCategories;

CREATE TABLE IF NOT EXISTS `AttributeKeyCategories` (
  `akCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akCategoryHandle` varchar(255) NOT NULL,
  `akCategoryAllowSets` smallint(4) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`akCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO AttributeKeyCategories VALUES(1,'collection',1,NULL)
 ,(2,'user',1,NULL)
 ,(3,'file',1,NULL);

DROP TABLE IF EXISTS AttributeKeys;

CREATE TABLE IF NOT EXISTS `AttributeKeys` (
  `akID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akHandle` varchar(255) NOT NULL,
  `akName` varchar(255) NOT NULL,
  `akIsSearchable` tinyint(1) NOT NULL DEFAULT '0',
  `akIsSearchableIndexed` tinyint(1) NOT NULL DEFAULT '0',
  `akIsAutoCreated` tinyint(1) NOT NULL DEFAULT '0',
  `akIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `akIsColumnHeader` tinyint(1) NOT NULL DEFAULT '0',
  `akIsEditable` tinyint(1) NOT NULL DEFAULT '0',
  `atID` int(10) unsigned DEFAULT NULL,
  `akCategoryID` int(10) unsigned DEFAULT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`akID`),
  UNIQUE KEY `akHandle` (`akHandle`,`akCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO AttributeKeys VALUES(1,'meta_title','Meta Title',1,1,0,0,0,1,1,1,0)
 ,(2,'meta_description','Meta Description',1,1,0,0,0,1,2,1,0)
 ,(3,'meta_keywords','Meta Keywords',1,1,0,0,0,1,2,1,0)
 ,(4,'icon_dashboard','Dashboard Icon',1,1,0,1,0,1,2,1,0)
 ,(5,'exclude_nav','Exclude From Nav',1,1,0,0,0,1,3,1,0)
 ,(6,'exclude_page_list','Exclude From Page List',1,1,0,0,0,1,3,1,0)
 ,(7,'header_extra_content','Header Extra Content',1,1,0,0,0,1,2,1,0)
 ,(8,'exclude_search_index','Exclude From Search Index',1,1,0,0,0,1,3,1,0)
 ,(9,'exclude_sitemapxml','Exclude From sitemap.xml',1,1,0,0,0,1,3,1,0)
 ,(10,'profile_private_messages_enabled','I would like to receive private messages.',1,1,0,0,0,1,3,2,0)
 ,(11,'profile_private_messages_notification_enabled','Send me email notifications when I receive a private message.',1,1,0,0,0,1,3,2,0)
 ,(12,'width','Width',1,1,0,0,0,1,6,3,0)
 ,(13,'height','Height',1,1,0,0,0,1,6,3,0)
 ,(14,'duration','Duration',1,1,0,0,0,1,6,3,0);

DROP TABLE IF EXISTS AttributeSetKeys;

CREATE TABLE IF NOT EXISTS `AttributeSetKeys` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `asID` int(10) unsigned NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`,`asID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO AttributeSetKeys VALUES(1,1,1)
 ,(2,1,2)
 ,(3,1,3)
 ,(5,2,1)
 ,(6,2,2)
 ,(7,1,4)
 ,(8,2,3)
 ,(9,2,4);

DROP TABLE IF EXISTS AttributeSets;

CREATE TABLE IF NOT EXISTS `AttributeSets` (
  `asID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asName` varchar(255) DEFAULT NULL,
  `asHandle` varchar(255) NOT NULL,
  `akCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `asIsLocked` int(1) NOT NULL DEFAULT '1',
  `asDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`asID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO AttributeSets VALUES(1,'Page Header','page_header',1,0,0,0)
 ,(2,'Navigation and Indexing','navigation',1,0,0,1);

DROP TABLE IF EXISTS AttributeTypeCategories;

CREATE TABLE IF NOT EXISTS `AttributeTypeCategories` (
  `atID` int(10) unsigned NOT NULL DEFAULT '0',
  `akCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`atID`,`akCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO AttributeTypeCategories VALUES(1,1)
 ,(1,2)
 ,(1,3)
 ,(2,1)
 ,(2,2)
 ,(2,3)
 ,(3,1)
 ,(3,2)
 ,(3,3)
 ,(4,1)
 ,(4,2)
 ,(4,3)
 ,(5,1)
 ,(6,1)
 ,(6,2)
 ,(6,3)
 ,(7,1)
 ,(7,3)
 ,(8,1)
 ,(8,2)
 ,(8,3)
 ,(9,2);

DROP TABLE IF EXISTS AttributeTypes;

CREATE TABLE IF NOT EXISTS `AttributeTypes` (
  `atID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `atHandle` varchar(255) NOT NULL,
  `atName` varchar(255) NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`atID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO AttributeTypes VALUES(1,'text','Text',0)
 ,(2,'textarea','Text Area',0)
 ,(3,'boolean','Checkbox',0)
 ,(4,'date_time','Date/Time',0)
 ,(5,'image_file','Image/File',0)
 ,(6,'number','Number',0)
 ,(7,'rating','Rating',0)
 ,(8,'select','Select',0)
 ,(9,'address','Address',0);

DROP TABLE IF EXISTS AttributeValues;

CREATE TABLE IF NOT EXISTS `AttributeValues` (
  `avID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned DEFAULT NULL,
  `avDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uID` int(10) unsigned DEFAULT NULL,
  `atID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

INSERT INTO AttributeValues VALUES(1,3,'2013-11-22 09:17:57',1,2)
 ,(2,4,'2013-11-22 09:17:57',1,2)
 ,(3,3,'2013-11-22 09:17:57',1,2)
 ,(4,4,'2013-11-22 09:17:57',1,2)
 ,(5,3,'2013-11-22 09:17:57',1,2)
 ,(6,4,'2013-11-22 09:17:57',1,2)
 ,(7,3,'2013-11-22 09:17:57',1,2)
 ,(8,3,'2013-11-22 09:17:58',1,2)
 ,(9,4,'2013-11-22 09:17:58',1,2)
 ,(10,3,'2013-11-22 09:17:58',1,2)
 ,(11,4,'2013-11-22 09:17:58',1,2)
 ,(12,3,'2013-11-22 09:17:58',1,2)
 ,(13,4,'2013-11-22 09:17:58',1,2)
 ,(14,3,'2013-11-22 09:17:58',1,2)
 ,(15,4,'2013-11-22 09:17:58',1,2)
 ,(16,3,'2013-11-22 09:17:58',1,2)
 ,(17,4,'2013-11-22 09:17:59',1,2)
 ,(18,3,'2013-11-22 09:17:59',1,2)
 ,(19,4,'2013-11-22 09:17:59',1,2)
 ,(20,5,'2013-11-22 09:17:59',1,3)
 ,(21,3,'2013-11-22 09:17:59',1,2)
 ,(22,4,'2013-11-22 09:17:59',1,2)
 ,(23,3,'2013-11-22 09:17:59',1,2)
 ,(24,3,'2013-11-22 09:17:59',1,2)
 ,(25,4,'2013-11-22 09:17:59',1,2)
 ,(26,3,'2013-11-22 09:17:59',1,2)
 ,(27,4,'2013-11-22 09:17:59',1,2)
 ,(28,3,'2013-11-22 09:18:00',1,2)
 ,(29,4,'2013-11-22 09:18:00',1,2)
 ,(30,3,'2013-11-22 09:18:00',1,2)
 ,(31,5,'2013-11-22 09:18:00',1,3)
 ,(32,4,'2013-11-22 09:18:00',1,2)
 ,(33,3,'2013-11-22 09:18:00',1,2)
 ,(34,5,'2013-11-22 09:18:00',1,3)
 ,(35,4,'2013-11-22 09:18:01',1,2)
 ,(36,3,'2013-11-22 09:18:01',1,2)
 ,(37,4,'2013-11-22 09:18:01',1,2)
 ,(38,3,'2013-11-22 09:18:01',1,2)
 ,(39,3,'2013-11-22 09:18:01',1,2)
 ,(40,4,'2013-11-22 09:18:01',1,2)
 ,(41,3,'2013-11-22 09:18:01',1,2)
 ,(42,4,'2013-11-22 09:18:01',1,2)
 ,(43,3,'2013-11-22 09:18:01',1,2)
 ,(44,4,'2013-11-22 09:18:02',1,2)
 ,(45,3,'2013-11-22 09:18:02',1,2)
 ,(46,4,'2013-11-22 09:18:02',1,2)
 ,(47,3,'2013-11-22 09:18:02',1,2)
 ,(48,4,'2013-11-22 09:18:02',1,2)
 ,(49,3,'2013-11-22 09:18:02',1,2)
 ,(50,3,'2013-11-22 09:18:02',1,2)
 ,(51,3,'2013-11-22 09:18:02',1,2)
 ,(52,3,'2013-11-22 09:18:02',1,2)
 ,(53,4,'2013-11-22 09:18:02',1,2)
 ,(54,3,'2013-11-22 09:18:02',1,2)
 ,(55,4,'2013-11-22 09:18:03',1,2)
 ,(56,3,'2013-11-22 09:18:03',1,2)
 ,(57,4,'2013-11-22 09:18:03',1,2)
 ,(58,3,'2013-11-22 09:18:03',1,2)
 ,(59,4,'2013-11-22 09:18:03',1,2)
 ,(60,4,'2013-11-22 09:18:03',1,2)
 ,(61,3,'2013-11-22 09:18:03',1,2)
 ,(62,4,'2013-11-22 09:18:03',1,2)
 ,(63,4,'2013-11-22 09:18:03',1,2)
 ,(64,5,'2013-11-22 09:18:04',1,3)
 ,(65,8,'2013-11-22 09:18:04',1,3)
 ,(66,3,'2013-11-22 09:18:04',1,2)
 ,(67,4,'2013-11-22 09:18:04',1,2)
 ,(68,5,'2013-11-22 09:18:04',1,3)
 ,(69,5,'2013-11-22 09:18:04',1,3)
 ,(70,3,'2013-11-22 09:18:04',1,2)
 ,(71,3,'2013-11-22 09:18:04',1,2)
 ,(72,3,'2013-11-22 09:18:04',1,2)
 ,(73,3,'2013-11-22 09:18:04',1,2)
 ,(74,3,'2013-11-22 09:18:04',1,2)
 ,(75,5,'2013-11-22 09:18:04',1,3)
 ,(76,3,'2013-11-22 09:18:05',1,2)
 ,(77,3,'2013-11-22 09:18:05',1,2)
 ,(78,3,'2013-11-22 09:18:05',1,2)
 ,(79,3,'2013-11-22 09:18:05',1,2)
 ,(80,3,'2013-11-22 09:18:05',1,2)
 ,(81,3,'2013-11-22 09:18:05',1,2)
 ,(82,3,'2013-11-22 09:18:05',1,2)
 ,(83,3,'2013-11-22 09:18:05',1,2)
 ,(84,3,'2013-11-22 09:18:05',1,2)
 ,(85,3,'2013-11-22 09:18:05',1,2)
 ,(86,3,'2013-11-22 09:18:06',1,2)
 ,(87,3,'2013-11-22 09:18:06',1,2)
 ,(88,3,'2013-11-22 09:18:06',1,2)
 ,(89,3,'2013-11-22 09:18:06',1,2)
 ,(90,3,'2013-11-22 09:18:06',1,2)
 ,(91,3,'2013-11-22 09:18:06',1,2)
 ,(92,3,'2013-11-22 09:18:06',1,2)
 ,(93,3,'2013-11-22 09:18:06',1,2)
 ,(94,3,'2013-11-22 09:18:06',1,2)
 ,(95,3,'2013-11-22 09:18:06',1,2)
 ,(96,3,'2013-11-22 09:18:06',1,2)
 ,(97,3,'2013-11-22 09:18:07',1,2)
 ,(98,3,'2013-11-22 09:18:07',1,2)
 ,(99,3,'2013-11-22 09:18:07',1,2)
 ,(100,3,'2013-11-22 09:18:07',1,2)
 ,(101,3,'2013-11-22 09:18:07',1,2)
 ,(102,3,'2013-11-22 09:18:07',1,2)
 ,(103,3,'2013-11-22 09:18:07',1,2)
 ,(104,3,'2013-11-22 09:18:07',1,2)
 ,(105,3,'2013-11-22 09:18:07',1,2)
 ,(106,3,'2013-11-22 09:18:07',1,2)
 ,(107,3,'2013-11-22 09:18:07',1,2)
 ,(108,8,'2013-11-22 09:18:08',1,3)
 ,(109,3,'2013-11-22 09:18:08',1,2)
 ,(110,3,'2013-11-22 09:18:08',1,2)
 ,(111,3,'2013-11-22 09:18:08',1,2)
 ,(112,3,'2013-11-22 09:18:08',1,2)
 ,(113,3,'2013-11-22 09:18:08',1,2)
 ,(114,3,'2013-11-22 09:18:08',1,2)
 ,(115,3,'2013-11-22 09:18:08',1,2)
 ,(116,3,'2013-11-22 09:18:08',1,2)
 ,(117,5,'2013-11-22 09:18:09',1,3)
 ,(118,5,'2013-11-22 09:18:10',1,3)
 ,(119,8,'2013-11-22 09:18:10',1,3)
 ,(120,12,'2013-11-22 10:37:10',1,6)
 ,(121,13,'2013-11-22 10:37:10',1,6)
 ,(122,12,'2013-11-22 10:37:11',1,6)
 ,(123,13,'2013-11-22 10:37:11',1,6)
 ,(124,12,'2013-11-22 10:37:11',1,6)
 ,(125,13,'2013-11-22 10:37:12',1,6);

DROP TABLE IF EXISTS BasicWorkflowPermissionAssignments;

CREATE TABLE IF NOT EXISTS `BasicWorkflowPermissionAssignments` (
  `wfID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wfID`,`pkID`,`paID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS BasicWorkflowProgressData;

CREATE TABLE IF NOT EXISTS `BasicWorkflowProgressData` (
  `wpID` int(10) unsigned NOT NULL DEFAULT '0',
  `uIDStarted` int(10) unsigned NOT NULL DEFAULT '0',
  `uIDCompleted` int(10) unsigned NOT NULL DEFAULT '0',
  `wpDateCompleted` datetime DEFAULT NULL,
  PRIMARY KEY (`wpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS BlockPermissionAssignments;

CREATE TABLE IF NOT EXISTS `BlockPermissionAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`pkID`,`paID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS BlockRelations;

CREATE TABLE IF NOT EXISTS `BlockRelations` (
  `brID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `originalBID` int(10) unsigned NOT NULL DEFAULT '0',
  `relationType` varchar(50) NOT NULL,
  PRIMARY KEY (`brID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS BlockTypePermissionBlockTypeAccessList;

CREATE TABLE IF NOT EXISTS `BlockTypePermissionBlockTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS BlockTypePermissionBlockTypeAccessListCustom;

CREATE TABLE IF NOT EXISTS `BlockTypePermissionBlockTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`btID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS BlockTypes;

CREATE TABLE IF NOT EXISTS `BlockTypes` (
  `btID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `btHandle` varchar(32) NOT NULL,
  `btName` varchar(128) NOT NULL,
  `btDescription` text,
  `btActiveWhenAdded` tinyint(1) NOT NULL DEFAULT '1',
  `btCopyWhenPropagate` tinyint(1) NOT NULL DEFAULT '0',
  `btIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  `btIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `btDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `btInterfaceWidth` int(10) unsigned NOT NULL DEFAULT '400',
  `btInterfaceHeight` int(10) unsigned NOT NULL DEFAULT '400',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`btID`),
  UNIQUE KEY `btHandle` (`btHandle`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

INSERT INTO BlockTypes VALUES(1,'core_scrapbook_display','Scrapbook Display (Core)','Proxy block for blocks pasted through the scrapbook.',1,0,0,1,0,400,400,0)
 ,(2,'core_stack_display','Stack Display (Core)','Proxy block for stacks added through the UI.',1,0,0,1,0,400,400,0)
 ,(3,'dashboard_featured_addon','Dashboard Featured Add-On','Features an add-on from concrete5.org.',1,0,0,1,0,300,100,0)
 ,(4,'dashboard_featured_theme','Dashboard Featured Theme','Features a theme from concrete5.org.',1,0,0,1,0,300,100,0)
 ,(5,'dashboard_newsflow_latest','Dashboard Newsflow Latest','Grabs the latest newsflow data from concrete5.org.',1,0,0,1,0,400,400,0)
 ,(6,'dashboard_app_status','Dashboard App Status','Displays update and welcome back information on your dashboard.',1,0,0,1,0,400,400,0)
 ,(7,'dashboard_site_activity','Dashboard Site Activity','Displays a summary of website activity.',1,0,0,1,0,400,400,0)
 ,(8,'autonav','Auto-Nav','Creates navigation trees and sitemaps.',1,0,0,0,1,500,350,0)
 ,(9,'content','Content','HTML/WYSIWYG Editor Content.',1,0,0,0,2,600,465,0)
 ,(10,'date_nav','Date Navigation','A collapsible date based navigation tree',1,0,0,0,3,500,350,0)
 ,(11,'external_form','External Form','Include external forms in the filesystem and place them on pages.',1,0,0,0,4,370,100,0)
 ,(12,'file','File','Link to files stored in the asset library.',1,0,0,0,5,300,250,0)
 ,(13,'flash_content','Flash Content','Embeds SWF files, including flash detection.',1,0,0,0,6,380,200,0)
 ,(14,'form','Form','Build simple forms and surveys.',1,0,0,0,7,420,430,0)
 ,(15,'google_map','Google Map','Enter an address and a Google Map of that location will be placed in your page.',1,0,0,0,8,400,200,0)
 ,(16,'guestbook','Guestbook / Comments','Adds blog-style comments (a guestbook) to your page.',1,0,1,0,9,370,480,0)
 ,(17,'html','HTML','For adding HTML by hand.',1,0,0,0,10,600,465,0)
 ,(18,'image','Image','Adds images and onstates from the library to pages.',1,0,0,0,11,400,550,0)
 ,(19,'next_previous','Next & Previous Nav','Navigate through sibling pages.',1,0,0,0,12,430,400,0)
 ,(20,'page_list','Page List','List pages based on type, area.',1,0,0,0,13,500,350,0)
 ,(21,'rss_displayer','RSS Displayer','Fetch, parse and display the contents of an RSS or Atom feed.',1,0,0,0,14,400,330,0)
 ,(22,'search','Search','Add a search box to your site.',1,0,0,0,15,400,240,0)
 ,(23,'slideshow','Slideshow','Display a running loop of images.',1,0,0,0,16,550,400,0)
 ,(24,'survey','Survey','Provide a simple survey, along with results in a pie chart format.',1,0,0,0,17,420,300,0)
 ,(25,'tags','Tags','List pages based on type, area.',1,0,0,0,18,450,260,0)
 ,(26,'video','Video Player','Embeds uploaded video into a web page. Supports AVI, WMV, Quicktime/MPEG4 and FLV formats.',1,0,0,0,19,320,220,0)
 ,(27,'youtube','YouTube Video','Embeds a YouTube Video in your web page.',1,0,0,0,20,400,210,0);

DROP TABLE IF EXISTS Blocks;

CREATE TABLE IF NOT EXISTS `Blocks` (
  `bID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bName` varchar(60) DEFAULT NULL,
  `bDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bDateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bFilename` varchar(255) DEFAULT NULL,
  `bIsActive` varchar(1) NOT NULL DEFAULT '1',
  `btID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned DEFAULT NULL,
  `btCachedBlockRecord` longtext,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO Blocks VALUES(1,'','2013-11-22 09:18:08','2013-11-22 09:18:08',NULL,'1',9,1,NULL)
 ,(2,'','2013-11-22 09:18:09','2013-11-22 09:18:09',NULL,'1',9,1,NULL)
 ,(3,'','2013-11-22 09:18:09','2013-11-22 09:18:09',NULL,'1',9,1,NULL)
 ,(4,'','2013-11-22 09:18:09','2013-11-22 09:18:09',NULL,'1',9,1,NULL)
 ,(5,'','2013-11-22 09:18:09','2013-11-22 09:18:09',NULL,'1',9,1,NULL)
 ,(6,'','2013-11-22 09:18:09','2013-11-22 09:18:09',NULL,'1',6,1,NULL)
 ,(7,'','2013-11-22 09:18:09','2013-11-22 09:18:09',NULL,'1',7,1,NULL)
 ,(8,'','2013-11-22 09:18:09','2013-11-22 09:18:10',NULL,'1',5,1,NULL)
 ,(9,'','2013-11-22 09:18:10','2013-11-22 09:18:10',NULL,'1',5,1,NULL)
 ,(10,'','2013-11-22 09:18:10','2013-11-22 09:18:10',NULL,'1',4,1,NULL)
 ,(11,'','2013-11-22 09:18:10','2013-11-22 09:18:10',NULL,'1',3,1,NULL)
 ,(12,'','2013-11-22 09:18:10','2013-11-22 09:18:10',NULL,'1',5,1,NULL)
 ,(13,NULL,'2013-11-22 09:22:06','2013-11-22 09:22:06',NULL,'1',9,1,NULL);

DROP TABLE IF EXISTS CollectionAttributeValues;

CREATE TABLE IF NOT EXISTS `CollectionAttributeValues` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`akID`,`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO CollectionAttributeValues VALUES(3,1,3,1)
 ,(3,1,4,2)
 ,(4,1,3,3)
 ,(4,1,4,4)
 ,(5,1,3,5)
 ,(5,1,4,6)
 ,(6,1,3,7)
 ,(7,1,3,8)
 ,(7,1,4,9)
 ,(8,1,3,10)
 ,(8,1,4,11)
 ,(9,1,3,12)
 ,(9,1,4,13)
 ,(11,1,3,14)
 ,(11,1,4,15)
 ,(12,1,3,16)
 ,(12,1,4,17)
 ,(13,1,3,18)
 ,(13,1,4,19)
 ,(14,1,3,21)
 ,(14,1,4,22)
 ,(14,1,5,20)
 ,(15,1,3,23)
 ,(16,1,3,24)
 ,(16,1,4,25)
 ,(17,1,3,26)
 ,(17,1,4,27)
 ,(18,1,3,28)
 ,(18,1,4,29)
 ,(19,1,3,30)
 ,(19,1,4,32)
 ,(19,1,5,31)
 ,(20,1,3,33)
 ,(20,1,4,35)
 ,(20,1,5,34)
 ,(21,1,3,36)
 ,(21,1,4,37)
 ,(22,1,3,38)
 ,(23,1,3,39)
 ,(23,1,4,40)
 ,(24,1,3,41)
 ,(24,1,4,42)
 ,(25,1,3,43)
 ,(25,1,4,44)
 ,(26,1,3,45)
 ,(26,1,4,46)
 ,(28,1,3,47)
 ,(28,1,4,48)
 ,(29,1,3,49)
 ,(30,1,3,50)
 ,(31,1,3,51)
 ,(32,1,3,52)
 ,(32,1,4,53)
 ,(34,1,3,54)
 ,(34,1,4,55)
 ,(35,1,3,56)
 ,(35,1,4,57)
 ,(36,1,3,58)
 ,(37,1,4,59)
 ,(38,1,4,60)
 ,(40,1,3,61)
 ,(40,1,4,62)
 ,(41,1,4,63)
 ,(42,1,5,64)
 ,(42,1,8,65)
 ,(43,1,3,66)
 ,(43,1,4,67)
 ,(44,1,5,68)
 ,(45,1,5,69)
 ,(46,1,3,70)
 ,(47,1,3,71)
 ,(48,1,3,72)
 ,(49,1,3,73)
 ,(50,1,3,74)
 ,(51,1,5,75)
 ,(53,1,3,76)
 ,(54,1,3,77)
 ,(55,1,3,78)
 ,(56,1,3,79)
 ,(57,1,3,80)
 ,(58,1,3,81)
 ,(60,1,3,82)
 ,(61,1,3,83)
 ,(62,1,3,84)
 ,(63,1,3,85)
 ,(64,1,3,86)
 ,(65,1,3,87)
 ,(67,1,3,88)
 ,(68,1,3,89)
 ,(69,1,3,90)
 ,(71,1,3,91)
 ,(72,1,3,92)
 ,(73,1,3,93)
 ,(74,1,3,94)
 ,(77,1,3,95)
 ,(78,1,3,96)
 ,(79,1,3,97)
 ,(80,1,3,98)
 ,(82,1,3,99)
 ,(83,1,3,100)
 ,(84,1,3,101)
 ,(85,1,3,102)
 ,(86,1,3,103)
 ,(87,1,3,104)
 ,(88,1,3,105)
 ,(89,1,3,106)
 ,(90,1,3,107)
 ,(91,1,8,108)
 ,(92,1,3,109)
 ,(93,1,3,110)
 ,(94,1,3,111)
 ,(95,1,3,112)
 ,(96,1,3,113)
 ,(97,1,3,114)
 ,(99,1,3,115)
 ,(100,1,3,116)
 ,(105,1,5,117)
 ,(106,1,5,118)
 ,(106,1,8,119);

DROP TABLE IF EXISTS CollectionSearchIndexAttributes;

CREATE TABLE IF NOT EXISTS `CollectionSearchIndexAttributes` (
  `cID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_meta_title` text,
  `ak_meta_description` text,
  `ak_meta_keywords` text,
  `ak_icon_dashboard` text,
  `ak_exclude_nav` tinyint(4) DEFAULT '0',
  `ak_exclude_page_list` tinyint(4) DEFAULT '0',
  `ak_header_extra_content` text,
  `ak_exclude_search_index` tinyint(4) DEFAULT '0',
  `ak_exclude_sitemapxml` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO CollectionSearchIndexAttributes VALUES(1,NULL,NULL,NULL,NULL,0,0,NULL,0,0)
 ,(3,NULL,NULL,'blog, blogging','icon-book',0,0,NULL,0,0)
 ,(4,NULL,NULL,'new blog, write blog, blogging','icon-pencil',0,0,NULL,0,0)
 ,(5,NULL,NULL,'blog drafts, composer','icon-book',0,0,NULL,0,0)
 ,(6,NULL,NULL,'pages, add page, delete page, copy, move, alias',NULL,0,0,NULL,0,0)
 ,(7,NULL,NULL,'pages, add page, delete page, copy, move, alias','icon-home',0,0,NULL,0,0)
 ,(8,NULL,NULL,'pages, add page, delete page, copy, move, alias, bulk','icon-road',0,0,NULL,0,0)
 ,(9,NULL,NULL,'find page, search page, search, find, pages, sitemap','icon-search',0,0,NULL,0,0)
 ,(11,NULL,NULL,'add file, delete file, copy, move, alias, resize, crop, rename, images, title, attribute','icon-picture',0,0,NULL,0,0)
 ,(12,NULL,NULL,'file, file attributes, title, attribute, description, rename','icon-cog',0,0,NULL,0,0)
 ,(13,NULL,NULL,'files, category, categories','icon-list-alt',0,0,NULL,0,0)
 ,(14,NULL,NULL,'new file set','icon-plus-sign',1,0,NULL,0,0)
 ,(15,NULL,NULL,'users, groups, people, find, delete user, remove user, change password, password',NULL,0,0,NULL,0,0)
 ,(16,NULL,NULL,'find, search, people, delete user, remove user, change password, password','icon-user',0,0,NULL,0,0)
 ,(17,NULL,NULL,'user, group, people, permissions, access, expire','icon-globe',0,0,NULL,0,0)
 ,(18,NULL,NULL,'user attributes, user data, gather data, registration data','icon-cog',0,0,NULL,0,0)
 ,(19,NULL,NULL,'new user, create','icon-plus-sign',1,0,NULL,0,0)
 ,(20,NULL,NULL,'new user group, new group, group, create','icon-plus',1,0,NULL,0,0)
 ,(21,NULL,NULL,'group set','icon-list',0,0,NULL,0,0)
 ,(22,NULL,NULL,'forms, log, error, email, mysql, exception, survey',NULL,0,0,NULL,0,0)
 ,(23,NULL,NULL,'hits, pageviews, visitors, activity','icon-signal',0,0,NULL,0,0)
 ,(24,NULL,NULL,'forms, questions, response, data','icon-briefcase',0,0,NULL,0,0)
 ,(25,NULL,NULL,'questions, quiz, response','icon-tasks',0,0,NULL,0,0)
 ,(26,NULL,NULL,'forms, log, error, email, mysql, exception, survey, history','icon-time',0,0,NULL,0,0)
 ,(28,NULL,NULL,'new theme, theme, active theme, change theme, template, css','icon-font',0,0,NULL,0,0)
 ,(29,NULL,NULL,'theme',NULL,0,0,NULL,0,0)
 ,(30,NULL,NULL,'page types',NULL,0,0,NULL,0,0)
 ,(31,NULL,NULL,'custom theme, change theme, custom css, css',NULL,0,0,NULL,0,0)
 ,(32,NULL,NULL,'page type defaults, global block, global area, starter, template','icon-file',0,0,NULL,0,0)
 ,(34,NULL,NULL,'page attributes, custom','icon-cog',0,0,NULL,0,0)
 ,(35,NULL,NULL,'single, page, custom, application','icon-wrench',0,0,NULL,0,0)
 ,(36,NULL,NULL,'add workflow, remove workflow',NULL,0,0,NULL,0,0)
 ,(37,NULL,NULL,NULL,'icon-list',0,0,NULL,0,0)
 ,(38,NULL,NULL,NULL,'icon-user',0,0,NULL,0,0)
 ,(40,NULL,NULL,'stacks, reusable content, scrapbook, copy, paste, paste block, copy block, site name, logo','icon-th',0,0,NULL,0,0)
 ,(41,NULL,NULL,NULL,'icon-lock',0,0,NULL,0,0)
 ,(42,NULL,NULL,NULL,NULL,1,0,NULL,1,0)
 ,(43,NULL,NULL,'block, refresh, custom','icon-wrench',0,0,NULL,0,0)
 ,(44,NULL,NULL,NULL,NULL,1,0,NULL,0,0)
 ,(45,NULL,NULL,NULL,NULL,1,0,NULL,0,0)
 ,(46,NULL,NULL,'add-on, addon, ecommerce, install, discussions, forums, themes, templates, blocks',NULL,0,0,NULL,0,0)
 ,(47,NULL,NULL,'update, upgrade',NULL,0,0,NULL,0,0)
 ,(48,NULL,NULL,'concrete5.org, my account, marketplace',NULL,0,0,NULL,0,0)
 ,(49,NULL,NULL,'buy theme, new theme, marketplace, template',NULL,0,0,NULL,0,0)
 ,(50,NULL,NULL,'buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace',NULL,0,0,NULL,0,0)
 ,(51,NULL,NULL,NULL,NULL,1,0,NULL,0,0)
 ,(53,NULL,NULL,'website name, title',NULL,0,0,NULL,0,0)
 ,(54,NULL,NULL,'logo, favicon, iphone, icon, bookmark',NULL,0,0,NULL,0,0)
 ,(55,NULL,NULL,'tinymce, content block, fonts, editor, content, overlay',NULL,0,0,NULL,0,0)
 ,(56,NULL,NULL,'translate, translation, internationalization, multilingual',NULL,0,0,NULL,0,0)
 ,(57,NULL,NULL,'timezone, profile, locale',NULL,0,0,NULL,0,0)
 ,(58,NULL,NULL,'interface, quick nav, dashboard background, background image',NULL,0,0,NULL,0,0)
 ,(60,NULL,NULL,'vanity, pretty url, seo, pageview, view',NULL,0,0,NULL,0,0)
 ,(61,NULL,NULL,'bulk, seo, change keywords, engine, optimization, search',NULL,0,0,NULL,0,0)
 ,(62,NULL,NULL,'traffic, statistics, google analytics, quant, pageviews, hits',NULL,0,0,NULL,0,0)
 ,(63,NULL,NULL,'pretty, slug',NULL,0,0,NULL,0,0)
 ,(64,NULL,NULL,'turn off statistics, tracking, statistics, pageviews, hits',NULL,0,0,NULL,0,0)
 ,(65,NULL,NULL,'configure search, site search, search option',NULL,0,0,NULL,0,0)
 ,(67,NULL,NULL,'cache option, change cache, override, turn on cache, turn off cache, no cache, page cache, caching',NULL,0,0,NULL,0,0)
 ,(68,NULL,NULL,'cache option, turn off cache, no cache, page cache, caching',NULL,0,0,NULL,0,0)
 ,(69,NULL,NULL,'index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old',NULL,0,0,NULL,0,0)
 ,(71,NULL,NULL,'editors, hide site, offline, private, public, access',NULL,0,0,NULL,0,0)
 ,(72,NULL,NULL,'file options, file manager, upload, modify',NULL,0,0,NULL,0,0)
 ,(73,NULL,NULL,'security, files, media, extension, manager, upload',NULL,0,0,NULL,0,0)
 ,(74,NULL,NULL,'security, actions, administrator, admin, package, marketplace, search',NULL,0,0,NULL,0,0)
 ,(77,NULL,NULL,'security, lock ip, lock out, block ip, address, restrict, access',NULL,0,0,NULL,0,0)
 ,(78,NULL,NULL,'security, registration',NULL,0,0,NULL,0,0)
 ,(79,NULL,NULL,'antispam, block spam, security',NULL,0,0,NULL,0,0)
 ,(80,NULL,NULL,'lock site, under construction, hide, hidden',NULL,0,0,NULL,0,0)
 ,(82,NULL,NULL,'profile, login, redirect, specific, dashboard, administrators',NULL,0,0,NULL,0,0)
 ,(83,NULL,NULL,'member profile, member page, community, forums, social, avatar',NULL,0,0,NULL,0,0)
 ,(84,NULL,NULL,'signup, new user, community',NULL,0,0,NULL,0,0)
 ,(85,NULL,NULL,'smtp, mail settings',NULL,0,0,NULL,0,0)
 ,(86,NULL,NULL,'email server, mail settings, mail configuration, external, internal',NULL,0,0,NULL,0,0)
 ,(87,NULL,NULL,'email server, mail settings, mail configuration, private message, message system, import, email, message',NULL,0,0,NULL,0,0)
 ,(88,NULL,NULL,'attribute configuration',NULL,0,0,NULL,0,0)
 ,(89,NULL,NULL,'attributes, sets',NULL,0,0,NULL,0,0)
 ,(90,NULL,NULL,'attributes, types',NULL,0,0,NULL,0,0)
 ,(91,NULL,NULL,NULL,NULL,0,0,NULL,1,0)
 ,(92,NULL,NULL,'overrides, system info, debug, support, help',NULL,0,0,NULL,0,0)
 ,(93,NULL,NULL,'errors, exceptions, develop, support, help',NULL,0,0,NULL,0,0)
 ,(94,NULL,NULL,'email, logging, logs, smtp, pop, errors, mysql, log',NULL,0,0,NULL,0,0)
 ,(95,NULL,NULL,'security, alternate storage, hide files',NULL,0,0,NULL,0,0)
 ,(96,NULL,NULL,'network, proxy server',NULL,0,0,NULL,0,0)
 ,(97,NULL,NULL,'export, backup, database, sql, mysql, encryption, restore',NULL,0,0,NULL,0,0)
 ,(99,NULL,NULL,'upgrade, new version, update',NULL,0,0,NULL,0,0)
 ,(100,NULL,NULL,'export, database, xml, starting, points, schema, refresh, custom, tables',NULL,0,0,NULL,0,0)
 ,(105,NULL,NULL,NULL,NULL,1,0,NULL,0,0)
 ,(106,NULL,NULL,NULL,NULL,1,0,NULL,1,0)
 ,(123,NULL,NULL,NULL,NULL,0,0,NULL,0,0)
 ,(124,NULL,NULL,NULL,NULL,0,0,NULL,0,0)
 ,(125,NULL,NULL,NULL,NULL,0,0,NULL,0,0)
 ,(126,NULL,NULL,NULL,NULL,0,0,NULL,0,0);

DROP TABLE IF EXISTS CollectionVersionAreaLayouts;

CREATE TABLE IF NOT EXISTS `CollectionVersionAreaLayouts` (
  `cvalID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned DEFAULT '0',
  `cvID` int(10) unsigned DEFAULT '0',
  `arHandle` varchar(255) DEFAULT NULL,
  `layoutID` int(10) unsigned NOT NULL DEFAULT '0',
  `position` int(10) DEFAULT '1000',
  `areaNameNumber` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`cvalID`),
  KEY `areaLayoutsIndex` (`cID`,`cvID`,`arHandle`),
  KEY `cID` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS CollectionVersionAreaStyles;

CREATE TABLE IF NOT EXISTS `CollectionVersionAreaStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`arHandle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS CollectionVersionBlockStyles;

CREATE TABLE IF NOT EXISTS `CollectionVersionBlockStyles` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS CollectionVersionBlocks;

CREATE TABLE IF NOT EXISTS `CollectionVersionBlocks` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `cbDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `isOriginal` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cbOverrideAreaPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `cbIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  KEY `cbIncludeAll` (`cbIncludeAll`),
  KEY `isOriginal` (`isOriginal`),
  KEY `bID` (`bID`),
  KEY `cIDcvID` (`cID`,`cvID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO CollectionVersionBlocks VALUES(1,2,13,'Introduction',0,1,0,0)
 ,(1,3,13,'Introduction',0,0,0,0)
 ,(105,1,1,'Header',0,1,0,0)
 ,(105,1,2,'Column 1',0,1,0,0)
 ,(105,1,3,'Column 2',0,1,0,0)
 ,(105,1,4,'Column 3',0,1,0,0)
 ,(105,1,5,'Column 4',0,1,0,0)
 ,(106,1,6,'Primary',0,1,0,0)
 ,(106,1,7,'Primary',1,1,0,0)
 ,(106,1,8,'Secondary 1',0,1,0,0)
 ,(106,1,9,'Secondary 2',0,1,0,0)
 ,(106,1,10,'Secondary 3',0,1,0,0)
 ,(106,1,11,'Secondary 4',0,1,0,0)
 ,(106,1,12,'Secondary 5',0,1,0,0);

DROP TABLE IF EXISTS CollectionVersionBlocksOutputCache;

CREATE TABLE IF NOT EXISTS `CollectionVersionBlocksOutputCache` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `arHandle` varchar(255) NOT NULL,
  `btCachedBlockOutput` longtext,
  `btCachedBlockOutputExpires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS CollectionVersionRelatedEdits;

CREATE TABLE IF NOT EXISTS `CollectionVersionRelatedEdits` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '0',
  `cRelationID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvRelationID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`cvID`,`cRelationID`,`cvRelationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS CollectionVersions;

CREATE TABLE IF NOT EXISTS `CollectionVersions` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvID` int(10) unsigned NOT NULL DEFAULT '1',
  `cvName` text,
  `cvHandle` varchar(255) DEFAULT NULL,
  `cvDescription` text,
  `cvDatePublic` datetime DEFAULT NULL,
  `cvDateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cvComments` varchar(255) DEFAULT NULL,
  `cvIsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `cvIsNew` tinyint(1) NOT NULL DEFAULT '0',
  `cvAuthorUID` int(10) unsigned DEFAULT NULL,
  `cvApproverUID` int(10) unsigned DEFAULT NULL,
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `cvActivateDatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`cID`,`cvID`),
  KEY `cvIsApproved` (`cvIsApproved`),
  KEY `ctID` (`ctID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO CollectionVersions VALUES(1,1,'Home','home','','2013-11-22 09:17:21','2013-11-22 09:17:21','Initial Version',0,0,1,NULL,5,4,NULL)
 ,(1,2,'Home','home','','2013-11-22 09:17:21','2013-11-22 09:22:06','Version 2',0,0,1,1,5,4,NULL)
 ,(1,3,'Home','home','','2013-11-22 09:17:21','2013-11-22 15:54:02','Version 3',1,0,1,1,5,5,NULL)
 ,(2,1,'Dashboard','dashboard','','2013-11-22 09:17:27','2013-11-22 09:17:27','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(3,1,'Composer','composer','Write for your site.','2013-11-22 09:17:29','2013-11-22 09:17:29','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(4,1,'Write','write','','2013-11-22 09:17:29','2013-11-22 09:17:29','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(5,1,'Drafts','drafts','','2013-11-22 09:17:30','2013-11-22 09:17:30','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(6,1,'Sitemap','sitemap','Whole world at a glance.','2013-11-22 09:17:30','2013-11-22 09:17:30','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(7,1,'Full Sitemap','full','','2013-11-22 09:17:30','2013-11-22 09:17:30','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(8,1,'Flat View','explore','','2013-11-22 09:17:30','2013-11-22 09:17:30','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(9,1,'Page Search','search','','2013-11-22 09:17:31','2013-11-22 09:17:31','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(10,1,'Files','files','All documents and images.','2013-11-22 09:17:31','2013-11-22 09:17:31','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(11,1,'File Manager','search','','2013-11-22 09:17:31','2013-11-22 09:17:31','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(12,1,'Attributes','attributes','','2013-11-22 09:17:31','2013-11-22 09:17:31','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(13,1,'File Sets','sets','','2013-11-22 09:17:31','2013-11-22 09:17:31','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(14,1,'Add File Set','add_set','','2013-11-22 09:17:32','2013-11-22 09:17:32','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(15,1,'Members','users','Add and manage the user accounts and groups on your website.','2013-11-22 09:17:32','2013-11-22 09:17:32','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(16,1,'Search Users','search','','2013-11-22 09:17:32','2013-11-22 09:17:32','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(17,1,'User Groups','groups','','2013-11-22 09:17:32','2013-11-22 09:17:32','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(18,1,'Attributes','attributes','','2013-11-22 09:17:33','2013-11-22 09:17:33','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(19,1,'Add User','add','','2013-11-22 09:17:33','2013-11-22 09:17:33','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(20,1,'Add Group','add_group','','2013-11-22 09:17:33','2013-11-22 09:17:33','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(21,1,'Group Sets','group_sets','','2013-11-22 09:17:33','2013-11-22 09:17:33','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(22,1,'Reports','reports','Get data from forms and logs.','2013-11-22 09:17:34','2013-11-22 09:17:34','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(23,1,'Statistics','statistics','View your site activity.','2013-11-22 09:17:34','2013-11-22 09:17:34','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(24,1,'Form Results','forms','Get submission data.','2013-11-22 09:17:34','2013-11-22 09:17:34','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(25,1,'Surveys','surveys','','2013-11-22 09:17:35','2013-11-22 09:17:35','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(26,1,'Logs','logs','','2013-11-22 09:17:35','2013-11-22 09:17:35','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(27,1,'Pages & Themes','pages','Reskin your site.','2013-11-22 09:17:35','2013-11-22 09:17:35','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(28,1,'Themes','themes','Reskin your site.','2013-11-22 09:17:35','2013-11-22 09:17:35','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(29,1,'Add','add','','2013-11-22 09:17:35','2013-11-22 09:17:35','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(30,1,'Inspect','inspect','','2013-11-22 09:17:36','2013-11-22 09:17:36','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(31,1,'Customize','customize','','2013-11-22 09:17:36','2013-11-22 09:17:36','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(32,1,'Page Types','types','What goes in your site.','2013-11-22 09:17:36','2013-11-22 09:17:36','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(33,1,'Add Page Type','add','Add page types to your site.','2013-11-22 09:17:37','2013-11-22 09:17:37','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(34,1,'Attributes','attributes','','2013-11-22 09:17:37','2013-11-22 09:17:37','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(35,1,'Single Pages','single','','2013-11-22 09:17:37','2013-11-22 09:17:37','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(36,1,'Workflow','workflow','','2013-11-22 09:17:37','2013-11-22 09:17:37','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(37,1,'Workflow List','list','','2013-11-22 09:17:38','2013-11-22 09:17:38','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(38,1,'Waiting for Me','me','','2013-11-22 09:17:38','2013-11-22 09:17:38','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(39,1,'Stacks & Blocks','blocks','Manage sitewide content and administer block types.','2013-11-22 09:17:38','2013-11-22 09:17:38','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(40,1,'Stacks','stacks','Share content across your site.','2013-11-22 09:17:38','2013-11-22 09:17:38','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(41,1,'Block & Stack Permissions','permissions','Control who can add blocks and stacks on your site.','2013-11-22 09:17:39','2013-11-22 09:17:39','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(42,1,'Stack List','list','','2013-11-22 09:17:39','2013-11-22 09:17:39','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(43,1,'Block Types','types','Manage the installed block types in your site.','2013-11-22 09:17:40','2013-11-22 09:17:40','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(44,1,'Extend concrete5','extend','Connect to the concrete5 marketplace, install custom add-ons, and download updates for marketplace add-ons and themes.','2013-11-22 09:17:40','2013-11-22 09:17:40','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(45,1,'Dashboard','news','','2013-11-22 09:17:40','2013-11-22 09:17:40','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(46,1,'Add Functionality','install','Install add-ons & themes.','2013-11-22 09:17:41','2013-11-22 09:17:41','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(47,1,'Update Add-Ons','update','Update your installed packages.','2013-11-22 09:17:41','2013-11-22 09:17:41','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(48,1,'Connect to the Community','connect','Connect to the concrete5 community.','2013-11-22 09:17:41','2013-11-22 09:17:41','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(49,1,'Get More Themes','themes','Download themes from concrete5.org.','2013-11-22 09:17:41','2013-11-22 09:17:41','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(50,1,'Get More Add-Ons','add-ons','Download add-ons from concrete5.org.','2013-11-22 09:17:42','2013-11-22 09:17:42','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(51,1,'System & Settings','system','Secure and setup your site.','2013-11-22 09:17:42','2013-11-22 09:17:42','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(52,1,'Basics','basics','Basic information about your website.','2013-11-22 09:17:42','2013-11-22 09:17:42','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(53,1,'Site Name','site_name','','2013-11-22 09:17:42','2013-11-22 09:17:42','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(54,1,'Bookmark Icons','icons','Bookmark icon and mobile home screen icon setup.','2013-11-22 09:17:43','2013-11-22 09:17:43','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(55,1,'Rich Text Editor','editor','','2013-11-22 09:17:43','2013-11-22 09:17:43','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(56,1,'Languages','multilingual','','2013-11-22 09:17:43','2013-11-22 09:17:43','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(57,1,'Time Zone','timezone','','2013-11-22 09:17:43','2013-11-22 09:17:43','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(58,1,'Interface Preferences','interface','','2013-11-22 09:17:44','2013-11-22 09:17:44','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(59,1,'SEO & Statistics','seo','Enable pretty URLs, statistics and tracking codes.','2013-11-22 09:17:44','2013-11-22 09:17:44','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(60,1,'Pretty URLs','urls','','2013-11-22 09:17:44','2013-11-22 09:17:44','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(61,1,'Bulk SEO Updater','bulk_seo_tool','','2013-11-22 09:17:45','2013-11-22 09:17:45','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(62,1,'Tracking Codes','tracking_codes','','2013-11-22 09:17:45','2013-11-22 09:17:45','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(63,1,'Excluded URL Word List','excluded','','2013-11-22 09:17:45','2013-11-22 09:17:45','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(64,1,'Statistics','statistics','','2013-11-22 09:17:45','2013-11-22 09:17:45','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(65,1,'Search Index','search_index','','2013-11-22 09:17:46','2013-11-22 09:17:46','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(66,1,'Optimization','optimization','Keep your site running well.','2013-11-22 09:17:46','2013-11-22 09:17:46','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(67,1,'Cache & Speed Settings','cache','','2013-11-22 09:17:46','2013-11-22 09:17:46','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(68,1,'Clear Cache','clear_cache','','2013-11-22 09:17:47','2013-11-22 09:17:47','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(69,1,'Automated Jobs','jobs','','2013-11-22 09:17:47','2013-11-22 09:17:47','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(70,1,'Permissions & Access','permissions','Control who sees and edits your site.','2013-11-22 09:17:47','2013-11-22 09:17:47','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(71,1,'Site Access','site','','2013-11-22 09:17:48','2013-11-22 09:17:48','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(72,1,'File Manager Permissions','files','','2013-11-22 09:17:48','2013-11-22 09:17:48','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(73,1,'Allowed File Types','file_types','','2013-11-22 09:17:48','2013-11-22 09:17:48','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(74,1,'Task Permissions','tasks','','2013-11-22 09:17:48','2013-11-22 09:17:48','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(75,1,'User Permissions','users','','2013-11-22 09:17:48','2013-11-22 09:17:48','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(76,1,'Advanced Permissions','advanced','','2013-11-22 09:17:49','2013-11-22 09:17:49','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(77,1,'IP Blacklist','ip_blacklist','','2013-11-22 09:17:49','2013-11-22 09:17:49','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(78,1,'Captcha Setup','captcha','','2013-11-22 09:17:49','2013-11-22 09:17:49','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(79,1,'Spam Control','antispam','','2013-11-22 09:17:50','2013-11-22 09:17:50','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(80,1,'Maintenance Mode','maintenance_mode','','2013-11-22 09:17:50','2013-11-22 09:17:50','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(81,1,'Login & Registration','registration','Change login behaviors and setup public profiles.','2013-11-22 09:17:51','2013-11-22 09:17:51','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(82,1,'Login Destination','postlogin','','2013-11-22 09:17:51','2013-11-22 09:17:51','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(83,1,'Public Profiles','profiles','','2013-11-22 09:17:51','2013-11-22 09:17:51','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(84,1,'Public Registration','public_registration','','2013-11-22 09:17:51','2013-11-22 09:17:51','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(85,1,'Email','mail','Control how your site send and processes mail.','2013-11-22 09:17:52','2013-11-22 09:17:52','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(86,1,'SMTP Method','method','','2013-11-22 09:17:52','2013-11-22 09:17:52','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(87,1,'Email Importers','importers','','2013-11-22 09:17:52','2013-11-22 09:17:52','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(88,1,'Attributes','attributes','Setup attributes for pages, users, files and more.','2013-11-22 09:17:53','2013-11-22 09:17:53','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(89,1,'Sets','sets','Group attributes into sets for easier organization','2013-11-22 09:17:53','2013-11-22 09:17:53','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(90,1,'Types','types','Choose which attribute types are available for different items.','2013-11-22 09:17:53','2013-11-22 09:17:53','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(91,1,'Environment','environment','Advanced settings for web developers.','2013-11-22 09:17:53','2013-11-22 09:17:53','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(92,1,'Environment Information','info','','2013-11-22 09:17:54','2013-11-22 09:17:54','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(93,1,'Debug Settings','debug','','2013-11-22 09:17:54','2013-11-22 09:17:54','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(94,1,'Logging Settings','logging','','2013-11-22 09:17:54','2013-11-22 09:17:54','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(95,1,'File Storage Locations','file_storage_locations','','2013-11-22 09:17:54','2013-11-22 09:17:54','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(96,1,'Proxy Server','proxy','','2013-11-22 09:17:55','2013-11-22 09:17:55','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(97,1,'Backup & Restore','backup_restore','Backup or restore your website.','2013-11-22 09:17:55','2013-11-22 09:17:55','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(98,1,'Backup Database','backup','','2013-11-22 09:17:55','2013-11-22 09:17:55','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(99,1,'Update concrete5','update','','2013-11-22 09:17:56','2013-11-22 09:17:56','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(100,1,'Database XML','database','','2013-11-22 09:17:56','2013-11-22 09:17:56','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(101,1,'Composer','composer','','2013-11-22 09:17:56','2013-11-22 09:17:56','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(102,1,'',NULL,NULL,'2013-11-22 09:17:56','2013-11-22 09:17:56','Initial Version',1,0,NULL,NULL,0,1,NULL)
 ,(103,1,'',NULL,NULL,'2013-11-22 09:17:56','2013-11-22 09:17:56','Initial Version',1,0,NULL,NULL,0,2,NULL)
 ,(104,1,'',NULL,NULL,'2013-11-22 09:17:56','2013-11-22 09:17:56','Initial Version',1,0,NULL,NULL,0,3,NULL)
 ,(105,1,'Welcome to concrete5','welcome','Learn about how to use concrete5, how to develop for concrete5, and get general help.','2013-11-22 09:17:56','2013-11-22 09:17:56','Initial Version',1,0,1,NULL,5,3,NULL)
 ,(106,1,'Customize Dashboard Home','home','','2013-11-22 09:17:57','2013-11-22 09:17:57','Initial Version',1,0,1,NULL,5,2,NULL)
 ,(107,1,'Drafts','!drafts','','2013-11-22 09:18:10','2013-11-22 09:18:10','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(108,1,'Trash','!trash','','2013-11-22 09:18:11','2013-11-22 09:18:11','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(109,1,'Stacks','!stacks','','2013-11-22 09:18:11','2013-11-22 09:18:11','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(110,1,'Login','login','','2013-11-22 09:18:11','2013-11-22 09:18:11','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(111,1,'Register','register','','2013-11-22 09:18:12','2013-11-22 09:18:12','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(112,1,'Profile','profile','','2013-11-22 09:18:12','2013-11-22 09:18:12','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(113,1,'Edit','edit','','2013-11-22 09:18:12','2013-11-22 09:18:12','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(114,1,'Avatar','avatar','','2013-11-22 09:18:13','2013-11-22 09:18:13','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(115,1,'Messages','messages','','2013-11-22 09:18:13','2013-11-22 09:18:13','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(116,1,'Friends','friends','','2013-11-22 09:18:13','2013-11-22 09:18:13','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(117,1,'Page Not Found','page_not_found','','2013-11-22 09:18:13','2013-11-22 09:18:13','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(118,1,'Page Forbidden','page_forbidden','','2013-11-22 09:18:14','2013-11-22 09:18:14','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(119,1,'Download File','download_file','','2013-11-22 09:18:14','2013-11-22 09:18:14','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(120,1,'Members','members','','2013-11-22 09:18:14','2013-11-22 09:18:14','Initial Version',1,0,1,NULL,5,0,NULL)
 ,(121,1,'',NULL,NULL,'2013-11-22 09:18:15','2013-11-22 09:18:15','Initial Version',1,0,NULL,NULL,0,4,NULL)
 ,(122,1,'',NULL,NULL,'2013-11-22 09:52:54','2013-11-22 09:52:54','Initial Version',1,0,NULL,NULL,0,5,NULL)
 ,(123,1,'Homepage','homepage','','2013-11-22 09:53:00','2013-11-22 09:53:26','Initial Version',1,0,1,1,5,5,NULL)
 ,(124,1,'Services','services','','2013-11-22 13:43:00','2013-11-22 13:43:00','Initial Version',0,0,1,1,5,5,NULL)
 ,(124,2,'Services','services','','2013-11-22 13:43:00','2013-11-22 14:49:54','New Version 2',1,0,1,1,5,4,NULL)
 ,(125,1,'People','people','','2013-11-22 13:48:00','2013-11-22 13:48:12','Initial Version',1,0,1,1,5,5,NULL)
 ,(126,1,'Contact us','contact-us','','2013-11-22 13:48:00','2013-11-22 13:48:37','Initial Version',1,0,1,1,5,5,NULL);

DROP TABLE IF EXISTS Collections;

CREATE TABLE IF NOT EXISTS `Collections` (
  `cID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cDateModified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cHandle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  KEY `cDateModified` (`cDateModified`),
  KEY `cDateAdded` (`cDateAdded`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

INSERT INTO Collections VALUES(1,'2013-11-22 09:17:21','2013-11-22 15:54:15','home')
 ,(2,'2013-11-22 09:17:27','2013-11-22 09:17:29','dashboard')
 ,(3,'2013-11-22 09:17:29','2013-11-22 09:17:29','composer')
 ,(4,'2013-11-22 09:17:29','2013-11-22 09:17:30','write')
 ,(5,'2013-11-22 09:17:30','2013-11-22 09:17:30','drafts')
 ,(6,'2013-11-22 09:17:30','2013-11-22 09:17:30','sitemap')
 ,(7,'2013-11-22 09:17:30','2013-11-22 09:17:30','full')
 ,(8,'2013-11-22 09:17:30','2013-11-22 09:17:30','explore')
 ,(9,'2013-11-22 09:17:31','2013-11-22 09:17:31','search')
 ,(10,'2013-11-22 09:17:31','2013-11-22 09:17:31','files')
 ,(11,'2013-11-22 09:17:31','2013-11-22 09:17:31','search')
 ,(12,'2013-11-22 09:17:31','2013-11-22 09:17:31','attributes')
 ,(13,'2013-11-22 09:17:31','2013-11-22 09:17:32','sets')
 ,(14,'2013-11-22 09:17:32','2013-11-22 09:17:32','add_set')
 ,(15,'2013-11-22 09:17:32','2013-11-22 09:17:32','users')
 ,(16,'2013-11-22 09:17:32','2013-11-22 09:17:32','search')
 ,(17,'2013-11-22 09:17:32','2013-11-22 09:17:33','groups')
 ,(18,'2013-11-22 09:17:33','2013-11-22 09:17:33','attributes')
 ,(19,'2013-11-22 09:17:33','2013-11-22 09:17:33','add')
 ,(20,'2013-11-22 09:17:33','2013-11-22 09:17:33','add_group')
 ,(21,'2013-11-22 09:17:33','2013-11-22 09:17:34','group_sets')
 ,(22,'2013-11-22 09:17:34','2013-11-22 09:17:34','reports')
 ,(23,'2013-11-22 09:17:34','2013-11-22 09:17:34','statistics')
 ,(24,'2013-11-22 09:17:34','2013-11-22 09:17:34','forms')
 ,(25,'2013-11-22 09:17:35','2013-11-22 09:17:35','surveys')
 ,(26,'2013-11-22 09:17:35','2013-11-22 09:17:35','logs')
 ,(27,'2013-11-22 09:17:35','2013-11-22 09:17:35','pages')
 ,(28,'2013-11-22 09:17:35','2013-11-22 09:17:35','themes')
 ,(29,'2013-11-22 09:17:35','2013-11-22 09:17:36','add')
 ,(30,'2013-11-22 09:17:36','2013-11-22 09:17:36','inspect')
 ,(31,'2013-11-22 09:17:36','2013-11-22 09:17:36','customize')
 ,(32,'2013-11-22 09:17:36','2013-11-22 09:17:37','types')
 ,(33,'2013-11-22 09:17:37','2013-11-22 09:17:37','add')
 ,(34,'2013-11-22 09:17:37','2013-11-22 09:17:37','attributes')
 ,(35,'2013-11-22 09:17:37','2013-11-22 09:17:37','single')
 ,(36,'2013-11-22 09:17:37','2013-11-22 09:17:38','workflow')
 ,(37,'2013-11-22 09:17:38','2013-11-22 09:17:38','list')
 ,(38,'2013-11-22 09:17:38','2013-11-22 09:17:38','me')
 ,(39,'2013-11-22 09:17:38','2013-11-22 09:17:38','blocks')
 ,(40,'2013-11-22 09:17:38','2013-11-22 09:17:38','stacks')
 ,(41,'2013-11-22 09:17:39','2013-11-22 09:17:39','permissions')
 ,(42,'2013-11-22 09:17:39','2013-11-22 09:17:40','list')
 ,(43,'2013-11-22 09:17:40','2013-11-22 09:17:40','types')
 ,(44,'2013-11-22 09:17:40','2013-11-22 09:17:40','extend')
 ,(45,'2013-11-22 09:17:40','2013-11-22 09:17:40','news')
 ,(46,'2013-11-22 09:17:41','2013-11-22 09:17:41','install')
 ,(47,'2013-11-22 09:17:41','2013-11-22 09:17:41','update')
 ,(48,'2013-11-22 09:17:41','2013-11-22 09:17:41','connect')
 ,(49,'2013-11-22 09:17:41','2013-11-22 09:17:41','themes')
 ,(50,'2013-11-22 09:17:42','2013-11-22 09:17:42','add-ons')
 ,(51,'2013-11-22 09:17:42','2013-11-22 09:17:42','system')
 ,(52,'2013-11-22 09:17:42','2013-11-22 09:17:42','basics')
 ,(53,'2013-11-22 09:17:42','2013-11-22 09:17:43','site_name')
 ,(54,'2013-11-22 09:17:43','2013-11-22 09:17:43','icons')
 ,(55,'2013-11-22 09:17:43','2013-11-22 09:17:43','editor')
 ,(56,'2013-11-22 09:17:43','2013-11-22 09:17:43','multilingual')
 ,(57,'2013-11-22 09:17:43','2013-11-22 09:17:44','timezone')
 ,(58,'2013-11-22 09:17:44','2013-11-22 09:17:44','interface')
 ,(59,'2013-11-22 09:17:44','2013-11-22 09:17:44','seo')
 ,(60,'2013-11-22 09:17:44','2013-11-22 09:17:44','urls')
 ,(61,'2013-11-22 09:17:45','2013-11-22 09:17:45','bulk_seo_tool')
 ,(62,'2013-11-22 09:17:45','2013-11-22 09:17:45','tracking_codes')
 ,(63,'2013-11-22 09:17:45','2013-11-22 09:17:45','excluded')
 ,(64,'2013-11-22 09:17:45','2013-11-22 09:17:46','statistics')
 ,(65,'2013-11-22 09:17:46','2013-11-22 09:17:46','search_index')
 ,(66,'2013-11-22 09:17:46','2013-11-22 09:17:46','optimization')
 ,(67,'2013-11-22 09:17:46','2013-11-22 09:17:47','cache')
 ,(68,'2013-11-22 09:17:47','2013-11-22 09:17:47','clear_cache')
 ,(69,'2013-11-22 09:17:47','2013-11-22 09:17:47','jobs')
 ,(70,'2013-11-22 09:17:47','2013-11-22 09:17:48','permissions')
 ,(71,'2013-11-22 09:17:48','2013-11-22 09:17:48','site')
 ,(72,'2013-11-22 09:17:48','2013-11-22 09:17:48','files')
 ,(73,'2013-11-22 09:17:48','2013-11-22 09:17:48','file_types')
 ,(74,'2013-11-22 09:17:48','2013-11-22 09:17:48','tasks')
 ,(75,'2013-11-22 09:17:48','2013-11-22 09:17:49','users')
 ,(76,'2013-11-22 09:17:49','2013-11-22 09:17:49','advanced')
 ,(77,'2013-11-22 09:17:49','2013-11-22 09:17:49','ip_blacklist')
 ,(78,'2013-11-22 09:17:49','2013-11-22 09:17:50','captcha')
 ,(79,'2013-11-22 09:17:50','2013-11-22 09:17:50','antispam')
 ,(80,'2013-11-22 09:17:50','2013-11-22 09:17:51','maintenance_mode')
 ,(81,'2013-11-22 09:17:51','2013-11-22 09:17:51','registration')
 ,(82,'2013-11-22 09:17:51','2013-11-22 09:17:51','postlogin')
 ,(83,'2013-11-22 09:17:51','2013-11-22 09:17:51','profiles')
 ,(84,'2013-11-22 09:17:51','2013-11-22 09:17:52','public_registration')
 ,(85,'2013-11-22 09:17:52','2013-11-22 09:17:52','mail')
 ,(86,'2013-11-22 09:17:52','2013-11-22 09:17:52','method')
 ,(87,'2013-11-22 09:17:52','2013-11-22 09:17:52','importers')
 ,(88,'2013-11-22 09:17:53','2013-11-22 09:17:53','attributes')
 ,(89,'2013-11-22 09:17:53','2013-11-22 09:17:53','sets')
 ,(90,'2013-11-22 09:17:53','2013-11-22 09:17:53','types')
 ,(91,'2013-11-22 09:17:53','2013-11-22 09:17:54','environment')
 ,(92,'2013-11-22 09:17:54','2013-11-22 09:17:54','info')
 ,(93,'2013-11-22 09:17:54','2013-11-22 09:17:54','debug')
 ,(94,'2013-11-22 09:17:54','2013-11-22 09:17:54','logging')
 ,(95,'2013-11-22 09:17:54','2013-11-22 09:17:55','file_storage_locations')
 ,(96,'2013-11-22 09:17:55','2013-11-22 09:17:55','proxy')
 ,(97,'2013-11-22 09:17:55','2013-11-22 09:17:55','backup_restore')
 ,(98,'2013-11-22 09:17:55','2013-11-22 09:17:55','backup')
 ,(99,'2013-11-22 09:17:56','2013-11-22 09:17:56','update')
 ,(100,'2013-11-22 09:17:56','2013-11-22 09:17:56','database')
 ,(101,'2013-11-22 09:17:56','2013-11-22 09:17:56','composer')
 ,(102,'2013-11-22 09:17:56','2013-11-22 09:17:56',NULL)
 ,(103,'2013-11-22 09:17:56','2013-11-22 09:17:56',NULL)
 ,(104,'2013-11-22 09:17:56','2013-11-22 09:17:56',NULL)
 ,(105,'2013-11-22 09:17:56','2013-11-22 09:17:57','welcome')
 ,(106,'2013-11-22 09:17:57','2013-11-22 09:17:57','home')
 ,(107,'2013-11-22 09:18:10','2013-11-22 09:18:11','!drafts')
 ,(108,'2013-11-22 09:18:11','2013-11-22 09:18:11','!trash')
 ,(109,'2013-11-22 09:18:11','2013-11-22 09:18:11','!stacks')
 ,(110,'2013-11-22 09:18:11','2013-11-22 09:18:12','login')
 ,(111,'2013-11-22 09:18:12','2013-11-22 09:18:12','register')
 ,(112,'2013-11-22 09:18:12','2013-11-22 09:18:12','profile')
 ,(113,'2013-11-22 09:18:12','2013-11-22 09:18:12','edit')
 ,(114,'2013-11-22 09:18:13','2013-11-22 09:18:13','avatar')
 ,(115,'2013-11-22 09:18:13','2013-11-22 09:18:13','messages')
 ,(116,'2013-11-22 09:18:13','2013-11-22 09:18:13','friends')
 ,(117,'2013-11-22 09:18:13','2013-11-22 09:18:13','page_not_found')
 ,(118,'2013-11-22 09:18:14','2013-11-22 09:18:14','page_forbidden')
 ,(119,'2013-11-22 09:18:14','2013-11-22 09:18:14','download_file')
 ,(120,'2013-11-22 09:18:14','2013-11-22 09:18:14','members')
 ,(121,'2013-11-22 09:18:15','2013-11-22 09:18:15',NULL)
 ,(122,'2013-11-22 09:52:54','2013-11-22 09:52:54',NULL)
 ,(123,'2013-11-22 09:53:26','2013-11-22 09:54:53','')
 ,(124,'2013-11-22 13:43:00','2013-11-22 14:49:54','')
 ,(125,'2013-11-22 13:48:12','2013-11-22 13:48:26','')
 ,(126,'2013-11-22 13:48:37','2013-11-22 13:48:50','');

DROP TABLE IF EXISTS ComposerContentLayout;

CREATE TABLE IF NOT EXISTS `ComposerContentLayout` (
  `cclID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `ccFilename` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`cclID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ComposerDrafts;

CREATE TABLE IF NOT EXISTS `ComposerDrafts` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cpPublishParentID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS ComposerTypes;

CREATE TABLE IF NOT EXISTS `ComposerTypes` (
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctComposerPublishPageMethod` varchar(64) NOT NULL DEFAULT 'CHOOSE',
  `ctComposerPublishPageTypeID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctComposerPublishPageParentID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO ComposerTypes VALUES(5,'CHOOSE',0,0);

DROP TABLE IF EXISTS Config;

CREATE TABLE IF NOT EXISTS `Config` (
  `cfKey` varchar(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cfValue` longtext,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cfKey`,`uID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Config VALUES('ACCESS_ENTITY_UPDATED','2013-11-22 10:37:10','1385116630',0,0)
 ,('ANTISPAM_LOG_SPAM','2013-11-22 09:18:14','1',0,0)
 ,('APP_VERSION_LATEST','2013-11-22 14:59:40','5.6.2.1',0,0)
 ,('DO_PAGE_REINDEX_CHECK','2013-11-22 15:54:16','0',0,0)
 ,('ENABLE_BLOCK_CACHE','2013-11-22 10:09:11','0',0,0)
 ,('ENABLE_LOG_EMAILS','2013-11-22 09:18:14','1',0,0)
 ,('ENABLE_LOG_ERRORS','2013-11-22 09:18:14','1',0,0)
 ,('ENABLE_MARKETPLACE_SUPPORT','2013-11-22 09:18:14','1',0,0)
 ,('ENABLE_OVERRIDE_CACHE','2013-11-22 10:09:11','0',0,0)
 ,('FULL_PAGE_CACHE_GLOBAL','2013-11-22 10:09:11','0',0,0)
 ,('FULL_PAGE_CACHE_LIFETIME','2013-11-22 10:09:11','default',0,0)
 ,('FULL_PAGE_CACHE_LIFETIME_CUSTOM','2013-11-22 10:09:11',NULL,0,0)
 ,('NEWSFLOW_LAST_VIEWED','2013-11-22 20:20:04','1385112004',1,0)
 ,('SEEN_INTRODUCTION','2013-11-22 09:20:04','1',0,0)
 ,('SITE','2013-11-22 09:18:16','Lawler',0,0)
 ,('SITE_APP_VERSION','2013-11-22 09:18:16','5.6.2.1',0,0)
 ,('SITE_DEBUG_LEVEL','2013-11-22 09:18:14','1',0,0)
 ,('SITE_INSTALLED_APP_VERSION','2013-11-22 09:18:16','5.6.2.1',0,0);

DROP TABLE IF EXISTS CustomStylePresets;

CREATE TABLE IF NOT EXISTS `CustomStylePresets` (
  `cspID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cspName` varchar(255) NOT NULL,
  `csrID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cspID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS CustomStyleRules;

CREATE TABLE IF NOT EXISTS `CustomStyleRules` (
  `csrID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `css_id` varchar(128) DEFAULT NULL,
  `css_class` varchar(128) DEFAULT NULL,
  `css_serialized` text,
  `css_custom` text,
  PRIMARY KEY (`csrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS DownloadStatistics;

CREATE TABLE IF NOT EXISTS `DownloadStatistics` (
  `dsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL,
  `fvID` int(10) unsigned NOT NULL,
  `uID` int(10) unsigned NOT NULL,
  `rcID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dsID`)
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8;

INSERT INTO DownloadStatistics VALUES(1,1,1,1,1,'2013-11-22 21:38:58')
 ,(2,2,1,1,1,'2013-11-22 21:38:58')
 ,(3,3,1,1,1,'2013-11-22 21:38:58')
 ,(4,1,1,0,1,'2013-11-22 21:40:02')
 ,(5,1,1,0,1,'2013-11-22 21:41:29')
 ,(6,1,1,0,1,'2013-11-22 21:43:17')
 ,(7,1,1,0,1,'2013-11-22 21:43:29')
 ,(8,1,1,0,1,'2013-11-22 21:43:55')
 ,(9,1,1,1,1,'2013-11-22 21:48:37')
 ,(10,2,1,1,1,'2013-11-22 21:48:37')
 ,(11,3,1,1,1,'2013-11-22 21:48:37')
 ,(12,1,1,1,1,'2013-11-22 21:49:01')
 ,(13,2,1,1,1,'2013-11-22 21:49:01')
 ,(14,3,1,1,1,'2013-11-22 21:49:01')
 ,(15,1,1,1,1,'2013-11-22 21:49:13')
 ,(16,2,1,1,1,'2013-11-22 21:49:13')
 ,(17,3,1,1,1,'2013-11-22 21:49:13')
 ,(18,1,1,1,1,'2013-11-22 23:29:56')
 ,(19,3,1,1,1,'2013-11-22 23:29:56')
 ,(20,2,1,1,1,'2013-11-22 23:29:56')
 ,(21,1,1,1,1,'2013-11-23 00:01:27')
 ,(22,3,1,1,1,'2013-11-23 00:01:27')
 ,(23,2,1,1,1,'2013-11-23 00:01:27')
 ,(24,1,1,1,1,'2013-11-23 00:02:04')
 ,(25,3,1,1,1,'2013-11-23 00:02:04')
 ,(26,2,1,1,1,'2013-11-23 00:02:04')
 ,(27,1,1,1,1,'2013-11-23 00:02:13')
 ,(28,2,1,1,1,'2013-11-23 00:02:13')
 ,(29,3,1,1,1,'2013-11-23 00:02:14')
 ,(30,1,1,1,1,'2013-11-23 00:04:50')
 ,(31,3,1,1,1,'2013-11-23 00:04:50')
 ,(32,2,1,1,1,'2013-11-23 00:04:50')
 ,(33,1,1,1,1,'2013-11-23 00:05:39')
 ,(34,2,1,1,1,'2013-11-23 00:05:39')
 ,(35,3,1,1,1,'2013-11-23 00:05:39')
 ,(36,1,1,1,1,'2013-11-23 00:05:56')
 ,(37,2,1,1,1,'2013-11-23 00:05:56')
 ,(38,3,1,1,1,'2013-11-23 00:05:57')
 ,(39,1,1,1,1,'2013-11-23 00:06:21')
 ,(40,2,1,1,1,'2013-11-23 00:06:21')
 ,(41,3,1,1,1,'2013-11-23 00:06:22')
 ,(42,1,1,1,1,'2013-11-23 00:42:44')
 ,(43,2,1,1,1,'2013-11-23 00:42:44')
 ,(44,3,1,1,1,'2013-11-23 00:42:44')
 ,(45,1,1,1,1,'2013-11-23 00:42:55')
 ,(46,3,1,1,1,'2013-11-23 00:42:55')
 ,(47,2,1,1,1,'2013-11-23 00:42:55')
 ,(48,1,1,1,124,'2013-11-23 00:43:36')
 ,(49,2,1,1,124,'2013-11-23 00:43:36')
 ,(50,3,1,1,124,'2013-11-23 00:43:36')
 ,(51,1,1,1,1,'2013-11-23 00:43:42')
 ,(52,3,1,1,1,'2013-11-23 00:43:42')
 ,(53,2,1,1,1,'2013-11-23 00:43:42')
 ,(54,1,1,1,125,'2013-11-23 00:48:27')
 ,(55,2,1,1,125,'2013-11-23 00:48:27')
 ,(56,3,1,1,125,'2013-11-23 00:48:27')
 ,(57,1,1,1,126,'2013-11-23 00:48:50')
 ,(58,3,1,1,126,'2013-11-23 00:48:51')
 ,(59,2,1,1,126,'2013-11-23 00:48:51')
 ,(60,1,1,1,1,'2013-11-23 00:49:00')
 ,(61,3,1,1,1,'2013-11-23 00:49:00')
 ,(62,2,1,1,1,'2013-11-23 00:49:00')
 ,(63,1,1,1,124,'2013-11-23 00:49:01')
 ,(64,2,1,1,124,'2013-11-23 00:49:01')
 ,(65,3,1,1,124,'2013-11-23 00:49:01')
 ,(66,1,1,1,125,'2013-11-23 00:49:02')
 ,(67,2,1,1,125,'2013-11-23 00:49:02')
 ,(68,3,1,1,125,'2013-11-23 00:49:02')
 ,(69,2,1,1,126,'2013-11-23 00:49:03')
 ,(70,1,1,1,126,'2013-11-23 00:49:03')
 ,(71,3,1,1,126,'2013-11-23 00:49:04')
 ,(72,1,1,1,1,'2013-11-23 00:49:04')
 ,(73,2,1,1,1,'2013-11-23 00:49:04')
 ,(74,3,1,1,1,'2013-11-23 00:49:05')
 ,(75,1,1,1,1,'2013-11-23 00:50:59')
 ,(76,2,1,1,1,'2013-11-23 00:50:59')
 ,(77,3,1,1,1,'2013-11-23 00:50:59')
 ,(78,3,1,1,1,'2013-11-23 00:51:18')
 ,(79,1,1,1,1,'2013-11-23 00:51:18')
 ,(80,2,1,1,1,'2013-11-23 00:51:19')
 ,(81,1,1,1,124,'2013-11-23 00:51:21')
 ,(82,3,1,1,124,'2013-11-23 00:51:21')
 ,(83,2,1,1,124,'2013-11-23 00:51:22')
 ,(84,1,1,1,125,'2013-11-23 00:51:22')
 ,(85,3,1,1,125,'2013-11-23 00:51:22')
 ,(86,2,1,1,125,'2013-11-23 00:51:23')
 ,(87,1,1,1,1,'2013-11-23 00:51:24')
 ,(88,2,1,1,1,'2013-11-23 00:51:24')
 ,(89,3,1,1,1,'2013-11-23 00:51:24')
 ,(90,1,1,1,1,'2013-11-23 00:53:48')
 ,(91,2,1,1,1,'2013-11-23 00:53:48')
 ,(92,3,1,1,1,'2013-11-23 00:53:48')
 ,(93,1,1,1,124,'2013-11-23 00:53:49')
 ,(94,2,1,1,124,'2013-11-23 00:53:49')
 ,(95,3,1,1,124,'2013-11-23 00:53:50')
 ,(96,1,1,1,125,'2013-11-23 00:53:50')
 ,(97,3,1,1,125,'2013-11-23 00:53:51')
 ,(98,2,1,1,125,'2013-11-23 00:53:51')
 ,(99,1,1,1,126,'2013-11-23 00:53:52')
 ,(100,3,1,1,126,'2013-11-23 00:53:52')
 ,(101,2,1,1,126,'2013-11-23 00:53:52')
 ,(102,1,1,1,1,'2013-11-23 00:53:53')
 ,(103,3,1,1,1,'2013-11-23 00:53:53')
 ,(104,2,1,1,1,'2013-11-23 00:53:53')
 ,(105,1,1,1,124,'2013-11-23 00:53:54')
 ,(106,2,1,1,124,'2013-11-23 00:53:54')
 ,(107,3,1,1,124,'2013-11-23 00:53:54')
 ,(108,1,1,1,125,'2013-11-23 00:53:55')
 ,(109,2,1,1,125,'2013-11-23 00:53:55')
 ,(110,3,1,1,125,'2013-11-23 00:53:55')
 ,(111,1,1,1,126,'2013-11-23 00:53:56')
 ,(112,2,1,1,126,'2013-11-23 00:53:56')
 ,(113,3,1,1,126,'2013-11-23 00:53:56')
 ,(114,1,1,1,124,'2013-11-23 00:53:57')
 ,(115,3,1,1,124,'2013-11-23 00:53:57')
 ,(116,2,1,1,124,'2013-11-23 00:53:57')
 ,(117,1,1,1,1,'2013-11-23 00:53:59')
 ,(118,2,1,1,1,'2013-11-23 00:53:59')
 ,(119,3,1,1,1,'2013-11-23 00:53:59')
 ,(120,1,1,1,124,'2013-11-23 00:54:00')
 ,(121,2,1,1,124,'2013-11-23 00:54:00')
 ,(122,3,1,1,124,'2013-11-23 00:54:00')
 ,(123,1,1,1,125,'2013-11-23 00:54:01')
 ,(124,2,1,1,125,'2013-11-23 00:54:01')
 ,(125,3,1,1,125,'2013-11-23 00:54:01')
 ,(126,1,1,1,126,'2013-11-23 00:54:02')
 ,(127,2,1,1,126,'2013-11-23 00:54:02')
 ,(128,3,1,1,126,'2013-11-23 00:54:02')
 ,(129,1,1,1,1,'2013-11-23 00:54:03')
 ,(130,3,1,1,1,'2013-11-23 00:54:03')
 ,(131,2,1,1,1,'2013-11-23 00:54:03')
 ,(132,2,1,1,124,'2013-11-23 00:54:05')
 ,(133,1,1,1,124,'2013-11-23 00:54:05')
 ,(134,3,1,1,124,'2013-11-23 00:54:05')
 ,(135,1,1,1,1,'2013-11-23 00:54:06')
 ,(136,3,1,1,1,'2013-11-23 00:54:06')
 ,(137,2,1,1,1,'2013-11-23 00:54:06')
 ,(138,1,1,1,126,'2013-11-23 00:54:07')
 ,(139,2,1,1,126,'2013-11-23 00:54:07')
 ,(140,3,1,1,126,'2013-11-23 00:54:07')
 ,(141,1,1,1,125,'2013-11-23 00:54:08')
 ,(142,3,1,1,125,'2013-11-23 00:54:08')
 ,(143,2,1,1,125,'2013-11-23 00:54:08')
 ,(144,3,1,1,124,'2013-11-23 00:54:09')
 ,(145,2,1,1,124,'2013-11-23 00:54:09')
 ,(146,1,1,1,124,'2013-11-23 00:54:09')
 ,(147,1,1,1,1,'2013-11-23 00:54:10')
 ,(148,3,1,1,1,'2013-11-23 00:54:10')
 ,(149,2,1,1,1,'2013-11-23 00:54:10')
 ,(150,1,1,1,125,'2013-11-23 00:54:11')
 ,(151,2,1,1,125,'2013-11-23 00:54:11')
 ,(152,3,1,1,125,'2013-11-23 00:54:12')
 ,(153,1,1,1,1,'2013-11-23 00:54:12')
 ,(154,3,1,1,1,'2013-11-23 00:54:12')
 ,(155,2,1,1,1,'2013-11-23 00:54:13')
 ,(156,1,1,1,124,'2013-11-23 00:55:07')
 ,(157,2,1,1,124,'2013-11-23 00:55:08')
 ,(158,3,1,1,124,'2013-11-23 00:55:08')
 ,(159,1,1,1,125,'2013-11-23 00:55:08')
 ,(160,3,1,1,125,'2013-11-23 00:55:09')
 ,(161,2,1,1,125,'2013-11-23 00:55:09')
 ,(162,1,1,1,126,'2013-11-23 00:55:10')
 ,(163,2,1,1,126,'2013-11-23 00:55:10')
 ,(164,3,1,1,126,'2013-11-23 00:55:10')
 ,(165,1,1,1,1,'2013-11-23 00:55:11')
 ,(166,3,1,1,1,'2013-11-23 00:55:11')
 ,(167,2,1,1,1,'2013-11-23 00:55:11')
 ,(168,3,1,1,1,'2013-11-23 00:55:12')
 ,(169,2,1,1,1,'2013-11-23 00:55:12')
 ,(170,1,1,1,124,'2013-11-23 00:55:13')
 ,(171,2,1,1,124,'2013-11-23 00:55:13')
 ,(172,3,1,1,124,'2013-11-23 00:55:13')
 ,(173,1,1,1,1,'2013-11-23 00:55:14')
 ,(174,3,1,1,1,'2013-11-23 00:55:14')
 ,(175,2,1,1,1,'2013-11-23 00:55:14')
 ,(176,1,1,1,124,'2013-11-23 00:55:20')
 ,(177,2,1,1,124,'2013-11-23 00:55:20')
 ,(178,3,1,1,124,'2013-11-23 00:55:20')
 ,(179,1,1,1,125,'2013-11-23 00:55:21')
 ,(180,3,1,1,125,'2013-11-23 00:55:21')
 ,(181,2,1,1,125,'2013-11-23 00:55:21')
 ,(182,1,1,1,126,'2013-11-23 00:55:22')
 ,(183,2,1,1,126,'2013-11-23 00:55:22')
 ,(184,3,1,1,126,'2013-11-23 00:55:22')
 ,(185,2,1,1,1,'2013-11-23 00:55:23')
 ,(186,1,1,1,1,'2013-11-23 00:55:23')
 ,(187,3,1,1,1,'2013-11-23 00:55:23')
 ,(188,1,1,1,1,'2013-11-23 01:02:05')
 ,(189,3,1,1,1,'2013-11-23 01:02:05')
 ,(190,2,1,1,1,'2013-11-23 01:02:05')
 ,(191,1,1,1,1,'2013-11-23 01:03:36')
 ,(192,3,1,1,1,'2013-11-23 01:03:36')
 ,(193,2,1,1,1,'2013-11-23 01:03:36')
 ,(194,3,1,1,1,'2013-11-23 01:04:10')
 ,(195,1,1,1,1,'2013-11-23 01:04:10')
 ,(196,2,1,1,1,'2013-11-23 01:04:10')
 ,(197,1,1,1,1,'2013-11-23 01:06:01')
 ,(198,3,1,1,1,'2013-11-23 01:06:02')
 ,(199,2,1,1,1,'2013-11-23 01:06:02')
 ,(200,1,1,1,126,'2013-11-23 01:08:14')
 ,(201,2,1,1,126,'2013-11-23 01:08:15')
 ,(202,3,1,1,126,'2013-11-23 01:08:15')
 ,(203,1,1,1,1,'2013-11-23 01:08:17')
 ,(204,3,1,1,1,'2013-11-23 01:08:17')
 ,(205,2,1,1,1,'2013-11-23 01:08:17')
 ,(206,1,1,1,1,'2013-11-23 01:08:19')
 ,(207,3,1,1,1,'2013-11-23 01:08:19')
 ,(208,2,1,1,1,'2013-11-23 01:08:19')
 ,(209,1,1,1,1,'2013-11-23 01:08:56')
 ,(210,2,1,1,1,'2013-11-23 01:08:56')
 ,(211,3,1,1,1,'2013-11-23 01:08:56')
 ,(212,1,1,1,1,'2013-11-23 01:09:21')
 ,(213,2,1,1,1,'2013-11-23 01:09:21')
 ,(214,3,1,1,1,'2013-11-23 01:09:21')
 ,(215,1,1,1,1,'2013-11-23 01:09:34')
 ,(216,2,1,1,1,'2013-11-23 01:09:34')
 ,(217,3,1,1,1,'2013-11-23 01:09:34')
 ,(218,1,1,1,124,'2013-11-23 01:09:38')
 ,(219,2,1,1,124,'2013-11-23 01:09:39')
 ,(220,3,1,1,124,'2013-11-23 01:09:39')
 ,(221,2,1,1,1,'2013-11-23 01:09:40')
 ,(222,3,1,1,1,'2013-11-23 01:09:40')
 ,(223,1,1,1,1,'2013-11-23 01:09:40')
 ,(224,1,1,1,125,'2013-11-23 01:09:41')
 ,(225,2,1,1,125,'2013-11-23 01:09:41')
 ,(226,3,1,1,125,'2013-11-23 01:09:41')
 ,(227,1,1,1,126,'2013-11-23 01:09:42')
 ,(228,3,1,1,126,'2013-11-23 01:09:42')
 ,(229,2,1,1,126,'2013-11-23 01:09:43')
 ,(230,2,1,1,1,'2013-11-23 01:09:44')
 ,(231,1,1,1,1,'2013-11-23 01:09:44')
 ,(232,3,1,1,1,'2013-11-23 01:09:44')
 ,(233,1,1,1,124,'2013-11-23 01:09:47')
 ,(234,3,1,1,124,'2013-11-23 01:09:47')
 ,(235,2,1,1,124,'2013-11-23 01:09:47')
 ,(236,1,1,1,125,'2013-11-23 01:09:48')
 ,(237,3,1,1,125,'2013-11-23 01:09:48')
 ,(238,2,1,1,125,'2013-11-23 01:09:48')
 ,(239,1,1,1,126,'2013-11-23 01:09:49')
 ,(240,2,1,1,126,'2013-11-23 01:09:49')
 ,(241,3,1,1,126,'2013-11-23 01:09:49')
 ,(242,1,1,1,1,'2013-11-23 01:09:50')
 ,(243,3,1,1,1,'2013-11-23 01:09:50')
 ,(244,2,1,1,1,'2013-11-23 01:09:50')
 ,(245,1,1,1,124,'2013-11-23 01:09:53')
 ,(246,2,1,1,124,'2013-11-23 01:09:53')
 ,(247,3,1,1,124,'2013-11-23 01:09:54')
 ,(248,2,1,1,1,'2013-11-23 01:09:55')
 ,(249,3,1,1,1,'2013-11-23 01:09:55')
 ,(250,1,1,1,1,'2013-11-23 01:09:55')
 ,(251,1,1,1,125,'2013-11-23 01:09:56')
 ,(252,3,1,1,125,'2013-11-23 01:09:56')
 ,(253,2,1,1,125,'2013-11-23 01:09:57')
 ,(254,1,1,1,1,'2013-11-23 01:09:57')
 ,(255,3,1,1,1,'2013-11-23 01:09:57')
 ,(256,2,1,1,1,'2013-11-23 01:09:57')
 ,(257,3,1,1,1,'2013-11-23 01:38:06')
 ,(258,1,1,1,1,'2013-11-23 01:38:06')
 ,(259,2,1,1,1,'2013-11-23 01:38:06')
 ,(260,1,1,1,124,'2013-11-23 01:38:09')
 ,(261,2,1,1,124,'2013-11-23 01:38:09')
 ,(262,3,1,1,124,'2013-11-23 01:38:09')
 ,(263,2,1,1,1,'2013-11-23 01:38:10')
 ,(264,3,1,1,1,'2013-11-23 01:38:10')
 ,(265,1,1,1,1,'2013-11-23 01:38:10')
 ,(266,1,1,1,1,'2013-11-23 01:40:09')
 ,(267,2,1,1,1,'2013-11-23 01:40:10')
 ,(268,3,1,1,1,'2013-11-23 01:40:10')
 ,(269,1,1,1,1,'2013-11-23 01:41:58')
 ,(270,3,1,1,1,'2013-11-23 01:41:58')
 ,(271,2,1,1,1,'2013-11-23 01:41:58')
 ,(272,1,1,1,1,'2013-11-23 01:47:29')
 ,(273,3,1,1,1,'2013-11-23 01:47:30')
 ,(274,2,1,1,1,'2013-11-23 01:47:30')
 ,(275,1,1,1,1,'2013-11-23 01:48:40')
 ,(276,2,1,1,1,'2013-11-23 01:48:40')
 ,(277,3,1,1,1,'2013-11-23 01:48:40')
 ,(278,1,1,1,1,'2013-11-23 01:49:11')
 ,(279,3,1,1,1,'2013-11-23 01:49:11')
 ,(280,2,1,1,1,'2013-11-23 01:49:11')
 ,(281,1,1,1,1,'2013-11-23 01:49:25')
 ,(282,2,1,1,1,'2013-11-23 01:49:25')
 ,(283,3,1,1,1,'2013-11-23 01:49:26')
 ,(284,1,1,1,1,'2013-11-23 01:49:27')
 ,(285,3,1,1,1,'2013-11-23 01:49:27')
 ,(286,2,1,1,1,'2013-11-23 01:49:28')
 ,(287,1,1,1,1,'2013-11-23 01:49:29')
 ,(288,3,1,1,1,'2013-11-23 01:49:29')
 ,(289,2,1,1,1,'2013-11-23 01:49:29')
 ,(290,1,1,1,126,'2013-11-23 01:49:31')
 ,(291,3,1,1,126,'2013-11-23 01:49:31')
 ,(292,2,1,1,126,'2013-11-23 01:49:31')
 ,(293,3,1,1,1,'2013-11-23 01:49:57')
 ,(294,2,1,1,1,'2013-11-23 01:49:57')
 ,(295,1,1,1,1,'2013-11-23 01:49:57')
 ,(296,1,1,1,1,'2013-11-23 01:52:10')
 ,(297,3,1,1,1,'2013-11-23 01:52:10')
 ,(298,2,1,1,1,'2013-11-23 01:52:10')
 ,(299,1,1,1,1,'2013-11-23 01:54:33')
 ,(300,3,1,1,1,'2013-11-23 01:54:33')
 ,(301,2,1,1,1,'2013-11-23 01:54:33')
 ,(302,1,1,1,1,'2013-11-23 01:58:13')
 ,(303,3,1,1,1,'2013-11-23 01:58:13')
 ,(304,2,1,1,1,'2013-11-23 01:58:13')
 ,(305,1,1,1,1,'2013-11-23 01:59:07')
 ,(306,3,1,1,1,'2013-11-23 01:59:07')
 ,(307,2,1,1,1,'2013-11-23 01:59:07')
 ,(308,1,1,1,1,'2013-11-23 01:59:53')
 ,(309,2,1,1,1,'2013-11-23 01:59:53')
 ,(310,3,1,1,1,'2013-11-23 01:59:53')
 ,(311,2,1,1,125,'2013-11-23 02:00:09')
 ,(312,3,1,1,125,'2013-11-23 02:00:09')
 ,(313,1,1,1,125,'2013-11-23 02:00:09')
 ,(314,1,1,1,126,'2013-11-23 02:00:12')
 ,(315,2,1,1,126,'2013-11-23 02:00:12')
 ,(316,3,1,1,126,'2013-11-23 02:00:12')
 ,(317,1,1,1,1,'2013-11-23 02:00:16')
 ,(318,3,1,1,1,'2013-11-23 02:00:16')
 ,(319,2,1,1,1,'2013-11-23 02:00:16')
 ,(320,1,1,1,1,'2013-11-23 02:00:19')
 ,(321,3,1,1,1,'2013-11-23 02:00:19')
 ,(322,2,1,1,1,'2013-11-23 02:00:19')
 ,(323,1,1,1,1,'2013-11-23 02:04:23')
 ,(324,3,1,1,1,'2013-11-23 02:04:23')
 ,(325,2,1,1,1,'2013-11-23 02:04:23')
 ,(326,1,1,1,1,'2013-11-23 02:06:26')
 ,(327,2,1,1,1,'2013-11-23 02:06:26')
 ,(328,3,1,1,1,'2013-11-23 02:06:26')
 ,(329,1,1,1,1,'2013-11-23 02:06:35')
 ,(330,2,1,1,1,'2013-11-23 02:06:36')
 ,(331,3,1,1,1,'2013-11-23 02:06:36')
 ,(332,1,1,1,1,'2013-11-23 02:07:24')
 ,(333,2,1,1,1,'2013-11-23 02:07:24')
 ,(334,3,1,1,1,'2013-11-23 02:07:24')
 ,(335,1,1,1,1,'2013-11-23 02:08:18')
 ,(336,2,1,1,1,'2013-11-23 02:08:18')
 ,(337,3,1,1,1,'2013-11-23 02:08:18')
 ,(338,1,1,1,1,'2013-11-23 02:11:01')
 ,(339,2,1,1,1,'2013-11-23 02:11:01')
 ,(340,3,1,1,1,'2013-11-23 02:11:01')
 ,(341,1,1,1,1,'2013-11-23 02:14:42')
 ,(342,2,1,1,1,'2013-11-23 02:14:42')
 ,(343,3,1,1,1,'2013-11-23 02:14:42')
 ,(344,1,1,1,1,'2013-11-23 02:15:31')
 ,(345,3,1,1,1,'2013-11-23 02:15:32')
 ,(346,2,1,1,1,'2013-11-23 02:15:32')
 ,(347,1,1,1,1,'2013-11-23 02:21:28')
 ,(348,3,1,1,1,'2013-11-23 02:21:28')
 ,(349,2,1,1,1,'2013-11-23 02:21:28')
 ,(350,1,1,1,1,'2013-11-23 02:27:12')
 ,(351,2,1,1,1,'2013-11-23 02:27:12')
 ,(352,3,1,1,1,'2013-11-23 02:27:12')
 ,(353,1,1,1,1,'2013-11-23 02:27:18')
 ,(354,2,1,1,1,'2013-11-23 02:27:18')
 ,(355,3,1,1,1,'2013-11-23 02:27:18')
 ,(356,1,1,1,1,'2013-11-23 02:40:50')
 ,(357,3,1,1,1,'2013-11-23 02:40:51')
 ,(358,2,1,1,1,'2013-11-23 02:40:51')
 ,(359,2,1,1,1,'2013-11-23 02:41:56')
 ,(360,1,1,1,1,'2013-11-23 02:41:56')
 ,(361,3,1,1,1,'2013-11-23 02:41:56')
 ,(362,1,1,1,1,'2013-11-23 02:44:10')
 ,(363,2,1,1,1,'2013-11-23 02:44:10')
 ,(364,3,1,1,1,'2013-11-23 02:44:10')
 ,(365,1,1,1,1,'2013-11-23 02:50:54')
 ,(366,2,1,1,1,'2013-11-23 02:50:54')
 ,(367,3,1,1,1,'2013-11-23 02:50:54')
 ,(368,2,1,1,1,'2013-11-23 02:54:02')
 ,(369,3,1,1,1,'2013-11-23 02:54:03')
 ,(370,1,1,1,1,'2013-11-23 02:54:03')
 ,(371,3,1,1,125,'2013-11-23 02:54:26')
 ,(372,1,1,1,125,'2013-11-23 02:54:26')
 ,(373,2,1,1,125,'2013-11-23 02:54:27')
 ,(374,1,1,1,126,'2013-11-23 02:54:27')
 ,(375,3,1,1,126,'2013-11-23 02:54:28')
 ,(376,2,1,1,126,'2013-11-23 02:54:28')
 ,(377,1,1,1,1,'2013-11-23 02:54:29')
 ,(378,2,1,1,1,'2013-11-23 02:54:29')
 ,(379,3,1,1,1,'2013-11-23 02:54:29');

DROP TABLE IF EXISTS FileAttributeValues;

CREATE TABLE IF NOT EXISTS `FileAttributeValues` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`fvID`,`akID`,`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO FileAttributeValues VALUES(1,1,12,120)
 ,(1,1,13,121)
 ,(2,1,12,122)
 ,(2,1,13,123)
 ,(3,1,12,124)
 ,(3,1,13,125);

DROP TABLE IF EXISTS FilePermissionAssignments;

CREATE TABLE IF NOT EXISTS `FilePermissionAssignments` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`paID`,`pkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FilePermissionFileTypes;

CREATE TABLE IF NOT EXISTS `FilePermissionFileTypes` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(32) NOT NULL,
  PRIMARY KEY (`fsID`,`gID`,`uID`,`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileSearchIndexAttributes;

CREATE TABLE IF NOT EXISTS `FileSearchIndexAttributes` (
  `fID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_width` decimal(14,4) DEFAULT '0.0000',
  `ak_height` decimal(14,4) DEFAULT '0.0000',
  `ak_duration` decimal(14,4) DEFAULT '0.0000',
  PRIMARY KEY (`fID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO FileSearchIndexAttributes VALUES(1,3192.0000,1064.0000,0.0000)
 ,(2,1521.0000,528.0000,0.0000)
 ,(3,1520.0000,518.0000,0.0000);

DROP TABLE IF EXISTS FileSetFiles;

CREATE TABLE IF NOT EXISTS `FileSetFiles` (
  `fsfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL,
  `fsID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fsDisplayOrder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fsfID`),
  KEY `fID` (`fID`),
  KEY `fsID` (`fsID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO FileSetFiles VALUES(1,1,1,'2013-11-22 21:37:20',0)
 ,(2,2,1,'2013-11-22 21:37:20',1)
 ,(3,3,1,'2013-11-22 21:37:20',2);

DROP TABLE IF EXISTS FileSetPermissionAssignments;

CREATE TABLE IF NOT EXISTS `FileSetPermissionAssignments` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fsID`,`paID`,`pkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO FileSetPermissionAssignments VALUES(0,43,35)
 ,(0,44,36)
 ,(0,45,37)
 ,(0,46,38)
 ,(0,47,39)
 ,(0,48,40)
 ,(0,49,42)
 ,(0,50,41)
 ,(0,51,43);

DROP TABLE IF EXISTS FileSetPermissionFileTypeAccessList;

CREATE TABLE IF NOT EXISTS `FileSetPermissionFileTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileSetPermissionFileTypeAccessListCustom;

CREATE TABLE IF NOT EXISTS `FileSetPermissionFileTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(64) NOT NULL,
  PRIMARY KEY (`paID`,`peID`,`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileSetSavedSearches;

CREATE TABLE IF NOT EXISTS `FileSetSavedSearches` (
  `fsID` int(10) unsigned NOT NULL DEFAULT '0',
  `fsSearchRequest` text,
  `fsResultColumns` text,
  PRIMARY KEY (`fsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileSets;

CREATE TABLE IF NOT EXISTS `FileSets` (
  `fsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fsName` varchar(64) NOT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `fsType` int(4) NOT NULL,
  `fsOverrideGlobalPermissions` int(4) DEFAULT NULL,
  PRIMARY KEY (`fsID`),
  KEY `fsOverrideGlobalPermissions` (`fsOverrideGlobalPermissions`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO FileSets VALUES(1,'highlights',1,1,0);

DROP TABLE IF EXISTS FileStorageLocations;

CREATE TABLE IF NOT EXISTS `FileStorageLocations` (
  `fslID` int(10) unsigned NOT NULL DEFAULT '0',
  `fslName` varchar(255) NOT NULL,
  `fslDirectory` varchar(255) NOT NULL,
  PRIMARY KEY (`fslID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS FileVersionLog;

CREATE TABLE IF NOT EXISTS `FileVersionLog` (
  `fvlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvUpdateTypeID` int(3) unsigned NOT NULL DEFAULT '0',
  `fvUpdateTypeAttributeID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fvlID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO FileVersionLog VALUES(1,1,1,5,12)
 ,(2,1,1,5,13)
 ,(3,2,1,5,12)
 ,(4,2,1,5,13)
 ,(5,3,1,5,12)
 ,(6,3,1,5,13);

DROP TABLE IF EXISTS FileVersions;

CREATE TABLE IF NOT EXISTS `FileVersions` (
  `fID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvFilename` varchar(255) NOT NULL,
  `fvPrefix` varchar(12) DEFAULT NULL,
  `fvGenericType` int(3) unsigned NOT NULL DEFAULT '0',
  `fvSize` int(20) unsigned NOT NULL DEFAULT '0',
  `fvTitle` varchar(255) DEFAULT NULL,
  `fvDescription` text,
  `fvTags` varchar(255) DEFAULT NULL,
  `fvIsApproved` int(10) unsigned NOT NULL DEFAULT '1',
  `fvDateAdded` datetime DEFAULT NULL,
  `fvApproverUID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvAuthorUID` int(10) unsigned NOT NULL DEFAULT '0',
  `fvActivateDatetime` datetime DEFAULT NULL,
  `fvHasThumbnail1` int(1) NOT NULL DEFAULT '0',
  `fvHasThumbnail2` int(1) NOT NULL DEFAULT '0',
  `fvHasThumbnail3` int(1) NOT NULL DEFAULT '0',
  `fvExtension` varchar(32) DEFAULT NULL,
  `fvType` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fID`,`fvID`),
  KEY `fvExtension` (`fvType`),
  KEY `fvTitle` (`fvTitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO FileVersions VALUES(1,1,'Frontpage_1_Color.jpg','861385116630',1,1591320,'Frontpage_1_Color.jpg','','',1,'2013-11-22 10:37:10',1,1,'2013-11-22 10:37:10',1,1,0,'jpg',1)
 ,(2,1,'Frontpage_2_Color.jpg','701385116631',1,678625,'Frontpage_2_Color.jpg','','',1,'2013-11-22 10:37:11',1,1,'2013-11-22 10:37:11',1,1,0,'jpg',1)
 ,(3,1,'Frontpage_4_Color.jpg','411385116631',1,648773,'Frontpage_4_Color.jpg','','',1,'2013-11-22 10:37:11',1,1,'2013-11-22 10:37:11',1,1,0,'jpg',1);

DROP TABLE IF EXISTS Files;

CREATE TABLE IF NOT EXISTS `Files` (
  `fID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fDateAdded` datetime DEFAULT NULL,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `fslID` int(10) unsigned NOT NULL DEFAULT '0',
  `ocID` int(10) unsigned NOT NULL DEFAULT '0',
  `fOverrideSetPermissions` int(1) NOT NULL DEFAULT '0',
  `fPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fID`,`uID`,`fslID`),
  KEY `fOverrideSetPermissions` (`fOverrideSetPermissions`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO Files VALUES(1,'2013-11-22 10:37:10',1,0,0,0,NULL)
 ,(2,'2013-11-22 10:37:11',1,0,0,0,NULL)
 ,(3,'2013-11-22 10:37:11',1,0,0,0,NULL);

DROP TABLE IF EXISTS GroupSetGroups;

CREATE TABLE IF NOT EXISTS `GroupSetGroups` (
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `gsID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gID`,`gsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS GroupSets;

CREATE TABLE IF NOT EXISTS `GroupSets` (
  `gsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gsName` varchar(255) DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Groups;

CREATE TABLE IF NOT EXISTS `Groups` (
  `gID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gName` varchar(128) NOT NULL,
  `gDescription` varchar(255) NOT NULL,
  `gUserExpirationIsEnabled` int(1) NOT NULL DEFAULT '0',
  `gUserExpirationMethod` varchar(12) DEFAULT NULL,
  `gUserExpirationSetDateTime` datetime DEFAULT NULL,
  `gUserExpirationInterval` int(10) unsigned NOT NULL DEFAULT '0',
  `gUserExpirationAction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`gID`),
  UNIQUE KEY `gName` (`gName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO Groups VALUES(1,'Guest','The guest group represents unregistered visitors to your site.',0,NULL,NULL,0,NULL)
 ,(2,'Registered Users','The registered users group represents all user accounts.',0,NULL,NULL,0,NULL)
 ,(3,'Administrators','',0,NULL,NULL,0,NULL);

DROP TABLE IF EXISTS JobSetJobs;

CREATE TABLE IF NOT EXISTS `JobSetJobs` (
  `jsID` int(10) unsigned NOT NULL DEFAULT '0',
  `jID` int(10) unsigned NOT NULL DEFAULT '0',
  `jRunOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`jsID`,`jID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO JobSetJobs VALUES(1,1,0)
 ,(1,3,0)
 ,(1,4,0)
 ,(1,5,0);

DROP TABLE IF EXISTS JobSets;

CREATE TABLE IF NOT EXISTS `JobSets` (
  `jsID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jsName` varchar(128) NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `jDateLastRun` datetime DEFAULT NULL,
  `isScheduled` smallint(1) NOT NULL DEFAULT '0',
  `scheduledInterval` varchar(255) NOT NULL DEFAULT 'days',
  `scheduledValue` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jsID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO JobSets VALUES(1,'Default',0,NULL,0,'days',0);

DROP TABLE IF EXISTS Jobs;

CREATE TABLE IF NOT EXISTS `Jobs` (
  `jID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jName` varchar(100) NOT NULL,
  `jDescription` varchar(255) NOT NULL,
  `jDateInstalled` datetime DEFAULT NULL,
  `jDateLastRun` datetime DEFAULT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `jLastStatusText` varchar(255) DEFAULT NULL,
  `jLastStatusCode` smallint(4) NOT NULL DEFAULT '0',
  `jStatus` varchar(14) NOT NULL DEFAULT 'ENABLED',
  `jHandle` varchar(255) NOT NULL,
  `jNotUninstallable` smallint(4) NOT NULL DEFAULT '0',
  `isScheduled` smallint(1) NOT NULL DEFAULT '0',
  `scheduledInterval` varchar(255) NOT NULL DEFAULT 'days',
  `scheduledValue` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO Jobs VALUES(1,'Index Search Engine - Updates','Index the site to allow searching to work quickly and accurately. Only reindexes pages that have changed since last indexing.','2013-11-22 09:17:27',NULL,0,NULL,0,'ENABLED','index_search',1,0,'days',0)
 ,(2,'Index Search Engine - All','Empties the page search index and reindexes all pages.','2013-11-22 09:17:27',NULL,0,NULL,0,'ENABLED','index_search_all',1,0,'days',0)
 ,(3,'Generate the sitemap.xml file','Generate the sitemap.xml file that search engines use to crawl your site.','2013-11-22 09:17:27',NULL,0,NULL,0,'ENABLED','generate_sitemap',0,0,'days',0)
 ,(4,'Process Email Posts','Polls an email account and grabs private messages/postings that are sent there..','2013-11-22 09:17:27',NULL,0,NULL,0,'ENABLED','process_email',0,0,'days',0)
 ,(5,'Remove Old Page Versions','Removes all except the 10 most recent page versions for each page.','2013-11-22 09:17:27',NULL,0,NULL,0,'ENABLED','remove_old_page_versions',0,0,'days',0);

DROP TABLE IF EXISTS JobsLog;

CREATE TABLE IF NOT EXISTS `JobsLog` (
  `jlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jID` int(10) unsigned NOT NULL,
  `jlMessage` varchar(255) NOT NULL,
  `jlTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jlError` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jlID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS LayoutPresets;

CREATE TABLE IF NOT EXISTS `LayoutPresets` (
  `lpID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lpName` varchar(128) NOT NULL,
  `layoutID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lpID`),
  UNIQUE KEY `layoutID` (`layoutID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Layouts;

CREATE TABLE IF NOT EXISTS `Layouts` (
  `layoutID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout_rows` int(5) NOT NULL DEFAULT '3',
  `layout_columns` int(3) NOT NULL DEFAULT '3',
  `spacing` int(3) NOT NULL DEFAULT '3',
  `breakpoints` varchar(255) NOT NULL DEFAULT '',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layoutID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Logs;

CREATE TABLE IF NOT EXISTS `Logs` (
  `logID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logType` varchar(64) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logText` longtext,
  `logUserID` int(10) unsigned DEFAULT NULL,
  `logIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logID`),
  KEY `logType` (`logType`),
  KEY `logIsInternal` (`logIsInternal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO Logs VALUES(1,'Page Action','2013-11-22 20:54:53','Page &quot;Homepage&quot; at path &quot;/homepage&quot; Moved to trash\n',1,0);

DROP TABLE IF EXISTS MailImporters;

CREATE TABLE IF NOT EXISTS `MailImporters` (
  `miID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miHandle` varchar(64) NOT NULL,
  `miServer` varchar(255) DEFAULT NULL,
  `miUsername` varchar(255) DEFAULT NULL,
  `miPassword` varchar(255) DEFAULT NULL,
  `miEncryption` varchar(32) DEFAULT NULL,
  `miIsEnabled` int(1) NOT NULL DEFAULT '0',
  `miEmail` varchar(255) DEFAULT NULL,
  `miPort` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned DEFAULT NULL,
  `miConnectionMethod` varchar(8) DEFAULT 'POP',
  PRIMARY KEY (`miID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO MailImporters VALUES(1,'private_message',NULL,NULL,NULL,NULL,0,NULL,0,0,'POP');

DROP TABLE IF EXISTS MailValidationHashes;

CREATE TABLE IF NOT EXISTS `MailValidationHashes` (
  `mvhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `miID` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `mHash` varchar(128) NOT NULL,
  `mDateGenerated` int(10) unsigned NOT NULL DEFAULT '0',
  `mDateRedeemed` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`mvhID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Packages;

CREATE TABLE IF NOT EXISTS `Packages` (
  `pkgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkgName` varchar(255) NOT NULL,
  `pkgHandle` varchar(64) NOT NULL,
  `pkgDescription` text,
  `pkgDateInstalled` datetime NOT NULL,
  `pkgIsInstalled` tinyint(1) NOT NULL DEFAULT '1',
  `pkgVersion` varchar(32) DEFAULT NULL,
  `pkgAvailableVersion` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`pkgID`),
  UNIQUE KEY `pkgHandle` (`pkgHandle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PagePaths;

CREATE TABLE IF NOT EXISTS `PagePaths` (
  `ppID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned DEFAULT '0',
  `cPath` text,
  `ppIsCanonical` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ppID`),
  KEY `cID` (`cID`),
  KEY `ppIsCanonical` (`ppIsCanonical`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

INSERT INTO PagePaths VALUES(1,2,'/dashboard','1')
 ,(2,3,'/dashboard/composer','1')
 ,(3,4,'/dashboard/composer/write','1')
 ,(4,5,'/dashboard/composer/drafts','1')
 ,(5,6,'/dashboard/sitemap','1')
 ,(6,7,'/dashboard/sitemap/full','1')
 ,(7,8,'/dashboard/sitemap/explore','1')
 ,(8,9,'/dashboard/sitemap/search','1')
 ,(9,10,'/dashboard/files','1')
 ,(10,11,'/dashboard/files/search','1')
 ,(11,12,'/dashboard/files/attributes','1')
 ,(12,13,'/dashboard/files/sets','1')
 ,(13,14,'/dashboard/files/add_set','1')
 ,(14,15,'/dashboard/users','1')
 ,(15,16,'/dashboard/users/search','1')
 ,(16,17,'/dashboard/users/groups','1')
 ,(17,18,'/dashboard/users/attributes','1')
 ,(18,19,'/dashboard/users/add','1')
 ,(19,20,'/dashboard/users/add_group','1')
 ,(20,21,'/dashboard/users/group_sets','1')
 ,(21,22,'/dashboard/reports','1')
 ,(22,23,'/dashboard/reports/statistics','1')
 ,(23,24,'/dashboard/reports/forms','1')
 ,(24,25,'/dashboard/reports/surveys','1')
 ,(25,26,'/dashboard/reports/logs','1')
 ,(26,27,'/dashboard/pages','1')
 ,(27,28,'/dashboard/pages/themes','1')
 ,(28,29,'/dashboard/pages/themes/add','1')
 ,(29,30,'/dashboard/pages/themes/inspect','1')
 ,(30,31,'/dashboard/pages/themes/customize','1')
 ,(31,32,'/dashboard/pages/types','1')
 ,(32,33,'/dashboard/pages/types/add','1')
 ,(33,34,'/dashboard/pages/attributes','1')
 ,(34,35,'/dashboard/pages/single','1')
 ,(35,36,'/dashboard/workflow','1')
 ,(36,37,'/dashboard/workflow/list','1')
 ,(37,38,'/dashboard/workflow/me','1')
 ,(38,39,'/dashboard/blocks','1')
 ,(39,40,'/dashboard/blocks/stacks','1')
 ,(40,41,'/dashboard/blocks/permissions','1')
 ,(41,42,'/dashboard/blocks/stacks/list','1')
 ,(42,43,'/dashboard/blocks/types','1')
 ,(43,44,'/dashboard/extend','1')
 ,(44,45,'/dashboard/news','1')
 ,(45,46,'/dashboard/extend/install','1')
 ,(46,47,'/dashboard/extend/update','1')
 ,(47,48,'/dashboard/extend/connect','1')
 ,(48,49,'/dashboard/extend/themes','1')
 ,(49,50,'/dashboard/extend/add-ons','1')
 ,(50,51,'/dashboard/system','1')
 ,(51,52,'/dashboard/system/basics','1')
 ,(52,53,'/dashboard/system/basics/site_name','1')
 ,(53,54,'/dashboard/system/basics/icons','1')
 ,(54,55,'/dashboard/system/basics/editor','1')
 ,(55,56,'/dashboard/system/basics/multilingual','1')
 ,(56,57,'/dashboard/system/basics/timezone','1')
 ,(57,58,'/dashboard/system/basics/interface','1')
 ,(58,59,'/dashboard/system/seo','1')
 ,(59,60,'/dashboard/system/seo/urls','1')
 ,(60,61,'/dashboard/system/seo/bulk_seo_tool','1')
 ,(61,62,'/dashboard/system/seo/tracking_codes','1')
 ,(62,63,'/dashboard/system/seo/excluded','1')
 ,(63,64,'/dashboard/system/seo/statistics','1')
 ,(64,65,'/dashboard/system/seo/search_index','1')
 ,(65,66,'/dashboard/system/optimization','1')
 ,(66,67,'/dashboard/system/optimization/cache','1')
 ,(67,68,'/dashboard/system/optimization/clear_cache','1')
 ,(68,69,'/dashboard/system/optimization/jobs','1')
 ,(69,70,'/dashboard/system/permissions','1')
 ,(70,71,'/dashboard/system/permissions/site','1')
 ,(71,72,'/dashboard/system/permissions/files','1')
 ,(72,73,'/dashboard/system/permissions/file_types','1')
 ,(73,74,'/dashboard/system/permissions/tasks','1')
 ,(74,75,'/dashboard/system/permissions/users','1')
 ,(75,76,'/dashboard/system/permissions/advanced','1')
 ,(76,77,'/dashboard/system/permissions/ip_blacklist','1')
 ,(77,78,'/dashboard/system/permissions/captcha','1')
 ,(78,79,'/dashboard/system/permissions/antispam','1')
 ,(79,80,'/dashboard/system/permissions/maintenance_mode','1')
 ,(80,81,'/dashboard/system/registration','1')
 ,(81,82,'/dashboard/system/registration/postlogin','1')
 ,(82,83,'/dashboard/system/registration/profiles','1')
 ,(83,84,'/dashboard/system/registration/public_registration','1')
 ,(84,85,'/dashboard/system/mail','1')
 ,(85,86,'/dashboard/system/mail/method','1')
 ,(86,87,'/dashboard/system/mail/importers','1')
 ,(87,88,'/dashboard/system/attributes','1')
 ,(88,89,'/dashboard/system/attributes/sets','1')
 ,(89,90,'/dashboard/system/attributes/types','1')
 ,(90,91,'/dashboard/system/environment','1')
 ,(91,92,'/dashboard/system/environment/info','1')
 ,(92,93,'/dashboard/system/environment/debug','1')
 ,(93,94,'/dashboard/system/environment/logging','1')
 ,(94,95,'/dashboard/system/environment/file_storage_locations','1')
 ,(95,96,'/dashboard/system/environment/proxy','1')
 ,(96,97,'/dashboard/system/backup_restore','1')
 ,(97,98,'/dashboard/system/backup_restore/backup','1')
 ,(98,99,'/dashboard/system/backup_restore/update','1')
 ,(99,100,'/dashboard/system/backup_restore/database','1')
 ,(100,101,'/dashboard/pages/types/composer','1')
 ,(101,105,'/dashboard/welcome','1')
 ,(102,106,'/dashboard/home','1')
 ,(103,107,'/!drafts','1')
 ,(104,108,'/!trash','1')
 ,(105,109,'/!stacks','1')
 ,(106,110,'/login','1')
 ,(107,111,'/register','1')
 ,(108,112,'/profile','1')
 ,(109,113,'/profile/edit','1')
 ,(110,114,'/profile/avatar','1')
 ,(111,115,'/profile/messages','1')
 ,(112,116,'/profile/friends','1')
 ,(113,117,'/page_not_found','1')
 ,(114,118,'/page_forbidden','1')
 ,(115,119,'/download_file','1')
 ,(116,120,'/members','1')
 ,(118,123,'/!trash/homepage','1')
 ,(120,125,'/people','1')
 ,(121,126,'/contact-us','1')
 ,(122,124,'/services','1');

DROP TABLE IF EXISTS PagePermissionAssignments;

CREATE TABLE IF NOT EXISTS `PagePermissionAssignments` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`pkID`,`paID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO PagePermissionAssignments VALUES(1,1,52)
 ,(1,2,53)
 ,(1,3,54)
 ,(1,4,55)
 ,(1,5,56)
 ,(1,6,57)
 ,(1,7,58)
 ,(1,8,59)
 ,(1,9,60)
 ,(1,10,61)
 ,(1,11,62)
 ,(1,12,63)
 ,(1,13,64)
 ,(1,14,65)
 ,(1,15,66)
 ,(1,16,67)
 ,(2,1,18)
 ,(2,2,20)
 ,(2,3,19)
 ,(2,4,25)
 ,(2,5,21)
 ,(2,6,22)
 ,(2,7,27)
 ,(2,8,29)
 ,(2,9,31)
 ,(2,10,28)
 ,(2,11,32)
 ,(2,12,33)
 ,(2,13,23)
 ,(2,14,26)
 ,(2,15,24)
 ,(2,16,30)
 ,(42,1,34)
 ,(42,3,35)
 ,(110,1,38)
 ,(110,3,39)
 ,(111,1,40)
 ,(111,3,41);

DROP TABLE IF EXISTS PagePermissionPageTypeAccessList;

CREATE TABLE IF NOT EXISTS `PagePermissionPageTypeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  `externalLink` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PagePermissionPageTypeAccessListCustom;

CREATE TABLE IF NOT EXISTS `PagePermissionPageTypeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`ctID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PagePermissionPropertyAccessList;

CREATE TABLE IF NOT EXISTS `PagePermissionPropertyAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `name` int(1) unsigned DEFAULT '0',
  `publicDateTime` int(1) unsigned DEFAULT '0',
  `uID` int(1) unsigned DEFAULT '0',
  `description` int(1) unsigned DEFAULT '0',
  `paths` int(1) unsigned DEFAULT '0',
  `attributePermission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PagePermissionPropertyAttributeAccessListCustom;

CREATE TABLE IF NOT EXISTS `PagePermissionPropertyAttributeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PagePermissionThemeAccessList;

CREATE TABLE IF NOT EXISTS `PagePermissionThemeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PagePermissionThemeAccessListCustom;

CREATE TABLE IF NOT EXISTS `PagePermissionThemeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`ptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PageSearchIndex;

CREATE TABLE IF NOT EXISTS `PageSearchIndex` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `cName` varchar(255) DEFAULT NULL,
  `cDescription` text,
  `cPath` text,
  `cDatePublic` datetime DEFAULT NULL,
  `cDateLastIndexed` datetime DEFAULT NULL,
  `cDateLastSitemapped` datetime DEFAULT NULL,
  `cRequiresReindex` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `cDateLastIndexed` (`cDateLastIndexed`),
  KEY `cDateLastSitemapped` (`cDateLastSitemapped`),
  KEY `cRequiresReindex` (`cRequiresReindex`),
  FULLTEXT KEY `cName` (`cName`),
  FULLTEXT KEY `cDescription` (`cDescription`),
  FULLTEXT KEY `content` (`content`),
  FULLTEXT KEY `content2` (`cName`,`cDescription`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO PageSearchIndex VALUES(3,'','Composer','Write for your site.','/dashboard/composer','2013-11-22 09:17:29','2013-11-22 09:17:57',NULL,0)
 ,(4,'','Write','','/dashboard/composer/write','2013-11-22 09:17:29','2013-11-22 09:17:57',NULL,0)
 ,(5,'','Drafts','','/dashboard/composer/drafts','2013-11-22 09:17:30','2013-11-22 09:17:57',NULL,0)
 ,(6,'','Sitemap','Whole world at a glance.','/dashboard/sitemap','2013-11-22 09:17:30','2013-11-22 09:17:58',NULL,0)
 ,(7,'','Full Sitemap','','/dashboard/sitemap/full','2013-11-22 09:17:30','2013-11-22 09:17:58',NULL,0)
 ,(8,'','Flat View','','/dashboard/sitemap/explore','2013-11-22 09:17:30','2013-11-22 09:17:58',NULL,0)
 ,(9,'','Page Search','','/dashboard/sitemap/search','2013-11-22 09:17:31','2013-11-22 09:17:58',NULL,0)
 ,(11,'','File Manager','','/dashboard/files/search','2013-11-22 09:17:31','2013-11-22 09:17:58',NULL,0)
 ,(12,'','Attributes','','/dashboard/files/attributes','2013-11-22 09:17:31','2013-11-22 09:17:59',NULL,0)
 ,(13,'','File Sets','','/dashboard/files/sets','2013-11-22 09:17:31','2013-11-22 09:17:59',NULL,0)
 ,(14,'','Add File Set','','/dashboard/files/add_set','2013-11-22 09:17:32','2013-11-22 09:17:59',NULL,0)
 ,(15,'','Members','Add and manage the user accounts and groups on your website.','/dashboard/users','2013-11-22 09:17:32','2013-11-22 09:17:59',NULL,0)
 ,(16,'','Search Users','','/dashboard/users/search','2013-11-22 09:17:32','2013-11-22 09:17:59',NULL,0)
 ,(17,'','User Groups','','/dashboard/users/groups','2013-11-22 09:17:32','2013-11-22 09:18:00',NULL,0)
 ,(18,'','Attributes','','/dashboard/users/attributes','2013-11-22 09:17:33','2013-11-22 09:18:00',NULL,0)
 ,(19,'','Add User','','/dashboard/users/add','2013-11-22 09:17:33','2013-11-22 09:18:00',NULL,0)
 ,(20,'','Add Group','','/dashboard/users/add_group','2013-11-22 09:17:33','2013-11-22 09:18:01',NULL,0)
 ,(21,'','Group Sets','','/dashboard/users/group_sets','2013-11-22 09:17:33','2013-11-22 09:18:01',NULL,0)
 ,(22,'','Reports','Get data from forms and logs.','/dashboard/reports','2013-11-22 09:17:34','2013-11-22 09:18:01',NULL,0)
 ,(23,'','Statistics','View your site activity.','/dashboard/reports/statistics','2013-11-22 09:17:34','2013-11-22 09:18:01',NULL,0)
 ,(24,'','Form Results','Get submission data.','/dashboard/reports/forms','2013-11-22 09:17:34','2013-11-22 09:18:01',NULL,0)
 ,(25,'','Surveys','','/dashboard/reports/surveys','2013-11-22 09:17:35','2013-11-22 09:18:02',NULL,0)
 ,(26,'','Logs','','/dashboard/reports/logs','2013-11-22 09:17:35','2013-11-22 09:18:02',NULL,0)
 ,(28,'','Themes','Reskin your site.','/dashboard/pages/themes','2013-11-22 09:17:35','2013-11-22 09:18:02',NULL,0)
 ,(29,'','Add','','/dashboard/pages/themes/add','2013-11-22 09:17:35','2013-11-22 09:18:02',NULL,0)
 ,(30,'','Inspect','','/dashboard/pages/themes/inspect','2013-11-22 09:17:36','2013-11-22 09:18:02',NULL,0)
 ,(31,'','Customize','','/dashboard/pages/themes/customize','2013-11-22 09:17:36','2013-11-22 09:18:02',NULL,0)
 ,(32,'','Page Types','What goes in your site.','/dashboard/pages/types','2013-11-22 09:17:36','2013-11-22 09:18:02',NULL,0)
 ,(34,'','Attributes','','/dashboard/pages/attributes','2013-11-22 09:17:37','2013-11-22 09:18:03',NULL,0)
 ,(35,'','Single Pages','','/dashboard/pages/single','2013-11-22 09:17:37','2013-11-22 09:18:03',NULL,0)
 ,(36,'','Workflow','','/dashboard/workflow','2013-11-22 09:17:37','2013-11-22 09:18:03',NULL,0)
 ,(37,'','Workflow List','','/dashboard/workflow/list','2013-11-22 09:17:38','2013-11-22 09:18:03',NULL,0)
 ,(38,'','Waiting for Me','','/dashboard/workflow/me','2013-11-22 09:17:38','2013-11-22 09:18:03',NULL,0)
 ,(40,'','Stacks','Share content across your site.','/dashboard/blocks/stacks','2013-11-22 09:17:38','2013-11-22 09:18:03',NULL,0)
 ,(41,'','Block & Stack Permissions','Control who can add blocks and stacks on your site.','/dashboard/blocks/permissions','2013-11-22 09:17:39','2013-11-22 09:18:04',NULL,0)
 ,(42,'','Stack List','','/dashboard/blocks/stacks/list','2013-11-22 09:17:39','2013-11-22 09:18:04',NULL,0)
 ,(43,'','Block Types','Manage the installed block types in your site.','/dashboard/blocks/types','2013-11-22 09:17:40','2013-11-22 09:18:04',NULL,0)
 ,(44,'','Extend concrete5','Connect to the concrete5 marketplace, install custom add-ons, and download updates for marketplace add-ons and themes.','/dashboard/extend','2013-11-22 09:17:40','2013-11-22 09:18:04',NULL,0)
 ,(45,'','Dashboard','','/dashboard/news','2013-11-22 09:17:40','2013-11-22 09:18:04',NULL,0)
 ,(46,'','Add Functionality','Install add-ons & themes.','/dashboard/extend/install','2013-11-22 09:17:41','2013-11-22 09:18:04',NULL,0)
 ,(47,'','Update Add-Ons','Update your installed packages.','/dashboard/extend/update','2013-11-22 09:17:41','2013-11-22 09:18:04',NULL,0)
 ,(48,'','Connect to the Community','Connect to the concrete5 community.','/dashboard/extend/connect','2013-11-22 09:17:41','2013-11-22 09:18:04',NULL,0)
 ,(49,'','Get More Themes','Download themes from concrete5.org.','/dashboard/extend/themes','2013-11-22 09:17:41','2013-11-22 09:18:04',NULL,0)
 ,(50,'','Get More Add-Ons','Download add-ons from concrete5.org.','/dashboard/extend/add-ons','2013-11-22 09:17:42','2013-11-22 09:18:04',NULL,0)
 ,(51,'','System & Settings','Secure and setup your site.','/dashboard/system','2013-11-22 09:17:42','2013-11-22 09:18:05',NULL,0)
 ,(53,'','Site Name','','/dashboard/system/basics/site_name','2013-11-22 09:17:42','2013-11-22 09:18:05',NULL,0)
 ,(54,'','Bookmark Icons','Bookmark icon and mobile home screen icon setup.','/dashboard/system/basics/icons','2013-11-22 09:17:43','2013-11-22 09:18:05',NULL,0)
 ,(55,'','Rich Text Editor','','/dashboard/system/basics/editor','2013-11-22 09:17:43','2013-11-22 09:18:05',NULL,0)
 ,(56,'','Languages','','/dashboard/system/basics/multilingual','2013-11-22 09:17:43','2013-11-22 09:18:05',NULL,0)
 ,(57,'','Time Zone','','/dashboard/system/basics/timezone','2013-11-22 09:17:43','2013-11-22 09:18:05',NULL,0)
 ,(58,'','Interface Preferences','','/dashboard/system/basics/interface','2013-11-22 09:17:44','2013-11-22 09:18:05',NULL,0)
 ,(60,'','Pretty URLs','','/dashboard/system/seo/urls','2013-11-22 09:17:44','2013-11-22 09:18:05',NULL,0)
 ,(61,'','Bulk SEO Updater','','/dashboard/system/seo/bulk_seo_tool','2013-11-22 09:17:45','2013-11-22 09:18:05',NULL,0)
 ,(62,'','Tracking Codes','','/dashboard/system/seo/tracking_codes','2013-11-22 09:17:45','2013-11-22 09:18:05',NULL,0)
 ,(63,'','Excluded URL Word List','','/dashboard/system/seo/excluded','2013-11-22 09:17:45','2013-11-22 09:18:06',NULL,0)
 ,(64,'','Statistics','','/dashboard/system/seo/statistics','2013-11-22 09:17:45','2013-11-22 09:18:06',NULL,0)
 ,(65,'','Search Index','','/dashboard/system/seo/search_index','2013-11-22 09:17:46','2013-11-22 09:18:06',NULL,0)
 ,(67,'','Cache & Speed Settings','','/dashboard/system/optimization/cache','2013-11-22 09:17:46','2013-11-22 09:18:06',NULL,0)
 ,(68,'','Clear Cache','','/dashboard/system/optimization/clear_cache','2013-11-22 09:17:47','2013-11-22 09:18:06',NULL,0)
 ,(69,'','Automated Jobs','','/dashboard/system/optimization/jobs','2013-11-22 09:17:47','2013-11-22 09:18:06',NULL,0)
 ,(71,'','Site Access','','/dashboard/system/permissions/site','2013-11-22 09:17:48','2013-11-22 09:18:06',NULL,0)
 ,(72,'','File Manager Permissions','','/dashboard/system/permissions/files','2013-11-22 09:17:48','2013-11-22 09:18:06',NULL,0)
 ,(73,'','Allowed File Types','','/dashboard/system/permissions/file_types','2013-11-22 09:17:48','2013-11-22 09:18:06',NULL,0)
 ,(74,'','Task Permissions','','/dashboard/system/permissions/tasks','2013-11-22 09:17:48','2013-11-22 09:18:06',NULL,0)
 ,(77,'','IP Blacklist','','/dashboard/system/permissions/ip_blacklist','2013-11-22 09:17:49','2013-11-22 09:18:06',NULL,0)
 ,(78,'','Captcha Setup','','/dashboard/system/permissions/captcha','2013-11-22 09:17:49','2013-11-22 09:18:07',NULL,0)
 ,(79,'','Spam Control','','/dashboard/system/permissions/antispam','2013-11-22 09:17:50','2013-11-22 09:18:07',NULL,0)
 ,(80,'','Maintenance Mode','','/dashboard/system/permissions/maintenance_mode','2013-11-22 09:17:50','2013-11-22 09:18:07',NULL,0)
 ,(82,'','Login Destination','','/dashboard/system/registration/postlogin','2013-11-22 09:17:51','2013-11-22 09:18:07',NULL,0)
 ,(83,'','Public Profiles','','/dashboard/system/registration/profiles','2013-11-22 09:17:51','2013-11-22 09:18:07',NULL,0)
 ,(84,'','Public Registration','','/dashboard/system/registration/public_registration','2013-11-22 09:17:51','2013-11-22 09:18:07',NULL,0)
 ,(85,'','Email','Control how your site send and processes mail.','/dashboard/system/mail','2013-11-22 09:17:52','2013-11-22 09:18:07',NULL,0)
 ,(86,'','SMTP Method','','/dashboard/system/mail/method','2013-11-22 09:17:52','2013-11-22 09:18:07',NULL,0)
 ,(87,'','Email Importers','','/dashboard/system/mail/importers','2013-11-22 09:17:52','2013-11-22 09:18:07',NULL,0)
 ,(88,'','Attributes','Setup attributes for pages, users, files and more.','/dashboard/system/attributes','2013-11-22 09:17:53','2013-11-22 09:18:07',NULL,0)
 ,(89,'','Sets','Group attributes into sets for easier organization','/dashboard/system/attributes/sets','2013-11-22 09:17:53','2013-11-22 09:18:07',NULL,0)
 ,(90,'','Types','Choose which attribute types are available for different items.','/dashboard/system/attributes/types','2013-11-22 09:17:53','2013-11-22 09:18:08',NULL,0)
 ,(91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0)
 ,(92,'','Environment Information','','/dashboard/system/environment/info','2013-11-22 09:17:54','2013-11-22 09:18:08',NULL,0)
 ,(93,'','Debug Settings','','/dashboard/system/environment/debug','2013-11-22 09:17:54','2013-11-22 09:18:08',NULL,0)
 ,(94,'','Logging Settings','','/dashboard/system/environment/logging','2013-11-22 09:17:54','2013-11-22 09:18:08',NULL,0)
 ,(95,'','File Storage Locations','','/dashboard/system/environment/file_storage_locations','2013-11-22 09:17:54','2013-11-22 09:18:08',NULL,0)
 ,(96,'','Proxy Server','','/dashboard/system/environment/proxy','2013-11-22 09:17:55','2013-11-22 09:18:08',NULL,0)
 ,(97,'','Backup & Restore','Backup or restore your website.','/dashboard/system/backup_restore','2013-11-22 09:17:55','2013-11-22 09:18:08',NULL,0)
 ,(99,'','Update concrete5','','/dashboard/system/backup_restore/update','2013-11-22 09:17:56','2013-11-22 09:18:08',NULL,0)
 ,(100,'','Database XML','','/dashboard/system/backup_restore/database','2013-11-22 09:17:56','2013-11-22 09:18:08',NULL,0)
 ,(105,'	Welcome to concrete5.\n						It\'s easy to edit content and add pages using in-context editing. \n						 \n							Building Your Own Site\n							 Editing with concrete5 is a breeze. Just point and click to make changes. \n							 \n							 Editor\'s Guide \n							  \n							Developing Applications\n							 If you’re comfortable in PHP concrete5 should be a breeze to learn. Take a few moments to understand the architecture. \n							 Developer\'s Guide \n							  \n							Designing Websites\n							 Good with CSS and HTML? You can easily theme anything with concrete5. \n							 \n							 Designer\'s Guide \n							  \n						\n						Business Background\n						 Worried about license structures, white-labeling or why concrete5 is a good choice for your agency? \n						 Executive\'s Guide \n						  ','Welcome to concrete5','Learn about how to use concrete5, how to develop for concrete5, and get general help.','/dashboard/welcome','2013-11-22 09:17:56','2013-11-22 09:18:09',NULL,0)
 ,(106,'','Customize Dashboard Home','','/dashboard/home','2013-11-22 09:17:57','2013-11-22 09:18:10',NULL,0)
 ,(1,'\r\n We believe we can make a difference in your personal and financial life. As the leaders in All-of-Life Financial Care we create lifelong financial blueprints - a tailored personal investment strategy leading the way to financial security. Our All-of-Life approach, expert advisers and unique financial strategy converts confusion into knowledge, opportunity into success, and commitment into absolute trust. Give us the opportunity to sit down with you and show you how. \r\n  ','Home','',NULL,'2013-11-22 09:17:21','2013-11-22 15:54:16',NULL,0)
 ,(123,'','Homepage','','/homepage','2013-11-22 09:53:00','2013-11-22 09:53:52',NULL,0)
 ,(124,'','Services','','/services','2013-11-22 13:43:00','2013-11-22 14:49:57',NULL,0)
 ,(125,'','People','','/people','2013-11-22 13:48:00','2013-11-22 13:48:27',NULL,0)
 ,(126,'','Contact us','','/contact-us','2013-11-22 13:48:00','2013-11-22 13:48:51',NULL,0);

DROP TABLE IF EXISTS PageStatistics;

CREATE TABLE IF NOT EXISTS `PageStatistics` (
  `pstID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pstID`),
  KEY `cID` (`cID`),
  KEY `date` (`date`),
  KEY `uID` (`uID`)
) ENGINE=MyISAM AUTO_INCREMENT=724 DEFAULT CHARSET=utf8;

INSERT INTO PageStatistics VALUES(1,1,'2013-11-22','2013-11-22 20:20:04',1)
 ,(2,105,'2013-11-22','2013-11-22 20:20:04',1)
 ,(3,2,'2013-11-22','2013-11-22 20:20:21',1)
 ,(4,28,'2013-11-22','2013-11-22 20:20:24',1)
 ,(5,28,'2013-11-22','2013-11-22 20:20:27',1)
 ,(6,30,'2013-11-22','2013-11-22 20:20:27',1)
 ,(7,30,'2013-11-22','2013-11-22 20:20:44',1)
 ,(8,28,'2013-11-22','2013-11-22 20:21:01',1)
 ,(9,28,'2013-11-22','2013-11-22 20:21:05',1)
 ,(10,28,'2013-11-22','2013-11-22 20:21:09',1)
 ,(11,30,'2013-11-22','2013-11-22 20:21:14',1)
 ,(12,28,'2013-11-22','2013-11-22 20:21:18',1)
 ,(13,1,'2013-11-22','2013-11-22 20:21:27',1)
 ,(14,1,'2013-11-22','2013-11-22 20:21:37',1)
 ,(15,1,'2013-11-22','2013-11-22 20:22:16',1)
 ,(16,1,'2013-11-22','2013-11-22 20:39:03',1)
 ,(17,1,'2013-11-22','2013-11-22 20:39:04',1)
 ,(18,1,'2013-11-22','2013-11-22 20:39:10',1)
 ,(19,1,'2013-11-22','2013-11-22 20:39:12',1)
 ,(20,1,'2013-11-22','2013-11-22 20:40:26',1)
 ,(21,1,'2013-11-22','2013-11-22 20:41:17',1)
 ,(22,1,'2013-11-22','2013-11-22 20:41:53',1)
 ,(23,1,'2013-11-22','2013-11-22 20:46:26',1)
 ,(24,2,'2013-11-22','2013-11-22 20:47:51',1)
 ,(25,32,'2013-11-22','2013-11-22 20:48:01',1)
 ,(26,2,'2013-11-22','2013-11-22 20:48:07',1)
 ,(27,28,'2013-11-22','2013-11-22 20:48:09',1)
 ,(28,2,'2013-11-22','2013-11-22 20:48:13',1)
 ,(29,5,'2013-11-22','2013-11-22 20:48:19',1)
 ,(30,2,'2013-11-22','2013-11-22 20:48:24',1)
 ,(31,8,'2013-11-22','2013-11-22 20:48:30',1)
 ,(32,2,'2013-11-22','2013-11-22 20:48:35',1)
 ,(33,4,'2013-11-22','2013-11-22 20:48:36',1)
 ,(34,2,'2013-11-22','2013-11-22 20:48:42',1)
 ,(35,32,'2013-11-22','2013-11-22 20:48:44',1)
 ,(36,33,'2013-11-22','2013-11-22 20:48:46',1)
 ,(37,27,'2013-11-22','2013-11-22 20:50:00',1)
 ,(38,2,'2013-11-22','2013-11-22 20:50:03',1)
 ,(39,28,'2013-11-22','2013-11-22 20:50:07',1)
 ,(40,2,'2013-11-22','2013-11-22 20:50:13',1)
 ,(41,32,'2013-11-22','2013-11-22 20:52:23',1)
 ,(42,33,'2013-11-22','2013-11-22 20:52:26',1)
 ,(43,33,'2013-11-22','2013-11-22 20:52:54',1)
 ,(44,32,'2013-11-22','2013-11-22 20:52:54',1)
 ,(45,101,'2013-11-22','2013-11-22 20:53:02',1)
 ,(46,101,'2013-11-22','2013-11-22 20:53:18',1)
 ,(47,101,'2013-11-22','2013-11-22 20:53:18',1)
 ,(48,27,'2013-11-22','2013-11-22 20:53:21',1)
 ,(49,2,'2013-11-22','2013-11-22 20:53:24',1)
 ,(50,4,'2013-11-22','2013-11-22 20:53:26',1)
 ,(51,4,'2013-11-22','2013-11-22 20:53:26',1)
 ,(52,4,'2013-11-22','2013-11-22 20:53:26',1)
 ,(53,4,'2013-11-22','2013-11-22 20:53:33',1)
 ,(54,4,'2013-11-22','2013-11-22 20:53:40',1)
 ,(55,4,'2013-11-22','2013-11-22 20:53:40',1)
 ,(56,4,'2013-11-22','2013-11-22 20:53:47',1)
 ,(57,4,'2013-11-22','2013-11-22 20:53:50',1)
 ,(58,123,'2013-11-22','2013-11-22 20:53:51',1)
 ,(59,123,'2013-11-22','2013-11-22 20:54:26',1)
 ,(60,1,'2013-11-22','2013-11-22 20:54:54',1)
 ,(61,2,'2013-11-22','2013-11-22 20:57:05',1)
 ,(62,1,'2013-11-22','2013-11-22 20:57:27',1)
 ,(63,1,'2013-11-22','2013-11-22 20:57:29',1)
 ,(64,1,'2013-11-22','2013-11-22 20:57:42',1)
 ,(65,1,'2013-11-22','2013-11-22 20:57:48',1)
 ,(66,1,'2013-11-22','2013-11-22 20:57:51',1)
 ,(67,32,'2013-11-22','2013-11-22 20:58:06',1)
 ,(68,32,'2013-11-22','2013-11-22 20:58:12',1)
 ,(69,32,'2013-11-22','2013-11-22 20:58:22',1)
 ,(70,32,'2013-11-22','2013-11-22 20:58:29',1)
 ,(71,32,'2013-11-22','2013-11-22 20:58:29',1)
 ,(72,1,'2013-11-22','2013-11-22 21:03:22',1)
 ,(73,1,'2013-11-22','2013-11-22 21:03:24',1)
 ,(74,1,'2013-11-22','2013-11-22 21:03:43',1)
 ,(75,1,'2013-11-22','2013-11-22 21:03:46',1)
 ,(76,1,'2013-11-22','2013-11-22 21:04:05',1)
 ,(77,1,'2013-11-22','2013-11-22 21:04:10',1)
 ,(78,1,'2013-11-22','2013-11-22 21:04:13',1)
 ,(79,1,'2013-11-22','2013-11-22 21:04:14',1)
 ,(80,1,'2013-11-22','2013-11-22 21:04:17',1)
 ,(81,1,'2013-11-22','2013-11-22 21:04:18',1)
 ,(82,1,'2013-11-22','2013-11-22 21:04:22',1)
 ,(83,1,'2013-11-22','2013-11-22 21:04:24',1)
 ,(84,1,'2013-11-22','2013-11-22 21:04:25',1)
 ,(85,32,'2013-11-22','2013-11-22 21:04:35',1)
 ,(86,122,'2013-11-22','2013-11-22 21:04:35',1)
 ,(87,32,'2013-11-22','2013-11-22 21:04:45',1)
 ,(88,1,'2013-11-22','2013-11-22 21:05:40',1)
 ,(89,1,'2013-11-22','2013-11-22 21:05:41',1)
 ,(90,2,'2013-11-22','2013-11-22 21:05:44',1)
 ,(91,32,'2013-11-22','2013-11-22 21:05:47',1)
 ,(92,32,'2013-11-22','2013-11-22 21:05:50',1)
 ,(93,32,'2013-11-22','2013-11-22 21:05:57',1)
 ,(94,32,'2013-11-22','2013-11-22 21:05:57',1)
 ,(95,32,'2013-11-22','2013-11-22 21:06:01',1)
 ,(96,122,'2013-11-22','2013-11-22 21:06:01',1)
 ,(97,32,'2013-11-22','2013-11-22 21:06:04',1)
 ,(98,2,'2013-11-22','2013-11-22 21:08:18',1)
 ,(99,51,'2013-11-22','2013-11-22 21:08:25',1)
 ,(100,68,'2013-11-22','2013-11-22 21:08:29',1)
 ,(101,68,'2013-11-22','2013-11-22 21:08:31',1)
 ,(102,68,'2013-11-22','2013-11-22 21:08:31',1)
 ,(103,1,'2013-11-22','2013-11-22 21:08:35',1)
 ,(104,1,'2013-11-22','2013-11-22 21:08:38',1)
 ,(105,1,'2013-11-22','2013-11-22 21:08:41',1)
 ,(106,1,'2013-11-22','2013-11-22 21:08:44',1)
 ,(107,1,'2013-11-22','2013-11-22 21:08:45',1)
 ,(108,1,'2013-11-22','2013-11-22 21:08:50',1)
 ,(109,51,'2013-11-22','2013-11-22 21:08:58',1)
 ,(110,67,'2013-11-22','2013-11-22 21:09:00',1)
 ,(111,67,'2013-11-22','2013-11-22 21:09:11',1)
 ,(112,67,'2013-11-22','2013-11-22 21:09:11',1)
 ,(113,51,'2013-11-22','2013-11-22 21:09:14',1)
 ,(114,1,'2013-11-22','2013-11-22 21:11:44',1)
 ,(115,1,'2013-11-22','2013-11-22 21:11:46',1)
 ,(116,1,'2013-11-22','2013-11-22 21:11:46',1)
 ,(117,1,'2013-11-22','2013-11-22 21:11:46',1)
 ,(118,1,'2013-11-22','2013-11-22 21:11:47',1)
 ,(119,1,'2013-11-22','2013-11-22 21:11:50',1)
 ,(120,68,'2013-11-22','2013-11-22 21:11:59',1)
 ,(121,68,'2013-11-22','2013-11-22 21:12:00',1)
 ,(122,68,'2013-11-22','2013-11-22 21:12:00',1)
 ,(123,1,'2013-11-22','2013-11-22 21:12:03',1)
 ,(124,1,'2013-11-22','2013-11-22 21:12:08',1)
 ,(125,68,'2013-11-22','2013-11-22 21:35:39',1)
 ,(126,68,'2013-11-22','2013-11-22 21:35:40',1)
 ,(127,51,'2013-11-22','2013-11-22 21:35:42',1)
 ,(128,2,'2013-11-22','2013-11-22 21:35:44',1)
 ,(129,2,'2013-11-22','2013-11-22 21:35:45',1)
 ,(130,13,'2013-11-22','2013-11-22 21:35:48',1)
 ,(131,14,'2013-11-22','2013-11-22 21:35:50',1)
 ,(132,14,'2013-11-22','2013-11-22 21:36:06',1)
 ,(133,13,'2013-11-22','2013-11-22 21:36:06',1)
 ,(134,13,'2013-11-22','2013-11-22 21:36:09',1)
 ,(135,2,'2013-11-22','2013-11-22 21:36:14',1)
 ,(136,11,'2013-11-22','2013-11-22 21:36:15',1)
 ,(137,1,'2013-11-22','2013-11-22 21:37:30',1)
 ,(138,1,'2013-11-22','2013-11-22 21:38:04',1)
 ,(139,1,'2013-11-22','2013-11-22 21:38:58',1)
 ,(140,119,'2013-11-22','2013-11-22 21:38:58',1)
 ,(141,119,'2013-11-22','2013-11-22 21:38:58',1)
 ,(142,119,'2013-11-22','2013-11-22 21:38:58',1)
 ,(143,119,'2013-11-22','2013-11-22 21:40:02',0)
 ,(144,119,'2013-11-22','2013-11-22 21:41:29',0)
 ,(145,119,'2013-11-22','2013-11-22 21:43:17',0)
 ,(146,119,'2013-11-22','2013-11-22 21:43:29',0)
 ,(147,119,'2013-11-22','2013-11-22 21:43:55',0)
 ,(148,1,'2013-11-22','2013-11-22 21:48:37',1)
 ,(149,119,'2013-11-22','2013-11-22 21:48:37',1)
 ,(150,119,'2013-11-22','2013-11-22 21:48:37',1)
 ,(151,119,'2013-11-22','2013-11-22 21:48:37',1)
 ,(152,1,'2013-11-22','2013-11-22 21:49:00',1)
 ,(153,119,'2013-11-22','2013-11-22 21:49:01',1)
 ,(154,119,'2013-11-22','2013-11-22 21:49:01',1)
 ,(155,119,'2013-11-22','2013-11-22 21:49:01',1)
 ,(156,1,'2013-11-22','2013-11-22 21:49:12',1)
 ,(157,119,'2013-11-22','2013-11-22 21:49:13',1)
 ,(158,119,'2013-11-22','2013-11-22 21:49:13',1)
 ,(159,119,'2013-11-22','2013-11-22 21:49:13',1)
 ,(160,1,'2013-11-22','2013-11-22 23:29:55',1)
 ,(161,119,'2013-11-22','2013-11-22 23:29:56',1)
 ,(162,119,'2013-11-22','2013-11-22 23:29:56',1)
 ,(163,119,'2013-11-22','2013-11-22 23:29:56',1)
 ,(164,1,'2013-11-23','2013-11-23 00:01:27',1)
 ,(165,119,'2013-11-23','2013-11-23 00:01:27',1)
 ,(166,119,'2013-11-23','2013-11-23 00:01:27',1)
 ,(167,119,'2013-11-23','2013-11-23 00:01:27',1)
 ,(168,1,'2013-11-23','2013-11-23 00:02:03',1)
 ,(169,119,'2013-11-23','2013-11-23 00:02:04',1)
 ,(170,119,'2013-11-23','2013-11-23 00:02:04',1)
 ,(171,119,'2013-11-23','2013-11-23 00:02:04',1)
 ,(172,1,'2013-11-23','2013-11-23 00:02:13',1)
 ,(173,119,'2013-11-23','2013-11-23 00:02:13',1)
 ,(174,119,'2013-11-23','2013-11-23 00:02:13',1)
 ,(175,119,'2013-11-23','2013-11-23 00:02:14',1)
 ,(176,1,'2013-11-23','2013-11-23 00:04:50',1)
 ,(177,119,'2013-11-23','2013-11-23 00:04:50',1)
 ,(178,119,'2013-11-23','2013-11-23 00:04:50',1)
 ,(179,119,'2013-11-23','2013-11-23 00:04:50',1)
 ,(180,1,'2013-11-23','2013-11-23 00:05:39',1)
 ,(181,119,'2013-11-23','2013-11-23 00:05:39',1)
 ,(182,119,'2013-11-23','2013-11-23 00:05:39',1)
 ,(183,119,'2013-11-23','2013-11-23 00:05:39',1)
 ,(184,1,'2013-11-23','2013-11-23 00:05:56',1)
 ,(185,119,'2013-11-23','2013-11-23 00:05:56',1)
 ,(186,119,'2013-11-23','2013-11-23 00:05:56',1)
 ,(187,119,'2013-11-23','2013-11-23 00:05:57',1)
 ,(188,1,'2013-11-23','2013-11-23 00:06:21',1)
 ,(189,119,'2013-11-23','2013-11-23 00:06:21',1)
 ,(190,119,'2013-11-23','2013-11-23 00:06:21',1)
 ,(191,119,'2013-11-23','2013-11-23 00:06:21',1)
 ,(192,1,'2013-11-23','2013-11-23 00:42:43',1)
 ,(193,119,'2013-11-23','2013-11-23 00:42:44',1)
 ,(194,119,'2013-11-23','2013-11-23 00:42:44',1)
 ,(195,119,'2013-11-23','2013-11-23 00:42:44',1)
 ,(196,1,'2013-11-23','2013-11-23 00:42:54',1)
 ,(197,119,'2013-11-23','2013-11-23 00:42:55',1)
 ,(198,119,'2013-11-23','2013-11-23 00:42:55',1)
 ,(199,119,'2013-11-23','2013-11-23 00:42:55',1)
 ,(200,2,'2013-11-23','2013-11-23 00:42:56',1)
 ,(201,4,'2013-11-23','2013-11-23 00:43:00',1)
 ,(202,4,'2013-11-23','2013-11-23 00:43:00',1)
 ,(203,4,'2013-11-23','2013-11-23 00:43:01',1)
 ,(204,4,'2013-11-23','2013-11-23 00:43:08',1)
 ,(205,4,'2013-11-23','2013-11-23 00:43:15',1)
 ,(206,4,'2013-11-23','2013-11-23 00:43:22',1)
 ,(207,4,'2013-11-23','2013-11-23 00:43:35',1)
 ,(208,4,'2013-11-23','2013-11-23 00:43:35',1)
 ,(209,124,'2013-11-23','2013-11-23 00:43:35',1)
 ,(210,119,'2013-11-23','2013-11-23 00:43:36',1)
 ,(211,119,'2013-11-23','2013-11-23 00:43:36',1)
 ,(212,119,'2013-11-23','2013-11-23 00:43:36',1)
 ,(213,1,'2013-11-23','2013-11-23 00:43:42',1)
 ,(214,119,'2013-11-23','2013-11-23 00:43:42',1)
 ,(215,119,'2013-11-23','2013-11-23 00:43:42',1)
 ,(216,119,'2013-11-23','2013-11-23 00:43:42',1)
 ,(217,2,'2013-11-23','2013-11-23 00:48:10',1)
 ,(218,4,'2013-11-23','2013-11-23 00:48:12',1)
 ,(219,4,'2013-11-23','2013-11-23 00:48:12',1)
 ,(220,4,'2013-11-23','2013-11-23 00:48:12',1)
 ,(221,4,'2013-11-23','2013-11-23 00:48:19',1)
 ,(222,4,'2013-11-23','2013-11-23 00:48:24',1)
 ,(223,4,'2013-11-23','2013-11-23 00:48:26',1)
 ,(224,125,'2013-11-23','2013-11-23 00:48:26',1)
 ,(225,119,'2013-11-23','2013-11-23 00:48:27',1)
 ,(226,119,'2013-11-23','2013-11-23 00:48:27',1)
 ,(227,119,'2013-11-23','2013-11-23 00:48:27',1)
 ,(228,2,'2013-11-23','2013-11-23 00:48:35',1)
 ,(229,4,'2013-11-23','2013-11-23 00:48:37',1)
 ,(230,4,'2013-11-23','2013-11-23 00:48:37',1)
 ,(231,4,'2013-11-23','2013-11-23 00:48:37',1)
 ,(232,4,'2013-11-23','2013-11-23 00:48:45',1)
 ,(233,4,'2013-11-23','2013-11-23 00:48:49',1)
 ,(234,4,'2013-11-23','2013-11-23 00:48:49',1)
 ,(235,126,'2013-11-23','2013-11-23 00:48:50',1)
 ,(236,119,'2013-11-23','2013-11-23 00:48:50',1)
 ,(237,119,'2013-11-23','2013-11-23 00:48:51',1)
 ,(238,119,'2013-11-23','2013-11-23 00:48:51',1)
 ,(239,1,'2013-11-23','2013-11-23 00:48:59',1)
 ,(240,119,'2013-11-23','2013-11-23 00:49:00',1)
 ,(241,119,'2013-11-23','2013-11-23 00:49:00',1)
 ,(242,119,'2013-11-23','2013-11-23 00:49:00',1)
 ,(243,124,'2013-11-23','2013-11-23 00:49:01',1)
 ,(244,119,'2013-11-23','2013-11-23 00:49:01',1)
 ,(245,119,'2013-11-23','2013-11-23 00:49:01',1)
 ,(246,119,'2013-11-23','2013-11-23 00:49:01',1)
 ,(247,125,'2013-11-23','2013-11-23 00:49:02',1)
 ,(248,119,'2013-11-23','2013-11-23 00:49:02',1)
 ,(249,119,'2013-11-23','2013-11-23 00:49:02',1)
 ,(250,119,'2013-11-23','2013-11-23 00:49:02',1)
 ,(251,126,'2013-11-23','2013-11-23 00:49:03',1)
 ,(252,119,'2013-11-23','2013-11-23 00:49:03',1)
 ,(253,119,'2013-11-23','2013-11-23 00:49:03',1)
 ,(254,119,'2013-11-23','2013-11-23 00:49:04',1)
 ,(255,1,'2013-11-23','2013-11-23 00:49:04',1)
 ,(256,119,'2013-11-23','2013-11-23 00:49:04',1)
 ,(257,119,'2013-11-23','2013-11-23 00:49:04',1)
 ,(258,119,'2013-11-23','2013-11-23 00:49:05',1)
 ,(259,1,'2013-11-23','2013-11-23 00:50:58',1)
 ,(260,119,'2013-11-23','2013-11-23 00:50:59',1)
 ,(261,119,'2013-11-23','2013-11-23 00:50:59',1)
 ,(262,119,'2013-11-23','2013-11-23 00:50:59',1)
 ,(263,1,'2013-11-23','2013-11-23 00:51:18',1)
 ,(264,119,'2013-11-23','2013-11-23 00:51:18',1)
 ,(265,119,'2013-11-23','2013-11-23 00:51:18',1)
 ,(266,119,'2013-11-23','2013-11-23 00:51:19',1)
 ,(267,124,'2013-11-23','2013-11-23 00:51:21',1)
 ,(268,119,'2013-11-23','2013-11-23 00:51:21',1)
 ,(269,119,'2013-11-23','2013-11-23 00:51:21',1)
 ,(270,119,'2013-11-23','2013-11-23 00:51:22',1)
 ,(271,125,'2013-11-23','2013-11-23 00:51:22',1)
 ,(272,119,'2013-11-23','2013-11-23 00:51:22',1)
 ,(273,119,'2013-11-23','2013-11-23 00:51:22',1)
 ,(274,119,'2013-11-23','2013-11-23 00:51:23',1)
 ,(275,1,'2013-11-23','2013-11-23 00:51:23',1)
 ,(276,119,'2013-11-23','2013-11-23 00:51:24',1)
 ,(277,119,'2013-11-23','2013-11-23 00:51:24',1)
 ,(278,119,'2013-11-23','2013-11-23 00:51:24',1)
 ,(279,1,'2013-11-23','2013-11-23 00:53:47',1)
 ,(280,119,'2013-11-23','2013-11-23 00:53:48',1)
 ,(281,119,'2013-11-23','2013-11-23 00:53:48',1)
 ,(282,119,'2013-11-23','2013-11-23 00:53:48',1)
 ,(283,124,'2013-11-23','2013-11-23 00:53:49',1)
 ,(284,119,'2013-11-23','2013-11-23 00:53:49',1)
 ,(285,119,'2013-11-23','2013-11-23 00:53:49',1)
 ,(286,119,'2013-11-23','2013-11-23 00:53:50',1)
 ,(287,125,'2013-11-23','2013-11-23 00:53:50',1)
 ,(288,119,'2013-11-23','2013-11-23 00:53:50',1)
 ,(289,119,'2013-11-23','2013-11-23 00:53:51',1)
 ,(290,119,'2013-11-23','2013-11-23 00:53:51',1)
 ,(291,126,'2013-11-23','2013-11-23 00:53:52',1)
 ,(292,119,'2013-11-23','2013-11-23 00:53:52',1)
 ,(293,119,'2013-11-23','2013-11-23 00:53:52',1)
 ,(294,119,'2013-11-23','2013-11-23 00:53:52',1)
 ,(295,1,'2013-11-23','2013-11-23 00:53:53',1)
 ,(296,119,'2013-11-23','2013-11-23 00:53:53',1)
 ,(297,119,'2013-11-23','2013-11-23 00:53:53',1)
 ,(298,119,'2013-11-23','2013-11-23 00:53:53',1)
 ,(299,124,'2013-11-23','2013-11-23 00:53:54',1)
 ,(300,119,'2013-11-23','2013-11-23 00:53:54',1)
 ,(301,119,'2013-11-23','2013-11-23 00:53:54',1)
 ,(302,119,'2013-11-23','2013-11-23 00:53:54',1)
 ,(303,125,'2013-11-23','2013-11-23 00:53:55',1)
 ,(304,119,'2013-11-23','2013-11-23 00:53:55',1)
 ,(305,119,'2013-11-23','2013-11-23 00:53:55',1)
 ,(306,119,'2013-11-23','2013-11-23 00:53:55',1)
 ,(307,126,'2013-11-23','2013-11-23 00:53:56',1)
 ,(308,119,'2013-11-23','2013-11-23 00:53:56',1)
 ,(309,119,'2013-11-23','2013-11-23 00:53:56',1)
 ,(310,119,'2013-11-23','2013-11-23 00:53:56',1)
 ,(311,124,'2013-11-23','2013-11-23 00:53:57',1)
 ,(312,119,'2013-11-23','2013-11-23 00:53:57',1)
 ,(313,119,'2013-11-23','2013-11-23 00:53:57',1)
 ,(314,119,'2013-11-23','2013-11-23 00:53:57',1)
 ,(315,1,'2013-11-23','2013-11-23 00:53:58',1)
 ,(316,119,'2013-11-23','2013-11-23 00:53:59',1)
 ,(317,119,'2013-11-23','2013-11-23 00:53:59',1)
 ,(318,119,'2013-11-23','2013-11-23 00:53:59',1)
 ,(319,124,'2013-11-23','2013-11-23 00:54:00',1)
 ,(320,119,'2013-11-23','2013-11-23 00:54:00',1)
 ,(321,119,'2013-11-23','2013-11-23 00:54:00',1)
 ,(322,119,'2013-11-23','2013-11-23 00:54:00',1)
 ,(323,125,'2013-11-23','2013-11-23 00:54:00',1)
 ,(324,119,'2013-11-23','2013-11-23 00:54:01',1)
 ,(325,119,'2013-11-23','2013-11-23 00:54:01',1)
 ,(326,119,'2013-11-23','2013-11-23 00:54:01',1)
 ,(327,126,'2013-11-23','2013-11-23 00:54:01',1)
 ,(328,119,'2013-11-23','2013-11-23 00:54:02',1)
 ,(329,119,'2013-11-23','2013-11-23 00:54:02',1)
 ,(330,119,'2013-11-23','2013-11-23 00:54:02',1)
 ,(331,1,'2013-11-23','2013-11-23 00:54:03',1)
 ,(332,119,'2013-11-23','2013-11-23 00:54:03',1)
 ,(333,119,'2013-11-23','2013-11-23 00:54:03',1)
 ,(334,119,'2013-11-23','2013-11-23 00:54:03',1)
 ,(335,124,'2013-11-23','2013-11-23 00:54:04',1)
 ,(336,119,'2013-11-23','2013-11-23 00:54:04',1)
 ,(337,119,'2013-11-23','2013-11-23 00:54:05',1)
 ,(338,119,'2013-11-23','2013-11-23 00:54:05',1)
 ,(339,1,'2013-11-23','2013-11-23 00:54:06',1)
 ,(340,119,'2013-11-23','2013-11-23 00:54:06',1)
 ,(341,119,'2013-11-23','2013-11-23 00:54:06',1)
 ,(342,119,'2013-11-23','2013-11-23 00:54:06',1)
 ,(343,126,'2013-11-23','2013-11-23 00:54:07',1)
 ,(344,119,'2013-11-23','2013-11-23 00:54:07',1)
 ,(345,119,'2013-11-23','2013-11-23 00:54:07',1)
 ,(346,119,'2013-11-23','2013-11-23 00:54:07',1)
 ,(347,125,'2013-11-23','2013-11-23 00:54:08',1)
 ,(348,119,'2013-11-23','2013-11-23 00:54:08',1)
 ,(349,119,'2013-11-23','2013-11-23 00:54:08',1)
 ,(350,119,'2013-11-23','2013-11-23 00:54:08',1)
 ,(351,124,'2013-11-23','2013-11-23 00:54:09',1)
 ,(352,119,'2013-11-23','2013-11-23 00:54:09',1)
 ,(353,119,'2013-11-23','2013-11-23 00:54:09',1)
 ,(354,119,'2013-11-23','2013-11-23 00:54:09',1)
 ,(355,1,'2013-11-23','2013-11-23 00:54:10',1)
 ,(356,119,'2013-11-23','2013-11-23 00:54:10',1)
 ,(357,119,'2013-11-23','2013-11-23 00:54:10',1)
 ,(358,119,'2013-11-23','2013-11-23 00:54:10',1)
 ,(359,125,'2013-11-23','2013-11-23 00:54:11',1)
 ,(360,119,'2013-11-23','2013-11-23 00:54:11',1)
 ,(361,119,'2013-11-23','2013-11-23 00:54:11',1)
 ,(362,119,'2013-11-23','2013-11-23 00:54:12',1)
 ,(363,1,'2013-11-23','2013-11-23 00:54:12',1)
 ,(364,119,'2013-11-23','2013-11-23 00:54:12',1)
 ,(365,119,'2013-11-23','2013-11-23 00:54:12',1)
 ,(366,119,'2013-11-23','2013-11-23 00:54:12',1)
 ,(367,124,'2013-11-23','2013-11-23 00:55:07',1)
 ,(368,119,'2013-11-23','2013-11-23 00:55:07',1)
 ,(369,119,'2013-11-23','2013-11-23 00:55:08',1)
 ,(370,119,'2013-11-23','2013-11-23 00:55:08',1)
 ,(371,125,'2013-11-23','2013-11-23 00:55:08',1)
 ,(372,119,'2013-11-23','2013-11-23 00:55:08',1)
 ,(373,119,'2013-11-23','2013-11-23 00:55:09',1)
 ,(374,119,'2013-11-23','2013-11-23 00:55:09',1)
 ,(375,126,'2013-11-23','2013-11-23 00:55:09',1)
 ,(376,119,'2013-11-23','2013-11-23 00:55:10',1)
 ,(377,119,'2013-11-23','2013-11-23 00:55:10',1)
 ,(378,119,'2013-11-23','2013-11-23 00:55:10',1)
 ,(379,1,'2013-11-23','2013-11-23 00:55:10',1)
 ,(380,119,'2013-11-23','2013-11-23 00:55:11',1)
 ,(381,119,'2013-11-23','2013-11-23 00:55:11',1)
 ,(382,119,'2013-11-23','2013-11-23 00:55:11',1)
 ,(383,1,'2013-11-23','2013-11-23 00:55:11',1)
 ,(384,119,'2013-11-23','2013-11-23 00:55:12',1)
 ,(385,119,'2013-11-23','2013-11-23 00:55:12',1)
 ,(386,124,'2013-11-23','2013-11-23 00:55:13',1)
 ,(387,119,'2013-11-23','2013-11-23 00:55:13',1)
 ,(388,119,'2013-11-23','2013-11-23 00:55:13',1)
 ,(389,119,'2013-11-23','2013-11-23 00:55:13',1)
 ,(390,1,'2013-11-23','2013-11-23 00:55:14',1)
 ,(391,119,'2013-11-23','2013-11-23 00:55:14',1)
 ,(392,119,'2013-11-23','2013-11-23 00:55:14',1)
 ,(393,119,'2013-11-23','2013-11-23 00:55:14',1)
 ,(394,124,'2013-11-23','2013-11-23 00:55:20',1)
 ,(395,119,'2013-11-23','2013-11-23 00:55:20',1)
 ,(396,119,'2013-11-23','2013-11-23 00:55:20',1)
 ,(397,119,'2013-11-23','2013-11-23 00:55:20',1)
 ,(398,125,'2013-11-23','2013-11-23 00:55:21',1)
 ,(399,119,'2013-11-23','2013-11-23 00:55:21',1)
 ,(400,119,'2013-11-23','2013-11-23 00:55:21',1)
 ,(401,119,'2013-11-23','2013-11-23 00:55:21',1)
 ,(402,126,'2013-11-23','2013-11-23 00:55:21',1)
 ,(403,119,'2013-11-23','2013-11-23 00:55:22',1)
 ,(404,119,'2013-11-23','2013-11-23 00:55:22',1)
 ,(405,119,'2013-11-23','2013-11-23 00:55:22',1)
 ,(406,1,'2013-11-23','2013-11-23 00:55:22',1)
 ,(407,119,'2013-11-23','2013-11-23 00:55:23',1)
 ,(408,119,'2013-11-23','2013-11-23 00:55:23',1)
 ,(409,119,'2013-11-23','2013-11-23 00:55:23',1)
 ,(410,1,'2013-11-23','2013-11-23 01:02:04',1)
 ,(411,119,'2013-11-23','2013-11-23 01:02:05',1)
 ,(412,119,'2013-11-23','2013-11-23 01:02:05',1)
 ,(413,119,'2013-11-23','2013-11-23 01:02:05',1)
 ,(414,1,'2013-11-23','2013-11-23 01:03:36',1)
 ,(415,119,'2013-11-23','2013-11-23 01:03:36',1)
 ,(416,119,'2013-11-23','2013-11-23 01:03:36',1)
 ,(417,119,'2013-11-23','2013-11-23 01:03:36',1)
 ,(418,1,'2013-11-23','2013-11-23 01:04:09',1)
 ,(419,119,'2013-11-23','2013-11-23 01:04:10',1)
 ,(420,119,'2013-11-23','2013-11-23 01:04:10',1)
 ,(421,119,'2013-11-23','2013-11-23 01:04:10',1)
 ,(422,1,'2013-11-23','2013-11-23 01:06:01',1)
 ,(423,119,'2013-11-23','2013-11-23 01:06:01',1)
 ,(424,119,'2013-11-23','2013-11-23 01:06:02',1)
 ,(425,119,'2013-11-23','2013-11-23 01:06:02',1)
 ,(426,126,'2013-11-23','2013-11-23 01:08:14',1)
 ,(427,119,'2013-11-23','2013-11-23 01:08:14',1)
 ,(428,119,'2013-11-23','2013-11-23 01:08:15',1)
 ,(429,119,'2013-11-23','2013-11-23 01:08:15',1)
 ,(430,1,'2013-11-23','2013-11-23 01:08:17',1)
 ,(431,119,'2013-11-23','2013-11-23 01:08:17',1)
 ,(432,119,'2013-11-23','2013-11-23 01:08:17',1)
 ,(433,119,'2013-11-23','2013-11-23 01:08:17',1)
 ,(434,1,'2013-11-23','2013-11-23 01:08:18',1)
 ,(435,119,'2013-11-23','2013-11-23 01:08:19',1)
 ,(436,119,'2013-11-23','2013-11-23 01:08:19',1)
 ,(437,119,'2013-11-23','2013-11-23 01:08:19',1)
 ,(438,1,'2013-11-23','2013-11-23 01:08:55',1)
 ,(439,119,'2013-11-23','2013-11-23 01:08:56',1)
 ,(440,119,'2013-11-23','2013-11-23 01:08:56',1)
 ,(441,119,'2013-11-23','2013-11-23 01:08:56',1)
 ,(442,1,'2013-11-23','2013-11-23 01:09:21',1)
 ,(443,119,'2013-11-23','2013-11-23 01:09:21',1)
 ,(444,119,'2013-11-23','2013-11-23 01:09:21',1)
 ,(445,119,'2013-11-23','2013-11-23 01:09:21',1)
 ,(446,1,'2013-11-23','2013-11-23 01:09:33',1)
 ,(447,119,'2013-11-23','2013-11-23 01:09:34',1)
 ,(448,119,'2013-11-23','2013-11-23 01:09:34',1)
 ,(449,119,'2013-11-23','2013-11-23 01:09:34',1)
 ,(450,124,'2013-11-23','2013-11-23 01:09:38',1)
 ,(451,119,'2013-11-23','2013-11-23 01:09:38',1)
 ,(452,119,'2013-11-23','2013-11-23 01:09:39',1)
 ,(453,119,'2013-11-23','2013-11-23 01:09:39',1)
 ,(454,1,'2013-11-23','2013-11-23 01:09:39',1)
 ,(455,119,'2013-11-23','2013-11-23 01:09:40',1)
 ,(456,119,'2013-11-23','2013-11-23 01:09:40',1)
 ,(457,119,'2013-11-23','2013-11-23 01:09:40',1)
 ,(458,125,'2013-11-23','2013-11-23 01:09:41',1)
 ,(459,119,'2013-11-23','2013-11-23 01:09:41',1)
 ,(460,119,'2013-11-23','2013-11-23 01:09:41',1)
 ,(461,119,'2013-11-23','2013-11-23 01:09:41',1)
 ,(462,126,'2013-11-23','2013-11-23 01:09:42',1)
 ,(463,119,'2013-11-23','2013-11-23 01:09:42',1)
 ,(464,119,'2013-11-23','2013-11-23 01:09:42',1)
 ,(465,119,'2013-11-23','2013-11-23 01:09:43',1)
 ,(466,1,'2013-11-23','2013-11-23 01:09:43',1)
 ,(467,119,'2013-11-23','2013-11-23 01:09:44',1)
 ,(468,119,'2013-11-23','2013-11-23 01:09:44',1)
 ,(469,119,'2013-11-23','2013-11-23 01:09:44',1)
 ,(470,124,'2013-11-23','2013-11-23 01:09:46',1)
 ,(471,119,'2013-11-23','2013-11-23 01:09:47',1)
 ,(472,119,'2013-11-23','2013-11-23 01:09:47',1)
 ,(473,119,'2013-11-23','2013-11-23 01:09:47',1)
 ,(474,125,'2013-11-23','2013-11-23 01:09:48',1)
 ,(475,119,'2013-11-23','2013-11-23 01:09:48',1)
 ,(476,119,'2013-11-23','2013-11-23 01:09:48',1)
 ,(477,119,'2013-11-23','2013-11-23 01:09:48',1)
 ,(478,126,'2013-11-23','2013-11-23 01:09:49',1)
 ,(479,119,'2013-11-23','2013-11-23 01:09:49',1)
 ,(480,119,'2013-11-23','2013-11-23 01:09:49',1)
 ,(481,119,'2013-11-23','2013-11-23 01:09:49',1)
 ,(482,1,'2013-11-23','2013-11-23 01:09:50',1)
 ,(483,119,'2013-11-23','2013-11-23 01:09:50',1)
 ,(484,119,'2013-11-23','2013-11-23 01:09:50',1)
 ,(485,119,'2013-11-23','2013-11-23 01:09:50',1)
 ,(486,124,'2013-11-23','2013-11-23 01:09:53',1)
 ,(487,119,'2013-11-23','2013-11-23 01:09:53',1)
 ,(488,119,'2013-11-23','2013-11-23 01:09:53',1)
 ,(489,119,'2013-11-23','2013-11-23 01:09:54',1)
 ,(490,1,'2013-11-23','2013-11-23 01:09:55',1)
 ,(491,119,'2013-11-23','2013-11-23 01:09:55',1)
 ,(492,119,'2013-11-23','2013-11-23 01:09:55',1)
 ,(493,119,'2013-11-23','2013-11-23 01:09:55',1)
 ,(494,125,'2013-11-23','2013-11-23 01:09:56',1)
 ,(495,119,'2013-11-23','2013-11-23 01:09:56',1)
 ,(496,119,'2013-11-23','2013-11-23 01:09:56',1)
 ,(497,119,'2013-11-23','2013-11-23 01:09:56',1)
 ,(498,1,'2013-11-23','2013-11-23 01:09:57',1)
 ,(499,119,'2013-11-23','2013-11-23 01:09:57',1)
 ,(500,119,'2013-11-23','2013-11-23 01:09:57',1)
 ,(501,119,'2013-11-23','2013-11-23 01:09:57',1)
 ,(502,1,'2013-11-23','2013-11-23 01:38:06',1)
 ,(503,119,'2013-11-23','2013-11-23 01:38:06',1)
 ,(504,119,'2013-11-23','2013-11-23 01:38:06',1)
 ,(505,119,'2013-11-23','2013-11-23 01:38:06',1)
 ,(506,124,'2013-11-23','2013-11-23 01:38:08',1)
 ,(507,119,'2013-11-23','2013-11-23 01:38:09',1)
 ,(508,119,'2013-11-23','2013-11-23 01:38:09',1)
 ,(509,119,'2013-11-23','2013-11-23 01:38:09',1)
 ,(510,1,'2013-11-23','2013-11-23 01:38:10',1)
 ,(511,119,'2013-11-23','2013-11-23 01:38:10',1)
 ,(512,119,'2013-11-23','2013-11-23 01:38:10',1)
 ,(513,119,'2013-11-23','2013-11-23 01:38:10',1)
 ,(514,1,'2013-11-23','2013-11-23 01:40:09',1)
 ,(515,119,'2013-11-23','2013-11-23 01:40:09',1)
 ,(516,119,'2013-11-23','2013-11-23 01:40:10',1)
 ,(517,119,'2013-11-23','2013-11-23 01:40:10',1)
 ,(518,1,'2013-11-23','2013-11-23 01:41:57',1)
 ,(519,119,'2013-11-23','2013-11-23 01:41:58',1)
 ,(520,119,'2013-11-23','2013-11-23 01:41:58',1)
 ,(521,119,'2013-11-23','2013-11-23 01:41:58',1)
 ,(522,1,'2013-11-23','2013-11-23 01:47:29',1)
 ,(523,119,'2013-11-23','2013-11-23 01:47:29',1)
 ,(524,119,'2013-11-23','2013-11-23 01:47:29',1)
 ,(525,119,'2013-11-23','2013-11-23 01:47:30',1)
 ,(526,1,'2013-11-23','2013-11-23 01:48:40',1)
 ,(527,119,'2013-11-23','2013-11-23 01:48:40',1)
 ,(528,119,'2013-11-23','2013-11-23 01:48:40',1)
 ,(529,119,'2013-11-23','2013-11-23 01:48:40',1)
 ,(530,1,'2013-11-23','2013-11-23 01:49:10',1)
 ,(531,119,'2013-11-23','2013-11-23 01:49:11',1)
 ,(532,119,'2013-11-23','2013-11-23 01:49:11',1)
 ,(533,119,'2013-11-23','2013-11-23 01:49:11',1)
 ,(534,1,'2013-11-23','2013-11-23 01:49:25',1)
 ,(535,119,'2013-11-23','2013-11-23 01:49:25',1)
 ,(536,119,'2013-11-23','2013-11-23 01:49:25',1)
 ,(537,119,'2013-11-23','2013-11-23 01:49:26',1)
 ,(538,1,'2013-11-23','2013-11-23 01:49:27',1)
 ,(539,119,'2013-11-23','2013-11-23 01:49:27',1)
 ,(540,119,'2013-11-23','2013-11-23 01:49:27',1)
 ,(541,119,'2013-11-23','2013-11-23 01:49:28',1)
 ,(542,1,'2013-11-23','2013-11-23 01:49:29',1)
 ,(543,119,'2013-11-23','2013-11-23 01:49:29',1)
 ,(544,119,'2013-11-23','2013-11-23 01:49:29',1)
 ,(545,119,'2013-11-23','2013-11-23 01:49:29',1)
 ,(546,126,'2013-11-23','2013-11-23 01:49:31',1)
 ,(547,119,'2013-11-23','2013-11-23 01:49:31',1)
 ,(548,119,'2013-11-23','2013-11-23 01:49:31',1)
 ,(549,119,'2013-11-23','2013-11-23 01:49:31',1)
 ,(550,4,'2013-11-23','2013-11-23 01:49:38',1)
 ,(551,2,'2013-11-23','2013-11-23 01:49:43',1)
 ,(552,9,'2013-11-23','2013-11-23 01:49:46',1)
 ,(553,1,'2013-11-23','2013-11-23 01:49:57',1)
 ,(554,119,'2013-11-23','2013-11-23 01:49:57',1)
 ,(555,119,'2013-11-23','2013-11-23 01:49:57',1)
 ,(556,119,'2013-11-23','2013-11-23 01:49:57',1)
 ,(557,124,'2013-11-23','2013-11-23 01:49:58',1)
 ,(558,1,'2013-11-23','2013-11-23 01:52:09',1)
 ,(559,119,'2013-11-23','2013-11-23 01:52:10',1)
 ,(560,119,'2013-11-23','2013-11-23 01:52:10',1)
 ,(561,119,'2013-11-23','2013-11-23 01:52:10',1)
 ,(562,1,'2013-11-23','2013-11-23 01:54:33',1)
 ,(563,119,'2013-11-23','2013-11-23 01:54:33',1)
 ,(564,119,'2013-11-23','2013-11-23 01:54:33',1)
 ,(565,119,'2013-11-23','2013-11-23 01:54:33',1)
 ,(566,1,'2013-11-23','2013-11-23 01:58:12',1)
 ,(567,119,'2013-11-23','2013-11-23 01:58:13',1)
 ,(568,119,'2013-11-23','2013-11-23 01:58:13',1)
 ,(569,119,'2013-11-23','2013-11-23 01:58:13',1)
 ,(570,1,'2013-11-23','2013-11-23 01:59:06',1)
 ,(571,119,'2013-11-23','2013-11-23 01:59:07',1)
 ,(572,119,'2013-11-23','2013-11-23 01:59:07',1)
 ,(573,119,'2013-11-23','2013-11-23 01:59:07',1)
 ,(574,2,'2013-11-23','2013-11-23 01:59:12',1)
 ,(575,47,'2013-11-23','2013-11-23 01:59:16',1)
 ,(576,2,'2013-11-23','2013-11-23 01:59:23',1)
 ,(577,51,'2013-11-23','2013-11-23 01:59:28',1)
 ,(578,99,'2013-11-23','2013-11-23 01:59:36',1)
 ,(579,99,'2013-11-23','2013-11-23 01:59:39',1)
 ,(580,99,'2013-11-23','2013-11-23 01:59:40',1)
 ,(581,51,'2013-11-23','2013-11-23 01:59:43',1)
 ,(582,68,'2013-11-23','2013-11-23 01:59:49',1)
 ,(583,68,'2013-11-23','2013-11-23 01:59:50',1)
 ,(584,68,'2013-11-23','2013-11-23 01:59:50',1)
 ,(585,1,'2013-11-23','2013-11-23 01:59:53',1)
 ,(586,119,'2013-11-23','2013-11-23 01:59:53',1)
 ,(587,119,'2013-11-23','2013-11-23 01:59:53',1)
 ,(588,119,'2013-11-23','2013-11-23 01:59:53',1)
 ,(589,124,'2013-11-23','2013-11-23 02:00:05',1)
 ,(590,125,'2013-11-23','2013-11-23 02:00:08',1)
 ,(591,119,'2013-11-23','2013-11-23 02:00:08',1)
 ,(592,119,'2013-11-23','2013-11-23 02:00:09',1)
 ,(593,119,'2013-11-23','2013-11-23 02:00:09',1)
 ,(594,126,'2013-11-23','2013-11-23 02:00:12',1)
 ,(595,119,'2013-11-23','2013-11-23 02:00:12',1)
 ,(596,119,'2013-11-23','2013-11-23 02:00:12',1)
 ,(597,119,'2013-11-23','2013-11-23 02:00:12',1)
 ,(598,124,'2013-11-23','2013-11-23 02:00:14',1)
 ,(599,1,'2013-11-23','2013-11-23 02:00:16',1)
 ,(600,119,'2013-11-23','2013-11-23 02:00:16',1)
 ,(601,119,'2013-11-23','2013-11-23 02:00:16',1)
 ,(602,119,'2013-11-23','2013-11-23 02:00:16',1)
 ,(603,124,'2013-11-23','2013-11-23 02:00:17',1)
 ,(604,1,'2013-11-23','2013-11-23 02:00:19',1)
 ,(605,119,'2013-11-23','2013-11-23 02:00:19',1)
 ,(606,119,'2013-11-23','2013-11-23 02:00:19',1)
 ,(607,119,'2013-11-23','2013-11-23 02:00:19',1)
 ,(608,1,'2013-11-23','2013-11-23 02:04:23',1)
 ,(609,119,'2013-11-23','2013-11-23 02:04:23',1)
 ,(610,119,'2013-11-23','2013-11-23 02:04:23',1)
 ,(611,119,'2013-11-23','2013-11-23 02:04:23',1)
 ,(612,1,'2013-11-23','2013-11-23 02:06:25',1)
 ,(613,119,'2013-11-23','2013-11-23 02:06:26',1)
 ,(614,119,'2013-11-23','2013-11-23 02:06:26',1)
 ,(615,119,'2013-11-23','2013-11-23 02:06:26',1)
 ,(616,1,'2013-11-23','2013-11-23 02:06:35',1)
 ,(617,119,'2013-11-23','2013-11-23 02:06:35',1)
 ,(618,119,'2013-11-23','2013-11-23 02:06:36',1)
 ,(619,119,'2013-11-23','2013-11-23 02:06:36',1)
 ,(620,1,'2013-11-23','2013-11-23 02:07:23',1)
 ,(621,119,'2013-11-23','2013-11-23 02:07:24',1)
 ,(622,119,'2013-11-23','2013-11-23 02:07:24',1)
 ,(623,119,'2013-11-23','2013-11-23 02:07:24',1)
 ,(624,2,'2013-11-23','2013-11-23 02:07:56',1)
 ,(625,23,'2013-11-23','2013-11-23 02:08:03',1)
 ,(626,1,'2013-11-23','2013-11-23 02:08:18',1)
 ,(627,119,'2013-11-23','2013-11-23 02:08:18',1)
 ,(628,119,'2013-11-23','2013-11-23 02:08:18',1)
 ,(629,119,'2013-11-23','2013-11-23 02:08:18',1)
 ,(630,1,'2013-11-23','2013-11-23 02:11:01',1)
 ,(631,119,'2013-11-23','2013-11-23 02:11:01',1)
 ,(632,119,'2013-11-23','2013-11-23 02:11:01',1)
 ,(633,119,'2013-11-23','2013-11-23 02:11:01',1)
 ,(634,1,'2013-11-23','2013-11-23 02:14:41',1)
 ,(635,119,'2013-11-23','2013-11-23 02:14:42',1)
 ,(636,119,'2013-11-23','2013-11-23 02:14:42',1)
 ,(637,119,'2013-11-23','2013-11-23 02:14:42',1)
 ,(638,1,'2013-11-23','2013-11-23 02:15:31',1)
 ,(639,119,'2013-11-23','2013-11-23 02:15:31',1)
 ,(640,119,'2013-11-23','2013-11-23 02:15:32',1)
 ,(641,119,'2013-11-23','2013-11-23 02:15:32',1)
 ,(642,1,'2013-11-23','2013-11-23 02:21:28',1)
 ,(643,119,'2013-11-23','2013-11-23 02:21:28',1)
 ,(644,119,'2013-11-23','2013-11-23 02:21:28',1)
 ,(645,119,'2013-11-23','2013-11-23 02:21:28',1)
 ,(646,124,'2013-11-23','2013-11-23 02:27:10',1)
 ,(647,1,'2013-11-23','2013-11-23 02:27:12',1)
 ,(648,119,'2013-11-23','2013-11-23 02:27:12',1)
 ,(649,119,'2013-11-23','2013-11-23 02:27:12',1)
 ,(650,119,'2013-11-23','2013-11-23 02:27:12',1)
 ,(651,124,'2013-11-23','2013-11-23 02:27:16',1)
 ,(652,1,'2013-11-23','2013-11-23 02:27:18',1)
 ,(653,119,'2013-11-23','2013-11-23 02:27:18',1)
 ,(654,119,'2013-11-23','2013-11-23 02:27:18',1)
 ,(655,119,'2013-11-23','2013-11-23 02:27:18',1)
 ,(656,1,'2013-11-23','2013-11-23 02:40:50',1)
 ,(657,119,'2013-11-23','2013-11-23 02:40:50',1)
 ,(658,119,'2013-11-23','2013-11-23 02:40:51',1)
 ,(659,119,'2013-11-23','2013-11-23 02:40:51',1)
 ,(660,1,'2013-11-23','2013-11-23 02:41:56',1)
 ,(661,119,'2013-11-23','2013-11-23 02:41:56',1)
 ,(662,119,'2013-11-23','2013-11-23 02:41:56',1)
 ,(663,119,'2013-11-23','2013-11-23 02:41:56',1)
 ,(664,2,'2013-11-23','2013-11-23 02:43:18',1)
 ,(665,51,'2013-11-23','2013-11-23 02:43:30',1)
 ,(666,92,'2013-11-23','2013-11-23 02:43:34',1)
 ,(667,92,'2013-11-23','2013-11-23 02:43:35',1)
 ,(668,51,'2013-11-23','2013-11-23 02:43:51',1)
 ,(669,68,'2013-11-23','2013-11-23 02:44:06',1)
 ,(670,68,'2013-11-23','2013-11-23 02:44:07',1)
 ,(671,68,'2013-11-23','2013-11-23 02:44:07',1)
 ,(672,1,'2013-11-23','2013-11-23 02:44:09',1)
 ,(673,119,'2013-11-23','2013-11-23 02:44:10',1)
 ,(674,119,'2013-11-23','2013-11-23 02:44:10',1)
 ,(675,119,'2013-11-23','2013-11-23 02:44:10',1)
 ,(676,1,'2013-11-23','2013-11-23 02:50:53',1)
 ,(677,119,'2013-11-23','2013-11-23 02:50:54',1)
 ,(678,119,'2013-11-23','2013-11-23 02:50:54',1)
 ,(679,119,'2013-11-23','2013-11-23 02:50:54',1)
 ,(680,1,'2013-11-23','2013-11-23 02:51:35',1)
 ,(681,1,'2013-11-23','2013-11-23 02:51:39',1)
 ,(682,110,'2013-11-23','2013-11-23 02:51:55',1)
 ,(683,1,'2013-11-23','2013-11-23 02:51:55',0)
 ,(684,1,'2013-11-23','2013-11-23 02:51:58',0)
 ,(685,1,'2013-11-23','2013-11-23 02:52:00',0)
 ,(686,1,'2013-11-23','2013-11-23 02:52:02',0)
 ,(687,1,'2013-11-23','2013-11-23 02:52:04',0)
 ,(688,1,'2013-11-23','2013-11-23 02:52:06',0)
 ,(689,1,'2013-11-23','2013-11-23 02:52:12',0)
 ,(690,1,'2013-11-23','2013-11-23 02:52:15',0)
 ,(691,1,'2013-11-23','2013-11-23 02:52:22',0)
 ,(692,110,'2013-11-23','2013-11-23 02:52:37',0)
 ,(693,2,'2013-11-23','2013-11-23 02:52:38',1)
 ,(694,1,'2013-11-23','2013-11-23 02:52:44',1)
 ,(695,1,'2013-11-23','2013-11-23 02:52:48',1)
 ,(696,1,'2013-11-23','2013-11-23 02:52:52',1)
 ,(697,1,'2013-11-23','2013-11-23 02:53:04',1)
 ,(698,1,'2013-11-23','2013-11-23 02:53:07',1)
 ,(699,1,'2013-11-23','2013-11-23 02:53:13',1)
 ,(700,1,'2013-11-23','2013-11-23 02:53:40',1)
 ,(701,1,'2013-11-23','2013-11-23 02:53:56',1)
 ,(702,1,'2013-11-23','2013-11-23 02:54:02',1)
 ,(703,119,'2013-11-23','2013-11-23 02:54:02',1)
 ,(704,119,'2013-11-23','2013-11-23 02:54:03',1)
 ,(705,119,'2013-11-23','2013-11-23 02:54:03',1)
 ,(706,1,'2013-11-23','2013-11-23 02:54:15',1)
 ,(707,124,'2013-11-23','2013-11-23 02:54:25',1)
 ,(708,125,'2013-11-23','2013-11-23 02:54:26',1)
 ,(709,119,'2013-11-23','2013-11-23 02:54:26',1)
 ,(710,119,'2013-11-23','2013-11-23 02:54:26',1)
 ,(711,119,'2013-11-23','2013-11-23 02:54:27',1)
 ,(712,126,'2013-11-23','2013-11-23 02:54:27',1)
 ,(713,119,'2013-11-23','2013-11-23 02:54:27',1)
 ,(714,119,'2013-11-23','2013-11-23 02:54:28',1)
 ,(715,119,'2013-11-23','2013-11-23 02:54:28',1)
 ,(716,1,'2013-11-23','2013-11-23 02:54:29',1)
 ,(717,119,'2013-11-23','2013-11-23 02:54:29',1)
 ,(718,119,'2013-11-23','2013-11-23 02:54:29',1)
 ,(719,119,'2013-11-23','2013-11-23 02:54:29',1)
 ,(720,2,'2013-11-23','2013-11-23 02:54:57',1)
 ,(721,51,'2013-11-23','2013-11-23 02:55:01',1)
 ,(722,98,'2013-11-23','2013-11-23 02:55:07',1)
 ,(723,98,'2013-11-23','2013-11-23 02:55:11',1);

DROP TABLE IF EXISTS PageThemeStyles;

CREATE TABLE IF NOT EXISTS `PageThemeStyles` (
  `ptID` int(10) unsigned NOT NULL DEFAULT '0',
  `ptsHandle` varchar(128) NOT NULL,
  `ptsValue` longtext,
  `ptsType` varchar(32) NOT NULL,
  PRIMARY KEY (`ptID`,`ptsHandle`,`ptsType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PageThemes;

CREATE TABLE IF NOT EXISTS `PageThemes` (
  `ptID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ptHandle` varchar(64) NOT NULL,
  `ptName` varchar(255) DEFAULT NULL,
  `ptDescription` text,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ptID`),
  UNIQUE KEY `ptHandle` (`ptHandle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO PageThemes VALUES(1,'default','Plain Yogurt','Plain Yogurt is concrete5\'s default theme.',0)
 ,(2,'greensalad','Green Salad Theme','This is concrete5\'s Green Salad site theme.',0)
 ,(3,'dark_chocolate','Dark Chocolate','Dark Chocolate is concrete5\'s default theme in black.',0)
 ,(4,'greek_yogurt','Greek Yogurt','An elegant theme for concrete5.',0)
 ,(5,'lawler','Lawler Financial Services','Theme developed by Hans-Albert Maritz',0);

DROP TABLE IF EXISTS PageTypeAttributes;

CREATE TABLE IF NOT EXISTS `PageTypeAttributes` (
  `ctID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`,`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO PageTypeAttributes VALUES(5,5);

DROP TABLE IF EXISTS PageTypes;

CREATE TABLE IF NOT EXISTS `PageTypes` (
  `ctID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctHandle` varchar(32) NOT NULL,
  `ctIcon` varchar(128) DEFAULT NULL,
  `ctName` varchar(90) NOT NULL,
  `ctIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctID`),
  UNIQUE KEY `ctHandle` (`ctHandle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO PageTypes VALUES(1,'core_stack','main.png','Stack',1,0)
 ,(2,'dashboard_primary_five','main.png','Dashboard Primary + Five',1,0)
 ,(3,'dashboard_header_four_col','main.png','Dashboard Header + Four Column',1,0)
 ,(4,'right_sidebar','right_sidebar.png','Right Sidebar',0,0)
 ,(5,'home','main.png','Homepage',0,0);

DROP TABLE IF EXISTS PageWorkflowProgress;

CREATE TABLE IF NOT EXISTS `PageWorkflowProgress` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `wpID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`wpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Pages;

CREATE TABLE IF NOT EXISTS `Pages` (
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `cIsTemplate` int(1) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned DEFAULT NULL,
  `cIsCheckedOut` tinyint(1) NOT NULL DEFAULT '0',
  `cCheckedOutUID` int(10) unsigned DEFAULT NULL,
  `cCheckedOutDatetime` datetime DEFAULT NULL,
  `cCheckedOutDatetimeLastEdit` datetime DEFAULT NULL,
  `cOverrideTemplatePermissions` tinyint(1) NOT NULL DEFAULT '1',
  `cInheritPermissionsFromCID` int(10) unsigned NOT NULL DEFAULT '0',
  `cInheritPermissionsFrom` varchar(8) NOT NULL DEFAULT 'PARENT',
  `cFilename` varchar(255) DEFAULT NULL,
  `cPointerID` int(10) unsigned NOT NULL DEFAULT '0',
  `cPointerExternalLink` longtext,
  `cPointerExternalLinkNewWindow` tinyint(1) NOT NULL DEFAULT '0',
  `cIsActive` tinyint(1) NOT NULL DEFAULT '1',
  `cChildren` int(10) unsigned NOT NULL DEFAULT '0',
  `cDisplayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  `cParentID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  `cCacheFullPageContent` int(4) NOT NULL DEFAULT '-1',
  `cCacheFullPageContentOverrideLifetime` varchar(32) NOT NULL DEFAULT '0',
  `cCacheFullPageContentLifetimeCustom` int(10) unsigned NOT NULL DEFAULT '0',
  `cIsSystemPage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `cParentID` (`cParentID`),
  KEY `cIsActive` (`cIsActive`),
  KEY `cCheckedOutUID` (`cCheckedOutUID`),
  KEY `uID` (`uID`),
  KEY `cPointerID` (`cPointerID`),
  KEY `cIsTemplate` (`cIsTemplate`),
  KEY `cIsSystemPage` (`cIsSystemPage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Pages VALUES(1,0,1,0,NULL,NULL,NULL,1,1,'OVERRIDE',NULL,0,NULL,0,1,14,0,0,0,-1,'0',0,0)
 ,(2,0,1,0,NULL,NULL,NULL,1,2,'OVERRIDE','/dashboard/view.php',0,NULL,0,1,13,0,0,0,-1,'0',0,1)
 ,(3,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,2,0,2,0,-1,'0',0,1)
 ,(4,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/composer/write.php',0,NULL,0,1,0,0,3,0,-1,'0',0,1)
 ,(5,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/composer/drafts.php',0,NULL,0,1,0,1,3,0,-1,'0',0,1)
 ,(6,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,3,1,2,0,-1,'0',0,1)
 ,(7,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/sitemap/full.php',0,NULL,0,1,0,0,6,0,-1,'0',0,1)
 ,(8,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/sitemap/explore.php',0,NULL,0,1,0,1,6,0,-1,'0',0,1)
 ,(9,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/sitemap/search.php',0,NULL,0,1,0,2,6,0,-1,'0',0,1)
 ,(10,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,4,2,2,0,-1,'0',0,1)
 ,(11,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/files/search.php',0,NULL,0,1,0,0,10,0,-1,'0',0,1)
 ,(12,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/files/attributes.php',0,NULL,0,1,0,1,10,0,-1,'0',0,1)
 ,(13,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/files/sets.php',0,NULL,0,1,0,2,10,0,-1,'0',0,1)
 ,(14,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/files/add_set.php',0,NULL,0,1,0,3,10,0,-1,'0',0,1)
 ,(15,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/users/view.php',0,NULL,0,1,6,3,2,0,-1,'0',0,1)
 ,(16,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/users/search.php',0,NULL,0,1,0,0,15,0,-1,'0',0,1)
 ,(17,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/users/groups.php',0,NULL,0,1,0,1,15,0,-1,'0',0,1)
 ,(18,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/users/attributes.php',0,NULL,0,1,0,2,15,0,-1,'0',0,1)
 ,(19,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/users/add.php',0,NULL,0,1,0,3,15,0,-1,'0',0,1)
 ,(20,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/users/add_group.php',0,NULL,0,1,0,4,15,0,-1,'0',0,1)
 ,(21,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/users/group_sets.php',0,NULL,0,1,0,5,15,0,-1,'0',0,1)
 ,(22,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,4,4,2,0,-1,'0',0,1)
 ,(23,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/reports/statistics.php',0,NULL,0,1,0,0,22,0,-1,'0',0,1)
 ,(24,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/reports/forms.php',0,NULL,0,1,0,1,22,0,-1,'0',0,1)
 ,(25,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/reports/surveys.php',0,NULL,0,1,0,2,22,0,-1,'0',0,1)
 ,(26,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/reports/logs.php',0,NULL,0,1,0,3,22,0,-1,'0',0,1)
 ,(27,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,4,5,2,0,-1,'0',0,1)
 ,(28,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/pages/themes/view.php',0,NULL,0,1,3,0,27,0,-1,'0',0,1)
 ,(29,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/pages/themes/add.php',0,NULL,0,1,0,0,28,0,-1,'0',0,1)
 ,(30,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/pages/themes/inspect.php',0,NULL,0,1,0,1,28,0,-1,'0',0,1)
 ,(31,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/pages/themes/customize.php',0,NULL,0,1,0,2,28,0,-1,'0',0,1)
 ,(32,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/pages/types/view.php',0,NULL,0,1,2,1,27,0,-1,'0',0,1)
 ,(33,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/pages/types/add.php',0,NULL,0,1,0,0,32,0,-1,'0',0,1)
 ,(34,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/pages/attributes.php',0,NULL,0,1,0,2,27,0,-1,'0',0,1)
 ,(35,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/pages/single.php',0,NULL,0,1,0,3,27,0,-1,'0',0,1)
 ,(36,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/workflow/view.php',0,NULL,0,1,2,6,2,0,-1,'0',0,1)
 ,(37,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/workflow/list.php',0,NULL,0,1,0,0,36,0,-1,'0',0,1)
 ,(38,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/workflow/me.php',0,NULL,0,1,0,1,36,0,-1,'0',0,1)
 ,(39,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,3,7,2,0,-1,'0',0,1)
 ,(40,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/blocks/stacks/view.php',0,NULL,0,1,1,0,39,0,-1,'0',0,1)
 ,(41,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/blocks/permissions.php',0,NULL,0,1,0,1,39,0,-1,'0',0,1)
 ,(42,0,1,0,NULL,NULL,NULL,1,42,'OVERRIDE','/dashboard/blocks/stacks/list/view.php',0,NULL,0,1,0,0,40,0,-1,'0',0,1)
 ,(43,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/blocks/types/view.php',0,NULL,0,1,0,2,39,0,-1,'0',0,1)
 ,(44,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/extend/view.php',0,NULL,0,1,5,8,2,0,-1,'0',0,1)
 ,(45,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,0,9,2,0,-1,'0',0,1)
 ,(46,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/extend/install.php',0,NULL,0,1,0,0,44,0,-1,'0',0,1)
 ,(47,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/extend/update.php',0,NULL,0,1,0,1,44,0,-1,'0',0,1)
 ,(48,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/extend/connect.php',0,NULL,0,1,0,2,44,0,-1,'0',0,1)
 ,(49,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/extend/themes.php',0,NULL,0,1,0,3,44,0,-1,'0',0,1)
 ,(50,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/extend/add-ons.php',0,NULL,0,1,0,4,44,0,-1,'0',0,1)
 ,(51,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/view.php',0,NULL,0,1,9,10,2,0,-1,'0',0,1)
 ,(52,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,6,0,51,0,-1,'0',0,1)
 ,(53,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/basics/site_name.php',0,NULL,0,1,0,0,52,0,-1,'0',0,1)
 ,(54,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/basics/icons.php',0,NULL,0,1,0,1,52,0,-1,'0',0,1)
 ,(55,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/basics/editor.php',0,NULL,0,1,0,2,52,0,-1,'0',0,1)
 ,(56,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/basics/multilingual/view.php',0,NULL,0,1,0,3,52,0,-1,'0',0,1)
 ,(57,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/basics/timezone.php',0,NULL,0,1,0,4,52,0,-1,'0',0,1)
 ,(58,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/basics/interface.php',0,NULL,0,1,0,5,52,0,-1,'0',0,1)
 ,(59,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/seo/view.php',0,NULL,0,1,6,1,51,0,-1,'0',0,1)
 ,(60,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/seo/urls.php',0,NULL,0,1,0,0,59,0,-1,'0',0,1)
 ,(61,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/seo/bulk_seo_tool.php',0,NULL,0,1,0,1,59,0,-1,'0',0,1)
 ,(62,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/seo/tracking_codes.php',0,NULL,0,1,0,2,59,0,-1,'0',0,1)
 ,(63,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/seo/excluded.php',0,NULL,0,1,0,3,59,0,-1,'0',0,1)
 ,(64,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/seo/statistics.php',0,NULL,0,1,0,4,59,0,-1,'0',0,1)
 ,(65,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/seo/search_index.php',0,NULL,0,1,0,5,59,0,-1,'0',0,1)
 ,(66,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,3,2,51,0,-1,'0',0,1)
 ,(67,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/optimization/cache.php',0,NULL,0,1,0,0,66,0,-1,'0',0,1)
 ,(68,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/optimization/clear_cache.php',0,NULL,0,1,0,1,66,0,-1,'0',0,1)
 ,(69,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/optimization/jobs.php',0,NULL,0,1,0,2,66,0,-1,'0',0,1)
 ,(70,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/view.php',0,NULL,0,1,10,3,51,0,-1,'0',0,1)
 ,(71,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/site.php',0,NULL,0,1,0,0,70,0,-1,'0',0,1)
 ,(72,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/files.php',0,NULL,0,1,0,1,70,0,-1,'0',0,1)
 ,(73,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/file_types.php',0,NULL,0,1,0,2,70,0,-1,'0',0,1)
 ,(74,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/tasks.php',0,NULL,0,1,0,3,70,0,-1,'0',0,1)
 ,(75,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/users.php',0,NULL,0,1,0,4,70,0,-1,'0',0,1)
 ,(76,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/advanced.php',0,NULL,0,1,0,5,70,0,-1,'0',0,1)
 ,(77,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/ip_blacklist.php',0,NULL,0,1,0,6,70,0,-1,'0',0,1)
 ,(78,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/captcha.php',0,NULL,0,1,0,7,70,0,-1,'0',0,1)
 ,(79,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/antispam.php',0,NULL,0,1,0,8,70,0,-1,'0',0,1)
 ,(80,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/permissions/maintenance_mode.php',0,NULL,0,1,0,9,70,0,-1,'0',0,1)
 ,(81,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,3,4,51,0,-1,'0',0,1)
 ,(82,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/registration/postlogin.php',0,NULL,0,1,0,0,81,0,-1,'0',0,1)
 ,(83,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/registration/profiles.php',0,NULL,0,1,0,1,81,0,-1,'0',0,1)
 ,(84,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/registration/public_registration.php',0,NULL,0,1,0,2,81,0,-1,'0',0,1)
 ,(85,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/mail/view.php',0,NULL,0,1,2,5,51,0,-1,'0',0,1)
 ,(86,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/mail/method.php',0,NULL,0,1,0,0,85,0,-1,'0',0,1)
 ,(87,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/mail/importers.php',0,NULL,0,1,0,1,85,0,-1,'0',0,1)
 ,(88,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,2,6,51,0,-1,'0',0,1)
 ,(89,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/attributes/sets.php',0,NULL,0,1,0,0,88,0,-1,'0',0,1)
 ,(90,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/attributes/types.php',0,NULL,0,1,0,1,88,0,-1,'0',0,1)
 ,(91,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,5,7,51,0,-1,'0',0,1)
 ,(92,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/environment/info.php',0,NULL,0,1,0,0,91,0,-1,'0',0,1)
 ,(93,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/environment/debug.php',0,NULL,0,1,0,1,91,0,-1,'0',0,1)
 ,(94,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/environment/logging.php',0,NULL,0,1,0,2,91,0,-1,'0',0,1)
 ,(95,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/environment/file_storage_locations.php',0,NULL,0,1,0,3,91,0,-1,'0',0,1)
 ,(96,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/environment/proxy.php',0,NULL,0,1,0,4,91,0,-1,'0',0,1)
 ,(97,0,1,0,NULL,NULL,NULL,1,2,'PARENT','0',0,NULL,0,1,3,8,51,0,-1,'0',0,1)
 ,(98,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/backup_restore/backup.php',0,NULL,0,1,0,0,97,0,-1,'0',0,1)
 ,(99,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/backup_restore/update.php',0,NULL,0,1,0,1,97,0,-1,'0',0,1)
 ,(100,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/system/backup_restore/database.php',0,NULL,0,1,0,2,97,0,-1,'0',0,1)
 ,(101,0,1,0,NULL,NULL,NULL,1,2,'PARENT','/dashboard/pages/types/composer.php',0,NULL,0,1,0,1,32,0,-1,'0',0,1)
 ,(102,1,NULL,0,NULL,NULL,NULL,1,0,'PARENT',NULL,0,NULL,0,1,0,0,0,0,-1,'0',0,0)
 ,(103,1,NULL,0,NULL,NULL,NULL,1,0,'PARENT',NULL,0,NULL,0,1,0,0,0,0,-1,'0',0,0)
 ,(104,1,NULL,0,NULL,NULL,NULL,1,0,'PARENT',NULL,0,NULL,0,1,0,0,0,0,-1,'0',0,0)
 ,(105,0,1,0,NULL,NULL,NULL,1,2,'PARENT',NULL,0,NULL,0,1,0,11,2,0,-1,'0',0,1)
 ,(106,0,1,0,NULL,NULL,NULL,1,2,'PARENT',NULL,0,NULL,0,1,0,12,2,0,-1,'0',0,1)
 ,(107,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/!drafts/view.php',0,NULL,0,1,0,0,0,0,-1,'0',0,1)
 ,(108,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/!trash/view.php',0,NULL,0,1,1,0,0,0,-1,'0',0,1)
 ,(109,0,1,0,NULL,NULL,NULL,1,1,'PARENT','0',0,NULL,0,1,0,0,0,0,-1,'0',0,1)
 ,(110,0,1,0,NULL,NULL,NULL,1,110,'OVERRIDE','/login.php',0,NULL,0,1,0,0,0,0,-1,'0',0,1)
 ,(111,0,1,0,NULL,NULL,NULL,1,111,'OVERRIDE','/register.php',0,NULL,0,1,0,0,0,0,-1,'0',0,1)
 ,(112,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/profile/view.php',0,NULL,0,1,4,0,1,0,-1,'0',0,1)
 ,(113,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/profile/edit.php',0,NULL,0,1,0,0,112,0,-1,'0',0,1)
 ,(114,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/profile/avatar.php',0,NULL,0,1,0,1,112,0,-1,'0',0,1)
 ,(115,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/profile/messages.php',0,NULL,0,1,0,2,112,0,-1,'0',0,1)
 ,(116,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/profile/friends.php',0,NULL,0,1,0,3,112,0,-1,'0',0,1)
 ,(117,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/page_not_found.php',0,NULL,0,1,0,1,0,0,-1,'0',0,1)
 ,(118,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/page_forbidden.php',0,NULL,0,1,0,1,0,0,-1,'0',0,1)
 ,(119,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/download_file.php',0,NULL,0,1,0,1,1,0,-1,'0',0,1)
 ,(120,0,1,0,NULL,NULL,NULL,1,1,'PARENT','/members.php',0,NULL,0,1,0,2,1,0,-1,'0',0,1)
 ,(121,1,NULL,0,NULL,NULL,NULL,1,0,'PARENT',NULL,0,NULL,0,1,0,0,0,0,-1,'0',0,0)
 ,(122,1,NULL,0,NULL,NULL,NULL,1,0,'PARENT',NULL,0,NULL,0,1,0,0,0,0,-1,'0',0,0)
 ,(123,0,1,0,NULL,NULL,NULL,1,1,'PARENT',NULL,0,NULL,0,0,0,0,108,0,-1,'0',0,1)
 ,(124,0,1,0,NULL,NULL,NULL,1,1,'PARENT',NULL,0,NULL,0,1,0,3,1,0,-1,'0',0,0)
 ,(125,0,1,0,NULL,NULL,NULL,1,1,'PARENT',NULL,0,NULL,0,1,0,4,1,0,-1,'0',0,0)
 ,(126,0,1,0,NULL,NULL,NULL,1,1,'PARENT',NULL,0,NULL,0,1,0,5,1,0,-1,'0',0,0);

DROP TABLE IF EXISTS PermissionAccess;

CREATE TABLE IF NOT EXISTS `PermissionAccess` (
  `paID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paIsInUse` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

INSERT INTO PermissionAccess VALUES(1,1)
 ,(2,1)
 ,(3,1)
 ,(4,1)
 ,(5,1)
 ,(6,1)
 ,(7,1)
 ,(8,1)
 ,(9,1)
 ,(10,1)
 ,(11,1)
 ,(12,1)
 ,(13,1)
 ,(14,1)
 ,(15,1)
 ,(16,1)
 ,(17,1)
 ,(18,1)
 ,(19,1)
 ,(20,1)
 ,(21,1)
 ,(22,1)
 ,(23,1)
 ,(24,1)
 ,(25,1)
 ,(26,1)
 ,(27,1)
 ,(28,1)
 ,(29,1)
 ,(30,1)
 ,(31,1)
 ,(32,1)
 ,(33,1)
 ,(34,1)
 ,(35,1)
 ,(36,1)
 ,(37,1)
 ,(38,1)
 ,(39,1)
 ,(40,1)
 ,(41,1)
 ,(42,1)
 ,(43,1)
 ,(44,1)
 ,(45,1)
 ,(46,1)
 ,(47,1)
 ,(48,1)
 ,(49,1)
 ,(50,1)
 ,(51,1)
 ,(52,1)
 ,(53,1)
 ,(54,1)
 ,(55,1)
 ,(56,1)
 ,(57,1)
 ,(58,1)
 ,(59,1)
 ,(60,1)
 ,(61,1)
 ,(62,1)
 ,(63,1)
 ,(64,1)
 ,(65,1)
 ,(66,1)
 ,(67,1);

DROP TABLE IF EXISTS PermissionAccessEntities;

CREATE TABLE IF NOT EXISTS `PermissionAccessEntities` (
  `peID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `petID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`peID`),
  KEY `petID` (`petID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO PermissionAccessEntities VALUES(1,1)
 ,(2,1)
 ,(3,1)
 ,(4,5)
 ,(5,6);

DROP TABLE IF EXISTS PermissionAccessEntityGroupSets;

CREATE TABLE IF NOT EXISTS `PermissionAccessEntityGroupSets` (
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `gsID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`peID`,`gsID`),
  KEY `gsID` (`gsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PermissionAccessEntityGroups;

CREATE TABLE IF NOT EXISTS `PermissionAccessEntityGroups` (
  `pegID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pegID`),
  KEY `gID` (`gID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO PermissionAccessEntityGroups VALUES(1,1,3)
 ,(2,2,1)
 ,(3,3,2);

DROP TABLE IF EXISTS PermissionAccessEntityTypeCategories;

CREATE TABLE IF NOT EXISTS `PermissionAccessEntityTypeCategories` (
  `petID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkCategoryID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petID`,`pkCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO PermissionAccessEntityTypeCategories VALUES(1,1)
 ,(1,5)
 ,(1,6)
 ,(1,7)
 ,(1,8)
 ,(1,9)
 ,(1,10)
 ,(1,11)
 ,(1,12)
 ,(1,13)
 ,(1,14)
 ,(2,1)
 ,(2,5)
 ,(2,6)
 ,(2,7)
 ,(2,8)
 ,(2,9)
 ,(2,10)
 ,(2,11)
 ,(2,12)
 ,(2,13)
 ,(2,14)
 ,(3,1)
 ,(3,5)
 ,(3,6)
 ,(3,7)
 ,(3,8)
 ,(3,9)
 ,(3,10)
 ,(3,11)
 ,(3,12)
 ,(3,13)
 ,(3,14)
 ,(4,1)
 ,(4,5)
 ,(4,6)
 ,(4,7)
 ,(4,8)
 ,(4,9)
 ,(4,10)
 ,(4,11)
 ,(4,12)
 ,(4,13)
 ,(4,14)
 ,(5,1)
 ,(6,6)
 ,(6,7);

DROP TABLE IF EXISTS PermissionAccessEntityTypes;

CREATE TABLE IF NOT EXISTS `PermissionAccessEntityTypes` (
  `petID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `petHandle` varchar(255) NOT NULL,
  `petName` varchar(255) NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`petID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO PermissionAccessEntityTypes VALUES(1,'group','Group',0)
 ,(2,'user','User',0)
 ,(3,'group_set','Group Set',0)
 ,(4,'group_combination','Group Combination',0)
 ,(5,'page_owner','Page Owner',0)
 ,(6,'file_uploader','File Uploader',0);

DROP TABLE IF EXISTS PermissionAccessEntityUsers;

CREATE TABLE IF NOT EXISTS `PermissionAccessEntityUsers` (
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`peID`,`uID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PermissionAccessList;

CREATE TABLE IF NOT EXISTS `PermissionAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `pdID` int(10) unsigned NOT NULL DEFAULT '0',
  `accessType` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`),
  KEY `accessType` (`accessType`),
  KEY `peID` (`peID`),
  KEY `peID_accessType` (`peID`,`accessType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO PermissionAccessList VALUES(1,1,0,10)
 ,(2,1,0,10)
 ,(3,1,0,10)
 ,(4,1,0,10)
 ,(5,1,0,10)
 ,(6,1,0,10)
 ,(7,1,0,10)
 ,(8,1,0,10)
 ,(9,1,0,10)
 ,(10,1,0,10)
 ,(11,1,0,10)
 ,(12,1,0,10)
 ,(13,1,0,10)
 ,(14,1,0,10)
 ,(15,1,0,10)
 ,(16,1,0,10)
 ,(17,1,0,10)
 ,(18,1,0,10)
 ,(19,1,0,10)
 ,(20,1,0,10)
 ,(21,1,0,10)
 ,(22,1,0,10)
 ,(23,1,0,10)
 ,(24,1,0,10)
 ,(25,1,0,10)
 ,(26,1,0,10)
 ,(27,1,0,10)
 ,(28,1,0,10)
 ,(29,1,0,10)
 ,(30,1,0,10)
 ,(31,1,0,10)
 ,(32,1,0,10)
 ,(33,1,0,10)
 ,(34,2,0,10)
 ,(35,2,0,10)
 ,(36,2,0,10)
 ,(37,2,0,10)
 ,(38,2,0,10)
 ,(38,3,0,10)
 ,(39,2,0,10)
 ,(39,3,0,10)
 ,(40,2,0,10)
 ,(41,2,0,10)
 ,(42,2,0,10)
 ,(43,1,0,10)
 ,(43,2,0,10)
 ,(44,1,0,10)
 ,(45,1,0,10)
 ,(46,1,0,10)
 ,(47,1,0,10)
 ,(48,1,0,10)
 ,(49,1,0,10)
 ,(50,1,0,10)
 ,(51,1,0,10)
 ,(52,2,0,10)
 ,(53,1,0,10)
 ,(54,1,0,10)
 ,(55,1,0,10)
 ,(56,1,0,10)
 ,(57,1,0,10)
 ,(58,1,0,10)
 ,(59,1,0,10)
 ,(60,1,0,10)
 ,(61,1,0,10)
 ,(62,1,0,10)
 ,(63,1,0,10)
 ,(64,1,0,10)
 ,(65,1,0,10)
 ,(66,1,0,10)
 ,(67,1,0,10);

DROP TABLE IF EXISTS PermissionAccessWorkflows;

CREATE TABLE IF NOT EXISTS `PermissionAccessWorkflows` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `wfID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`wfID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PermissionAssignments;

CREATE TABLE IF NOT EXISTS `PermissionAssignments` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `pkID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`pkID`),
  KEY `pkID` (`pkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO PermissionAssignments VALUES(1,17)
 ,(2,18)
 ,(3,55)
 ,(4,56)
 ,(5,57)
 ,(6,58)
 ,(7,60)
 ,(8,61)
 ,(9,62)
 ,(10,63)
 ,(11,64)
 ,(12,66)
 ,(13,67)
 ,(14,68)
 ,(15,69)
 ,(16,70)
 ,(17,71);

DROP TABLE IF EXISTS PermissionDurationObjects;

CREATE TABLE IF NOT EXISTS `PermissionDurationObjects` (
  `pdID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pdObject` text,
  PRIMARY KEY (`pdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS PermissionKeyCategories;

CREATE TABLE IF NOT EXISTS `PermissionKeyCategories` (
  `pkCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkCategoryHandle` varchar(255) NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pkCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO PermissionKeyCategories VALUES(1,'page',NULL)
 ,(2,'single_page',NULL)
 ,(3,'stack',NULL)
 ,(4,'composer_page',NULL)
 ,(5,'user',NULL)
 ,(6,'file_set',NULL)
 ,(7,'file',NULL)
 ,(8,'area',NULL)
 ,(9,'block_type',NULL)
 ,(10,'block',NULL)
 ,(11,'admin',NULL)
 ,(12,'sitemap',NULL)
 ,(13,'marketplace_newsflow',NULL)
 ,(14,'basic_workflow',NULL);

DROP TABLE IF EXISTS PermissionKeys;

CREATE TABLE IF NOT EXISTS `PermissionKeys` (
  `pkID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pkHandle` varchar(255) NOT NULL,
  `pkName` varchar(255) NOT NULL,
  `pkCanTriggerWorkflow` int(1) NOT NULL DEFAULT '0',
  `pkHasCustomClass` int(1) NOT NULL DEFAULT '0',
  `pkDescription` varchar(255) DEFAULT NULL,
  `pkCategoryID` int(10) unsigned DEFAULT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pkID`),
  UNIQUE KEY `akHandle` (`pkHandle`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

INSERT INTO PermissionKeys VALUES(1,'view_page','View',0,0,'Can see a page exists and read its content.',1,0)
 ,(2,'view_page_versions','View Versions',0,0,'Can view the page versions dialog and read past versions of a page.',1,0)
 ,(3,'view_page_in_sitemap','View Page in Sitemap',0,0,'Controls whether a user can see a page in the sitemap or intelligent search.',1,0)
 ,(4,'preview_page_as_user','Preview Page As User',0,0,'Ability to see what this page will look like at a specific time in the future as a specific user.',1,0)
 ,(5,'edit_page_properties','Edit Properties',0,1,'Ability to change anything in the Page Properties menu.',1,0)
 ,(6,'edit_page_contents','Edit Contents',0,0,'Ability to make edits to at least some of the content in the page. You can lock down different block areas and specific blocks by clicking Permissions on them as well. ',1,0)
 ,(7,'edit_page_speed_settings','Edit Speed Settings',0,0,'Ability to change caching settings.',1,0)
 ,(8,'edit_page_theme','Change Theme',0,1,'Ability to change just the theme for this page.',1,0)
 ,(9,'edit_page_type','Change Page Type',0,0,'Ability to change just the page type for this page, also check out Theme permissions.',1,0)
 ,(10,'edit_page_permissions','Edit Permissions',1,0,'Ability to change permissions for this page. Warning: by granting this a user could give themselves more access.',1,0)
 ,(11,'delete_page','Delete',1,0,'Ability to move this page to the site\'s Trash.',1,0)
 ,(12,'delete_page_versions','Delete Versions',1,0,'Ability to remove old versions of this page.',1,0)
 ,(13,'approve_page_versions','Approve Changes',1,0,'Can publish an unapproved version of the page.',1,0)
 ,(14,'add_subpage','Add Sub-Page',0,1,'Can add a page beneath the current page.',1,0)
 ,(15,'move_or_copy_page','Move or Copy Page',1,0,'Can move or copy this page to another location.',1,0)
 ,(16,'schedule_page_contents_guest_access','Schedule Guest Access',0,0,'Can control scheduled guest access to this page.',1,0)
 ,(17,'add_block','Add Block',0,1,'Can add a block to any area on the site. If someone is added here they can add blocks to any area (unless that area has permissions that override these global permissions.)',9,0)
 ,(18,'add_stack','Add Stack',0,0,'Can add a stack or block from a stack to any area on the site. If someone is added here they can add stacks to any area (unless that area has permissions that override these global permissions.)',9,0)
 ,(19,'view_area','View Area',0,0,'Can view the area and its contents.',8,0)
 ,(20,'edit_area_contents','Edit Area Contents',0,0,'Can edit blocks within this area.',8,0)
 ,(21,'add_block_to_area','Add Block to Area',0,1,'Can add blocks to this area. This setting overrides the global Add Block permission for this area.',8,0)
 ,(22,'add_stack_to_area','Add Stack to Area',0,0,'Can add stacks to this area. This setting overrides the global Add Stack permission for this area.',8,0)
 ,(23,'add_layout_to_area','Add Layouts to Area',0,0,'Controls whether users get the ability to add layouts to a particular area.',8,0)
 ,(24,'edit_area_design','Edit Area Design',0,0,'Controls whether users see design controls and can modify an area\'s custom CSS.',8,0)
 ,(25,'edit_area_permissions','Edit Area Permissions',0,0,'Controls whether users can access the permissions on an area. Custom area permissions could override those of the page.',8,0)
 ,(26,'delete_area_contents','Delete Area Contents',0,0,'Controls whether users can delete blocks from this area.',8,0)
 ,(27,'schedule_area_contents_guest_access','Schedule Guest Access',0,0,'Controls whether users can schedule guest access permissions on blocks in this area. Guest Access is a shortcut for granting permissions just to the Guest Group.',8,0)
 ,(28,'view_block','View Block',0,0,'Controls whether users can view this block in the page.',10,0)
 ,(29,'edit_block','Edit Block',0,0,'Controls whether users can edit this block. This overrides any area or page permissions.',10,0)
 ,(30,'edit_block_custom_template','Change Custom Template',0,0,'Controls whether users can change the custom template on this block. This overrides any area or page permissions.',10,0)
 ,(31,'delete_block','Delete Block',0,0,'Controls whether users can delete this block. This overrides any area or page permissions.',10,0)
 ,(32,'edit_block_design','Edit Design',0,0,'Controls whether users can set custom design properties or CSS on this block.',10,0)
 ,(33,'edit_block_permissions','Edit Permissions',0,0,'Controls whether users can change permissions on this block, potentially granting themselves or others greater access.',10,0)
 ,(34,'schedule_guest_access','Schedule Guest Access',0,0,'Controls whether users can schedule guest access permissions on this block. Guest Access is a shortcut for granting permissions just to the Guest Group.',10,0)
 ,(35,'view_file_set_file','View Files',0,0,'Can view and download files in the site.',6,0)
 ,(36,'search_file_set','Search Files in File Manager',0,0,'Can access the file manager',6,0)
 ,(37,'edit_file_set_file_properties','Edit File Properties',0,0,'Can edit a file\'s properties.',6,0)
 ,(38,'edit_file_set_file_contents','Edit File Contents',0,0,'Can edit or replace files in set.',6,0)
 ,(39,'copy_file_set_files','Copy File',0,0,'Can copy files in file set.',6,0)
 ,(40,'edit_file_set_permissions','Edit File Access',0,0,'Can edit access to file sets.',6,0)
 ,(41,'delete_file_set','Delete File Set',0,0,'',6,0)
 ,(42,'delete_file_set_files','Delete File',0,0,'Can delete files in set.',6,0)
 ,(43,'add_file','Add File',0,1,'Can add files to set.',6,0)
 ,(44,'view_file','View Files',0,0,'Can view and download files.',7,0)
 ,(45,'view_file_in_file_manager','View File in File Manager',0,0,'Can access the File Manager.',7,0)
 ,(46,'edit_file_properties','Edit File Properties',0,0,'Can edit a file\'s properties.',7,0)
 ,(47,'edit_file_contents','Edit File Contents',0,0,'Can edit or replace files.',7,0)
 ,(48,'copy_file','Copy File',0,0,'Can copy file.',7,0)
 ,(49,'edit_file_permissions','Edit File Access',0,0,'Can edit access to file.',7,0)
 ,(50,'delete_file','Delete File',0,0,'Can delete file.',7,0)
 ,(51,'approve_basic_workflow_action','Approve or Deny',0,0,'Grant ability to approve workflow.',14,0)
 ,(52,'notify_on_basic_workflow_entry','Notify on Entry',0,0,'Notify approvers that a change has entered the workflow.',14,0)
 ,(53,'notify_on_basic_workflow_approve','Notify on Approve',0,0,'Notify approvers that a change has been approved.',14,0)
 ,(54,'notify_on_basic_workflow_deny','Notify on Deny',0,0,'Notify approvers that a change has been denied.',14,0)
 ,(55,'access_user_search','Access User Search',0,1,'',5,0)
 ,(56,'edit_user_properties','Edit User Details',0,1,NULL,5,0)
 ,(57,'view_user_attributes','View User Attributes',0,1,NULL,5,0)
 ,(58,'activate_user','Activate/Deactivate User',0,0,NULL,5,0)
 ,(59,'sudo','Sign in as User',0,0,NULL,5,0)
 ,(60,'delete_user','Delete User',0,0,NULL,5,0)
 ,(61,'access_group_search','Access Group Search',0,0,'',5,0)
 ,(62,'edit_groups','Edit Groups',0,0,'',5,0)
 ,(63,'assign_user_groups','Assign Groups to User',0,1,'',5,0)
 ,(64,'backup','Perform Backups',0,0,NULL,11,0)
 ,(65,'access_task_permissions','Access Task Permissions',0,0,NULL,11,0)
 ,(66,'access_sitemap','Access Sitemap',0,0,NULL,12,0)
 ,(67,'access_page_defaults','Access Page Type Defaults',0,0,NULL,11,0)
 ,(68,'empty_trash','Empty Trash',0,0,NULL,11,0)
 ,(69,'uninstall_packages','Uninstall Packages',0,0,NULL,13,0)
 ,(70,'install_packages','Install Packages',0,0,NULL,13,0)
 ,(71,'view_newsflow','View Newsflow',0,0,NULL,13,0);

DROP TABLE IF EXISTS PileContents;

CREATE TABLE IF NOT EXISTS `PileContents` (
  `pcID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemID` int(10) unsigned NOT NULL DEFAULT '0',
  `itemType` varchar(64) NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `displayOrder` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pcID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Piles;

CREATE TABLE IF NOT EXISTS `Piles` (
  `pID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `state` varchar(64) NOT NULL,
  PRIMARY KEY (`pID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS QueueMessages;

CREATE TABLE IF NOT EXISTS `QueueMessages` (
  `message_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue_id` int(10) unsigned NOT NULL,
  `handle` varchar(32) DEFAULT NULL,
  `body` varchar(8192) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `timeout` decimal(14,0) unsigned DEFAULT NULL,
  `created` int(10) unsigned NOT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_handle` (`handle`),
  KEY `message_queueid` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS QueuePageDuplicationRelations;

CREATE TABLE IF NOT EXISTS `QueuePageDuplicationRelations` (
  `queue_name` varchar(255) NOT NULL,
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  `originalCID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cID`,`originalCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Queues;

CREATE TABLE IF NOT EXISTS `Queues` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `queue_name` varchar(100) NOT NULL,
  `timeout` int(5) unsigned NOT NULL DEFAULT '30',
  PRIMARY KEY (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS SignupRequests;

CREATE TABLE IF NOT EXISTS `SignupRequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipFrom` int(10) unsigned NOT NULL DEFAULT '0',
  `date_access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_ipFrom` (`ipFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Stacks;

CREATE TABLE IF NOT EXISTS `Stacks` (
  `stID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stName` varchar(255) NOT NULL,
  `stType` int(1) unsigned NOT NULL DEFAULT '0',
  `cID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stID`),
  KEY `stType` (`stType`),
  KEY `stName` (`stName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS SystemAntispamLibraries;

CREATE TABLE IF NOT EXISTS `SystemAntispamLibraries` (
  `saslHandle` varchar(64) NOT NULL,
  `saslName` varchar(255) DEFAULT NULL,
  `saslIsActive` int(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`saslHandle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS SystemCaptchaLibraries;

CREATE TABLE IF NOT EXISTS `SystemCaptchaLibraries` (
  `sclHandle` varchar(64) NOT NULL,
  `sclName` varchar(255) DEFAULT NULL,
  `sclIsActive` int(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sclHandle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO SystemCaptchaLibraries VALUES('securimage','SecurImage (Default)',1,0);

DROP TABLE IF EXISTS SystemNotifications;

CREATE TABLE IF NOT EXISTS `SystemNotifications` (
  `snID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `snTypeID` int(3) unsigned NOT NULL DEFAULT '0',
  `snURL` text,
  `snURL2` text,
  `snDateTime` datetime NOT NULL,
  `snIsArchived` int(1) NOT NULL DEFAULT '0',
  `snIsNew` int(1) NOT NULL DEFAULT '0',
  `snTitle` varchar(255) DEFAULT NULL,
  `snDescription` text,
  `snBody` text,
  PRIMARY KEY (`snID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserAttributeKeys;

CREATE TABLE IF NOT EXISTS `UserAttributeKeys` (
  `akID` int(10) unsigned NOT NULL,
  `uakProfileDisplay` tinyint(1) NOT NULL DEFAULT '0',
  `uakMemberListDisplay` tinyint(1) NOT NULL DEFAULT '0',
  `uakProfileEdit` tinyint(1) NOT NULL DEFAULT '1',
  `uakProfileEditRequired` tinyint(1) NOT NULL DEFAULT '0',
  `uakRegisterEdit` tinyint(1) NOT NULL DEFAULT '0',
  `uakRegisterEditRequired` tinyint(1) NOT NULL DEFAULT '0',
  `displayOrder` int(10) unsigned DEFAULT '0',
  `uakIsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO UserAttributeKeys VALUES(10,0,0,1,0,1,0,1,1)
 ,(11,0,0,1,0,1,0,2,1);

DROP TABLE IF EXISTS UserAttributeValues;

CREATE TABLE IF NOT EXISTS `UserAttributeValues` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uID`,`akID`,`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserBannedIPs;

CREATE TABLE IF NOT EXISTS `UserBannedIPs` (
  `ipFrom` int(10) unsigned NOT NULL DEFAULT '0',
  `ipTo` int(10) unsigned NOT NULL DEFAULT '0',
  `banCode` int(1) unsigned NOT NULL DEFAULT '1',
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  `isManual` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipFrom`,`ipTo`),
  KEY `ipFrom` (`ipFrom`),
  KEY `ipTo` (`ipTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserGroups;

CREATE TABLE IF NOT EXISTS `UserGroups` (
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  `ugEntered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uID`,`gID`),
  KEY `uID` (`uID`),
  KEY `gID` (`gID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserOpenIDs;

CREATE TABLE IF NOT EXISTS `UserOpenIDs` (
  `uID` int(10) unsigned NOT NULL,
  `uOpenID` varchar(255) NOT NULL,
  PRIMARY KEY (`uOpenID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPermissionAssignGroupAccessList;

CREATE TABLE IF NOT EXISTS `UserPermissionAssignGroupAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPermissionAssignGroupAccessListCustom;

CREATE TABLE IF NOT EXISTS `UserPermissionAssignGroupAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`gID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPermissionEditPropertyAccessList;

CREATE TABLE IF NOT EXISTS `UserPermissionEditPropertyAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `uName` int(1) unsigned DEFAULT '0',
  `uEmail` int(1) unsigned DEFAULT '0',
  `uPassword` int(1) unsigned DEFAULT '0',
  `uAvatar` int(1) unsigned DEFAULT '0',
  `uTimezone` int(1) unsigned DEFAULT '0',
  `uDefaultLanguage` int(1) unsigned DEFAULT '0',
  `attributePermission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPermissionEditPropertyAttributeAccessListCustom;

CREATE TABLE IF NOT EXISTS `UserPermissionEditPropertyAttributeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPermissionUserSearchAccessList;

CREATE TABLE IF NOT EXISTS `UserPermissionUserSearchAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPermissionUserSearchAccessListCustom;

CREATE TABLE IF NOT EXISTS `UserPermissionUserSearchAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `gID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`gID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPermissionViewAttributeAccessList;

CREATE TABLE IF NOT EXISTS `UserPermissionViewAttributeAccessList` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`paID`,`peID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPermissionViewAttributeAccessListCustom;

CREATE TABLE IF NOT EXISTS `UserPermissionViewAttributeAccessListCustom` (
  `paID` int(10) unsigned NOT NULL DEFAULT '0',
  `peID` int(10) unsigned NOT NULL DEFAULT '0',
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paID`,`peID`,`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPointHistory;

CREATE TABLE IF NOT EXISTS `UserPointHistory` (
  `upID` int(11) NOT NULL AUTO_INCREMENT,
  `upuID` int(11) NOT NULL DEFAULT '0',
  `upaID` int(11) DEFAULT '0',
  `upPoints` int(11) DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`upID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPrivateMessages;

CREATE TABLE IF NOT EXISTS `UserPrivateMessages` (
  `msgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uAuthorID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgDateCreated` datetime NOT NULL,
  `msgSubject` varchar(255) NOT NULL,
  `msgBody` text,
  `uToID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserPrivateMessagesTo;

CREATE TABLE IF NOT EXISTS `UserPrivateMessagesTo` (
  `msgID` int(10) unsigned NOT NULL DEFAULT '0',
  `uID` int(10) unsigned NOT NULL DEFAULT '0',
  `uAuthorID` int(10) unsigned NOT NULL DEFAULT '0',
  `msgMailboxID` int(11) NOT NULL,
  `msgIsNew` int(1) NOT NULL DEFAULT '0',
  `msgIsUnread` int(1) NOT NULL DEFAULT '0',
  `msgIsReplied` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msgID`,`uID`,`uAuthorID`),
  KEY `uID` (`uID`),
  KEY `uAuthorID` (`uAuthorID`),
  KEY `msgFolderID` (`msgMailboxID`),
  KEY `msgIsNew` (`msgIsNew`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserSearchIndexAttributes;

CREATE TABLE IF NOT EXISTS `UserSearchIndexAttributes` (
  `uID` int(11) unsigned NOT NULL DEFAULT '0',
  `ak_profile_private_messages_enabled` tinyint(4) DEFAULT '0',
  `ak_profile_private_messages_notification_enabled` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`uID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS UserValidationHashes;

CREATE TABLE IF NOT EXISTS `UserValidationHashes` (
  `uvhID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `uHash` varchar(64) NOT NULL,
  `type` int(4) unsigned NOT NULL DEFAULT '0',
  `uDateGenerated` int(10) unsigned NOT NULL DEFAULT '0',
  `uDateRedeemed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uvhID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS Users;

CREATE TABLE IF NOT EXISTS `Users` (
  `uID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uName` varchar(64) NOT NULL,
  `uEmail` varchar(64) NOT NULL,
  `uPassword` varchar(255) NOT NULL,
  `uIsActive` varchar(1) NOT NULL DEFAULT '0',
  `uIsValidated` tinyint(4) NOT NULL DEFAULT '-1',
  `uIsFullRecord` tinyint(1) NOT NULL DEFAULT '1',
  `uDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uHasAvatar` tinyint(1) NOT NULL DEFAULT '0',
  `uLastOnline` int(10) unsigned NOT NULL DEFAULT '0',
  `uLastLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `uLastIP` bigint(10) NOT NULL DEFAULT '0',
  `uPreviousLogin` int(10) unsigned NOT NULL DEFAULT '0',
  `uNumLogins` int(10) unsigned NOT NULL DEFAULT '0',
  `uTimezone` varchar(255) DEFAULT NULL,
  `uDefaultLanguage` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uID`),
  UNIQUE KEY `uName` (`uName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO Users VALUES(1,'admin','maritz.hans@gmail.com','56769c88ac2d4a7323bcfd63b175eddd','1',-1,1,'2013-11-22 09:17:16',0,1385135711,1385135557,2130706433,1385111836,2,NULL,NULL);

DROP TABLE IF EXISTS UsersFriends;

CREATE TABLE IF NOT EXISTS `UsersFriends` (
  `ufID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uID` int(10) unsigned DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `friendUID` int(10) unsigned DEFAULT NULL,
  `uDateAdded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ufID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS WorkflowProgress;

CREATE TABLE IF NOT EXISTS `WorkflowProgress` (
  `wpID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wpCategoryID` int(10) unsigned DEFAULT NULL,
  `wfID` int(10) unsigned NOT NULL DEFAULT '0',
  `wpApproved` tinyint(1) NOT NULL DEFAULT '0',
  `wpDateAdded` datetime DEFAULT NULL,
  `wpDateLastAction` datetime DEFAULT NULL,
  `wpCurrentStatus` int(10) NOT NULL DEFAULT '0',
  `wrID` int(1) NOT NULL DEFAULT '0',
  `wpIsCompleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wpID`),
  KEY `wrID` (`wrID`),
  KEY `wpIsCompleted` (`wpIsCompleted`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS WorkflowProgressCategories;

CREATE TABLE IF NOT EXISTS `WorkflowProgressCategories` (
  `wpCategoryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wpCategoryHandle` varchar(255) NOT NULL,
  `pkgID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`wpCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO WorkflowProgressCategories VALUES(1,'page',NULL)
 ,(2,'file',NULL)
 ,(3,'user',NULL);

DROP TABLE IF EXISTS WorkflowProgressHistory;

CREATE TABLE IF NOT EXISTS `WorkflowProgressHistory` (
  `wphID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wpID` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `object` text,
  PRIMARY KEY (`wphID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO WorkflowProgressHistory VALUES(1,1,'2013-11-22 20:22:15','O:30:\"ApprovePagePageWorkflowRequest\":8:{s:14:\"\0*\0wrStatusNum\";i:30;s:12:\"\0*\0currentWP\";N;s:6:\"\0*\0uID\";s:1:\"1\";s:5:\"error\";s:0:\"\";s:4:\"pkID\";s:2:\"13\";s:3:\"cID\";s:1:\"1\";s:4:\"cvID\";s:1:\"2\";s:4:\"wrID\";s:1:\"1\";}')
 ,(2,2,'2013-11-22 20:53:51','O:30:\"ApprovePagePageWorkflowRequest\":8:{s:14:\"\0*\0wrStatusNum\";i:30;s:12:\"\0*\0currentWP\";N;s:6:\"\0*\0uID\";s:1:\"1\";s:5:\"error\";s:0:\"\";s:4:\"pkID\";s:2:\"13\";s:3:\"cID\";s:3:\"123\";s:4:\"cvID\";s:1:\"1\";s:4:\"wrID\";s:1:\"2\";}')
 ,(3,3,'2013-11-22 20:54:53','O:29:\"DeletePagePageWorkflowRequest\":7:{s:14:\"\0*\0wrStatusNum\";i:100;s:12:\"\0*\0currentWP\";N;s:6:\"\0*\0uID\";s:1:\"1\";s:5:\"error\";s:0:\"\";s:4:\"pkID\";s:2:\"11\";s:3:\"cID\";s:3:\"123\";s:4:\"wrID\";s:1:\"3\";}')
 ,(4,4,'2013-11-23 00:43:35','O:30:\"ApprovePagePageWorkflowRequest\":8:{s:14:\"\0*\0wrStatusNum\";i:30;s:12:\"\0*\0currentWP\";N;s:6:\"\0*\0uID\";s:1:\"1\";s:5:\"error\";s:0:\"\";s:4:\"pkID\";s:2:\"13\";s:3:\"cID\";s:3:\"124\";s:4:\"cvID\";s:1:\"1\";s:4:\"wrID\";s:1:\"4\";}')
 ,(5,5,'2013-11-23 00:48:26','O:30:\"ApprovePagePageWorkflowRequest\":8:{s:14:\"\0*\0wrStatusNum\";i:30;s:12:\"\0*\0currentWP\";N;s:6:\"\0*\0uID\";s:1:\"1\";s:5:\"error\";s:0:\"\";s:4:\"pkID\";s:2:\"13\";s:3:\"cID\";s:3:\"125\";s:4:\"cvID\";s:1:\"1\";s:4:\"wrID\";s:1:\"5\";}')
 ,(6,6,'2013-11-23 00:48:50','O:30:\"ApprovePagePageWorkflowRequest\":8:{s:14:\"\0*\0wrStatusNum\";i:30;s:12:\"\0*\0currentWP\";N;s:6:\"\0*\0uID\";s:1:\"1\";s:5:\"error\";s:0:\"\";s:4:\"pkID\";s:2:\"13\";s:3:\"cID\";s:3:\"126\";s:4:\"cvID\";s:1:\"1\";s:4:\"wrID\";s:1:\"6\";}')
 ,(7,7,'2013-11-23 01:49:54','O:30:\"ApprovePagePageWorkflowRequest\":8:{s:14:\"\0*\0wrStatusNum\";i:30;s:12:\"\0*\0currentWP\";N;s:6:\"\0*\0uID\";s:1:\"1\";s:5:\"error\";s:0:\"\";s:4:\"pkID\";s:2:\"13\";s:3:\"cID\";s:3:\"124\";s:4:\"cvID\";s:1:\"2\";s:4:\"wrID\";s:1:\"7\";}')
 ,(8,8,'2013-11-23 02:54:15','O:30:\"ApprovePagePageWorkflowRequest\":8:{s:14:\"\0*\0wrStatusNum\";i:30;s:12:\"\0*\0currentWP\";N;s:6:\"\0*\0uID\";s:1:\"1\";s:5:\"error\";s:0:\"\";s:4:\"pkID\";s:2:\"13\";s:3:\"cID\";s:1:\"1\";s:4:\"cvID\";s:1:\"3\";s:4:\"wrID\";s:1:\"8\";}');

DROP TABLE IF EXISTS WorkflowRequestObjects;

CREATE TABLE IF NOT EXISTS `WorkflowRequestObjects` (
  `wrID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wrObject` text,
  PRIMARY KEY (`wrID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS WorkflowTypes;

CREATE TABLE IF NOT EXISTS `WorkflowTypes` (
  `wftID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wftHandle` varchar(64) NOT NULL,
  `wftName` varchar(128) NOT NULL,
  `pkgID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wftID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO WorkflowTypes VALUES(1,'basic','Basic Workflow',0);

DROP TABLE IF EXISTS Workflows;

CREATE TABLE IF NOT EXISTS `Workflows` (
  `wfID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wfName` varchar(255) DEFAULT NULL,
  `wftID` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wfID`),
  UNIQUE KEY `wfName` (`wfName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atAddress;

CREATE TABLE IF NOT EXISTS `atAddress` (
  `avID` int(10) unsigned NOT NULL DEFAULT '0',
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `country` varchar(4) DEFAULT NULL,
  `postal_code` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atAddressCustomCountries;

CREATE TABLE IF NOT EXISTS `atAddressCustomCountries` (
  `atAddressCustomCountryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `country` varchar(5) NOT NULL,
  PRIMARY KEY (`atAddressCustomCountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atAddressSettings;

CREATE TABLE IF NOT EXISTS `atAddressSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akHasCustomCountries` int(1) NOT NULL DEFAULT '0',
  `akDefaultCountry` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atBoolean;

CREATE TABLE IF NOT EXISTS `atBoolean` (
  `avID` int(10) unsigned NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO atBoolean VALUES(20,1)
 ,(31,1)
 ,(34,1)
 ,(64,1)
 ,(65,1)
 ,(68,1)
 ,(69,1)
 ,(75,1)
 ,(108,1)
 ,(117,1)
 ,(118,1)
 ,(119,1);

DROP TABLE IF EXISTS atBooleanSettings;

CREATE TABLE IF NOT EXISTS `atBooleanSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akCheckedByDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO atBooleanSettings VALUES(5,0)
 ,(6,0)
 ,(8,0)
 ,(9,0)
 ,(10,1)
 ,(11,1);

DROP TABLE IF EXISTS atDateTime;

CREATE TABLE IF NOT EXISTS `atDateTime` (
  `avID` int(10) unsigned NOT NULL,
  `value` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atDateTimeSettings;

CREATE TABLE IF NOT EXISTS `atDateTimeSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akDateDisplayMode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atDefault;

CREATE TABLE IF NOT EXISTS `atDefault` (
  `avID` int(10) unsigned NOT NULL,
  `value` longtext,
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO atDefault VALUES(1,'blog, blogging')
 ,(2,'icon-book')
 ,(3,'new blog, write blog, blogging')
 ,(4,'icon-pencil')
 ,(5,'blog drafts, composer')
 ,(6,'icon-book')
 ,(7,'pages, add page, delete page, copy, move, alias')
 ,(8,'pages, add page, delete page, copy, move, alias')
 ,(9,'icon-home')
 ,(10,'pages, add page, delete page, copy, move, alias, bulk')
 ,(11,'icon-road')
 ,(12,'find page, search page, search, find, pages, sitemap')
 ,(13,'icon-search')
 ,(14,'add file, delete file, copy, move, alias, resize, crop, rename, images, title, attribute')
 ,(15,'icon-picture')
 ,(16,'file, file attributes, title, attribute, description, rename')
 ,(17,'icon-cog')
 ,(18,'files, category, categories')
 ,(19,'icon-list-alt')
 ,(21,'new file set')
 ,(22,'icon-plus-sign')
 ,(23,'users, groups, people, find, delete user, remove user, change password, password')
 ,(24,'find, search, people, delete user, remove user, change password, password')
 ,(25,'icon-user')
 ,(26,'user, group, people, permissions, access, expire')
 ,(27,'icon-globe')
 ,(28,'user attributes, user data, gather data, registration data')
 ,(29,'icon-cog')
 ,(30,'new user, create')
 ,(32,'icon-plus-sign')
 ,(33,'new user group, new group, group, create')
 ,(35,'icon-plus')
 ,(36,'group set')
 ,(37,'icon-list')
 ,(38,'forms, log, error, email, mysql, exception, survey')
 ,(39,'hits, pageviews, visitors, activity')
 ,(40,'icon-signal')
 ,(41,'forms, questions, response, data')
 ,(42,'icon-briefcase')
 ,(43,'questions, quiz, response')
 ,(44,'icon-tasks')
 ,(45,'forms, log, error, email, mysql, exception, survey, history')
 ,(46,'icon-time')
 ,(47,'new theme, theme, active theme, change theme, template, css')
 ,(48,'icon-font')
 ,(49,'theme')
 ,(50,'page types')
 ,(51,'custom theme, change theme, custom css, css')
 ,(52,'page type defaults, global block, global area, starter, template')
 ,(53,'icon-file')
 ,(54,'page attributes, custom')
 ,(55,'icon-cog')
 ,(56,'single, page, custom, application')
 ,(57,'icon-wrench')
 ,(58,'add workflow, remove workflow')
 ,(59,'icon-list')
 ,(60,'icon-user')
 ,(61,'stacks, reusable content, scrapbook, copy, paste, paste block, copy block, site name, logo')
 ,(62,'icon-th')
 ,(63,'icon-lock')
 ,(66,'block, refresh, custom')
 ,(67,'icon-wrench')
 ,(70,'add-on, addon, ecommerce, install, discussions, forums, themes, templates, blocks')
 ,(71,'update, upgrade')
 ,(72,'concrete5.org, my account, marketplace')
 ,(73,'buy theme, new theme, marketplace, template')
 ,(74,'buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace')
 ,(76,'website name, title')
 ,(77,'logo, favicon, iphone, icon, bookmark')
 ,(78,'tinymce, content block, fonts, editor, content, overlay')
 ,(79,'translate, translation, internationalization, multilingual')
 ,(80,'timezone, profile, locale')
 ,(81,'interface, quick nav, dashboard background, background image')
 ,(82,'vanity, pretty url, seo, pageview, view')
 ,(83,'bulk, seo, change keywords, engine, optimization, search')
 ,(84,'traffic, statistics, google analytics, quant, pageviews, hits')
 ,(85,'pretty, slug')
 ,(86,'turn off statistics, tracking, statistics, pageviews, hits')
 ,(87,'configure search, site search, search option')
 ,(88,'cache option, change cache, override, turn on cache, turn off cache, no cache, page cache, caching')
 ,(89,'cache option, turn off cache, no cache, page cache, caching')
 ,(90,'index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old')
 ,(91,'editors, hide site, offline, private, public, access')
 ,(92,'file options, file manager, upload, modify')
 ,(93,'security, files, media, extension, manager, upload')
 ,(94,'security, actions, administrator, admin, package, marketplace, search')
 ,(95,'security, lock ip, lock out, block ip, address, restrict, access')
 ,(96,'security, registration')
 ,(97,'antispam, block spam, security')
 ,(98,'lock site, under construction, hide, hidden')
 ,(99,'profile, login, redirect, specific, dashboard, administrators')
 ,(100,'member profile, member page, community, forums, social, avatar')
 ,(101,'signup, new user, community')
 ,(102,'smtp, mail settings')
 ,(103,'email server, mail settings, mail configuration, external, internal')
 ,(104,'email server, mail settings, mail configuration, private message, message system, import, email, message')
 ,(105,'attribute configuration')
 ,(106,'attributes, sets')
 ,(107,'attributes, types')
 ,(109,'overrides, system info, debug, support, help')
 ,(110,'errors, exceptions, develop, support, help')
 ,(111,'email, logging, logs, smtp, pop, errors, mysql, log')
 ,(112,'security, alternate storage, hide files')
 ,(113,'network, proxy server')
 ,(114,'export, backup, database, sql, mysql, encryption, restore')
 ,(115,'upgrade, new version, update')
 ,(116,'export, database, xml, starting, points, schema, refresh, custom, tables');

DROP TABLE IF EXISTS atFile;

CREATE TABLE IF NOT EXISTS `atFile` (
  `avID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atNumber;

CREATE TABLE IF NOT EXISTS `atNumber` (
  `avID` int(10) unsigned NOT NULL,
  `value` decimal(14,4) DEFAULT '0.0000',
  PRIMARY KEY (`avID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO atNumber VALUES(120,3192.0000)
 ,(121,1064.0000)
 ,(122,1521.0000)
 ,(123,528.0000)
 ,(124,1520.0000)
 ,(125,518.0000);

DROP TABLE IF EXISTS atSelectOptions;

CREATE TABLE IF NOT EXISTS `atSelectOptions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `akID` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `displayOrder` int(10) unsigned DEFAULT NULL,
  `isEndUserAdded` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atSelectOptionsSelected;

CREATE TABLE IF NOT EXISTS `atSelectOptionsSelected` (
  `avID` int(10) unsigned NOT NULL,
  `atSelectOptionID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`avID`,`atSelectOptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atSelectSettings;

CREATE TABLE IF NOT EXISTS `atSelectSettings` (
  `akID` int(10) unsigned NOT NULL,
  `akSelectAllowMultipleValues` tinyint(1) NOT NULL DEFAULT '0',
  `akSelectOptionDisplayOrder` varchar(255) NOT NULL DEFAULT 'display_asc',
  `akSelectAllowOtherValues` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS atTextareaSettings;

CREATE TABLE IF NOT EXISTS `atTextareaSettings` (
  `akID` int(10) unsigned NOT NULL DEFAULT '0',
  `akTextareaDisplayMode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`akID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO atTextareaSettings VALUES(2,'')
 ,(3,'')
 ,(4,'')
 ,(7,'');

DROP TABLE IF EXISTS btContentFile;

CREATE TABLE IF NOT EXISTS `btContentFile` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `fileLinkText` varchar(255) DEFAULT NULL,
  `filePassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btContentImage;

CREATE TABLE IF NOT EXISTS `btContentImage` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT '0',
  `fOnstateID` int(10) unsigned DEFAULT '0',
  `maxWidth` int(10) unsigned DEFAULT '0',
  `maxHeight` int(10) unsigned DEFAULT '0',
  `externalLink` varchar(255) DEFAULT NULL,
  `internalLinkCID` int(10) unsigned DEFAULT '0',
  `forceImageToMatchDimensions` int(10) unsigned DEFAULT '0',
  `altText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btContentLocal;

CREATE TABLE IF NOT EXISTS `btContentLocal` (
  `bID` int(10) unsigned NOT NULL,
  `content` longtext,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO btContentLocal VALUES(1,'	<div id=\"newsflow-header-first-run\"><h1>Welcome to concrete5.</h1>\n						<h2>It\'s easy to edit content and add pages using in-context editing.</h2></div>\n						')
 ,(2,'<div class=\"newsflow-column-first-run\">\n							<h3>Building Your Own Site</h3>\n							<p>Editing with concrete5 is a breeze. Just point and click to make changes.</p>\n							<br/>\n							<p><a href=\"javascript:void(0)\" onclick=\"ccm_getNewsflowByPath(\'/welcome/editors\')\" class=\"btn primary\">Editor\'s Guide</a></p>\n							</div>')
 ,(3,'<div class=\"newsflow-column-first-run\">\n							<h3>Developing Applications</h3>\n							<p>If you’re comfortable in PHP concrete5 should be a breeze to learn. Take a few moments to understand the architecture.</p>\n							<p><a href=\"javascript:void(0)\" onclick=\"ccm_getNewsflowByPath(\'/welcome/developers\')\" class=\"btn primary\">Developer\'s Guide</a></p>\n							</div>')
 ,(4,'<div class=\"newsflow-column-first-run\">\n							<h3>Designing Websites</h3>\n							<p>Good with CSS and HTML? You can easily theme anything with concrete5.</p>\n							<br/>\n							<p><a href=\"javascript:void(0)\" onclick=\"ccm_getNewsflowByPath(\'/welcome/designers\')\" class=\"btn primary\">Designer\'s Guide</a></p>\n							</div>')
 ,(5,'\n						<div class=\"newsflow-column-first-run\">\n						<h3>Business Background</h3>\n						<p>Worried about license structures, white-labeling or why concrete5 is a good choice for your agency?</p>\n						<p><a href=\"javascript:void(0)\" onclick=\"ccm_getNewsflowByPath(\'/welcome/executives\')\" class=\"btn primary\">Executive\'s Guide</a></p>\n						</div>')
 ,(13,'<div id=\"welcome\">\r\n<p>We believe we can make a difference in your personal and financial life. As the leaders in All-of-Life Financial Care we create lifelong financial blueprints - a tailored personal investment strategy leading the way to financial security. Our All-of-Life approach, expert advisers and unique financial strategy converts confusion into knowledge, opportunity into success, and commitment into absolute trust. Give us the opportunity to sit down with you and show you how.</p>\r\n</div>');

DROP TABLE IF EXISTS btCoreScrapbookDisplay;

CREATE TABLE IF NOT EXISTS `btCoreScrapbookDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `bOriginalID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bID`),
  KEY `bOriginalID` (`bOriginalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btCoreStackDisplay;

CREATE TABLE IF NOT EXISTS `btCoreStackDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `stID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btDashboardNewsflowLatest;

CREATE TABLE IF NOT EXISTS `btDashboardNewsflowLatest` (
  `bID` int(10) unsigned NOT NULL,
  `slot` varchar(1) NOT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO btDashboardNewsflowLatest VALUES(8,'A')
 ,(9,'B')
 ,(12,'C');

DROP TABLE IF EXISTS btDateNav;

CREATE TABLE IF NOT EXISTS `btDateNav` (
  `bID` int(10) unsigned NOT NULL,
  `num` smallint(5) unsigned NOT NULL,
  `cParentID` int(10) unsigned NOT NULL DEFAULT '1',
  `cThis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ctID` smallint(5) unsigned DEFAULT NULL,
  `flatDisplay` int(11) DEFAULT '0',
  `defaultNode` varchar(64) DEFAULT 'current_page',
  `truncateTitles` int(11) DEFAULT '0',
  `truncateSummaries` int(11) DEFAULT '0',
  `displayFeaturedOnly` int(11) DEFAULT '0',
  `truncateChars` int(11) DEFAULT '128',
  `truncateTitleChars` int(11) DEFAULT '128',
  `showDescriptions` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btExternalForm;

CREATE TABLE IF NOT EXISTS `btExternalForm` (
  `bID` int(10) unsigned NOT NULL,
  `filename` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btFlashContent;

CREATE TABLE IF NOT EXISTS `btFlashContent` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `minVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btForm;

CREATE TABLE IF NOT EXISTS `btForm` (
  `bID` int(10) unsigned NOT NULL,
  `questionSetId` int(10) unsigned DEFAULT '0',
  `surveyName` varchar(255) DEFAULT NULL,
  `thankyouMsg` text,
  `notifyMeOnSubmission` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recipientEmail` varchar(255) DEFAULT NULL,
  `displayCaptcha` int(11) DEFAULT '1',
  `redirectCID` int(11) DEFAULT '0',
  `addFilesToSet` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`),
  KEY `questionSetIdForeign` (`questionSetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btFormAnswerSet;

CREATE TABLE IF NOT EXISTS `btFormAnswerSet` (
  `asID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questionSetId` int(10) unsigned DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uID` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`asID`),
  KEY `questionSetId` (`questionSetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btFormAnswers;

CREATE TABLE IF NOT EXISTS `btFormAnswers` (
  `aID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asID` int(10) unsigned DEFAULT '0',
  `msqID` int(10) unsigned DEFAULT '0',
  `answer` varchar(255) DEFAULT NULL,
  `answerLong` text,
  PRIMARY KEY (`aID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btFormQuestions;

CREATE TABLE IF NOT EXISTS `btFormQuestions` (
  `qID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msqID` int(10) unsigned DEFAULT '0',
  `bID` int(10) unsigned DEFAULT '0',
  `questionSetId` int(10) unsigned DEFAULT '0',
  `question` varchar(255) DEFAULT NULL,
  `inputType` varchar(255) DEFAULT NULL,
  `options` text,
  `position` int(10) unsigned DEFAULT '1000',
  `width` int(10) unsigned DEFAULT '50',
  `height` int(10) unsigned DEFAULT '3',
  `required` int(11) DEFAULT '0',
  PRIMARY KEY (`qID`),
  KEY `questionSetId` (`questionSetId`),
  KEY `msqID` (`msqID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btGoogleMap;

CREATE TABLE IF NOT EXISTS `btGoogleMap` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zoom` int(8) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btGuestBook;

CREATE TABLE IF NOT EXISTS `btGuestBook` (
  `bID` int(10) unsigned NOT NULL,
  `requireApproval` int(11) DEFAULT '0',
  `title` varchar(100) DEFAULT 'Comments',
  `dateFormat` varchar(100) DEFAULT NULL,
  `displayGuestBookForm` int(11) DEFAULT '1',
  `displayCaptcha` int(11) DEFAULT '1',
  `authenticationRequired` int(11) DEFAULT '0',
  `notifyEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btGuestBookEntries;

CREATE TABLE IF NOT EXISTS `btGuestBookEntries` (
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT '1',
  `entryID` int(11) NOT NULL AUTO_INCREMENT,
  `uID` int(11) DEFAULT '0',
  `commentText` longtext,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `entryDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved` int(11) DEFAULT '1',
  PRIMARY KEY (`entryID`),
  KEY `cID` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btNavigation;

CREATE TABLE IF NOT EXISTS `btNavigation` (
  `bID` int(10) unsigned NOT NULL,
  `orderBy` varchar(255) DEFAULT 'alpha_asc',
  `displayPages` varchar(255) DEFAULT 'top',
  `displayPagesCID` int(10) unsigned NOT NULL DEFAULT '1',
  `displayPagesIncludeSelf` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displaySubPages` varchar(255) DEFAULT 'none',
  `displaySubPageLevels` varchar(255) DEFAULT 'none',
  `displaySubPageLevelsNum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `displayUnavailablePages` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btNextPrevious;

CREATE TABLE IF NOT EXISTS `btNextPrevious` (
  `bID` int(10) unsigned NOT NULL,
  `linkStyle` varchar(32) DEFAULT NULL,
  `nextLabel` varchar(128) DEFAULT NULL,
  `previousLabel` varchar(128) DEFAULT NULL,
  `parentLabel` varchar(128) DEFAULT NULL,
  `showArrows` int(11) DEFAULT '1',
  `loopSequence` int(11) DEFAULT '1',
  `excludeSystemPages` int(11) DEFAULT '1',
  `orderBy` varchar(20) DEFAULT 'display_asc',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btPageList;

CREATE TABLE IF NOT EXISTS `btPageList` (
  `bID` int(10) unsigned NOT NULL,
  `num` smallint(5) unsigned NOT NULL,
  `orderBy` varchar(32) DEFAULT NULL,
  `cParentID` int(10) unsigned NOT NULL DEFAULT '1',
  `cThis` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `includeAllDescendents` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `paginate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayAliases` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ctID` smallint(5) unsigned DEFAULT NULL,
  `rss` int(11) DEFAULT '0',
  `rssTitle` varchar(255) DEFAULT NULL,
  `rssDescription` longtext,
  `truncateSummaries` int(11) DEFAULT '0',
  `displayFeaturedOnly` int(11) DEFAULT '0',
  `truncateChars` int(11) DEFAULT '128',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btRssDisplay;

CREATE TABLE IF NOT EXISTS `btRssDisplay` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `dateFormat` varchar(100) DEFAULT NULL,
  `itemsToDisplay` int(10) unsigned DEFAULT '5',
  `showSummary` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `launchInNewWindow` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btSearch;

CREATE TABLE IF NOT EXISTS `btSearch` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `buttonText` varchar(128) DEFAULT NULL,
  `baseSearchPath` varchar(255) DEFAULT NULL,
  `postTo_cID` varchar(255) DEFAULT NULL,
  `resultsURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btSlideshow;

CREATE TABLE IF NOT EXISTS `btSlideshow` (
  `bID` int(10) unsigned NOT NULL,
  `fsID` int(10) unsigned DEFAULT NULL,
  `playback` varchar(50) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `fadeDuration` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btSlideshowImg;

CREATE TABLE IF NOT EXISTS `btSlideshowImg` (
  `slideshowImgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(10) unsigned DEFAULT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `fadeDuration` int(10) unsigned DEFAULT NULL,
  `groupSet` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `imgHeight` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`slideshowImgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btSurvey;

CREATE TABLE IF NOT EXISTS `btSurvey` (
  `bID` int(10) unsigned NOT NULL,
  `question` varchar(255) DEFAULT '',
  `requiresRegistration` int(11) DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btSurveyOptions;

CREATE TABLE IF NOT EXISTS `btSurveyOptions` (
  `optionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bID` int(11) DEFAULT NULL,
  `optionName` varchar(255) DEFAULT NULL,
  `displayOrder` int(11) DEFAULT '0',
  PRIMARY KEY (`optionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btSurveyResults;

CREATE TABLE IF NOT EXISTS `btSurveyResults` (
  `resultID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `optionID` int(10) unsigned DEFAULT '0',
  `uID` int(10) unsigned DEFAULT '0',
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL,
  `ipAddress` varchar(128) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`resultID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btTags;

CREATE TABLE IF NOT EXISTS `btTags` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `targetCID` int(11) DEFAULT NULL,
  `displayMode` varchar(20) DEFAULT 'page',
  `cloudCount` int(11) DEFAULT '10',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btVideo;

CREATE TABLE IF NOT EXISTS `btVideo` (
  `bID` int(10) unsigned NOT NULL,
  `fID` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS btYouTube;

CREATE TABLE IF NOT EXISTS `btYouTube` (
  `bID` int(10) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `videoURL` varchar(255) DEFAULT NULL,
  `vHeight` varchar(255) DEFAULT NULL,
  `vWidth` varchar(255) DEFAULT NULL,
  `vPlayer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



