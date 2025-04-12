# Source
```lua
local Clude = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/refs/heads/main/SourceLib"))()
```
# Create Window and Title
```lua
local myWindow = Clude:CreateWindow({
    Title = "My UI Library",
    Size = UDim2.new(0.6, 0, 0.8, 0),
    Position = UDim2.new(0.2, 0, 0.06, 0)
})
```
#Create Tabs
```lua
local tab1 = myWindow:CreateTab("Example")
local tab2 = myWindow:CreateTab("Example")
```
