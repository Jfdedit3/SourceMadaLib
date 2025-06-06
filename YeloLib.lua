local Yelo = {}
Yelo.__index = Yelo

function Yelo.new()
    local self = setmetatable({}, Yelo)
    local player = game.Players.LocalPlayer
    self.PlayerGui = player:WaitForChild("PlayerGui")

    local YeloLib = Instance.new("ScreenGui")
    YeloLib.Name = "YeloLib"
    YeloLib.Parent = self.PlayerGui
    self.YeloLib = YeloLib

    self.Windows = {}
    self.Containers = {}
    self.Tabs = {}

    self.Player = player
    return self
end

-- Add main window with Title and Title_2
function Yelo:AddWindow(options)
    options = options or {}
    local window = Instance.new("Frame")
    window.Name = "AddWindow"
    window.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    window.Size = UDim2.new(0, 442, 0, 422)
    window.Position = UDim2.new(0.3, 0, 0, 0)
    window.Parent = self.YeloLib

    local corner = Instance.new("UICorner")
    corner.Parent = window
    corner.CornerRadius = UDim.new(0, 6)

    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Text = options.Title or "title"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 15
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, -60, 0, 29)
    Title.Position = UDim2.new(0, 7, 0, 0)
    Title.Parent = window

    local TitleStroke = Instance.new("UIStroke")
    TitleStroke.Parent = Title
    TitleStroke.Color = Color3.fromRGB(127, 127, 127)

    -- Title_2 container label (like "CludeHub")
    local Title_2 = Instance.new("TextLabel")
    Title_2.Name = "Title_2"
    Title_2.Text = options.Title_2 or ""
    Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title_2.TextSize = 15
    Title_2.TextXAlignment = Enum.TextXAlignment.Left
    Title_2.BackgroundTransparency = 1
    Title_2.Size = UDim2.new(1, -20, 0, 29)
    Title_2.Position = UDim2.new(0, 8, 0, 0)
    Title_2.Parent = nil -- will be parented to container later (optional)

    local Title2Stroke = Instance.new("UIStroke")
    Title2Stroke.Parent = Title_2
    Title2Stroke.Color = Color3.fromRGB(127, 127, 127)

    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 16
    CloseButton.BackgroundTransparency = 1
    CloseButton.Size = UDim2.new(0, 35, 0, 29)
    CloseButton.Position = UDim2.new(1, -37, 0, 0)
    CloseButton.Parent = window

    local CloseButtonStroke = Instance.new("UIStroke")
    CloseButtonStroke.Parent = CloseButton
    CloseButtonStroke.Color = Color3.fromRGB(127, 127, 127)

    CloseButton.MouseButton1Click:Connect(function()
        window:Destroy()
    end)

    -- Line under title
    local Line_1 = Instance.new("Frame")
    Line_1.Name = "Line_1"
    Line_1.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
    Line_1.Size = UDim2.new(1, 0, 0, 1)
    Line_1.Position = UDim2.new(0, 0, 0, 29)
    Line_1.Parent = window
    Line_1.BorderSizePixel = 0

    self.Windows[window] = {Title_2 = Title_2} -- Store ref for later

    return window, Title_2
end

-- Add left or right container with scrolling frame, return the container frame
function Yelo:AddContainer(side)
    assert(side == "left" or side == "right", "Container side must be 'left' or 'right'")

    local window = next(self.Windows)
    if not window then
        error("No window created. Call Yelo:AddWindow first.")
    end

    local container = Instance.new("Frame")
    container.Name = side == "left" and "left" or "right"
    container.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    container.Size = UDim2.new(0, 200, 0, 200)
    container.Position = side == "left" and UDim2.new(0, 4, 0, 34) or UDim2.new(0, 238, 0, 34)
    container.Parent = window

    local corner = Instance.new("UICorner")
    corner.Parent = container
    corner.CornerRadius = UDim.new(0, 6)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Name = "ScrollingFrame"
    scroll.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    scroll.Size = UDim2.new(1, -4, 1, -4)
    scroll.Position = UDim2.new(0, 2, 0, 2)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 0
    scroll.Parent = container

    local listLayout = Instance.new("UIListLayout")
    listLayout.Parent = scroll
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 4)

    self.Containers[side] = container

    return container, scroll
end

-- Add tab button to left/right container's scrolling frame, returns the button
function Yelo:AddTab(name, iconImage)
    local leftContainer = self.Containers["left"]
    if not leftContainer then
        error("No left container found. Call Yelo:AddContainer('left') first.")
    end
    local scrollingFrame = leftContainer:FindFirstChildWhichIsA("ScrollingFrame")
    if not scrollingFrame then
        error("No scrolling frame found inside left container.")
    end

    local button = Instance.new("TextButton")
    button.Name = name .. "Tab"
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 15
    button.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    button.Size = UDim2.new(1, 0, 0, 28)
    button.BackgroundTransparency = 1
    button.Parent = scrollingFrame

    local corner = Instance.new("UICorner")
    corner.Parent = button
    corner.CornerRadius = UDim.new(0, 6)

    local stroke = Instance.new("UIStroke")
    stroke.Parent = button
    stroke.Color = Color3.fromRGB(127, 127, 127)

    if iconImage then
        local icon = Instance.new("ImageLabel")
        icon.Name = "icon"
        icon.BackgroundTransparency = 1
        icon.Size = UDim2.new(0, 23, 0, 22)
        icon.Position = UDim2.new(0, 3, 0, 3)
        icon.Image = iconImage
        icon.Parent = button
    end

    return button
end

-- Set user thumbnail on given ImageLabel (safe)
function Yelo:SetUserThumbnail(imageLabel)
    local success, thumbnail = pcall(function()
        return game.Players:GetUserThumbnailAsync(self.Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48)
    end)

    if success and thumbnail then
        imageLabel.Image = thumbnail
    end
end

-- Add the user info display on the TabFrame container (like username + image)
function Yelo:AddUserInfo(container)
    local TabFrame = container
    if not TabFrame then
        error("AddUserInfo requires a container/frame.")
    end

    -- Username text label
    local Username = Instance.new("TextLabel")
    Username.Name = "Username"
    Username.Text = self.Player.Name
    Username.TextColor3 = Color3.fromRGB(255, 255, 255)
    Username.TextScaled = true
    Username.TextXAlignment = Enum.TextXAlignment.Left
    Username.BackgroundTransparency = 1
    Username.Size = UDim2.new(0, 89, 0, 34)
    Username.Position = UDim2.new(0, 48, 0, 383)
    Username.Parent = TabFrame

    local UsernameStroke = Instance.new("UIStroke")
    UsernameStroke.Parent = Username
    UsernameStroke.Color = Color3.fromRGB(127, 127, 127)

    -- ImageLabel for user thumbnail
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
    ImageLabel.Size = UDim2.new(0, 34, 0, 34)
    ImageLabel.Position = UDim2.new(0, 5, 0, 384)
    ImageLabel.Parent = TabFrame
    ImageLabel.BackgroundTransparency = 0

    local UICorner_ImageLabel = Instance.new("UICorner")
    UICorner_ImageLabel.Parent = ImageLabel
    UICorner_ImageLabel.CornerRadius = UDim.new(1, 0)

    local ImageLabelStroke = Instance.new("UIStroke")
    ImageLabelStroke.Parent = ImageLabel
    ImageLabelStroke.Color = Color3.fromRGB(127, 127, 127)

    self:SetUserThumbnail(ImageLabel)
end

return Yelo
