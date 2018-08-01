(function(){

	Phone.apps['bank-transfer']  = {};
	const app                    = Phone.apps['bank-transfer'];
	const MAX_CONTACTS_ON_SCREEN = 16;
	const contactTpl             = '{{#players}}<div class="contact" data-source="{{source}}"><div class="contact-name">{{name}}</div></div>{{/players}}';
	let currentRow               = 0;
	let currentPlayer;

	app.open = function(players) {

		currentRow = 0;

		const html = Mustache.render(contactTpl, {players});

		$('#app-bank-transfer .contact-list').html(html);

		const elems = $('#app-bank-transfer .contact-list .contact');

		if(elems.length > 0)
			app.selectElem(elems[0]);

	}

	app.move = function(direction) {

		const elems = $('#app-bank-transfer .contact-list .contact');

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

		elems.show();

		let diff = currentRow - MAX_CONTACTS_ON_SCREEN + 2;

		if(diff > 0) {

			for(let i=0; i<diff; i++)
				$(elems[i]).hide();

		}

		app.selectElem(elems[currentRow]);

	}

	app.enter = function() {

		Phone.open('bank-transfer-menu', currentPlayer)

	}

	app.selectElem = function(elem) {
		
		const elems   = $('#app-bank-transfer .contact-list .contact');
		currentPlayer = parseInt($(elem).data('source'));
		
		elems.removeClass('selected');

		$(elem).addClass('selected');
	}

})();