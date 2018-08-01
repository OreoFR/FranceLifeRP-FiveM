client_script {
	'@es_extended/locale.lua',
	"config.lua",
	"client/client.lua",
	"locales/fr.lua"
}
server_script {
	'@es_extended/locale.lua',
	"@mysql-async/lib/MySQL.lua",
	"locales/fr.lua",
	"server/server.lua"
}
