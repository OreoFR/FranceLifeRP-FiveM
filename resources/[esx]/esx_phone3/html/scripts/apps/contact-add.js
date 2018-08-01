(function(){

	Phone.apps['contact-add'] = {};
	const app                 = Phone.apps['contact-add'];

	app.open = function(contact) {

		const elems = $('#app-contact-add .add-contact-wrapper div input')

		elems.val('');

		setTimeout(() => {
			$(elems[0]).focus();
		}, 50);

		$.post('http://esx_phone3/request_focus');

	}

	app.close = function() {
		$.post('http://esx_phone3/release_focus');
		return true;
	}

	app.move = function(direction) {


	}

	app.enter = function() {

		const elems = $('#app-contact-add .add-contact-wrapper div input')

		for(let i=0; i<elems.length; i++) {

			if($(elems[i]).is(':focus') && $(elems[i]).val().trim() != '') {

				if(typeof elems[i + 1] != 'undefined')
					$(elems[i + 1]).focus();
				else
					app.submit();

				break;
			}

		}

	}

	app.submit = function() {

		const name   = $('#app-contact-add input[name="add-contact-name"]').val();
		const number = $('#app-contact-add input[name="add-contact-number"]').val();

		$.post('http://esx_phone3/add_contact', JSON.stringify({
			phoneNumber: number,
			contactName: name
		}));

		Phone.close();
	}

	app.selectElem = function(elem) {

	}

})();