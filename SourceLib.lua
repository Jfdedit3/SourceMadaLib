local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local existingGui = player.PlayerGui:FindFirstChild("CludeGui")

if existingGui then
    existingGui:Destroy()
end

local colors = {
	window = Color3.fromRGB(36, 36, 48),
	title2 = Color3.fromRGB(44, 44, 56),
	tabbuttons = Color3.fromRGB(32, 32, 42),
	tabButton = Color3.fromRGB(70, 85, 100),
	container = Color3.fromRGB(45, 50, 60),
	button = Color3.fromRGB(60, 85, 105),
	toggle = Color3.fromRGB(60, 85, 105),
	box = Color3.fromRGB(55, 55, 65)
}

local Clude = {}

function Clude:CreateWindow(config)
    local gui = Instance.new("ScreenGui")
    gui.Name = "CludeGui"
    gui.ResetOnSpawn = false
    gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	
    local window = Instance.new("Frame")
    window.Size = UDim2.new(0, 0, 0, 0)
    window.Position = UDim2.new(0.21, 0, -0.04, 0)
    window.BackgroundColor3 = colors.window
    window.Draggable = false
    window.Active = true
    window.Parent = gui
    Instance.new("UICorner", window).CornerRadius = UDim.new(0, 5)

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 3
    uiStroke.Color = Color3.fromRGB(0, 0, 0)  -- Black stroke
    uiStroke.Parent = window

    local closeOpenButton = Instance.new("TextButton")
    closeOpenButton.Size = UDim2.new(0, 40, 0, 40)
    closeOpenButton.Position = UDim2.new(1, -40, 0, 0)
    closeOpenButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    closeOpenButton.Text = "-"
    closeOpenButton.TextColor3 = Color3.new(1, 1, 1)
    closeOpenButton.Font = Enum.Font.SourceSansBold
    closeOpenButton.TextSize = 23
    closeOpenButton.ZIndex = 255
    closeOpenButton.Parent = gui
    Instance.new("UICorner", closeOpenButton).CornerRadius = UDim.new(0, 5)

    closeOpenButton.MouseButton1Click:Connect(function()
    if window.Visible then
        window.Visible = false
        closeOpenButton.Text = "+"
    else
        window.Visible = true
        closeOpenButton.Text = "-"
    end
end)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.980, 0, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = config.Title or "Clude Library"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.SourceSansBold
    title.Position = UDim2.new(0, 13, 0, 10)
    title.TextScaled = true
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = window
    title.ZIndex = 3
    Instance.new("UICorner", title).CornerRadius = UDim.new(0, 5)
 
    local title2 = Instance.new("Frame")
    title2.Size = UDim2.new(1, 0, 0, 40)
    title2.BackgroundColor3 = colors.title2
    title2.Parent = window
    title2.ZIndex = 2
    Instance.new("UICorner", title2).CornerRadius = UDim.new(0, 5)
    
    local fpsLabel = Instance.new("TextLabel")
    fpsLabel.Name = "FPSCounter"
    fpsLabel.BackgroundTransparency = 1
    fpsLabel.TextColor3 = Color3.new(1, 1, 1)
    fpsLabel.TextStrokeTransparency = 0
    fpsLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    fpsLabel.Font = Enum.Font.SourceSansBold
    fpsLabel.TextScaled = true
    fpsLabel.Size = UDim2.new(0.980, 0, 0, 20)
    fpsLabel.Position = UDim2.new(0, -3, 0, 10)
    fpsLabel.TextXAlignment = Enum.TextXAlignment.Right
    fpsLabel.TextYAlignment = Enum.TextYAlignment.Center
    fpsLabel.Parent = window
    fpsLabel.ZIndex = 3

local fps = 0
local frames = 0
local lastTime = tick()

game:GetService("RunService").RenderStepped:Connect(function()
	frames = frames + 1
	local currentTime = tick()
	if currentTime - lastTime >= 1 then
		fps = frames
		frames = 0
		lastTime = currentTime
		local playerCount = #game:GetService("Players"):GetPlayers()
		fpsLabel.Text = "FPS: "..fps.."  |  Players:   "..playerCount
	end
end)
	
    local tabbuttons = Instance.new("ScrollingFrame")
    tabbuttons.Size = UDim2.new(0, 110, 1, -40)
    tabbuttons.Position = UDim2.new(0, 0, 0, 40)
    tabbuttons.BackgroundColor3 = colors.tabbuttons
    tabbuttons.ScrollBarThickness = 5
    tabbuttons.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tabbuttons.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabbuttons.Parent = window
    Instance.new("UICorner", tabbuttons).CornerRadius = UDim.new(0, 5)

    local tabListLayout = Instance.new("UIListLayout", tabbuttons)
    tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabListLayout.Padding = UDim.new(0, 6)

    local tabfolder = Instance.new("Folder", window)
    tabfolder.Name = "Tabs"

    TweenService:Create(window, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0.565, 0, 1, 0),
    Position = UDim2.new(0.25, 0, -0.04, 0)
}):Play()
    
    function Clude:CreateTab(name)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(1, -120, 1, -50)
        container.Position = UDim2.new(0, 114, 0, 45)
        container.BackgroundColor3 = colors.container
        container.Visible = false
        container.Parent = tabfolder
        Instance.new("UICorner", container).CornerRadius = UDim.new(0, 5)
        
        local scroll = Instance.new("ScrollingFrame")
        scroll.Size = UDim2.new(1, 0, 1, 0)
        scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        scroll.ScrollBarThickness = 7
        scroll.BackgroundTransparency = 1
        scroll.Parent = container

        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0, 8)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Parent = scroll

        local tabButton = Instance.new("TextButton")
        tabButton.Size = UDim2.new(1, -10, 0, 32)
        tabButton.Text = name
        tabButton.BackgroundColor3 = colors.tabButton
        tabButton.TextColor3 = Color3.new(1, 1, 1)
        tabButton.Font = Enum.Font.SourceSansBold
        tabButton.TextSize = 18
        tabButton.Parent = tabbuttons
        Instance.new("UICorner", tabButton).CornerRadius = UDim.new(0, 5)

        tabButton.MouseButton1Click:Connect(function()
            for _, other in pairs(tabfolder:GetChildren()) do
                other.Visible = false
            end
            container.Visible = true
        end)

        return scroll
    end

    function Clude:CreateButton(tab, text, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -20, 0, 40)
        button.BackgroundColor3 = colors.button
        button.Text = text
        button.TextXAlignment = Enum.TextXAlignment.Left
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 15
        button.Parent = tab
        Instance.new("UICorner", button).CornerRadius = UDim.new(0, 5)
        button.MouseButton1Click:Connect(callback)
    end

    function Clude:CreateToggle(tab, text, default, callback)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(1, -20, 0, 50)
    toggle.BackgroundColor3 = colors.toggle
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 14
    toggle.Text = text
    toggle.TextXAlignment = Enum.TextXAlignment.Left
    toggle.Parent = tab
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 8)

    -- Toggle switch container (background bar)
    local box = Instance.new("Frame")
    box.Size = UDim2.new(0, 50, 0, 24)
    box.Position = UDim2.new(1, -60, 0.5, -12)
    box.BackgroundColor3 = colors.box
    box.Parent = toggle
    Instance.new("UICorner", box).CornerRadius = UDim.new(1, 0)

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2
    uiStroke.Color = Color3.fromRGB(0, 0, 0)  -- Black stroke
    uiStroke.Parent = box
        
    -- Switch knob
    local innerBox = Instance.new("Frame")
    innerBox.Size = UDim2.new(0, 22, 0, 22)
    innerBox.Position = UDim2.new(0, 2, 0, 1)
    innerBox.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    innerBox.Parent = box
    innerBox.ZIndex = 10
    Instance.new("UICorner", innerBox).CornerRadius = UDim.new(1, 0)

    -- State logic
    local state = default
    if state then
        innerBox.Position = UDim2.new(1, -24, 0, 1)
        box.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    end

    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = text
        if state then
            innerBox:TweenPosition(UDim2.new(1, -24, 0, 1), "Out", "Quad", 0.3, true)
            innerBox.BackgroundColor3 = Color3.fromRGB(0, 102, 255)
        else
            innerBox:TweenPosition(UDim2.new(0, 2, 0, 1), "Out", "Quad", 0.3, true)
            innerBox.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
        end
        if callback then callback(state) end
    end)
    end

	function createIntro()
    local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.IgnoreGuiInset = true

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(0, 400, 0, 50)
    title.Position = UDim2.new(0.5, -200, 0.4, 0)
    title.Text = "CludeHub"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextScaled = true
    title.Font = Enum.Font.SourceSansBold
    title.BackgroundTransparency = 1

    local loading = Instance.new("TextLabel", frame)
    loading.Size = UDim2.new(0, 200, 0, 30)
    loading.Position = UDim2.new(0.5, -100, 0.4, 60)
    loading.Text = "Loading..."
    loading.TextColor3 = Color3.new(1, 1, 1)
    loading.TextScaled = true
    loading.Font = Enum.Font.SourceSans
    loading.BackgroundTransparency = 1

    task.delay(5, function()
        screenGui:Destroy()
    end)
end

createIntro()

    function Clude:CreateSlider(tab, text, min, max, default, callback)  
    local frame = Instance.new("Frame")  
    frame.Size = UDim2.new(1, -20, 0, 50)  
    frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)  
    frame.Parent = tab  
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 5)  

    local label = Instance.new("TextLabel")  
    label.Size = UDim2.new(1, 0, 0, 20)  
    label.BackgroundTransparency = 1  
    label.Text = text .. ": " .. default  
    label.TextColor3 = Color3.new(1, 1, 1)  
    label.Font = Enum.Font.GothamBold  
    label.TextSize = 14  
    label.Parent = frame  

    local slider = Instance.new("TextButton")  
    slider.Size = UDim2.new(1, -10, 0, 20)  
    slider.Position = UDim2.new(0, 5, 0, 25)  
    slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  
    slider.Text = ""  
    slider.Parent = frame  
    Instance.new("UICorner", slider).CornerRadius = UDim.new(0, 5)  

    local value = default  
    slider.MouseButton1Click:Connect(function()  
        value = value + 1  
        if value > max then value = min end  
        label.Text = text .. ": " .. value  
        if callback then callback(value) end  
    end)  
end

    function Clude:CreateColorPicker(tab, labelText, defaultColor, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 0, 120)
    container.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    container.Parent = tab
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 5)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = labelText or "Color Picker"
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local preview = Instance.new("Frame")
    preview.Size = UDim2.new(0, 30, 0, 30)
    preview.Position = UDim2.new(1, -40, 0, 5)
    preview.BackgroundColor3 = defaultColor or Color3.fromRGB(255, 255, 255)
    preview.Parent = container
    Instance.new("UICorner", preview).CornerRadius = UDim.new(0, 6)

    local function createSlider(name, posY, initVal)
        local slider = Instance.new("TextButton")
        slider.Size = UDim2.new(1, -20, 0, 20)
        slider.Position = UDim2.new(0, 10, 0, posY)
        slider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        slider.Text = name .. ": " .. tostring(initVal)
        slider.TextColor3 = Color3.new(1, 1, 1)
        slider.Font = Enum.Font.GothamBold
        slider.TextSize = 13
        slider.TextXAlignment = Enum.TextXAlignment.Left
        slider.AutoButtonColor = false
        slider.Parent = container
        Instance.new("UICorner", slider).CornerRadius = UDim.new(0, 5)

        return slider
    end

    local r, g, b = defaultColor.R * 255, defaultColor.G * 255, defaultColor.B * 255
    local rSlider = createSlider("R", 35, math.floor(r))
    local gSlider = createSlider("G", 60, math.floor(g))
    local bSlider = createSlider("B", 85, math.floor(b))

    local function updateColor()
        local newColor = Color3.fromRGB(r, g, b)
        preview.BackgroundColor3 = newColor
        if callback then
            callback(newColor)
        end
    end

    local function onSliderClick(sliderName)
        local slider = ({ R = rSlider, G = gSlider, B = bSlider })[sliderName]
        slider.MouseButton1Click:Connect(function()
            local new = tonumber(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("CludeGui"):FindFirstChildWhichIsA("ScreenGui", true):FindFirstChild("CludeGui") and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").CludeGui:FindFirstChildWhichIsA("TextBox", true) and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui").CludeGui:FindFirstChildWhichIsA("TextBox", true).Text) or 0
            new = math.clamp(math.floor(new), 0, 255)
            if sliderName == "R" then r = new end
            if sliderName == "G" then g = new end
            if sliderName == "B" then b = new end
            slider.Text = sliderName .. ": " .. new
            updateColor()
        end)
    end

    onSliderClick("R")
    onSliderClick("G")
    onSliderClick("B")
	end

    function Clude:CreateInput(tab, label, placeholder, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    frame.Parent = tab
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 5)

    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(0, 100, 1, 0)
    labelText.Position = UDim2.new(0, 10, 0, 0)
    labelText.BackgroundTransparency = 1
    labelText.Text = label
    labelText.TextColor3 = Color3.new(1, 1, 1)
    labelText.Font = Enum.Font.GothamBold
    labelText.TextSize = 15
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = frame

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(0, 150, 1, -10)
    input.Position = UDim2.new(1, -160, 0, 5)
    input.PlaceholderText = placeholder
    input.Text = ""
    input.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    input.TextColor3 = Color3.new(1, 1, 1)
    input.Font = Enum.Font.Gotham
    input.TextScaled = true
    input.Parent = frame
    Instance.new("UICorner", input).CornerRadius = UDim.new(0, 5)

 input.FocusLost:Connect(function(enter)
     if enter then callback(input.Text) end
   end)
  end
    
    function Clude:CreateLabel(tab, text)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 0, 40)
        label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        label.Text = text
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 15
        label.Parent = tab
        Instance.new("UICorner", label).CornerRadius = UDim.new(0, 5)
    end

    function Clude:CreateParagraph(tab, text)
        local paragraph = Instance.new("TextLabel")
        paragraph.Size = UDim2.new(1, -20, 0, 60)
        paragraph.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        paragraph.Text = text
        paragraph.TextColor3 = Color3.new(1, 1, 1)
        paragraph.Font = Enum.Font.Gotham
        paragraph.TextSize = 14
        paragraph.TextWrapped = true
        paragraph.TextYAlignment = Enum.TextYAlignment.Top
        paragraph.Parent = tab
        Instance.new("UICorner", paragraph).CornerRadius = UDim.new(0, 5)
    end

    local TweenService = game:GetService("TweenService")

function Clude:CreateDropdown(tab, title, options, callback)
    local drop = Instance.new("TextButton")
    drop.Size = UDim2.new(1, -20, 0, 40)
    drop.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    drop.TextColor3 = Color3.new(1, 1, 1)
    drop.Font = Enum.Font.GothamBold
    drop.TextSize = 15
    drop.TextXAlignment = Enum.TextXAlignment.Left
    drop.Text = title .. " ▼"
    drop.Parent = tab
    Instance.new("UICorner", drop).CornerRadius = UDim.new(0, 5)

    local open = false
    local list = {}
    local spacing = 35

    local function updateDropdownPosition()
        for i, item in ipairs(list) do
            item.Position = UDim2.new(0, 20, 0, drop.Position.Y.Offset + drop.Size.Y.Offset + 5 + ((i - 1) * spacing))
        end
    end

    drop.MouseButton1Click:Connect(function()
        open = not open
        drop.Text = open and (title .. " ▲") or (title .. " ▼")

        for i, item in ipairs(list) do
            if open then
                item.Visible = true
                item.Position = UDim2.new(0, 20, 0, drop.Position.Y.Offset + drop.Size.Y.Offset)
                local targetPos = UDim2.new(0, 20, 0, drop.Position.Y.Offset + drop.Size.Y.Offset + 5 + ((i - 1) * spacing))
                TweenService:Create(item, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = targetPos}):Play()
            else
                local tween = TweenService:Create(item, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                    Position = UDim2.new(0, 20, 0, drop.Position.Y.Offset + drop.Size.Y.Offset)
                })
                tween:Play()
                tween.Completed:Connect(function()
                    item.Visible = false
                end)
            end
        end
    end)

    for i, option in ipairs(options) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -40, 0, 30)
        btn.Position = UDim2.new(0, 20, 0, 0)
        btn.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
        btn.Text = option
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 14
        btn.Visible = false
        btn.Parent = tab
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
        table.insert(list, btn)

        btn.MouseButton1Click:Connect(function()
            callback(option)
            drop.Text = title .. ": " .. option .. " ▼"
            open = false
            for _, b in ipairs(list) do
                TweenService:Create(b, TweenInfo.new(0.15), {Position = UDim2.new(0, 20, 0, drop.Position.Y.Offset + drop.Size.Y.Offset)}):Play()
                task.delay(0.15, function() b.Visible = false end)
            end
        end)
    end

    updateDropdownPosition()
	end
    
    return Clude
end

function Clude:Destroy()
    local gui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("CludeGui")
    if gui then
        gui:Destroy()
    end
end

return Clude
