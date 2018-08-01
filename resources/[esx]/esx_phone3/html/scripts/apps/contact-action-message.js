(function(){

	Phone.apps['contact-action-message'] = {};
	const app                            = Phone.apps['contact-action-message'];

	const messagesTpl = '{{#messages}}<div class="time">{{time}}</div><div class="message{{#self}} self{{/self}}">{{body}}{{#position}}&nbsp;<i class="fa fa-map-marker" style="color: #FF0000;"/>{{/position}}</div>{{/messages}}';

	let isTyping              = false;
	let currentCol            = 0;
	let currentContact;

	app.open = function(contact) {

		isTyping       = false;
		currentContact = contact;

		app.updateMessages();

		$('#app-contact-action-message .message-input textarea[name="message"]').removeClass('typing');

		setTimeout(() => {
			$('#app-contact-action-message .message-input textarea[name="message"]').focus();
			$('#app-contact-action-message .message-actions')[0].scrollIntoView();
		}, 50);

	}

	app.close = function() {

		if(isTyping){

			isTyping = false;
			$('#app-contact-action-message .message-input textarea[name="message"]').removeClass('typing');
			$.post('http://esx_phone3/release_focus');

			return false;
		
		} else {

			return true;
		
		}
	}

	app.move = function(direction) {

		const scrollable = $('#app-contact-action-message .app-inner')[0];

		switch(direction) {

			case 'TOP': {
				scrollable.scrollTop -= 15;
				break;
			}

			case 'DOWN': {
				scrollable.scrollTop += 15;
				break;
			}

			case 'LEFT': {
				
				if(isShowingConfirmation) {

					if(currentCol > 0) {

						currentCol--;

						$('#app-contact-action-message .message-confirm div').removeClass('selected animated pulse infinite');
						$($('#app-contact-action-message .message-confirm div')[currentCol]).addClass('selected animated pulse infinite');
						currentConfirmationAction = $($('#app-contact-action-message .message-confirm div')[currentCol]).data('action');

					}
				}

				break;
			}

			case 'RIGHT': {

				if(isShowingConfirmation) {

					if(currentCol < $('#app-contact-action-message .message-confirm div').length - 1) {

						currentCol++;

						$('#app-contact-action-message .message-confirm div').removeClass('selected animated pulse infinite');
						$($('#app-contact-action-message .message-confirm div')[currentCol]).addClass('selected animated pulse infinite');
						currentConfirmationAction = $($('#app-contact-action-message .message-confirm div')[currentCol]).data('action');

					}
				}

				break;
			}

			default: break;

		}

	}

	app.enter = function() {

		if(isTyping) {

			const msg  = $('#app-contact-action-message .message-input textarea[name="message"]').val();
			const date = new Date;

			Phone.messages.push({
				name     : currentContact.name,
				number   : currentContact.number,
				position : false,
				anon     : false,
				job      : false,
				self     : true,
				time     : date.getHours() + ':' + date.getMinutes().toString().padStart(2, '0'),
				timestamp: +date,
				body     : msg,
				read     : true,
			});

			$.post('http://esx_phone3/send', JSON.stringify({
				message: msg,
				number : currentContact.number,
				anon   : $('input[name="anon"]').is(':checked'),
			}))

			app.updateMessages();


			$('#app-contact-action-message .message-dialog').hide();
			$('#app-contact-action-message .message-input textarea[name="message"]').val('');
			$('#app-contact-action-message .message-input textarea[name="message"]').focus();
			$('#app-contact-action-message .message-input textarea[name="message"]').removeClass('typing');
			$('#app-contact-action-message .message-actions')[0].scrollIntoView();

			isTyping = false;

			$.post('http://esx_phone3/release_focus');

		} else {

			isTyping = true;
			$('#app-contact-action-message .message-input textarea[name="message"]').addClass('typing');
			$.post('http://esx_phone3/request_focus');
		}
	}

	app.updateMessages = function() {

		const messages = Phone.messages.filter((e) => e.number == currentContact.number);

		for(let i=0; i<messages.length; i++)
			messages[i].read = true;

		Phone.apps['messages'].updateMessages();

		const html = Mustache.render(messagesTpl, {messages});

		$('#app-contact-action-message .message-container').html(html);

	}

	app.activateGPS = function() {

		const filtered = Phone.messages.filter((e) => !e.self && e.number == currentContact.number && e.position != false);

		if(filtered.length > 0) {
			filtered.reverse();
			$.post('http://esx_phone3/activate_gps', JSON.stringify(filtered[0].position));
		}

	}

})();