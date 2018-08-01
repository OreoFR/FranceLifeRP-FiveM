-------------------------------------------------------------------------
-------THIS SCRIPT CHECKS IF YOUR RESOURCE IS UP TO DATE-----------------
-------PLEASE DO NOT MODIFY THESE LINES AS IT CAN CAUSE IT TO BREAK------
-------------------------------------------------------------------------



Citizen.CreateThread( function()
updatePath = "/Bluethefurry/initialdspeedo-fivem"
resourceName = "Initial D Speedometer ("..GetCurrentResourceName()..")"
function checkVersion(err,responseText, headers)
	curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

	if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
		print("\n###############################")
		print("\n"..resourceName.." is outdated, should be:\n"..responseText.."is:\n"..curVersion.."\nplease update it from https://github.com"..updatePath.."")
		print("\n###############################")
	elseif tonumber(curVersion) > tonumber(responseText) then
		print("You somehow skipped a few versions of "..resourceName.." or the git went offline, if it's still online i advise you to update ( or downgrade? )")
	else
		print("\n"..resourceName.." is up to date, have fun!")
	end
end

PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", checkVersion, "GET")


end)
