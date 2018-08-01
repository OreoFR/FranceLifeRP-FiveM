description 'ESX Reporter'

server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/scripts/app.js',
	'html/scripts/jquery.marquee.min.js',
	'html/css/app.css',
	'html/fonts/Reisenberg.otf'
}