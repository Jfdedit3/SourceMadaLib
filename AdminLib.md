# HD Admin UI Library
⚠️ It can ban you in the game so be careful how to fix:
make sure your adding safe script that don't affect the game so much

🇵🇭 Made in PH
# Credit:
CludeHub
paulparasplaythis 


# booting the library and add frame window
```lua
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/refs/heads/main/AdminCommand.lua"))():CreateWindow("COMMANDS")
```
# Creating the list
```lua
local killList = UI.AddList("kill <player>")
```
# Creating the command on textbox
```lua
UI.AddCommand("kill (%w+)", function(target)
	local plr = game.Players:FindFirstChild(target)
	if plr and plr.Character and plr.Character:FindFirstChild("Humanoid") then
		plr.Character.Humanoid.Health = 0
		print("Killed", target)
	else
		warn("Player not found:", target)
	end
end, killList)
```
