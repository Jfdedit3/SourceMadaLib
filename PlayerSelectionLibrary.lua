local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer

local AdminGui = {}

function AdminGui:CreateWindow(title)
    -- Create main frame
    local Frame = Instance.new("Frame")
    Frame.Name = "AddWindow"
    Frame.BackgroundColor3 = Color3.fromRGB(26, 18, 30)
    Frame.Size = UDim2.new(0, 420, 0, 320)
    Frame.Position = UDim2.new(0.5, -210, 0.5, -160)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.Parent = localPlayer:WaitForChild("PlayerGui")

    local UICornerFrame = Instance.new("UICorner")
    UICornerFrame.Parent = Frame

    -- Title label
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = title or "Admin Panel"
    TitleLabel.Size = UDim2.new(1, 0, 0, 30)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.new(1,1,1)
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextSize = 24
    TitleLabel.Parent = Frame

    -- Profile Image
    local ProfileImage = Instance.new("ImageLabel")
    ProfileImage.Name = "ProfileImage"
    ProfileImage.Size = UDim2.new(0, 60, 0, 60)
    ProfileImage.Position = UDim2.new(0, 10, 0, 40)
    ProfileImage.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ProfileImage.Parent = Frame
    Instance.new("UICorner", ProfileImage)

    -- Username label
    local UsernameLabel = Instance.new("TextLabel")
    UsernameLabel.Name = "UsernameLabel"
    UsernameLabel.Position = UDim2.new(0, 80, 0, 50)
    UsernameLabel.Size = UDim2.new(0, 200, 0, 30)
    UsernameLabel.TextColor3 = Color3.new(1,1,1)
    UsernameLabel.BackgroundTransparency = 1
    UsernameLabel.Font = Enum.Font.SourceSansBold
    UsernameLabel.TextSize = 22
    UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    UsernameLabel.Text = "Select a player"
    UsernameLabel.Parent = Frame

    -- WalkSpeed label
    local SpeedLabel = Instance.new("TextLabel")
    SpeedLabel.Name = "SpeedLabel"
    SpeedLabel.Position = UDim2.new(0, 10, 0, 110)
    SpeedLabel.Size = UDim2.new(0, 150, 0, 25)
    SpeedLabel.TextColor3 = Color3.new(1,1,1)
    SpeedLabel.BackgroundTransparency = 1
    SpeedLabel.Font = Enum.Font.SourceSansBold
    SpeedLabel.TextSize = 18
    SpeedLabel.Text = "WalkSpeed: "
    SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
    SpeedLabel.Parent = Frame

    -- JumpPower label
    local JumpLabel = Instance.new("TextLabel")
    JumpLabel.Name = "JumpLabel"
    JumpLabel.Position = UDim2.new(0, 10, 0, 135)
    JumpLabel.Size = UDim2.new(0, 150, 0, 25)
    JumpLabel.TextColor3 = Color3.new(1,1,1)
    JumpLabel.BackgroundTransparency = 1
    JumpLabel.Font = Enum.Font.SourceSansBold
    JumpLabel.TextSize = 18
    JumpLabel.Text = "JumpPower: "
    JumpLabel.TextXAlignment = Enum.TextXAlignment.Left
    JumpLabel.Parent = Frame

    -- Distance label
    local DistanceLabel = Instance.new("TextLabel")
    DistanceLabel.Name = "DistanceLabel"
    DistanceLabel.Position = UDim2.new(0, 10, 0, 160)
    DistanceLabel.Size = UDim2.new(0, 150, 0, 25)
    DistanceLabel.TextColor3 = Color3.new(1,1,1)
    DistanceLabel.BackgroundTransparency = 1
    DistanceLabel.Font = Enum.Font.SourceSansBold
    DistanceLabel.TextSize = 18
    DistanceLabel.Text = "Distance: "
    DistanceLabel.TextXAlignment = Enum.TextXAlignment.Left
    DistanceLabel.Parent = Frame

    -- Health label
    local HealthLabel = Instance.new("TextLabel")
    HealthLabel.Name = "HealthLabel"
    HealthLabel.Position = UDim2.new(0, 10, 0, 185)
    HealthLabel.Size = UDim2.new(0, 150, 0, 25)
    HealthLabel.TextColor3 = Color3.new(1,1,1)
    HealthLabel.BackgroundTransparency = 1
    HealthLabel.Font = Enum.Font.SourceSansBold
    HealthLabel.TextSize = 18
    HealthLabel.Text = "Health: "
    HealthLabel.TextXAlignment = Enum.TextXAlignment.Left
    HealthLabel.Parent = Frame

    -- Line divider top
    local LineTop = Instance.new("Frame")
    LineTop.Size = UDim2.new(1, 0, 0, 1)
    LineTop.Position = UDim2.new(0, 0, 0, 30)
    LineTop.BackgroundColor3 = Color3.fromRGB(54, 46, 63)
    LineTop.BorderSizePixel = 0
    LineTop.Parent = Frame

    -- Line divider bottom
    local LineBottom = Instance.new("Frame")
    LineBottom.Size = UDim2.new(1, 0, 0, 1)
    LineBottom.Position = UDim2.new(0, 0, 0, 215)
    LineBottom.BackgroundColor3 = Color3.fromRGB(54, 46, 63)
    LineBottom.BorderSizePixel = 0
    LineBottom.Parent = Frame

    -- Username Selection ScrollingFrame
    local UsernameSelection = Instance.new("ScrollingFrame")
    UsernameSelection.Name = "UsernameSelection"
    UsernameSelection.Size = UDim2.new(0, 150, 0, 180)
    UsernameSelection.Position = UDim2.new(0, 260, 0, 40)
    UsernameSelection.BackgroundColor3 = Color3.fromRGB(25, 17, 29)
    UsernameSelection.ScrollBarThickness = 6
    UsernameSelection.Parent = Frame
    Instance.new("UICorner", UsernameSelection)

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.FillDirection = Enum.FillDirection.Vertical
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Parent = UsernameSelection

    -- Container for action buttons
    local Container = Instance.new("ScrollingFrame")
    Container.Name = "Container"
    Container.Size = UDim2.new(0, 400, 0, 90)
    Container.Position = UDim2.new(0, 10, 0, 220)
    Container.BackgroundTransparency = 1
    Container.ScrollBarThickness = 6
    Container.Parent = Frame

    local ContainerLayout = Instance.new("UIListLayout")
    ContainerLayout.FillDirection = Enum.FillDirection.Horizontal
    ContainerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContainerLayout.Parent = Container

    -- Selected player variable
    local selectedPlayer = nil

    -- Update display function
    local function UpdatePlayerDisplay(plr)
        if not plr or not plr.Character or not plr.Character:FindFirstChild("Humanoid") then
            ProfileImage.Image = ""
            UsernameLabel.Text = "Select a player"
            SpeedLabel.Text = "WalkSpeed: "
            JumpLabel.Text = "JumpPower: "
            DistanceLabel.Text = "Distance: "
            HealthLabel.Text = "Health: "
            selectedPlayer = nil
            return
        end
        selectedPlayer = plr

        -- Update profile image using Player Thumbnail
        local userId = plr.UserId
        local thumbType = Enum.ThumbnailType.HeadShot
        local thumbSize = Enum.ThumbnailSize.Size100x100
        local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
        ProfileImage.Image = content

        UsernameLabel.Text = plr.Name

        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
        SpeedLabel.Text = "WalkSpeed: " .. tostring(humanoid.WalkSpeed)
        JumpLabel.Text = "JumpPower: " .. tostring(humanoid.JumpPower)

        local dist = (localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("HumanoidRootPart")) and
                     (localPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude or 0
        DistanceLabel.Text = string.format("Distance: %.2f", dist)

        HealthLabel.Text = "Health: " .. tostring(math.floor(humanoid.Health))
    end

    -- Populate UsernameSelection with player buttons
    local function PopulatePlayers()
        UsernameSelection:ClearAllChildren()
        UIListLayout.Parent = UsernameSelection -- Re-parent so layout updates after clearing

        for _, plr in ipairs(Players:GetPlayers()) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -10, 0, 30)
            btn.BackgroundColor3 = Color3.fromRGB(46, 39, 57)
            btn.TextColor3 = Color3.new(1, 1, 1)
            btn.Font = Enum.Font.SourceSansBold
            btn.TextSize = 18
            btn.Text = plr.Name
            btn.Parent = UsernameSelection
            Instance.new("UICorner", btn)

            btn.MouseButton1Click:Connect(function()
                UpdatePlayerDisplay(plr)
            end)
        end
    end

    PopulatePlayers()

    -- Keep updating distance and health of selected player every frame
    RunService.Heartbeat:Connect(function()
        if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChildOfClass("Humanoid") then
            local humanoid = selectedPlayer.Character:FindFirstChildOfClass("Humanoid")
            SpeedLabel.Text = "WalkSpeed: " .. tostring(humanoid.WalkSpeed)
            JumpLabel.Text = "JumpPower: " .. tostring(humanoid.JumpPower)

            local dist = (localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and selectedPlayer.Character:FindFirstChild("HumanoidRootPart")) and
                         (localPlayer.Character.HumanoidRootPart.Position - selectedPlayer.Character.HumanoidRootPart.Position).Magnitude or 0
            DistanceLabel.Text = string.format("Distance: %.2f", dist)

            HealthLabel.Text = "Health: " .. tostring(math.floor(humanoid.Health))
        end
    end)

    -- AddButton function for Container
    function Frame:AddButton(name, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 120, 0, 35)
        button.BackgroundColor3 = Color3.fromRGB(38, 31, 50)
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.SourceSansBold
        button.TextSize = 18
        button.Text = name
        button.Parent = Container
        Instance.new("UICorner", button)

        button.MouseButton1Click:Connect(function()
            if selectedPlayer then
                callback(selectedPlayer)
            else
                warn("No player selected!")
            end
        end)
    end

    return Frame
end

return AdminGui
