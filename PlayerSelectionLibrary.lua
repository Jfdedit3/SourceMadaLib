local Players = game:GetService("Players")

local AdminGui = {}
local selectedPlayer = nil

function AdminGui:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AdminGui"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local Frame = Instance.new("Frame")
    Frame.Name = "AddWindow"
    Frame.BackgroundColor3 = Color3.fromRGB(26, 18, 30)
    Frame.Size = UDim2.new(0.20200000703334808, 275, 0.20200000703334808, 290)
    Frame.Position = UDim2.new(0.20000000298023224, 0, 0, 0)
    Frame.Parent = ScreenGui

    local UICorner1 = Instance.new("UICorner")
    UICorner1.Parent = Frame

    local ProfileImage = Instance.new("ImageLabel")
    ProfileImage.Name = "ProfileImage"
    ProfileImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ProfileImage.Size = UDim2.new(0, 50, 0, 50)
    ProfileImage.Position = UDim2.new(0, 3, 0, 30)
    ProfileImage.Image = ""
    ProfileImage.Parent = Frame

    local UICornerPI = Instance.new("UICorner")
    UICornerPI.Parent = ProfileImage

    local TitleLine = Instance.new("Frame")
    TitleLine.Name = "TitleLine"
    TitleLine.BackgroundColor3 = Color3.fromRGB(54, 46, 63)
    TitleLine.Size = UDim2.new(1, 0, 0, 1)
    TitleLine.Position = UDim2.new(0, 0, 0, 30)
    TitleLine.BorderSizePixel = 0
    TitleLine.Parent = Frame

    local function createLabel(name, text, y)
        local label = Instance.new("TextLabel")
        label.Name = name
        label.Text = text
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextStrokeColor3 = Color3.fromRGB(127, 127, 127)
        label.TextStrokeTransparency = 0
        label.TextSize = 18
        label.Font = Enum.Font.SourceSansBold
        label.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(0, 120, 0, 29)
        label.Position = UDim2.new(0, 3, 0, y)
        label.TextWrapped = true
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = Frame
        return label
    end

    local DistanceLabel = createLabel("DistanceLabel", "Distance:", 101)
    local SpeedLabel = createLabel("SpeedLabel", "WalkSpeed:", 121)
    local JumpLabel = createLabel("JumpLabel", "JumpPower:", 138)
    local HealthLabel = createLabel("HealthLabel", "Health: 100", 80)

    local Line = Instance.new("Frame")
    Line.Name = "Line"
    Line.BackgroundColor3 = Color3.fromRGB(54, 46, 62)
    Line.Size = UDim2.new(1, 0, 0, 1)
    Line.Position = UDim2.new(0, 0, 0, 190)
    Line.BorderSizePixel = 0
    Line.Parent = Frame

    local UsernameLabel = Instance.new("TextLabel")
    UsernameLabel.Name = "UsernameLabel"
    UsernameLabel.Text = "Username"
    UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    UsernameLabel.TextStrokeColor3 = Color3.fromRGB(127, 127, 127)
    UsernameLabel.TextStrokeTransparency = 0
    UsernameLabel.TextSize = 18
    UsernameLabel.Font = Enum.Font.SourceSansBold
    UsernameLabel.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    UsernameLabel.BackgroundTransparency = 1
    UsernameLabel.Size = UDim2.new(0, 220, 0, 29)
    UsernameLabel.Position = UDim2.new(0, 67, 0, 40)
    UsernameLabel.TextWrapped = true
    UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    UsernameLabel.Parent = Frame

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Text = title or "Title"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextStrokeColor3 = Color3.fromRGB(127, 127, 127)
    Title.TextStrokeTransparency = 0
    Title.TextSize = 28
    Title.TextScaled = true
    Title.Font = Enum.Font.SourceSansBold
    Title.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, -60, 0, 29)
    Title.Position = UDim2.new(0, 19, 0, 0)
    Title.BorderSizePixel = 0
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Frame

    local UsernameSelection = Instance.new("ScrollingFrame")
    UsernameSelection.Name = "UsernameSelection"
    UsernameSelection.BackgroundColor3 = Color3.fromRGB(25, 17, 29)
    UsernameSelection.Size = UDim2.new(0.10000000149011612, 156, 0, 157)
    UsernameSelection.Position = UDim2.new(0.20000000298023224, 149, 0, 29)
    UsernameSelection.BorderSizePixel = 0
    UsernameSelection.ScrollBarThickness = 0
    UsernameSelection.Parent = Frame

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(54, 46, 62)
    UIStroke.Thickness = 1
    UIStroke.Parent = UsernameSelection

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = UsernameSelection

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.FillDirection = Enum.FillDirection.Vertical
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 2)
    UIListLayout.Parent = UsernameSelection

    for _, player in ipairs(Players:GetPlayers()) do
        local button = Instance.new("TextButton")
        button.Name = "UsernameButton"
        button.Text = player.Name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 18
        button.Font = Enum.Font.SourceSansBold
        button.BackgroundColor3 = Color3.fromRGB(46, 39, 57)
        button.Size = UDim2.new(1, -4, 0, 29)
        button.BorderSizePixel = 0
        button.Parent = UsernameSelection

        local buttonCorner = Instance.new("UICorner")
        buttonCorner.Parent = button

        button.MouseButton1Click:Connect(function()
            selectedPlayer = player
            UsernameLabel.Text = player.Name
            ProfileImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local root = character:FindFirstChild("HumanoidRootPart")
                if humanoid and root then
                    HealthLabel.Text = "Health: " .. math.floor(humanoid.Health)
                    SpeedLabel.Text = "WalkSpeed: " .. humanoid.WalkSpeed
                    JumpLabel.Text = "JumpPower: " .. humanoid.JumpPower
                    DistanceLabel.Text = "Distance: " .. math.floor((root.Position - game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude)
                end
            end
        end)
    end

    local Container = Instance.new("ScrollingFrame")
    Container.Name = "Container"
    Container.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
    Container.BackgroundTransparency = 1
    Container.Size = UDim2.new(0.10000000149011612, 394, 0, 184)
    Container.Position = UDim2.new(0, 3, 0, 192)
    Container.ScrollBarThickness = 0
    Container.Parent = Frame

    local UIListLayout2 = Instance.new("UIListLayout")
    UIListLayout2.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout2.Parent = Container

    Frame:SetAttribute("Container", Container)

    return Frame
end

function AdminGui:AddButton(frame, text, callback)
    local container = frame:GetAttribute("Container")
    if not container then return end

    local button = Instance.new("TextButton")
    button.Name = "AddButton"
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 18
    button.Font = Enum.Font.SourceSansBold
    button.BackgroundColor3 = Color3.fromRGB(38, 31, 50)
    button.Size = UDim2.new(0, 143, 0, 34)
    button.TextWrapped = true
    button.Parent = container

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.Parent = button

    button.MouseButton1Click:Connect(function()
        if selectedPlayer then
            callback(selectedPlayer)
        end
    end)
end

return AdminGui
