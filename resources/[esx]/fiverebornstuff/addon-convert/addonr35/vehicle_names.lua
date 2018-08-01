function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('0xC593CAF5', 'Nissan GT-R 35 Nismo 2015')
  AddTextEntry('0xC990C46A', 'Nissan GT-R 35 Nismo 2015')
end)
