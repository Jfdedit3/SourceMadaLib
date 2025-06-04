
local AdminGui = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function AdminGui:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AdminGui"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game.CoreGui

    local Frame = Instance.new("Frame")
    Frame.Name = "AddWindow"
    Frame.BackgroundColor3 = Color3.fromRGB(18, 12, 22)
    Frame.Size = UDim2.new(0.202, 275, 0.202, 290)
    Frame.Position = UDim2.new(0.2, 0, 0, 0)
    Frame.Active = true
    Frame.Draggable = true
    Frame.BackgroundTransparency = 1
    Frame.Parent = ScreenGui

    -- Open animation
    Frame:TweenPosition(UDim2.new(0.2, 0, 0.1, 0), "Out", "Back", 0.4, true)
    Frame:TweenSize(UDim2.new(0.202, 275, 0.202, 290), "Out", "Quad", 0.4, true)
    wait(0.4)
    Frame.BackgroundTransparency = 0

    local function CreateLabel(name, text, posY)
        local label = Instance.new("TextLabel")
        label.Name = name
        label.Text = text
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextStrokeColor3 = Color3.fromRGB(127,127,127)
        label.TextStrokeTransparency = 0
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 18
        label.BackgroundTransparency = 1
        label.BackgroundColor3 = Color3.fromRGB(162,162,162)
        label.Size = UDim2.new(0, 190, 0, 29)
        label.Position = UDim2.new(0, 3, 0, posY)
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = Frame
        return label
    end

    local function CreateScrollingFrame(name, pos, size)
        local sf = Instance.new("ScrollingFrame")
        sf.Name = name
        sf.Position = pos
        sf.Size = size
        sf.BackgroundColor3 = Color3.fromRGB(18,12,22)
        sf.ScrollBarThickness = 0
        sf.CanvasSize = UDim2.new(0,0,5,0)
        sf.BorderSizePixel = 0

        local corner = Instance.new("UICorner", sf)
        local stroke = Instance.new("UIStroke", sf)
        stroke.Color = Color3.fromRGB(54,46,62)

        local layout = Instance.new("UIListLayout", sf)
        layout.FillDirection = Enum.FillDirection.Horizontal
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
        layout.SortOrder = Enum.SortOrder.LayoutOrder

        return sf
    end

    local ProfileImage = Instance.new("ImageLabel")
    ProfileImage.Name = "ProfileImage"
    ProfileImage.Size = UDim2.new(0, 50, 0, 50)
    ProfileImage.Position = UDim2.new(0, 3, 0, 30)
    ProfileImage.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ProfileImage.Image = ""
    Instance.new("UICorner", ProfileImage)
    ProfileImage.Parent = Frame

    local UsernameLabel = CreateLabel("UsernameLabel", "Username", 40)
    local HealthLabel = CreateLabel("HealthLabel", "Health: 100", 80)
    local DistanceLabel = CreateLabel("DistanceLabel", "Distance: 0", 101)
    local SpeedLabel = CreateLabel("SpeedLabel", "WalkSpeed: 0", 121)
    local JumpLabel = CreateLabel("JumpLabel", "JumpPower: 0", 138)

    local line1 = Instance.new("Frame")
    line1.Name = "TitleLine"
    line1.BackgroundColor3 = Color3.fromRGB(54, 46, 63)
    line1.Size = UDim2.new(1, 0, 0, 1)
    line1.Position = UDim2.new(0, 0, 0, 30)
    line1.BorderSizePixel = 0
    line1.Parent = Frame

    local line2 = Instance.new("Frame")
    line2.Name = "Line"
    line2.BackgroundColor3 = Color3.fromRGB(54, 46, 62)
    line2.Size = UDim2.new(1, 0, 0, 1)
    line2.Position = UDim2.new(0, 0, 0, 190)
    line2.BorderSizePixel = 0
    line2.Parent = Frame

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Text = title or "Admin Panel"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextStrokeColor3 = Color3.fromRGB(127,127,127)
    Title.TextStrokeTransparency = 0
    Title.TextSize = 28
    Title.TextScaled = true
    Title.Font = Enum.Font.SourceSansBold
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, -60, 0, 29)
    Title.Position = UDim2.new(0, 19, 0, 0)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Frame

    local UsernameSelection = CreateScrollingFrame("UsernameSelection", UDim2.new(0.2, 149, 0, 29), UDim2.new(0.1, 156, 0, 157))
    UsernameSelection.Parent = Frame

    local Container = CreateScrollingFrame("Container", UDim2.new(0, 3, 0, 192), UDim2.new(0.1, 394, 0, 184))
    Container.Parent = Frame

    local selectedPlayer

    local function refreshPlayers()
        UsernameSelection:ClearAllChildren()
        for _, p in ipairs(Players:GetPlayers()) do
            local b = Instance.new("TextButton")
            b.Name = "UsernameButton"
            b.Text = p.Name
            b.Size = UDim2.new(0, 180, 0, 29)
            b.BackgroundColor3 = Color3.fromRGB(46, 39, 57)
            b.TextColor3 = Color3.new(1, 1, 1)
            b.TextStrokeColor3 = Color3.fromRGB(127,127,127)
            b.TextStrokeTransparency = 0
            b.Font = Enum.Font.SourceSansBold
            b.TextSize = 18
            b.Parent = UsernameSelection
            Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(function()
                selectedPlayer = p
                UsernameLabel.Text = p.Name
                ProfileImage.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                local char = p.Character
                if char and char:FindFirstChild("Humanoid") then
                    local humanoid = char:FindFirstChild("Humanoid")
                    HealthLabel.Text = "Health: " .. math.floor(humanoid.Health)
                    DistanceLabel.Text = "Distance: " .. math.floor((char:GetPivot().Position - LocalPlayer.Character:GetPivot().Position).Magnitude)
                    if humanoid:FindFirstChildOfClass("Humanoid") then
                        SpeedLabel.Text = "WalkSpeed: " .. humanoid.WalkSpeed
                        JumpLabel.Text = "JumpPower: " .. humanoid.JumpPower
                    end
                end
            end)
        end
    end

    refreshPlayers()
    Players.PlayerAdded:Connect(refreshPlayers)
    Players.PlayerRemoving:Connect(refreshPlayers)

    function AdminGui:AddButton(label, callback)
        local button = Instance.new("TextButton")
        button.Name = "AddButton"
        button.Text = label
        button.Size = UDim2.new(0, 143, 0, 34)
        button.BackgroundColor3 = Color3.fromRGB(38, 31, 50)
        button.TextColor3 = Color3.new(1, 1, 1)
        button.TextStrokeColor3 = Color3.fromRGB(127,127,127)
        button.TextStrokeTransparency = 0
        button.TextSize = 18
        button.Font = Enum.Font.SourceSansBold
        button.TextWrapped = true
        Instance.new("UICorner", button)
        button.Parent = Container
        button.MouseButton1Click:Connect(function()
            if selectedPlayer and callback then
                callback(selectedPlayer)
            end
        end)
    end

    return self
end

return AdminGui
