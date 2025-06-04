local AdminGui = {}

-- Call this to create the full UI ScreenGui and window frame
function AdminGui:CreateWindow(title)
    -- Create the ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AdminGuiScreen"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    -- Main Frame (window)
    local Frame = Instance.new("Frame")
    Frame.Name = "AddWindow"
    Frame.BackgroundColor3 = Color3.fromRGB(26, 18, 30)
    Frame.Size = UDim2.new(0.20200000703334808, 275, 0.20200000703334808, 290)
    Frame.Position = UDim2.new(0.20000000298023224, 0, 0, 0)
    Frame.Parent = screenGui

    -- UICorner on main frame
    local FrameUICorner = Instance.new("UICorner")
    FrameUICorner.Parent = Frame

    -- Profile Image
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "ProfileImage"
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.Size = UDim2.new(0, 50, 0, 50)
    ImageLabel.Position = UDim2.new(0, 3, 0, 30)
    local ImageUICorner = Instance.new("UICorner")
    ImageUICorner.Parent = ImageLabel
    ImageLabel.Parent = Frame

    -- Title line under profile image
    local TitleLine = Instance.new("Frame")
    TitleLine.Name = "TitleLine"
    TitleLine.BackgroundColor3 = Color3.fromRGB(54, 46, 63)
    TitleLine.Size = UDim2.new(1, 0, 0, 1)
    TitleLine.Position = UDim2.new(0, 0, 0, 30)
    TitleLine.BorderSizePixel = 0
    TitleLine.Parent = Frame

    -- JumpPower Label
    local JumpLabel = Instance.new("TextLabel")
    JumpLabel.Name = "JumpLabel"
    JumpLabel.Text = "JumpPower:"
    JumpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    JumpLabel.TextSize = 18
    JumpLabel.Font = Enum.Font.SourceSansBold
    JumpLabel.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    JumpLabel.BackgroundTransparency = 1
    JumpLabel.Size = UDim2.new(0, 120, 0, 29)
    JumpLabel.Position = UDim2.new(0, 3, 0, 138)
    JumpLabel.TextWrapped = true
    JumpLabel.TextXAlignment = Enum.TextXAlignment.Left
    JumpLabel.Parent = Frame

    -- WalkSpeed Label
    local SpeedLabel = Instance.new("TextLabel")
    SpeedLabel.Name = "SpeedLabel"
    SpeedLabel.Text = "WalkSpeed:"
    SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedLabel.TextSize = 18
    SpeedLabel.Font = Enum.Font.SourceSansBold
    SpeedLabel.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    SpeedLabel.BackgroundTransparency = 1
    SpeedLabel.Size = UDim2.new(0, 120, 0, 29)
    SpeedLabel.Position = UDim2.new(0, 3, 0, 121)
    SpeedLabel.TextWrapped = true
    SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
    SpeedLabel.Parent = Frame

    -- Distance Label
    local DistanceLabel = Instance.new("TextLabel")
    DistanceLabel.Name = "DistanceLabel"
    DistanceLabel.Text = "Distance: "
    DistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    DistanceLabel.TextSize = 18
    DistanceLabel.Font = Enum.Font.SourceSansBold
    DistanceLabel.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    DistanceLabel.BackgroundTransparency = 1
    DistanceLabel.Size = UDim2.new(0, 120, 0, 29)
    DistanceLabel.Position = UDim2.new(0, 3, 0, 101)
    DistanceLabel.TextWrapped = true
    DistanceLabel.TextXAlignment = Enum.TextXAlignment.Left
    DistanceLabel.Parent = Frame

    -- Bottom line
    local BottomLine = Instance.new("Frame")
    BottomLine.Name = "Line"
    BottomLine.BackgroundColor3 = Color3.fromRGB(54, 46, 62)
    BottomLine.Size = UDim2.new(1, 0, 0, 1)
    BottomLine.Position = UDim2.new(0, 0, 0, 190)
    BottomLine.BorderSizePixel = 0
    BottomLine.Parent = Frame

    -- Username Label
    local UsernameLabel = Instance.new("TextLabel")
    UsernameLabel.Name = "UsernameLabel"
    UsernameLabel.Text = "paulparasplaythis"
    UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    UsernameLabel.TextSize = 18
    UsernameLabel.Font = Enum.Font.SourceSansBold
    UsernameLabel.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    UsernameLabel.BackgroundTransparency = 1
    UsernameLabel.Size = UDim2.new(0, 220, 0, 29)
    UsernameLabel.Position = UDim2.new(0, 67, 0, 40)
    UsernameLabel.TextWrapped = true
    UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    UsernameLabel.Parent = Frame

    -- UsernameSelection ScrollingFrame
    local UsernameSelection = Instance.new("ScrollingFrame")
    UsernameSelection.Name = "UsernameSelection"
    UsernameSelection.BackgroundColor3 = Color3.fromRGB(25, 17, 29)
    UsernameSelection.Size = UDim2.new(0.10000000149011612, 156, 0, 157)
    UsernameSelection.Position = UDim2.new(0.20000000298023224, 149, 0, 29)
    UsernameSelection.Parent = Frame

    local UsernameSelectionUICorner = Instance.new("UICorner")
    UsernameSelectionUICorner.Parent = UsernameSelection

    local UsernameSelectionUIStroke = Instance.new("UIStroke")
    UsernameSelectionUIStroke.Color = Color3.fromRGB(127, 127, 127)
    UsernameSelectionUIStroke.Thickness = 1
    UsernameSelectionUIStroke.Parent = UsernameSelection

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.FillDirection = Enum.FillDirection.Vertical
    UIListLayout.Parent = UsernameSelection

    -- Container ScrollingFrame for buttons
    local Container = Instance.new("ScrollingFrame")
    Container.Name = "Container"
    Container.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    Container.BackgroundTransparency = 1
    Container.Size = UDim2.new(0.10000000149011612, 394, 0, 184)
    Container.Position = UDim2.new(0, 3, 0, 192)
    Container.Parent = Frame

    local ContainerUIListLayout = Instance.new("UIListLayout")
    ContainerUIListLayout.FillDirection = Enum.FillDirection.Horizontal
    ContainerUIListLayout.Parent = Container

    -- Health Label
    local HealthLabel = Instance.new("TextLabel")
    HealthLabel.Name = "HealthLabel"
    HealthLabel.Text = "Health: 100"
    HealthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    HealthLabel.TextSize = 18
    HealthLabel.Font = Enum.Font.SourceSansBold
    HealthLabel.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    HealthLabel.BackgroundTransparency = 1
    HealthLabel.Size = UDim2.new(0, 190, 0, 29)
    HealthLabel.Position = UDim2.new(0, 3, 0, 80)
    HealthLabel.TextXAlignment = Enum.TextXAlignment.Left
    HealthLabel.Parent = Frame

    -- Title Label
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.Text = title or "Title"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 28
    TitleLabel.TextScaled = true
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, -60, 0, 29)
    TitleLabel.Position = UDim2.new(0, 19, 0, 0)
    TitleLabel.BorderSizePixel = 0
    TitleLabel.TextWrapped = true
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Frame

    -- Function to add a button to Container
    function AdminGui:AddButton(buttonText, callback)
        local btn = Instance.new("TextButton")
        btn.Name = "AddButton"
        btn.Text = buttonText
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 18
        btn.Font = Enum.Font.SourceSansBold
        btn.BackgroundColor3 = Color3.fromRGB(38, 31, 50)
        btn.Size = UDim2.new(0, 143, 0, 34)
        btn.TextWrapped = true
        local btnUICorner = Instance.new("UICorner")
        btnUICorner.Parent = btn
        btn.Parent = Container

        btn.MouseButton1Click:Connect(function()
            -- Execute callback with currently selected player
            if selectedPlayer then
                callback(selectedPlayer)
            end
        end)
    end

    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local selectedPlayer = nil

    -- Clear UsernameSelection in case called multiple times
    UsernameSelection:ClearAllChildren()

    -- Add username buttons for all players
    for _, player in ipairs(Players:GetPlayers()) do
        local userBtn = Instance.new("TextButton")
        userBtn.Name = "UsernameButton"
        userBtn.Text = player.Name
        userBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        userBtn.TextSize = 18
        userBtn.Font = Enum.Font.SourceSansBold
        userBtn.BackgroundColor3 = Color3.fromRGB(46, 39, 57)
        userBtn.Size = UDim2.new(1, 0, 0, 29)
        userBtn.BorderSizePixel = 0
        local btnUICorner = Instance.new("UICorner")
        btnUICorner.Parent = userBtn

        userBtn.Parent = UsernameSelection

        userBtn.MouseButton1Click:Connect(function()
            selectedPlayer = player
            -- Update UI info
            UsernameLabel.Text = player.Name
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                local humanoid = player.Character.Humanoid
                JumpLabel.Text = "JumpPower: "..tostring(humanoid.JumpPower)
                SpeedLabel.Text = "WalkSpeed: "..tostring(humanoid.WalkSpeed)
                HealthLabel.Text = "Health: "..tostring(math.floor(humanoid.Health))
            else
                JumpLabel.Text = "JumpPower: N/A"
                SpeedLabel.Text = "WalkSpeed: N/A"
                HealthLabel.Text = "Health: N/A"
            end

            -- Distance calculation (local player to selected player)
            if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and
               player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (localPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                DistanceLabel.Text = "Distance: "..string.format("%.1f", dist)
            else
                DistanceLabel.Text = "Distance: N/A"
            end

            -- Update ProfileImage thumbnail
            local thumbType = Enum.ThumbnailType.HeadShot
            local thumbSize = Enum.ThumbnailSize.Size48x48
            local content, isReady = Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)
            ImageLabel.Image = content
        end)
    end

    -- Select first player by default if any
    if #Players:GetPlayers() > 0 then
        local firstPlayerBtn = UsernameSelection:FindFirstChild("UsernameButton")
        if firstPlayerBtn then
            firstPlayerBtn:CaptureFocus() -- optional, focuses button
            firstPlayerBtn.MouseButton1Click:Fire() -- simulate click to load data
        else
            -- Or just select first player manually
            local firstPlayer = Players:GetPlayers()[1]
            selectedPlayer = firstPlayer
            UsernameLabel.Text = firstPlayer.Name
        end
    end

    return screenGui, Frame
end

return AdminGui
