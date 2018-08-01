require "resources/mysql-async/lib/MySQL"

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local salary = math.random(50,200)
  	-- local salary = 50 -- FR -- Pour salaire fixe -- EN -- For Fixed salary
	TriggerEvent('es:getPlayerFromId', source, function(user)
  	-- FR -- Ajout de l'argent à l'utilisateur -- EN -- Adding money to the user
  	local user_id = user.identifier
  	-- FR -- Requête qui permet de recuperer le métier de l'utilisateur -- EN -- Query that retrieves the user's trade
    MySQL.Async.fetchAll("SELECT salary FROM users INNER JOIN jobs ON users.job = jobs.job_id WHERE identifier = @username",{['@username'] = user_id}, function (salary_job)
    	user:addMoney((salary + salary_job[1].salary))
 		TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Salaire reçu :  + "..salary.." ~g~$~s~~n~Salaire metier reçu : + "..salary_job[1].salary.." ~g~$")
    end)
end)
end)
