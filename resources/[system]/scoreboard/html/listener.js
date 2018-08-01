$(function()
{
    window.addEventListener('message', function(event)
    {
        var item = event.data;
        var buf = $('#wrap');
        
				$('#ems').html(event.data.ems);
		$('#police').html(event.data.police);
		$('#taxi').html(event.data.taxi);
		$('#mecano').html(event.data.mek);
		$('#bil').html(event.data.bil);
		$('#maklare').html(event.data.maklare);
		$('#ica').html(event.data.ica);
		$('#spelare').html(event.data.spelare);
	//	$('#ptbl').html(event.data.text);
		
        buf.find('table').append("<tr class=\"heading\"><th>ID</th><th>Name</th></tr>");
        if (item.meta && item.meta == 'close')
        {
            document.getElementById("ptbl").innerHTML = "";
            $('#wrap').hide();
            return;
        }
        buf.find('table').append(item.text);
        $('#wrap').show();
    }, false);
	
});


