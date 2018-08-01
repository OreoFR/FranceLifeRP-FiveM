(function(){

	let status = []

	let renderStatus = function(){

		$('#status_list').html('');

		for(let i=0; i<status.length; i++){

			if(!status[i].visible)
				continue;

			let statusDiv = $(
				'<div class="status">' +
					'<div class="vert-stat">' +
                        '<img src="' +
                        status[i].name +
                        '.png">' +
						'<div class="bg" style="z-index: -1;">' +
                        '</div>' +
					'</div>' +
				'</div>');
			
			statusDiv.find('.bg')
				.css({'background-color' : status[i].color,
                      'height'            : (status[i].val / 10000) + '%'})
			;

			statusDiv.find('.stagtus_val')
				.css({
					'background-color' : status[i].color,
					'width'            : (status[i].val / 10000) + '%'
				})
			;

			$('#status_list').append(statusDiv)
		}

	}


	window.onData = function(data){

		if(data.update){
			
			status.length = 0;

			for(let i=0; i<data.status.length; i++)
				status.push(data.status[i])

			renderStatus();
		}

		if(data.setDisplay){
			$('#status_lisst').css({'opacity' : data.display})
		}

	}

	window.onload = function(e){ window.addEventListener('message', function(event){ onData(event.data) }); }

})()