--// Syn Admin Commands; Loader \\--

--<< Variables >>--

-- Syn Setup
local Folder = script.Parent.Parent.Parent
local Setup = Folder:FindFirstChild('Setup')
local Plugins = Setup:FindFirstChild('Plugins')
local settings = Setup:FindFirstChild('Settings')

-- MainModule; https://www.roblox.com/library/4665853426/Syn-Admin-Commands-MainModule
local MainModule = game:GetService('ReplicatedStorage').Modules.SynMain

--<< Setup Check >>--

-- Setup  Folder
assert(Setup, 'Syn: Setup folder not found!')

-- settings Module
assert(settings, 'Syn: Settings module not found!')

-- Plugins Folder
if not Plugins then
	warn('Syn: Plugins not found!')
	Plugins = Instance.new('Folder', Setup)
	Plugins.Name = 'Plugins'
end

-- settings
if type(settings) ~= 'table' then
	-- Check if settings is ModuleScript
	pcall(function()
		if settings:IsA('ModuleScript') then
			settings = require(settings)
		end
	end)
	-- Final settings check.
	if type(settings) ~= 'table' then
		error('Syn: Error fetching settings.')
	end
end

--<< Run MainModule >>--

-- Protection
local Success, Error = pcall(function()
	require(MainModule)({
		Folder = Folder,
		Setup = Setup,
		Plugins = Plugins,
		settings = settings,
	})
end)

-- Check success
if not Success then
	warn('Syn: Error loading MainModule; ', Error)
end