# esx_radars
Original script: 
- https://github.com/DreanorGTA5Mods/StationaryRadar
- https://forum.fivem.net/t/release-vrp-stationary-radars/70605 - mostly taken from here edited it for ESX. 


## DISCORD

https://discord.me/fivem_esx

## SCREENSHOT

![screenshot](https://i.imgur.com/C3cWiT5.png)

## DESCRIPTION

Speed radar, tickets speeders. 

## To do

- Based on speed, how much over the speed limit tickets X amount
- Sends a bill, instead of automatically taking the money out. 
- The ability to add more spots with different speed limits
- Add vehicle hash list, so cops/ems can get fined when RPing as a civilian

## Requirements

- **pNotify** => https://forum.fivem.net/t/release-pnotify-in-game-js-notifications-using-noty/20659

## Download

**2) Manually**

- Download https://github.com/ESX-PUBLIC/esx_radars/archive/master.zip
- Put it in resource/[esx] directory

**3) Using git**

```
cd resources/[esx]/
git clone https://github.com/ESX-PUBLIC/esx_radars esx_radars
```

## Installation

1) Add folder esx_radars to your [esx] dir
2) Add this in your server.cfg :

```
start esx_radars
```
