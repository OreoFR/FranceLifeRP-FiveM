ui_page 'html/ui.html'

-- NUI Files
files {
-- HTML
'html/ui.html',

-- Langues (JS)
'html/languages.js',

-- JS
'html/js/script.js',
'html/js/playSounds.js',
'html/js/menu.js',

-- JS (functions)
'html/js/fonctions/replaceAll.js',
'html/js/fonctions/effetCompteur.js',
'html/js/fonctions/colorText.js',

-- CSS
'html/style.css',

-- Typos
'html/pdown.ttf',

-- Sounds
'html/sounds/downMoney.ogg',
'html/sounds/upMoney.ogg',
}

-- Server
server_script 'server/interactionsBDD.lua'

-- Client
client_script 'client/base.lua'
client_script 'client/menu.lua'
client_script 'client/shopsFoodDrink.lua'