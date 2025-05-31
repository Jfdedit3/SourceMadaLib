# HD Admin UI Library
⚠️ It can ban you in the game so be careful how to fix:
make sure your adding safe script that don't affect the game so much

🇵🇭 Made in PH
# Credit:
CludeHub
paulparasplaythis 


# booting the library
```lua
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/refs/heads/main/AdminCommand.lua"))()
```
# Creating the window frame
```lua
local ui = Lib:CreateWindow("COMMANDS")
```
# Creating the list
```lua
local nonadmin = ui.AddList("NonAdmin")
```
# Creating the command on textbox
```lua
ui.AddCommand(";fly%s+(%d+)", function(msg)
	print("Fly speed:", msg:match("%d+"))
end, nonadmin)
```
