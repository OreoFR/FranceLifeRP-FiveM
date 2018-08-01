resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX lock doors'

version '1.1.0'

server_scripts {
	'@es_extended/locale.lua',
	'locates/en.lua',
	'locates/fr.lua',
	'locates/sv.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locates/en.lua',
	'locates/fr.lua',
	'locates/sv.lua',
	'config.lua',
	'client/main.lua'
}
