local Yelo = {}
Yelo.__index = Yelo

local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

function Yelo.new()
    local self = setmetatable({}, Yelo)

    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = "YeloLib"
    self.ScreenGui.Parent = PlayerGui

    self.Windows = {}
    self.Containers = {}

    return self
end

-- Add main window, scaled to screen size (for example, 50% width, 60% height)
function Yelo:AddWindow(opts)
    local window = Instance.new("Frame")
    window.Name = "AddWindow"
    window.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    -- Scaled size & position
    window.Size = UDim2.fromScale(0.5, 0.6)
    window.Position = UDim2.fromScale(0.25, 0.2) -- Center-ish
    window.Parent = self.ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = window

    -- Title Label (top left)
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Text = opts.Title or "Title"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextScaled = true
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, -60, 0, 30)
    title.Position = UDim2.new(0, 8, 0, 5)
    title.Parent = window

    local titleStroke = Instance.new("UIStroke")
    titleStroke.Color = Color3.fromRGB(127, 127, 127)
    titleStroke.Parent = title

    -- Title_2 Label (top left, below title)
    local title2 = Instance.new("TextLabel")
    title2.Name = "Title_2"
    title2.Text = opts.Title_2 or ""
    title2.TextColor3 = Color3.new(1, 1, 1)
    title2.TextScaled = true
    title2.TextXAlignment = Enum.TextXAlignment.Left
    title2.BackgroundTransparency = 1
    title2.Size = UDim2.new(1, -20, 0, 30)
    title2.Position = UDim2.new(0, 8, 0, 35)
    title2.Parent = window

    local title2Stroke = Instance.new("UIStroke")
    title2Stroke.Color = Color3.fromRGB(127, 127, 127)
    title2Stroke.Parent = title2

    -- Close Button (top right)
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.new(1, 1, 1)
    closeBtn.TextScaled = true
    closeBtn.BackgroundTransparency = 1
    closeBtn.Size = UDim2.new(0, 40, 0, 30)
    closeBtn.Position = UDim2.new(1, -45, 0, 5)
    closeBtn.Parent = window

    local closeBtnStroke = Instance.new("UIStroke")
    closeBtnStroke.Color = Color3.fromRGB(127, 127, 127)
    closeBtnStroke.Parent = closeBtn

    closeBtn.MouseButton1Click:Connect(function()
        self.ScreenGui:Destroy()
    end)

    self.Windows[window.Name] = window
    self.MainWindow = window

    return window
end

-- Add container (left or right)
function Yelo:AddContainer(side)
    if not self.MainWindow then
        error("No window created! Use Yelo:AddWindow() first.")
    end

    local container = Instance.new("Frame")
    container.Name = side == "right" and "right" or "left"
    container.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    container.Size = UDim2.fromScale(0.4, 0.8)
    container.Position = side == "right" and UDim2.fromScale(0.58, 0.15) or UDim2.fromScale(0.02, 0.15)
    container.Parent = self.MainWindow

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = container

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.fromScale(1, 1)
    scroll.Position = UDim2.new(0, 0, 0, 0)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 0
    scroll.Parent = container

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = scroll

    self.Containers[side] = {Frame = container, ScrollingFrame = scroll}

    return container
end

-- Add Tab button with icon inside container
function Yelo:AddTab(name, iconImage)
    if not self.Containers["left"] and not self.Containers["right"] then
        error("No container created! Use Yelo:AddContainer() first.")
    end

    -- Just defaulting to left container for now, you can enhance to specify container later
    local containerSide = self.Containers["left"] and "left" or "right"
    local container = self.Containers[containerSide].ScrollingFrame

    local btn = Instance.new("TextButton")
    btn.Name = name .. "Tab"
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    btn.Size = UDim2.new(1, 0, 0, 28)
    btn.BackgroundTransparency = 0.8
    btn.Parent = container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(127, 127, 127)
    stroke.Parent = btn

    if iconImage then
        local icon = Instance.new("ImageLabel")
        icon.Name = "icon"
        icon.Size = UDim2.new(0, 20, 0, 20)
        icon.Position = UDim2.new(0, 4, 0, 4)
        icon.BackgroundTransparency = 1
        icon.Image = iconImage
        icon.Parent = btn
    end

    return btn
end

-- Create and return the library object
return Yelo
