# booting the library
```lua
local NEVERLOSE = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/NEVERLOSE-UI-Nightly/main/source.lua"))()
```
# Change Theme Color
dark, nightly, original. dark is good
```lua
NEVERLOSE:Theme("dark")
```

# Creating the window
```lua
local Window = NEVERLOSE:AddWindow("NEVERLOSE","TEXT HERE")
```

# Create notification
```lua 
local Notification = NEVERLOSE:Notification()
Notification.MaxNotifications = 6
```

# Create TabLabel
```lua
Window:AddTabLabel('Home')
```

# Creating Tab
```lua
local ExampleTab = Window:AddTab('Example Tab','earth') -- [ads , list , folder , earth , locked , home , mouse , user]
local MainTab = Window:AddTab('Test','ads')
```

# Create Section
```lua
local Example = ExampleTab:AddSection('Example',"left")
```
# Create Label 
```lua
Example:AddLabel("Label")
```

# Creating Button
```lua
Example:AddButton("Test Notification",function()
	print('button')
	Notification:Notify("info","Notification","Test Notification")
	Notification:Notify("warning","Notification","Don't Spam",4)
end)
```

# Creating Toggle
```lua
Example:AddToggle('Toggle',false,function(val)
	print("Toggle",val)
end)
```

# Add Keybind
```
Example:AddKeybind('Keybind',Enum.KeyCode.X,function(val)
	print('keybind',val)
end)
```

# Create Slider
```lua
Example:AddSlider('Slider',1,100,50,function(val)
	print('slider',val)
end)
```

# Create Dropdown
```lua
Example:AddDropdown('Dropdown',{1,2,3},2,function(val)
	print("dropdown",val)
end)
```

# Section Function
```
local Test = ExampleTab:AddSection('Test',"right")
```

# Example Toggle Function
```
Test:AddToggle('Example',true,function(val)
	if val then
		Example:Show()
	else
		Example:Hide()
	end
end)
```

# migger
```lua

local SectionTest = MainTab:AddSection('Test',"left")

SectionTest:AddButton("Kick",function()
	--game.Players.LocalPlayer:Kick()
end)
```
