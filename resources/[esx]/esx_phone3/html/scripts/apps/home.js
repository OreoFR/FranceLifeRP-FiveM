(function(){

	Phone.apps['home']      = {};
	const app               = Phone.apps['home'];
	const ICONS_PER_ROW     = 4;
	const ICONS_PER_COL     = 8;
	const STATUS_BAR_HEIGHT = 16;
	const SCREEN_HEIGHT     = 430;
	const SCROLLBAR_HEIGHT  = 30;
	let currentRow          = 0;
	let currentCol          = 0;
	let currentApp          = {};

	app.open = function(data) {
		
		currentRow = 0;
		currentCol = 0;

		app.updateCounters();

		app.selectElem($('#app-home .menu-icon')[0]);

	}

	app.move = function(direction) {

		const elems = $('#app-home .menu-icon');

		switch(direction) {

			case 'TOP': {

				if(currentRow > 0)
					currentRow--;

				break;
			}

			case 'DOWN': {

				if(currentRow + 1 < Math.ceil(elems.length / ICONS_PER_ROW) && currentRow * ICONS_PER_ROW + currentCol + ICONS_PER_ROW < elems.length)
					currentRow++;

				break;
			}

			case 'LEFT': {

				if(currentCol > 0)
					currentCol--;

				break;
			}

			case 'RIGHT': {

				if(currentCol + 1 < ICONS_PER_ROW && currentRow * ICONS_PER_ROW + currentCol < elems.length - 1)
					currentCol++;

				break;
			}

			default: break;

		}

		const index = currentRow * ICONS_PER_ROW + currentCol;
		let   diff  = index - ICONS_PER_ROW * ICONS_PER_COL + ICONS_PER_ROW;

		if(diff > 0) {

			while(diff % ICONS_PER_ROW != 0)
				diff--;

			for(let i=0; i<diff; i++)
				$(elems[i]).hide();
		}

		app.selectElem(elems[index]);

	}

	app.enter = function() {
		Phone.open(currentApp.name, currentApp.data);
	}

	app.selectElem = function(elem) {
		
		const elems = $('#app-home .menu-icon');
		
		elems.removeClass('selected animated pulse infinite').show();
		$(elem).addClass('selected animated pulse infinite');
		
		currentApp.name = $(elem).data('app');

		let data       = {};
		const argsJSON = $(elem).data('args');

		if(typeof argsJSON != 'undefined')
			data = argsJSON;

		currentApp.data = data;

		$('#app-home .app-inner .scrollbar').css('top', top + 'px');
	}

	app.updateCounters = function() {

		let unread = 0;

		for(let i=0; i<Phone.messages.length; i++)
			if(!Phone.messages[i].read)
				unread++;

		if(unread == 0)
			$('#app-home .menu-icon[data-app="messages"] .counter').hide();
		else
			$('#app-home .menu-icon[data-app="messages"] .counter').text(unread).show();
		
	}

})();