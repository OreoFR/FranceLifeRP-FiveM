description 'Scoreboard'

-- temporary!
ui_page 'html/scoreboard.html'

client_scripts {
  '@es_extended/locale.lua',
	'scoreboard.lua'
}

server_scripts {
  '@es_extended/locale.lua',
	'server.lua'
}


files {
    'html/scoreboard.html',
    'html/style.css',
    'html/reset.css',
    'html/bg.png',
    'html/newlogo.png',
    'html/listener.js',
    'html/res/futurastd-medium.css',
    'html/res/futurastd-medium.eot',
    'html/res/futurastd-medium.woff',
    'html/res/futurastd-medium.ttf',
    'html/res/opensans-light.ttf',
    'html/res/futurastd-medium.svg',
}