local NebulaUI = {}

function NebulaUI:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    ScreenGui.Name = "NebulaUI"
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 600, 0, 340)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -170)
    MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    MainFrame.BorderSizePixel = 0

    local UICorner = Instance.new("UICorner", MainFrame)
    UICorner.CornerRadius = UDim.new(0, 6)

    local UIScale = Instance.new("UIScale", MainFrame)
    UIScale.Scale = 0.9

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.BackgroundTransparency = 1
    Title.Text = title or "nebluatech"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.Position = UDim2.new(0, 10, 0, 5)

    local TabHolder = Instance.new("Frame", MainFrame)
    TabHolder.Name = "TabHolder"
    TabHolder.Size = UDim2.new(1, 0, 0, 30)
    TabHolder.Position = UDim2.new(0, 0, 0, 40)
    TabHolder.BackgroundTransparency = 1

    local Tabs = {}

    function Tabs:CreateTab(name)
        local tabButton = Instance.new("TextButton", TabHolder)
        tabButton.Size = UDim2.new(0, 90, 1, 0)
        tabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.Text = name
        tabButton.Font = Enum.Font.GothamSemibold
        tabButton.TextSize = 13
        tabButton.AutoButtonColor = false
        tabButton.BorderSizePixel = 0

        local tabContent = Instance.new("Frame", MainFrame)
        tabContent.Name = name .. "Tab"
        tabContent.Size = UDim2.new(1, -20, 1, -80)
        tabContent.Position = UDim2.new(0, 10, 0, 70)
        tabContent.BackgroundTransparency = 1
        tabContent.Visible = false

        tabButton.MouseButton1Click:Connect(function()
            for _, child in pairs(MainFrame:GetChildren()) do
                if child:IsA("Frame") and child.Name:match("Tab$") then
                    child.Visible = false
                end
            end
            tabContent.Visible = true
        end)

        local function CreateSection(side)
            local section = Instance.new("Frame", tabContent)
            section.Size = UDim2.new(0.48, 0, 1, 0)
            section.Position = side == "Left" and UDim2.new(0, 0, 0, 0) or UDim2.new(0.52, 0, 0, 0)
            section.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
            section.BorderSizePixel = 0

            local list = Instance.new("UIListLayout", section)
            list.Padding = UDim.new(0, 5)
            list.SortOrder = Enum.SortOrder.LayoutOrder

            return {
                AddToggle = function(self, text, default, callback)
                    local toggle = Instance.new("TextButton", section)
                    toggle.Size = UDim2.new(1, -10, 0, 30)
                    toggle.Text = text
                    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
                    toggle.Font = Enum.Font.Gotham
                    toggle.TextSize = 13
                    toggle.BorderSizePixel = 0
                    toggle.AutoButtonColor = false

                    local state = default
                    toggle.MouseButton1Click:Connect(function()
                        state = not state
                        callback(state)
                        toggle.BackgroundColor3 = state and Color3.fromRGB(130, 85, 255) or Color3.fromRGB(30, 30, 36)
                    end)
                end,
                AddDropdown = function(self, text, options, callback)
                    local dropdown = Instance.new("TextButton", section)
                    dropdown.Size = UDim2.new(1, -10, 0, 30)
                    dropdown.Text = text .. " ▼"
                    dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
                    dropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
                    dropdown.Font = Enum.Font.Gotham
                    dropdown.TextSize = 13
                    dropdown.BorderSizePixel = 0

                    dropdown.MouseButton1Click:Connect(function()
                        local choice = options[math.random(1, #options)]
                        dropdown.Text = text .. ": " .. choice
                        callback(choice)
                    end)
                end
            }
        end

        return {
            AddLeftSection = function(_, title)
                return CreateSection("Left")
            end,
            AddRightSection = function(_, title)
                return CreateSection("Right")
            end
        }
    end

    return Tabs
end

return NebulaUI
