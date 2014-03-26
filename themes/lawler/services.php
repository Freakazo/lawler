<?php $this->inc('header.php'); ?>
<link rel="stylesheet" type="text/css" href="<?=$this->getThemePath()?>/css/services.css">
<div id="content">
	<div id="container">
		<div id="intro">
			<?php $b = new Area('Content'); $b->display($c); ?>
		</div>
		<div class="panel-group" id="accordion">
			<?php $b = new Area('Accordion'); $b->display($c); ?>
		</div><!-- row -->
		<?php $this->inc('elements/footer.php'); ?>
	</div><!-- content -->
</div>

<script type="text/javascript">
var oldanchor = null;
$(document).ready(function() {
	if(window.location.hash){
	    var anchor = window.location.hash.replace("#", "");
	    oldanchor = anchor;
	    $("#" + anchor).collapse('show');

	    if(anchor !== "")
	    {
		    function goToByScroll(id){
		        $('html,body').animate({scrollTop: $("#"+id).offset().top - 130},'slow');
			}

			setTimeout(function(){
			      goToByScroll(anchor);
			},1000);    	
	    }
	}

});


$(window).on('hashchange', function() {

    var anchor = window.location.hash.replace("#", "");
    if(oldanchor != null) {
    	$("#" + oldanchor).collapse('hide');
    }
    oldanchor = anchor;

    $("#" + anchor).collapse('show');

    if(anchor !== "")
    {
	    function goToByScroll(id){
	        $('html,body').animate({scrollTop: $("#"+id).offset().top - 130},'slow');
		}

		setTimeout(function(){
		      goToByScroll(anchor);
		},400);
    }
});

</script>


</body>
</html>



