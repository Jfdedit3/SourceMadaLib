# HD Admin UI Library
⚠️ It can ban you in the game so be careful how to fix:
make sure your adding safe script that don't affect the game so much

🇵🇭 Made in PH
# Credit:
CludeHub
paulparasplaythis 


# booting the library and add frame window
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/refs/heads/main/AdminCommand.lua"))()

local UI = Library:CreateWindow("Command")
```

# Creating the command on textbox
```lua
UI.AddCommand("fly (%d+)", function(speed)
	print("Flying at speed:", speed)
end)
```
