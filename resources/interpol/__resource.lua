resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Police Job'

version '1.0.0'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'translation/sv.lua',
  'translation/en.lua',
  'config.lua',
  'server/main.lua',
}

client_scripts {
  '@es_extended/locale.lua',
  'translation/sv.lua',
  'translation/en.lua',
  'config.lua',
  'client/main.lua',
}