# esx_mafiajob

[REQUIREMENTS]
  
* ESX Identity Support
  * esx_identity => https://github.com/ESX-Org/esx_identity

[INSTALLATION]

1) CD in your resources/[esx] folder
2) Clone the repository
``git clone https://github.com/Thananyx/esx_mafiajob.git``

3) Import ``esx_mafiajob.sql`` in your database

4) Add this in your server.cfg :
``start esx_mafiajob``



5) * If you want player management you have to set ``Config.EnablePlayerManagement`` to ``true`` in config.lua
   * If you want armory management you have to set ``Config.EnableArmoryManagement`` to ``true`` in config.lua
lua