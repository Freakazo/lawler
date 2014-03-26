window.onload = (function() {
	var scrollPos = 150;
	var offset = 0;

	function getImageWidth(image){
		var ratio = image.width() / image.height();
		var width = ratio*365;
		return width;
	}




	//Initialize all the elements with on the showcase
	$("#Slide li").each(function (index) {

		$(this).attr('sofset', offset);

		//Initialize element position on showcase
		$(this).css({
			"left": (offset - scrollPos) + "px"
		});

		//Calculate image width instead of default 100px for images that need to be wider than 100px
		var width = getImageWidth($(this));
		$(this).find("img").css({ "width": width + "px"})

		//offset for next element to use		
		offset += width + 20; //width + x where x is space between elements
	});

	$('[data-toggle="popover"]').popover({
		trigger: 'hover',
		'placement': 'right',
		html : true
	});

	$("#Left").click(function () {
		if(scrollPos > -100)
		{
			scrollPos -= 250;
			$("#Slide li").each(function (index) {
				$(this).animate({
					"left": [$(this).attr('sofset') - scrollPos, "easeOutQuad"]
				}, 750);
			});
		}
		if (scrollPos -50 < -100){
			$("#Slide #Left .glyphicon").css("color", "grey");
		}
	});

	$("#Right").click(function () {

		console.log(scrollPos);
		scrollPos += 250;
				if(scrollPos > -100){
			$("#Slide #Left .glyphicon").css("color", "white");
		}
		$("#Slide li").each(function (index) {
			$(this).animate({
				"left": [$(this).attr('sofset') - scrollPos, "easeOutQuad"]
			}, 750);
		});
	});

	$("#Slide img").hover(function() {
		$(this).stop(true, false).animate({ "width" : (getImageWidth($(this)) + 50) + "px", "left" : "-25px"});
		$(this).parent().find('name').stop(true, false).animate({"left" : "-25px"});

	}, function() {
		$(this).stop(true, false).animate({ "width" : getImageWidth($(this)) + "px", "left" : "0px"});
		$(this).parent().find('name').stop(true, false).animate({"left" : "0px"});
	});

	$("#Slide #Left").hover(function(){
		$("#Slide #Left .glyphicon").stop(true, false).animate({ "font-size" : "28px", "top" : "44.5%" });
	}, function() {
		$("#Slide #Left .glyphicon").stop(true, false).animate({ "font-size" : "24px", "top": "45%"});
	});

	$("#Slide #Right").hover(function(){
		$("#Slide #Right .glyphicon").stop(true, false).animate({ "font-size" : "28px", "top" : "44.5%" });
	}, function() {
		$("#Slide #Right .glyphicon").stop(true, false).animate({ "font-size" : "24px", "top": "45%" });
	});
});