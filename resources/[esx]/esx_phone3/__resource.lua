resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Phone'

version '1.0.0'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}

client_scripts {
  'config.lua',
  'client/main.lua'
}

ui_page 'html/index.html'

files {
  'html/css/animate.css',
  'html/css/app.css',
  'html/css/font-awesome.css',
  'html/fonts/fontawesome-webfont.eot',
  'html/fonts/fontawesome-webfont.svg',
  'html/fonts/fontawesome-webfont.ttf',
  'html/fonts/fontawesome-webfont.woff',
  'html/fonts/fontawesome-webfont.woff2',
  'html/fonts/FontAwesome.otf',
  'html/img/apps/bank/logo.png',
  'html/img/backgroundPhone.png',
  'html/img/phone.png',
  'html/index.html',
  --'html/ogg/incoming-call.ogg',
  'html/ogg/outgoing-call.ogg',
  'html/ogg/sms_receive.ogg',
  'html/ogg/sms_send.ogg',
  'html/scripts/app.js',
  'html/scripts/apps/bank.js',
  'html/scripts/apps/bank-transfer.js',
  'html/scripts/apps/bank-transfer-menu.js',
  'html/scripts/apps/home.js',
  'html/scripts/apps/messages.js',
  'html/scripts/apps/incoming-call.js',
  'html/scripts/apps/contacts.js',
  'html/scripts/apps/contact-add.js',
  'html/scripts/apps/contact-actions.js',
  'html/scripts/apps/contact-action-call.js',
  'html/scripts/apps/contact-action-message.js',
  'html/scripts/mustache.min.js',

}