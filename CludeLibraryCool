local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local AdminUI = {}

-- Create main GUI container
local gui = Instance.new("ScreenGui")
gui.Name = "AdminGui"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.Size = UDim2.new(0, 600, 0, 380)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -190)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.Parent = mainFrame

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Text = "Admin Panel"
titleLabel.Font = Enum.Font.FredokaOne
titleLabel.TextSize = 28
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Position = UDim2.new(0.05, 0, 0, 10)
titleLabel.Size = UDim2.new(0.6, 0, 0, 40)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = mainFrame

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.FredokaOne
closeBtn.TextSize = 28
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BackgroundTransparency = 1
closeBtn.Position = UDim2.new(1, -50, 0, 10)
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.AnchorPoint = Vector2.new(0, 0)
closeBtn.Parent = mainFrame

closeBtn.MouseButton1Click:Connect(function()
    gui.Enabled = false
end)

-- Left Panel: Player Selection
local playerPanel = Instance.new("Frame")
playerPanel.Name = "PlayerPanel"
playerPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
playerPanel.Position = UDim2.new(0, 10, 0, 60)
playerPanel.Size = UDim2.new(0, 280, 0, 310)
playerPanel.Parent = mainFrame

local playerPanelCorner = Instance.new("UICorner")
playerPanelCorner.Parent = playerPanel

local playerList = Instance.new("ScrollingFrame")
playerList.Name = "PlayerList"
playerList.BackgroundTransparency = 1
playerList.Size = UDim2.new(1, -10, 1, -10)
playerList.Position = UDim2.new(0, 5, 0, 5)
playerList.CanvasSize = UDim2.new(0, 0, 0, 0)
playerList.ScrollBarThickness = 6
playerList.Parent = playerPanel

local playerListLayout = Instance.new("UIListLayout")
playerListLayout.Parent = playerList
playerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
playerListLayout.Padding = UDim.new(0, 5)

-- Right Panel: Selected Player Info + Actions
local infoPanel = Instance.new("Frame")
infoPanel.Name = "InfoPanel"
infoPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
infoPanel.Position = UDim2.new(0, 310, 0, 60)
infoPanel.Size = UDim2.new(0, 280, 0, 310)
infoPanel.Parent = mainFrame

local infoPanelCorner = Instance.new("UICorner")
infoPanelCorner.Parent = infoPanel

-- Player Avatar
local avatarImg = Instance.new("ImageLabel")
avatarImg.Name = "Avatar"
avatarImg.Size = UDim2.new(0, 100, 0, 100)
avatarImg.Position = UDim2.new(0.5, -50, 0, 10)
avatarImg.BackgroundTransparency = 1
avatarImg.Parent = infoPanel

local avatarCorner = Instance.new("UICorner")
avatarCorner.CornerRadius = UDim.new(1, 0)
avatarCorner.Parent = avatarImg

-- Player Name Label
local playerNameLabel = Instance.new("TextLabel")
playerNameLabel.Name = "PlayerName"
playerNameLabel.Text = "Select a player"
playerNameLabel.Font = Enum.Font.FredokaOne
playerNameLabel.TextSize = 24
playerNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
playerNameLabel.BackgroundTransparency = 1
playerNameLabel.Position = UDim2.new(0, 0, 0, 120)
playerNameLabel.Size = UDim2.new(1, 0, 0, 30)
playerNameLabel.TextScaled = true
playerNameLabel.Parent = infoPanel

-- Player Health Label
local healthLabel = Instance.new("TextLabel")
healthLabel.Name = "HealthLabel"
healthLabel.Text = "Health: N/A"
healthLabel.Font = Enum.Font.FredokaOne
healthLabel.TextSize = 22
healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
healthLabel.BackgroundTransparency = 1
healthLabel.Position = UDim2.new(0, 0, 0, 160)
healthLabel.Size = UDim2.new(1, 0, 0, 30)
healthLabel.TextScaled = true
healthLabel.Parent = infoPanel

-- Actions Container
local actionsContainer = Instance.new("Frame")
actionsContainer.Name = "ActionsContainer"
actionsContainer.BackgroundTransparency = 1
actionsContainer.Position = UDim2.new(0, 10, 0, 200)
actionsContainer.Size = UDim2.new(1, -20, 0, 100)
actionsContainer.Parent = infoPanel

local actionsLayout = Instance.new("UIListLayout")
actionsLayout.Parent = actionsContainer
actionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
actionsLayout.Padding = UDim.new(0, 8)

-- Internal variables
local selectedPlayer = nil
local playerButtons = {}

-- Update Selected Player Info
local function UpdateSelectedPlayer(player)
    selectedPlayer = player
    if player then
        playerNameLabel.Text = player.Name
        -- Use Roblox thumbnail API
        local thumbId, isReady = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
        avatarImg.Image = thumbId

        -- Update health if character and humanoid exists
        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            healthLabel.Text = "Health: " .. math.floor(humanoid.Health)
            -- Update health dynamically
            local conn
            conn = humanoid.HealthChanged:Connect(function(hp)
                healthLabel.Text = "Health: " .. math.floor(hp)
                if humanoid.Health <= 0 then
                    healthLabel.Text = "Health: DEAD"
                    if conn then
                        conn:Disconnect()
                    end
                end
            end)
        else
            healthLabel.Text = "Health: N/A"
        end
    else
        playerNameLabel.Text = "Select a player"
        avatarImg.Image = ""
        healthLabel.Text = "Health: N/A"
    end
end

-- Create Player Button
local function CreatePlayerButton(player)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.FredokaOne
    btn.TextSize = 20
    btn.Text = player.Name
    btn.AutoButtonColor = true
    btn.Parent = playerList

    local btnCorner = Instance.new("UICorner")
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        UpdateSelectedPlayer(player)
        -- Highlight selected button
        for _, b in pairs(playerButtons) do
            b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
        btn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    end)

    return btn
end

-- Add all current players
for _, p in pairs(Players:GetPlayers()) do
    playerButtons[p] = CreatePlayerButton(p)
end

-- Listen for new players
Players.PlayerAdded:Connect(function(player)
    playerButtons[player] = CreatePlayerButton(player)
    playerList.CanvasSize = UDim2.new(0, 0, 0, playerListLayout.AbsoluteContentSize.Y + 10)
end)

-- Remove buttons for leaving players
Players.PlayerRemoving:Connect(function(player)
    if playerButtons[player] then
        playerButtons[player]:Destroy()
        playerButtons[player] = nil
        if selectedPlayer == player then
            UpdateSelectedPlayer(nil)
        end
        playerList.CanvasSize = UDim2.new(0, 0, 0, playerListLayout.AbsoluteContentSize.Y + 10)
    end
end)

-- Update canvas size when layout changes
playerListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    playerList.CanvasSize = UDim2.new(0, 0, 0, playerListLayout.AbsoluteContentSize.Y + 10)
end)

-- Actions Buttons list
local actionButtons = {}

-- API to add action buttons
function AdminUI.AddActionButton(name, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.FredokaOne
    btn.TextSize = 20
    btn.Text = name
    btn.AutoButtonColor = true
    btn.Parent = actionsContainer

    local btnCorner = Instance.new("UICorner")
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        if selectedPlayer then
            callback(selectedPlayer)
        else
            warn("No player selected!")
        end
    end)

    table.insert(actionButtons, btn)
    return btn
end

-- Show the GUI
function AdminUI.Show()
    gui.Enabled = true
end

-- Hide the GUI
function AdminUI.Hide()
    gui.Enabled = false
end

-- Initialize hidden
gui.Enabled = true

return AdminUI
