local Players = game:GetService("Players")

local UILibrary = {}
UILibrary.__index = UILibrary

function UILibrary.new()
    local self = setmetatable({}, UILibrary)

    -- Create ScreenGui
    local gui = Instance.new("ScreenGui")
    gui.Name = "AdminGui"
    gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- MainFrame
    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Name = "MainFrame"
    mainFrame.AnchorPoint = Vector2.new(0, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    mainFrame.BackgroundTransparency = 0
    mainFrame.BorderSizePixel = 0
    mainFrame.Size = UDim2.new(0, 340, 0, 300)
    mainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    mainFrame.ClipsDescendants = false

    local mainCorner = Instance.new("UICorner", mainFrame)
    mainCorner.Name = "UICorner"

    -- Title Label
    local titleLabel = Instance.new("TextLabel", mainFrame)
    titleLabel.Name = "TitleLabel"
    titleLabel.Text = "Admin Panel"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 28
    titleLabel.Font = Enum.Font.FredokaOne
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.Size = UDim2.new(0, 200, 0, 40)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Close Button
    local closeBtn = Instance.new("TextButton", mainFrame)
    closeBtn.Name = "CloseButton"
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.FredokaOne
    closeBtn.TextScaled = true
    closeBtn.BackgroundTransparency = 1
    closeBtn.Position = UDim2.new(1, -40, 0, 5)
    closeBtn.Size = UDim2.new(0, 35, 0, 35)
    closeBtn.MouseButton1Click:Connect(function()
        gui.Enabled = false
    end)

    -- Avatar Image
    local avatarImg = Instance.new("ImageLabel", mainFrame)
    avatarImg.Name = "AvatarImage"
    avatarImg.Size = UDim2.new(0, 80, 0, 80)
    avatarImg.Position = UDim2.new(0, 10, 0, 50)
    avatarImg.BackgroundTransparency = 1
    avatarImg.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    local avatarCorner = Instance.new("UICorner", avatarImg)
    avatarCorner.CornerRadius = UDim.new(1, 0)

    -- Health Label
    local healthLabel = Instance.new("TextLabel", mainFrame)
    healthLabel.Name = "HealthLabel"
    healthLabel.Text = "Health: N/A"
    healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    healthLabel.Font = Enum.Font.FredokaOne
    healthLabel.TextSize = 24
    healthLabel.BackgroundTransparency = 1
    healthLabel.Position = UDim2.new(0, 100, 0, 70)
    healthLabel.Size = UDim2.new(0, 200, 0, 40)
    healthLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Player Selection Container
    local playerSelectionFrame = Instance.new("ScrollingFrame", mainFrame)
    playerSelectionFrame.Name = "PlayerSelection"
    playerSelectionFrame.Size = UDim2.new(1, -20, 0, 120)
    playerSelectionFrame.Position = UDim2.new(0, 10, 0, 140)
    playerSelectionFrame.BackgroundTransparency = 1
    playerSelectionFrame.BorderSizePixel = 0
    playerSelectionFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    playerSelectionFrame.ScrollBarThickness = 5

    local playerListLayout = Instance.new("UIListLayout", playerSelectionFrame)
    playerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    playerListLayout.Padding = UDim.new(0, 5)

    -- Action Buttons Container
    local actionButtonsFrame = Instance.new("Frame", mainFrame)
    actionButtonsFrame.Name = "ActionButtons"
    actionButtonsFrame.Size = UDim2.new(1, -20, 0, 50)
    actionButtonsFrame.Position = UDim2.new(0, 10, 1, -60)
    actionButtonsFrame.BackgroundTransparency = 1

    local actionListLayout = Instance.new("UIListLayout", actionButtonsFrame)
    actionListLayout.FillDirection = Enum.FillDirection.Horizontal
    actionListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    actionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    actionListLayout.Padding = UDim.new(0, 10)

    -- Store references
    self.gui = gui
    self.mainFrame = mainFrame
    self.avatarImg = avatarImg
    self.healthLabel = healthLabel
    self.playerSelectionFrame = playerSelectionFrame
    self.actionButtonsFrame = actionButtonsFrame

    self.selectedPlayer = nil
    self.playerButtons = {}

    -- Update canvas size for player selection frame
    local function updateCanvasSize()
        local totalHeight = 0
        for _, btn in pairs(self.playerButtons) do
            totalHeight = totalHeight + btn.Size.Y.Offset + 5
        end
        self.playerSelectionFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
    end
    self.updateCanvasSize = updateCanvasSize

    -- Function to select a player
    function self:SetSelectedPlayer(player)
        if typeof(player) == "Instance" and player:IsA("Player") then
            self.selectedPlayer = player
            self.avatarImg.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size80x80)
            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                self.healthLabel.Text = "Health: " .. math.floor(humanoid.Health)
            else
                self.healthLabel.Text = "Health: N/A"
            end
            -- Update buttons' selected state
            for _, btn in pairs(self.playerButtons) do
                btn.BackgroundColor3 = (btn.player == player) and Color3.fromRGB(80, 80, 80) or Color3.fromRGB(21, 21, 21)
            end
        else
            self.selectedPlayer = nil
            self.avatarImg.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
            self.healthLabel.Text = "Health: N/A"
            for _, btn in pairs(self.playerButtons) do
                btn.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
            end
        end
    end

    -- Connect health updates for selected player
    local function onHealthChanged()
        if self.selectedPlayer then
            local char = self.selectedPlayer.Character
            if char then
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    self.healthLabel.Text = "Health: " .. math.floor(humanoid.Health)
                end
            end
        end
    end
    self.onHealthChanged = onHealthChanged

    return self
end

-- Adds a player button for selection
function UILibrary:AddPlayerButton(player)
    local btn = Instance.new("TextButton")
    btn.Name = "PlayerButton"
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.FredokaOne
    btn.TextSize = 24
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = player.Name
    btn.LayoutOrder = #self.playerButtons + 1
    btn.Parent = self.playerSelectionFrame
    btn.player = player

    btn.MouseButton1Click:Connect(function()
        self:SetSelectedPlayer(player)
    end)

    table.insert(self.playerButtons, btn)
    self:updateCanvasSize()
end

-- Adds an action button (e.g., Kill) that acts on selected player
function UILibrary:AddActionButton(name, callback)
    local btn = Instance.new("TextButton")
    btn.Name = name .. "Button"
    btn.Size = UDim2.new(0, 100, 1, 0)
    btn.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.FredokaOne
    btn.TextSize = 24
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name
    btn.Parent = self.actionButtonsFrame

    btn.MouseButton1Click:Connect(function()
        if self.selectedPlayer then
            callback(self.selectedPlayer)
        else
            warn("No player selected!")
        end
    end)
end

return UILibrary
