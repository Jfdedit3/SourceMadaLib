local AdminGui = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local SelectedPlayer = nil

function AdminGui:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AdminUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local Frame = Instance.new("Frame")
    Frame.Name = "AdminWindow"
    Frame.BackgroundColor3 = Color3.fromRGB(26, 18, 30)
    Frame.Size = UDim2.new(0, 550, 0, 400)
    Frame.Position = UDim2.new(0.2, 0, 0.2, 0)
    Frame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner", Frame)

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Text = title
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextSize = 28
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.SourceSansBold
    Title.Size = UDim2.new(1, -60, 0, 30)
    Title.Position = UDim2.new(0, 20, 0, 0)
    Title.Parent = Frame

    local ProfileImage = Instance.new("ImageLabel")
    ProfileImage.Name = "ProfileImage"
    ProfileImage.Size = UDim2.new(0, 50, 0, 50)
    ProfileImage.Position = UDim2.new(0, 3, 0, 30)
    ProfileImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ProfileImage.Parent = Frame
    Instance.new("UICorner", ProfileImage)

    local UsernameLabel = Instance.new("TextLabel")
    UsernameLabel.Name = "UsernameLabel"
    UsernameLabel.Text = "Select a player"
    UsernameLabel.TextColor3 = Color3.new(1, 1, 1)
    UsernameLabel.TextSize = 18
    UsernameLabel.Font = Enum.Font.SourceSansBold
    UsernameLabel.BackgroundTransparency = 1
    UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    UsernameLabel.Size = UDim2.new(0, 220, 0, 29)
    UsernameLabel.Position = UDim2.new(0, 67, 0, 40)
    UsernameLabel.Parent = Frame

    local function createStatLabel(name, text, yOffset)
        local label = Instance.new("TextLabel")
        label.Name = name
        label.Text = text
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextSize = 18
        label.Font = Enum.Font.SourceSansBold
        label.BackgroundTransparency = 1
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Size = UDim2.new(0, 200, 0, 20)
        label.Position = UDim2.new(0, 3, 0, yOffset)
        label.Parent = Frame
        return label
    end

    local HealthLabel = createStatLabel("HealthLabel", "Health:", 80)
    local DistanceLabel = createStatLabel("DistanceLabel", "Distance:", 100)
    local SpeedLabel = createStatLabel("SpeedLabel", "WalkSpeed:", 121)
    local JumpLabel = createStatLabel("JumpLabel", "JumpPower:", 142)

    local UsernameSelection = Instance.new("ScrollingFrame")
    UsernameSelection.Name = "UsernameSelection"
    UsernameSelection.BackgroundColor3 = Color3.fromRGB(25, 17, 29)
    UsernameSelection.Size = UDim2.new(0, 150, 0, 150)
    UsernameSelection.Position = UDim2.new(0, 390, 0, 30)
    UsernameSelection.CanvasSize = UDim2.new(0, 0, 0, 0)
    UsernameSelection.ScrollBarThickness = 2
    UsernameSelection.Parent = Frame
    Instance.new("UICorner", UsernameSelection)

    local layout = Instance.new("UIListLayout", UsernameSelection)
    layout.SortOrder = Enum.SortOrder.LayoutOrder

    local function updateCanvasSize()
        task.wait()
        UsernameSelection.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
    end

    local function onPlayerSelected(player)
        SelectedPlayer = player
        UsernameLabel.Text = player.Name
        ProfileImage.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)

        local char = player.Character
        if char then
            local hum = char:FindFirstChildWhichIsA("Humanoid")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hum and hrp then
                HealthLabel.Text = "Health: " .. math.floor(hum.Health)
                DistanceLabel.Text = "Distance: " .. math.floor((LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude)
                SpeedLabel.Text = "WalkSpeed: " .. hum.WalkSpeed
                JumpLabel.Text = "JumpPower: " .. hum.JumpPower
            end
        end
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local button = Instance.new("TextButton")
            button.Name = "UsernameButton"
            button.Text = player.Name
            button.Size = UDim2.new(1, -6, 0, 24)
            button.BackgroundColor3 = Color3.fromRGB(46, 39, 57)
            button.TextColor3 = Color3.new(1, 1, 1)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 16
            button.Parent = UsernameSelection
            Instance.new("UICorner", button)

            button.MouseButton1Click:Connect(function()
                onPlayerSelected(player)
            end)
        end
    end

    updateCanvasSize()

    local Container = Instance.new("ScrollingFrame")
    Container.Name = "Container"
    Container.BackgroundTransparency = 1
    Container.Size = UDim2.new(1, -6, 0, 100)
    Container.Position = UDim2.new(0, 3, 1, -105)
    Container.ScrollBarThickness = 2
    Container.Parent = Frame

    local layout2 = Instance.new("UIListLayout", Container)
    layout2.SortOrder = Enum.SortOrder.LayoutOrder
    layout2.FillDirection = Enum.FillDirection.Vertical

    function AdminGui:AddButton(label, callback)
        local button = Instance.new("TextButton")
        button.Name = "AddButton"
        button.Text = label
        button.Size = UDim2.new(1, -6, 0, 30)
        button.BackgroundColor3 = Color3.fromRGB(38, 31, 50)
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.SourceSansBold
        button.TextSize = 16
        button.Parent = Container
        Instance.new("UICorner", button)

        button.MouseButton1Click:Connect(function()
            if SelectedPlayer then
                callback(SelectedPlayer)
            end
        end)
    end

    return Frame
end

return AdminGui
