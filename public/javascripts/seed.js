$(document).ready(function() {
	$('.click').toggle(function() {
		$(this).addClass('flip');
		$("input[name='" + $(this).attr("id") + "']").val("true");
	},
	function() {
		$(this).removeClass('flip');
		$("input[name='" + $(this).attr("id") + "']").val("false");
	});
});
