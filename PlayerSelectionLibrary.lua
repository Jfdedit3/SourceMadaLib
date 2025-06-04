local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local AdminGui = {}
AdminGui.__index = AdminGui

-- Darken a Color3 by 20%
local function darken(color, amount)
    amount = amount or 0.2
    return Color3.new(
        math.clamp(color.R * (1 - amount), 0, 1),
        math.clamp(color.G * (1 - amount), 0, 1),
        math.clamp(color.B * (1 - amount), 0, 1)
    )
end

function AdminGui:CreateWindow(title)
    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AdminGuiScreen"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Main Frame
    local Frame = Instance.new("Frame")
    Frame.Name = "AddWindow"
    Frame.BackgroundColor3 = darken(Color3.fromRGB(26, 18, 30), 0.2)
    Frame.Size = UDim2.new(0, 275, 0, 290)
    Frame.Position = UDim2.new(0.5, 0, 0, 50)
    Frame.AnchorPoint = Vector2.new(0.5, 0)
    Frame.Parent = screenGui

    -- Frame UICorner
    local frameCorner = Instance.new("UICorner")
    frameCorner.Parent = Frame

    -- Make Frame draggable
    local dragging = false
    local dragInput, mousePos, framePos

    Frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = Frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    RunService.RenderStepped:Connect(function()
        if dragging and dragInput then
            local delta = dragInput.Position - mousePos
            Frame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)

    -- Open animation (scale + fade)
    Frame.AnchorPoint = Vector2.new(0.5, 0)
    Frame.Position = UDim2.new(0.5, 0, 0, 50)
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.new(0, 0, 0, 0)

    coroutine.wrap(function()
        for i = 0, 1, 0.05 do
            Frame.Size = UDim2.new(0, 275 * i, 0, 290 * i)
            Frame.BackgroundTransparency = 1 - i
            wait(0.01)
        end
        Frame.Size = UDim2.new(0, 275, 0, 290)
        Frame.BackgroundTransparency = 0
    end)()

    -- Profile Image
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "ProfileImage"
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.Size = UDim2.new(0, 50, 0, 50)
    ImageLabel.Position = UDim2.new(0, 3, 0, 30)
    ImageLabel.Parent = Frame
    local imgCorner = Instance.new("UICorner")
    imgCorner.Parent = ImageLabel

    -- TitleLine
    local TitleLine = Instance.new("Frame")
    TitleLine.Name = "TitleLine"
    TitleLine.BackgroundColor3 = darken(Color3.fromRGB(54, 46, 63), 0.2)
    TitleLine.Size = UDim2.new(1, 0, 0, 1)
    TitleLine.Position = UDim2.new(0, 0, 0, 30)
    TitleLine.BorderSizePixel = 0
    TitleLine.Parent = Frame

    -- JumpLabel
    local JumpLabel = Instance.new("TextLabel")
    JumpLabel.Name = "JumpLabel"
    JumpLabel.Text = "JumpPower:"
    JumpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    JumpLabel.TextSize = 18
    JumpLabel.Font = Enum.Font.SourceSansBold
    JumpLabel.BackgroundTransparency = 1
    JumpLabel.Size = UDim2.new(0, 120, 0, 29)
    JumpLabel.Position = UDim2.new(0, 3, 0, 138)
    JumpLabel.TextWrapped = true
    JumpLabel.TextXAlignment = Enum.TextXAlignment.Left
    JumpLabel.Parent = Frame
    local jumpStroke = Instance.new("TextStroke")
    jumpStroke.Color = Color3.fromRGB(127, 127, 127)
    jumpStroke.Thickness = 1
    jumpStroke.Parent = JumpLabel

    -- SpeedLabel
    local SpeedLabel = Instance.new("TextLabel")
    SpeedLabel.Name = "SpeedLabel"
    SpeedLabel.Text = "WalkSpeed:"
    SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedLabel.TextSize = 18
    SpeedLabel.Font = Enum.Font.SourceSansBold
    SpeedLabel.BackgroundTransparency = 1
    SpeedLabel.Size = UDim2.new(0, 120, 0, 29)
    SpeedLabel.Position = UDim2.new(0, 3, 0, 121)
    SpeedLabel.TextWrapped = true
    SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
    SpeedLabel.Parent = Frame
    local speedStroke = Instance.new("TextStroke")
    speedStroke.Color = Color3.fromRGB(127, 127, 127)
    speedStroke.Thickness = 1
    speedStroke.Parent = SpeedLabel

    -- DistanceLabel
    local DistanceLabel = Instance.new("TextLabel")
    DistanceLabel.Name = "DistanceLabel"
    DistanceLabel.Text = "Distance:"
    DistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    DistanceLabel.TextSize = 18
    DistanceLabel.Font = Enum.Font.SourceSansBold
    DistanceLabel.BackgroundTransparency = 1
    DistanceLabel.Size = UDim2.new(0, 120, 0, 29)
    DistanceLabel.Position = UDim2.new(0, 3, 0, 101)
    DistanceLabel.TextWrapped = true
    DistanceLabel.TextXAlignment = Enum.TextXAlignment.Left
    DistanceLabel.Parent = Frame
    local distStroke = Instance.new("TextStroke")
    distStroke.Color = Color3.fromRGB(127, 127, 127)
    distStroke.Thickness = 1
    distStroke.Parent = DistanceLabel

    -- Line Frame
    local Line = Instance.new("Frame")
    Line.Name = "Line"
    Line.BackgroundColor3 = darken(Color3.fromRGB(54, 46, 62), 0.2)
    Line.Size = UDim2.new(1, 0, 0, 1)
    Line.Position = UDim2.new(0, 0, 0, 190)
    Line.BorderSizePixel = 0
    Line.Parent = Frame

    -- UsernameLabel
    local UsernameLabel = Instance.new("TextLabel")
    UsernameLabel.Name = "UsernameLabel"
    UsernameLabel.Text = "Select a player"
    UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    UsernameLabel.TextSize = 18
    UsernameLabel.Font = Enum.Font.SourceSansBold
    UsernameLabel.BackgroundTransparency = 1
    UsernameLabel.Size = UDim2.new(0, 220, 0, 29)
    UsernameLabel.Position = UDim2.new(0, 67, 0, 40)
    UsernameLabel.TextWrapped = true
    UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    UsernameLabel.Parent = Frame
    local userStroke = Instance.new("TextStroke")
    userStroke.Color = Color3.fromRGB(127, 127, 127)
    userStroke.Thickness = 1
    userStroke.Parent = UsernameLabel

    -- UsernameSelection scrolling frame
    local UsernameSelection = Instance.new("ScrollingFrame")
    UsernameSelection.Name = "UsernameSelection"
    UsernameSelection.BackgroundColor3 = darken(Color3.fromRGB(25, 17, 29), 0.2)
    UsernameSelection.Size = UDim2.new(0, 156, 0, 157)
    UsernameSelection.Position = UDim2.new(0, 149, 0, 29)
    UsernameSelection.Parent = Frame
    UsernameSelection.ScrollBarThickness = 0
    UsernameSelection.CanvasSize = UDim2.new(0, 0, 0, 0)

    local usernameSelectionCorner = Instance.new("UICorner")
    usernameSelectionCorner.Parent = UsernameSelection

    local usernameSelectionStroke = Instance.new("UIStroke")
    usernameSelectionStroke.Color = darken(Color3.fromRGB(46, 39, 57), 0.2)
    usernameSelectionStroke.Thickness = 1
    usernameSelectionStroke.Parent = UsernameSelection

    local usernameListLayout = Instance.new("UIListLayout")
    usernameListLayout.FillDirection = Enum.FillDirection.Vertical
    usernameListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    usernameListLayout.Parent = UsernameSelection
    usernameListLayout.Padding = UDim.new(0, 4)

    -- Container scrolling frame for buttons
    local Container = Instance.new("ScrollingFrame")
    Container.Name = "Container"
    Container.BackgroundTransparency = 1
    Container.Size = UDim2.new(1, -6, 0, 84)
    Container.Position = UDim2.new(0, 3, 0, 192)
    Container.Parent = Frame
    Container.ScrollBarThickness = 0
    Container.CanvasSize = UDim2.new(0, 0, 0, 0)

    local containerListLayout = Instance.new("UIListLayout")
    containerListLayout.FillDirection = Enum.FillDirection.Horizontal
    containerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    containerListLayout.Padding = UDim.new(0, 8)
    containerListLayout.Parent = Container

    -- Selected player property
    self.SelectedPlayer = nil

    -- Helper to update player info labels
    local function updatePlayerInfo(player)
        if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or not player.Character:FindFirstChild("Humanoid") then
            JumpLabel.Text = "JumpPower: N/A"
            SpeedLabel.Text = "WalkSpeed: N/A"
            DistanceLabel.Text = "Distance: N/A"
            ImageLabel.Image = ""
            UsernameLabel.Text = "Select a player"
            return
        end

        local humanoid = player.Character.Humanoid
        local hrp = player.Character.HumanoidRootPart
        local localPlayer = Players.LocalPlayer
        local localHRP = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
        local distance = localHRP and (hrp.Position - localHRP.Position).Magnitude or 0

        JumpLabel.Text = "JumpPower: " .. tostring(math.floor(humanoid.JumpPower))
        SpeedLabel.Text = "WalkSpeed: " .. tostring(math.floor(humanoid.WalkSpeed))
        DistanceLabel.Text = "Distance: " .. tostring(math.floor(distance))

        ImageLabel.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
        UsernameLabel.Text = player.Name
    end

    -- Function to refresh player buttons list
    local function refreshPlayers()
        UsernameSelection:ClearAllChildren()
        usernameListLayout.Parent = nil -- temporarily disable to avoid layout thrashing

        for _, player in pairs(Players:GetPlayers()) do
            local btn = Instance.new("TextButton")
            btn.Name = player.Name .. "_Btn"
            btn.Text = player.Name
            btn.Size = UDim2.new(1, 0, 0, 30)
            btn.BackgroundColor3 = darken(Color3.fromRGB(39, 30, 55), 0.2)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Font = Enum.Font.SourceSansBold
            btn.TextSize = 16
            btn.Parent = UsernameSelection

            local corner = Instance.new("UICorner")
            corner.Parent = btn
            local stroke = Instance.new("UIStroke")
            stroke.Color = darken(Color3.fromRGB(54, 46, 70), 0.2)
            stroke.Thickness = 1
            stroke.Parent = btn

            btn.MouseButton1Click:Connect(function()
                self.SelectedPlayer = player
                updatePlayerInfo(player)
            end)
        end

        usernameListLayout.Parent = UsernameSelection
        wait()
        -- Update canvas size
        UsernameSelection.CanvasSize = UDim2.new(0, 0, 0, usernameListLayout.AbsoluteContentSize.Y)
    end

    refreshPlayers()
    Players.PlayerAdded:Connect(refreshPlayers)
    Players.PlayerRemoving:Connect(refreshPlayers)

    -- AddButton method: adds buttons horizontally in Container, using SelectedPlayer
    function self:AddButton(label, callback)
        local button = Instance.new("TextButton")
        button.Name = label .. "_Btn"
        button.Text = label
        button.Size = UDim2.new(0, 70, 0, 34)
        button.BackgroundColor3 = darken(Color3.fromRGB(39, 30, 55), 0.2)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSansBold
        button.TextSize = 16
        button.Parent = Container

        local corner = Instance.new("UICorner")
        corner.Parent = button
        local stroke = Instance.new("UIStroke")
        stroke.Color = darken(Color3.fromRGB(54, 46, 70), 0.2)
        stroke.Thickness = 1
        stroke.Parent = button

        button.MouseButton1Click:Connect(function()
            if self.SelectedPlayer then
                callback(self.SelectedPlayer)
            end
        end)

        wait()
        -- Update canvas size to fit buttons horizontally
        Container.CanvasSize = UDim2.new(0, containerListLayout.AbsoluteContentSize.X + 10, 0, 0)
    end

    return self
end

return AdminGui
