$(document).ready(function() {
	var scrollPos = -150;


	$("#Slide li").each(function (index) {
		console.log(index + ": " + scrollPos);
		$(this).css({
			"left": index * 150 - scrollPos
		});
	});

	$('[data-toggle="popover"]').popover({
		trigger: 'hover',
		'placement': 'right',
		html : true
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
});