dlc.rpf was downloaded from https://www.gta5-mods.com/vehicles/2015-nissan-gt-r-35-nismo-add-on-replace-animated

- Download OpenIV
- create working folder (ex: `resources/addonr35`, all further work will be done inside this folder)
- create `stream/` folder
- create `__resource.lua` file
- open `dlc.rpf` in OpenIV
- extract `data/` or `common/data/` folder from dlc.rpf to `addonr35/`
- extract `context.xml` to `addonr35/`
- go into `x64/`
- [Optional] if there is a folder here called `data/` go into it then into `lang/`
- [Optional] go into your desired language (ex: `americandlc.rpf`)
- [Optional] right-click `global.gx2` and click `Export to openformat text`
- [NOTE] this file contains entries that we will use later
- go into `x64/vehicles.rpf`
- copy all files from here into `addonr35/stream/`
- [NOTE] There may be multiple folders and other .rpf files in here, go into each and copy over the plain files into `addonr35/stream/`
- You can now close `dlc.rpf` and OpenIV
- Open up `__resource.lua` and `context.xml`
- [NOTE] `context.xml` is what you will use as reference for adding the correct metadata files to load
- in `__resource.lua` add this to the top of the file `resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'`
- looking at `context.xml`, add in the data_files listed, it should show a filename, and right below it a type. Below is a list of types/files you can ignore
    RPF/.rpf
    TEXTFILE_METAFILE/dlctext.meta
- at the very bottom of `context.xml` will be another list of just the file names. the data_file entries in `__resource.lua` needs to be in the same order
- in `__resource.lua` you need to also add an array of these metal files. For each data_file, add the filename/path into `files {}`
- [NOTE] the file paths need to be changed if you renamed the `data/` folder that was copied over!
- if there was no global.g2a/.oxt file you're done :)
- now some coding :D create a new file called `vehicle_names.lua`
- copy/paste the code from my `vehicle_names.lua` and write in entries from `global.oxt` like i have (make sure to delete or replace the ones i had in by default)
- add this line into `__resource.lua`: `client_script 'vehicle_names.lua'`
- you can now delete `context.xml` and `global.oxt`
- add resource to `citmp-server.yml` (ex: `- addonr35`)
- Profit :)
