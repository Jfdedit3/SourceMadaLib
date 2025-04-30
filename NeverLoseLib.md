Here's the script with sections clearly labeled with hashtags, along with a guide for each part. This will help you understand what each section does when writing the .md file.


---

# NEVERLOSE UI Library
### By: **C-A-T-S-U-S**

## # Load NEVERLOSE UI Library
```lua
local NEVERLOSE = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/refs/heads/main/NerverLoseLibEdited.lua"))()
```

Guide: This loads the NEVERLOSE UI library from the GitHub repository.


---

# Set Theme
```lua
NEVERLOSE:Theme("dark") -- Options: "dark", "nightly", "original"
```
Guide: Sets the UI theme. You can change the theme between "dark", "nightly", or "original."


---

# Create Main Window and Notification System
```lua
local Window = NEVERLOSE:AddWindow("NEVERLOSE","TEXT HERE")
local Notification = NEVERLOSE:Notification()
Notification.MaxNotifications = 6
```
Guide: This code creates the main window and initializes the notification system. You can set the number of max notifications here.


---

# Add Tab Label
```lua
Window:AddTabLabel('Home')
```
Guide: This adds a label to the window, marking the first tab as "Home."


---

# Create Tabs
```lua
local ExampleTab = Window:AddTab('Example Tab','earth') -- [ads , list , folder , earth , locked , home , mouse , user]
local MainTab = Window:AddTab('Test','ads')
```

Guide: Adds tabs to the window. The tabs can be customized with icons (like 'earth', 'ads', etc.) and titles.


---

# Create Left Section in Example Tab
```lua
local Example = ExampleTab:AddSection('Example',"left")

Example:AddLabel("Label")
```
Guide: Creates a section in the "Example Tab" aligned to the left, and adds a label called "Label."


---

# Create Button
```lua
Example:AddButton("Test Notification",function()
    print('button')
    Notification:Notify("info","Notification","Test Notification")
    Notification:Notify("warning","Notification","Don't Spam",4)
end)
```

Guide: This creates a button that triggers two notifications when clicked: one info and one warning.


---

# Create Toggle
```lua
Example:AddToggle('Toggle',false,function(val)
    print("Toggle",val)
end)
```
Guide: Adds a toggle button. It prints the toggle value (true or false) whenever the toggle is changed.


---

# Create Keybind
```lua
Example:AddKeybind('Keybind',Enum.KeyCode.X,function(val)
    print('keybind',val)
end)
```
Guide: Creates a keybind that triggers the function when the X key is pressed, printing the keybind value.


---

# Create Slider
```lua
Example:AddSlider('Slider',1,100,50,function(val)
    print('slider',val)
end)
```
Guide: Creates a slider with a range from 1 to 100, with an initial value of 50. It prints the slider value when adjusted.


---

# Create Dropdown
```lua
Example:AddDropdown('Dropdown',{1,2,3},2,function(val)
    print("dropdown",val)
end)
```
Guide: Adds a dropdown menu with values {1, 2, 3}, and an initial selection of 2. It prints the selected value when changed.


---

# Create Right Section in Example Tab
```lua
local Test = ExampleTab:AddSection('Test',"right")

Test:AddToggle('Example',true,function(val)
    if val then
        Example:Show()
    else
        Example:Hide()
    end
end)
```
Guide: Adds a toggle in the right section of the "Example Tab." If toggled on, it shows the "Example" section; if toggled off, it hides the section.


---

# Create Section in MainTab
```lua
local SectionTest = MainTab:AddSection('Test',"left")

SectionTest:AddButton("Kick",function()
    -- game.Players.LocalPlayer:Kick()
end)
```
Guide: Adds a button in the "MainTab" to kick the local player from the game (this line is commented out for safety).


---

# Key System
```lua
local NEVERLOSE = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/refs/heads/main/NerverLoseLibEdited.lua"))()

local function Start(Key)
    local Window = NEVERLOSE:AddWindow("NEVERLOSE","TEXT HERE")
end

local KeySystem = NEVERLOSE:KeySystem("Key System","YOUR URL",function(key)
    if key=='Ah!! im coming' then
        return true
    end
    return false
end)

KeySystem:Callback(Start)
```
Guide: This initializes a key system where you check if the entered key matches the string 'Ah!! im coming'. If it matches, the system returns true, and the callback function is executed.
