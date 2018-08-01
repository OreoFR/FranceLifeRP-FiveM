(function(){

	let news               = [];
	let currentNewsEndTime = 0;

	let tickNews = function(){

		let currTime = + new Date();

		if(news.length > 0){

			if(currentNewsEndTime < currTime){

				currentNewsEndTime = currTime + 5 * 60000;
				let text           = news.shift();

				$('#news').text(text).show();

				$('#news').marquee({
			    duration         : 10000,
			    gap              : 50,
			    delayBeforeStart : 0,
			    direction        : 'left',
			    duplicated       : true
				});
			}

		} else {

			if(currentNewsEndTime < currTime)
				$('#news').hide();
		}

	}

	window.onData = function(data){

		if(data.addNews === true){
			news.push(data.text)
		}
	}

	window.onload = function(e){ window.addEventListener('message', function(event){ onData(event.data) }); }

	setInterval(tickNews, 1000);

})()