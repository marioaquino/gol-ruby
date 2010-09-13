var ws = null;
var timer = null;

$(function () {
	$('#pauseButton').toggle(function() {
		toggleTimer();
		$(this).val('Resume Evolution');
	}, function() {
	  	toggleTimer();
		$(this).val('Pause Evolution');
	});
	
	if(typeof(WebSocket) == "undefined") {
	  alert("WebSockets aren't supported in your browser!");
	}
	else {
		ws = new WebSocket("ws://127.0.0.1:9090");

		ws.onopen = function() {
			ws.send(JSON.stringify({
				"type" : "seed",
				"alive" : getLiveCells(),
				"rows" : rows,
				"columns" : columns
			     }));
			toggleTimer();
		};
		ws.onmessage = function(evt) {
			liveCells = JSON.parse(evt.data).live;
			evolve(liveCells);
		};
		ws.onclose = function() {};
	}});

function toggleTimer() {
	if (timer == null) {
		timer = window.setInterval(function () {
			ws.send(JSON.stringify({
				"type" : "step"
			}));
		}, 1000);
	} else {
		window.clearInterval(timer);
	    timer = null;
	}
}

function getLiveCells() {
	return $.map($(".flip"), function(item) {
		return item.id;
	});
}

function revive(elem) {
	if (!$(elem).hasClass('flip')) {
		$(elem).addClass('flip');
	}
};

function kill(elem) {
	$(elem).removeClass('flip');
};

function evolve(liveCells) {
	$("td > div").each(function() {
		if($.inArray(this.id, liveCells) > -1) {
			revive(this);
		} else {
			kill(this);
		}
	});
};
