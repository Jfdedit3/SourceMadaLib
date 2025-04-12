# CludeHub Library
intruding suck ui library the only sucks i made is the ui so ugly ass hell for me but this ui library doesn't has a bug

# Source
this is the siurce of the library you need this source because without this all nit will work
```lua
local Clude = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/refs/heads/main/SourceLib.lua"))()
```
# Creating the Window Frame and Title
this is the frame handling all the ui elements
```lua
local win = Clude:CreateWindow({ Title = "Clude Test UI" })
```
# Creating Tabs
this is the tabs you can add tabs like combat or home or misc
```lua
local tab = win:CreateTab("Main")
```
# Creating Buttons
this is the button click this so your dad back at your home with milk
```lua
win:CreateButton(tab, "Click Me", function()
    print("Button clicked!")
end)
```
# Creating Toggle
this is the toggle same as button but the difference is it has a on off
```lua
win:CreateToggle(tab, "Enable Power", false, function(state)
    print("Toggle:", state)
end)
```
# Creating Slider
thisis the slider that you xan change any number or speed or poop
```lua
win:CreateSlider(tab, "Volume", 0, 10, 5, function(val)
    print("Slider:", val)
end)
```
# Create TextBox
this is textbox you can type anything like "po**"
```lua
win:CreateInput(tab, "type hi", function(text)
    print("Typed:", text)
end)
```
# Create Label
this is a label that you can write your credit or your title example: "my dad is on jail"
```lua
myClude:CreateLabel(tab1, "This is a label")
```
# Create Paragraph
this is the paragraph that you can write a letter for your dad in jail
```lua
myClude:CreateParagraph(tab1, "This is a longer paragraph of text that can span multiple lines.")
```
# Create Dropdown 
this is dropdown that you can add multiple buttons parented in one button
```lua
myClude:CreateDropdown(tab1, "Select Option", {"Option 1", "Option 2", "Option 3"}, function(selectedOption)
    print("Selected option:", selectedOption)
end)
```

# Destroy your mom
this is the script that destroy the ui library
```lua
print("your mom get attacked by 5 black people and get pregnant and has 20 baby in stomach")
```
