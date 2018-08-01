(function(){

	Phone.apps['incoming-call'] = {};
	const app                   = Phone.apps['incoming-call'];

	let currentCol = 0;
	let currentAction;
	let currentContact;
	let callSound;

	app.open = function(contact) {

		currentContact = contact;
		currentCol     = 0;
		const elems    = $('#app-incoming-call .contact-action');

		$('#app-incoming-call .contact-action[data-action="accept"]').show();

		$('#app-incoming-call .contact-name')  .text(contact.name);
		$('#app-incoming-call .contact-number').text(contact.number);

		if(elems.length > 0)
			app.selectElem(elems[0]);

		callSound      = new Audio('ogg/incoming-call.ogg');
		callSound.loop = true;

		callSound.play();

	}

	app.close = function() {

		if(callSound) {
			callSound.pause();
			callSound = null;
		}

		$.post('http://esx_phone3/end_call', JSON.stringify({
			target : currentContact.target,
			channel: currentContact.channel,
		}))

		return true;

	}

	app.move = function(direction) {

		const elems = $('#app-incoming-call .contact-action');

		switch(direction) {

			case 'LEFT': {

				if(currentCol > 0)
					currentCol--;

				break;
			}

			case 'RIGHT': {

				if(currentCol + 1 < elems.length)
					currentCol++;

				break;
			}

			default: break;

		}

		app.selectElem(elems[currentCol]);

	}

	app.enter = function() {

		switch(currentAction) {

			case 'accept' : {
				
				const elems = $('#app-incoming-call .contact-action');

				callSound.pause();
				callSound = null;

				$('#app-incoming-call .contact-action[data-action="accept"]').hide();

				currentCol = 1;
				app.selectElem(elems[currentCol]);
				
				$.post('http://esx_phone3/accept_call', JSON.stringify({
					target : currentContact.target,
					channel: currentContact.channel,
				}));

				break;
			}

			case 'deny' : {
				Phone.close();
				break;
			}

			default: break;

		}

	}

	app.selectElem = function(elem) {
		
		const elems = $('#app-incoming-call .contact-action');

		currentAction = $(elem).data('action');

		elems.removeClass('selected animated pulse infinite');

		$(elem).addClass('selected animated pulse infinite');
	}

})();