require "resources/mysql-async/lib/MySQL"


---------------------------------- FUNCTIONS ----------------------------------

-- Fonction : Récupère le nom du travail
-- Paramètre(s) : id = ID du travail
function nameJob(id)
  return MySQL.Sync.fetchScalar("SELECT job_name FROM jobs WHERE job_id = @namejob", {['@namejob'] = id})
end

-- Fonction : Récupère le travail du joueur
-- Paramètre(s) : player = Identifiant du joueur
function whereIsJob(player)
  return MySQL.Sync.fetchScalar("SELECT job FROM users WHERE identifier = @identifier", {['@identifier'] = player})
end

-- Fonction : Mets à jour le travail du joueur
-- Paramètre(s) : player = Identifiant du joueur, id = ID du travail
function updatejob(player, id)
  local job = id
  MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = job, ['@identifier'] = player})
end

---------------------------------- EVENEMENT ----------------------------------

RegisterServerEvent('jobssystem:jobs')
AddEventHandler('jobssystem:jobs', function(id)
  TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        local jobName = nameJob(id)
        updatejob(player, id)
        TriggerClientEvent("jobssystem:updateJob", source, jobName)
        TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_STRIPCLUB_PR", 1, "Mairie", false, "Votre métier est maintenant : ".. jobName)
        -- ENGLISH VERSION : TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_STRIPCLUB_PR", 1, "Job", false, "Your Job is now : ".. nameJob)
  end)
end)

AddEventHandler('es:playerLoaded', function(source)
  TriggerEvent('es:getPlayerFromId', source, function(user)
      local player = user.identifier
      local WIJ = whereIsJob(player)
      local jobName = nameJob(WIJ)
      TriggerClientEvent("jobssystem:updateJob", source, jobName)
    end)
end)

