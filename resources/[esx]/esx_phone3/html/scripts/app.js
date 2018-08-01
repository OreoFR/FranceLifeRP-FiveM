(function(){

	window.Phone      = {};
	Phone.apps        = {};
	Phone.opened      = [];
	Phone.contacts    = [];
	Phone.messages    = [];
	Phone.appData     = {};
	Phone.hiddenIcons = {};

	Phone.contacts.sort((a,b) => a.name.localeCompare(b.name));

	Phone.move = function(direction) {

		const currrent = this.current();

		if(currrent != null)
			this.apps[currrent].move(direction);

	}

	Phone.enter = function(direction) {

		const currrent = this.current();

		if(currrent != null)
			this.apps[currrent].enter();

	}

	Phone.open = function(appName, data = {}) {
		
		Phone.appData[appName] = data;
		Phone.opened.push(appName);

		Phone.apps[appName].open(data);
		
		$('.app').hide();
		$('#app-' + appName).show();

	}

	Phone.addContact = function(name, number) {
		this.contacts.push({name, number});
		this.contacts.sort((a,b) => a.name.localeCompare(b.name));
	}

	Phone.close = function() {
			
		const currrent = this.current();

		if(currrent != null) {

			if(typeof this.apps[this.current()].close != 'undefined') {
				
				const canClose = this.apps[this.current()].close();

				if(canClose) {

					this.opened.pop();

					if(this.opened.length > 0) {

						Phone.apps[this.current()].open(this.appData[this.current()]);

						$('.app').hide();
						$('#app-' + this.current()).show();
					}

				}
			} else {

				this.opened.pop();

				if(this.opened.length > 0) {

					Phone.apps[this.current()].open(this.appData[this.current()]);
					
					$('.app').hide();
					$('#app-' + this.current()).show();
				}else {
					$.post('http://esx_phone3/escape');
					$('#phone').hide();
				}
			
			} 

		}

	}

	Phone.current = function() {
		return this.opened[this.opened.length - 1] || null;
	}

	document.onkeyup = function(e) {

		switch(e.which) {

			// ESC
			case 27 : {
				Phone.close();
				break;
			}

	    // ENTREE
	    case 13: {
	    	Phone.enter();
	    	break;
	    }

/*	    // G
	    case 71: {
				
				if(Phone.current() === 'contact-action-message') {
					Phone.apps['contact-action-message'].activateGPS()
				}

	    	break;
	    }
*/

		}

	}

	document.onkeydown = function (e) {

		switch(e.which) {

	    // FLECHE HAUT
	    case 38: {
	    	Phone.move('TOP');
	    	break;
	    }

	    // FLECHE BAS
	    case 40: {
	    	Phone.move('DOWN');
	    	break;
	    }

	    // FLECHE GAUCHE
	    case 37: {
				Phone.move('LEFT');
	    	break;
	    }

	    // FLECHE DROITE
	    case 39: {
	    	Phone.move('RIGHT');
	    	break;
	    }

	    default: break;

	  }
			
	};

	window.onData = function(data){

		if(data.controlPressed === true) {

			switch(data.control) {

				case 'TOP'       : Phone.move('TOP');   break;
				case 'DOWN'      : Phone.move('DOWN');  break;
				case 'LEFT'      : Phone.move('LEFT');  break;
				case 'RIGHT'     : Phone.move('RIGHT'); break;
				case 'ENTER'     : Phone.enter();       break;
		//Test
				case 'E'         : Phone.close();       break;

				default: break;

			}

		}

		if(data.showPhone === true) {

			Phone.opened.length = 0;

			Phone.open('home');

			$('#phone').show();

		}

		if(data.showPhone === false) {
			$('#phone').hide();
		}

		if(data.reloadPhone == true) {

			Phone.contacts.length = 0;

			$('#app-contacts .contact-me .contact-number').text(data.phoneData.phoneNumber);

			for(let i=0; i<data.phoneData.contacts.length; i++)
				Phone.addContact(data.phoneData.contacts[i].name, data.phoneData.contacts[i].number);

			for(let k in Phone.hiddenIcons)
				if(Phone.hiddenIcons.hasOwnProperty(k))
					$('#app-home .menu-icon-' + k).hide();

		}

		if(data.incomingCall === true) {

			let name = '';

			for(let i=0; i<Phone.contacts.length; i++)
				if(Phone.contacts[i].number == data.number)
					name = Phone.contacts[i].name;

			Phone.open('incoming-call', {
				name   : name,
				target : data.target,
				channel: data.channel,
				number : data.number,
			});

		}

		if(data.acceptedCall === true) {
			Phone.apps['contact-action-call'].startCall(data.channel, data.target);
		}

		if(data.endCall === true) {
			Phone.close();
		}

		if(data.showIcon === true) {
			delete Phone.hiddenIcons[data.icon];
			$('#app-home .menu-icon-' + data.icon).show();
		}

		if(data.showIcon === false) {
			Phone.hiddenIcons[data.icon] = true;
			$('#app-home .menu-icon-' + data.icon).hide();
		}

		if(data.newMessage === true) {

			const date = new Date();

			Phone.messages.push({
				number   : data.phoneNumber,
				body     : data.message,
				position : data.position,
				anon     : data.anon,
				job      : data.job,
				self     : false,
				time     : date.getHours().toString().padStart(2, '0') + ':' + date.getMinutes().toString().padStart(2, '0'),
				timestamp: +date,
				read     : false,
			})

			Phone.apps['contact-action-message'].updateMessages();

		}

		if(data.contactAdded === true) {
			Phone.addContact(data.name, data.number);
		}

		if(data.activateGPS === true && Phone.current() === 'contact-action-message') {
			Phone.apps['contact-action-message'].activateGPS()
		}

		if(data.setBank === true) {
			
			$('#app-bank .balance').removeClass('positive negative').text(data.money);

			if(data.money >= 0)
				$('#app-bank .balance').addClass('positive');
			else
				$('#app-bank .balance').addClass('negative');

		}

		if(data.onPlayers === true) {
			switch(data.reason) {

				case 'bank_transfer' : {

					Phone.open('bank-transfer', data.players)

					break;
				}

				default: break;

			}
		}

	}

	window.onload = function(e){
		window.addEventListener('message', function(event){
			onData(event.data);
		});
	}

	$('.app').addClass('animated zoomIn');

	setInterval(() => {

		const date = new Date;

		$('.status-bar .time .hour')  .text(date.getHours()  .toString().padStart(2, '0'));
		$('.status-bar .time .minute').text(date.getMinutes().toString().padStart(2, '0'));

	}, 1000);

})();
