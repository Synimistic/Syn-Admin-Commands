--// Syn Admin Commands; MainModule \\--

return function(Data)
	
	--<< Setup >>--
	local Folder = Data.Folder
	local Setup = Folder:FindFirstChild('Setup')
	local Plugins = Setup:FindFirstChild('Plugins')
	local settings = Setup:FindFirstChild('Settings')
	
	--<< Setup Check >>--
	
	-- Setup Folder
	assert(Setup, 'Syn: Setup folder not found!')
	
	-- settings Module
	assert(settings, 'Syn: Settings module not found!')
	
	-- Plugins Folder
	if not Plugins then
		warn('Syn: Plugins not found!')
		Plugins = Instance.new('Folder', Setup)
	end
	Plugins.Name = 'Plugins'
	
	-- settings
	if type(settings) ~= 'table' then
		-- Check if settings is ModuleScript
		pcall(function()
			if settings:IsA('ModuleScript') then
				settings = require(settings)
			end
		end)
	end
	
	-- Final settings check.
	if type(settings) ~= 'table' then
		error('Syn: Error fetching settings.')
	end
	
	
	
	warn('Syn: Successfully loaded MainModule.')
end
