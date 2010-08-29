$(document).ready(function() {
	$("a").click(function(e){	
		var $this = $(this);
		var row_column = $this.attr("title");
		$("#cell" + row_column).flip({
			direction: "lr",
			color: "black",
			onBefore: function(){$(".revert").show();}
		});
		$("input[name='" + row_column + "']").val("true");
		return false;
	});		
});