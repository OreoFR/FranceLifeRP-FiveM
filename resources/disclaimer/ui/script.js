$(function(){
	window.onload = function(e){
		window.addEventListener('message', function(event){

			var item = event.data;
			if (item !== undefined && item.type === "disclaimer") {

				if (item.display === true) {
					$('#disclaimer').delay(1000).fadeIn( "slow" );
				} else if (item.display === false) {
					$('#disclaimer').fadeOut( "slow" );
				}
			}
		});
	};
});