# booting the library
```lua
local CommandUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/main/CludeLibraryCool"))()
```
# creating the window
```lua
CommandUI:Create()
```
# adding list
```lua
CommandUI:AddList("walkspeed <speed>")
```
# adding command input
```lua
CommandUI:AddCommand("walkspeed <speed>", function(speed)
end)
```
