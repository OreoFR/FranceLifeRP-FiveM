(function(){

	Phone.apps['contact-action-call'] = {};
	const app                         = Phone.apps['contact-action-call'];

	let currentCol     = 0;
	let intervals      = [];
	let currentContact = {}
	let callSound      = null;
	let currentChannel;

	app.open = function(contact) {

		currentCol     = 0;
		currentContact = contact;

		const elems = $('#app-contact-actions .contact-action');

		if(elems.length > 0)
			app.selectElem(elems[0]);

		$('#app-contact-action-call .loader .info').text('Appel en cours');
		$('#app-contact-action-call').removeClass('online');
		$('#app-contact-action-call .contact-name')  .text(contact.name);
		$('#app-contact-action-call .contact-number').text(contact.number);

		callSound      = new Audio('ogg/outgoing-call.ogg');
		callSound.loop = true;

		callSound.play();

		$.post('http://esx_phone3/start_call', JSON.stringify({number: currentContact.number}))

	}

	app.close = function() {

		if(callSound != null) {
			callSound.pause();
			callSound = null;
		}

		intervals.map(e => clearInterval(e));

		intervals = [];

		if(typeof currentChannel != 'undefined') {

			$.post('http://esx_phone3/end_call', JSON.stringify({
				target : currentTarget,
				channel: currentChannel,
			}))

		}

		return true;

	}

	app.move = function(direction) {

		const elems = $('#app-contact-actions .contact-action');

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
		
	}

	app.selectElem = function(elem) {
		
		const elems = $('#app-contact-actions .contact-action');

		elems.removeClass('selected animated pulse infinite');

		$(elem).addClass('selected animated pulse infinite');
	}

	app.startCall = function(channel, target) {

		const startDate = new Date;
		currentChannel  = channel;
		currentTarget   = target;

		callSound.pause();
		callSound = null; 

		$('#app-contact-action-call').addClass('online');
		$('#app-contact-action-call .loader .info').text('0:00');

		intervals.push(setInterval(() => {

			const currentDate = new Date;
			const elapsed     = new Date(currentDate - startDate);

			$('#app-contact-action-call .loader .info').text(elapsed.getMinutes() + ':' + elapsed.getSeconds().toString().padStart(2, '0'));

		}, 1000));

	}

})();