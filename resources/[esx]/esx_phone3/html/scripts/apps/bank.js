(function(){

	Phone.apps['bank'] = {};
	const app          = Phone.apps['bank'];
	let currentRow     = 0;
	const elems        = [];
	let currentAction;

	$('#app-bank .button').each((i,e) => elems.push(e));

	elems.reverse();

	app.open = function(data) {

		if(elems.length > 0)
			app.selectElem(elems[0]);

	}

	app.move = function(direction) {

		switch(direction) {

			case 'TOP': {

				if(currentRow > 0)
					currentRow--;

				break;
			}

			case 'DOWN': {

				if(currentRow + 1 < elems.length)
					currentRow++;

				break;
			}

			default: break;

		}

		app.selectElem(elems[currentRow]);

	}

	app.enter = function() {

		switch(currentAction) {

			case 'contact' : {
				Phone.open('contact-action-message', {name: 'Banque', number: 'banker'});
				break;
			}

			case 'transfer' : {
				$.post('http://esx_phone3/get_players', JSON.stringify({reason: 'bank_transfer'}))
				break;
			}

			default: break;

		}

	}

	app.selectElem = function(elem) {

		currentAction = $(elem).data('action');

		for(let i=0; i<elems.length; i++)
			$(elems[i]).removeClass('selected animated pulse infinite');

		$(elem).addClass('selected animated pulse infinite');
	}

})();