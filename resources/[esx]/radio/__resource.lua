resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_01_CLASS_ROCK" { url = "http://icecast.skyrock.net/s/natio_mp3_64k?tvr_name=frequenceradio&tvr_section1=64mp3", volume = 0.2, name = "Skyrock" }
supersede_radio "RADIO_02_POP" { url = "http://185.52.127.173/fr/30001/mp3_128.mp3?origine=frequence-radio", volume = 0.2, name = "NRJ" }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://radiofg.impek.com/fg.mp3", volume = 0.2, name = "Radio FG" }
supersede_radio "RADIO_04_PUNK" { url = "http://streaming.radio.funradio.fr:80/fun-1-44-128.mp3", volume = 0.2, name = "Fun Radio" }
supersede_radio "RADIO_05_TALK_01" { url = "http://gene-wr05.ice.infomaniak.ch/gene-wr05.mp3", volume = 0.2, name = "Generation" }
supersede_radio "RADIO_06_COUNTRY" { url = "http://chai5she.lb.vip.cdn.dvmr.fr/rmcinfo", volume = 0.5, name = "RMC Sport" }


files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
