--// Syn Admin Commands; Loader \\--

--<< Setup >>--
local Folder = script.Parent.Parent.Parent
local Setup = Folder:FindFirstChild('Setup')
local Plugins = Setup:FindFirstChild('Plugins')
local settings = Setup:FindFirstChild('Settings')

-- MainModule; https://www.roblox.com/library/4665853426/Syn-Admin-Commands-MainModule
local MainModule = game:GetService('ReplicatedStorage'):FindFirstChild('MainModule')

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
