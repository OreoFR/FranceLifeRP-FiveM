
--[[
description 'ESX Extended - MoneyWash'

server_script 'config.lua'
server_script 'server/main.lua'

client_script 'config.lua'
client_script 'client/main.lua'




]]--
description 'ESX Extended - MoneyWash'

server_scripts {
    '@es_extended/locale.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
    '@es_extended/locale.lua',
	'config.lua',
	'client/main.lua'
}
files {
	'html/ui.html',
	'html/pdown.ttf',
	'html/img/keys/enter.png'
}

ui_page 'html/ui.html'