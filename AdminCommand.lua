
print("Credit:")
print("Scripter - CludeHub")
print("Library - paulparasplaythis")
local CommandUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/main/CludeLibraryCool"))()
CommandUI:Create()

-- Alocaldd command descriptions
CommandUI:AddList("dex - Opens Dex explorer")
CommandUI:AddList("dex explorer - Launches Dex tool with explorer view")
CommandUI:AddList("explorer - Opens game instance explorer")
CommandUI:AddList("rejoin - Rejoins the current server")
CommandUI:AddList("animlogger - Logs all animations played")
CommandUI:AddList("walkspeed <speed> - Changes your walking speed")
CommandUI:AddList("jumppower <power> - Sets your jump height")
CommandUI:AddList("noclip - Walk through walls")
CommandUI:AddList("clip - Re-enable collisions")
CommandUI:AddList("unnoclip - Disable noclip mode")
CommandUI:AddList("view <player> - Spectate a player")
CommandUI:AddList("unview - Stop spectating")
CommandUI:AddList("goto <player> - Teleport to a player")
CommandUI:AddList("fireclickdetectors - Trigger nearby ClickDetectors")
CommandUI:AddList("proximityprompt - Auto-trigger ProximityPrompts")
CommandUI:AddList("deletegui - Removes custom UI elements")
CommandUI:AddList("fly - Enables flying")
CommandUI:AddList("invisible - Makes your character invisible")
CommandUI:AddList("Visible - Makes your character visible again")
CommandUI:AddList("freeze <player> - Freezes a player in place")
CommandUI:AddList("unfreeze <player> - Unfreezes a player")
CommandUI:AddList("esp - Enable ESP to see players through walls")
CommandUI:AddList("noesp - Disable ESP")
CommandUI:AddList("unesp - Also disables ESP")
CommandUI:AddList("antilag - Reduces lag by removing effects")
CommandUI:AddList("boostfps - Increases FPS by optimizing performance")
CommandUI:AddList("nolag - Another lag reduction command")
CommandUI:AddList("headsize <size> - Change your head size")
CommandUI:AddList("kick <player> - Kick a player from the game")
CommandUI:AddList("shutdown - Shuts down the server")
CommandUI:AddList("fog end <value> - Sets fog end distance")
CommandUI:AddList("avatarcolor <r,g,b> - Sets your avatar's color")
CommandUI:AddList("brightness <value> - Sets game brightness")
CommandUI:AddList("fogcolor <r,g,b> - Sets fog color")
CommandUI:AddList("kill <player> - Kills a player")
CommandUI:AddList("day - Sets time to day")
CommandUI:AddList("night - Sets time to night")
CommandUI:AddList("fog start <value> - Sets fog start distance")
CommandUI:AddList("tp <player> - Teleport to a player")
CommandUI:AddList("antiafk - Prevents AFK kick")
CommandUI:AddList("btools - Gives building tools")
CommandUI:AddList("f3x - Gives F3X tools")
CommandUI:AddList("spin <speed> - Spin at a set speed")
CommandUI:AddList("unspin - Stop spinning")
CommandUI:AddList("music <id> - Play music by ID")
CommandUI:AddList("song <id> - Play song by ID")
CommandUI:AddList("stopmusic - Stop music")
CommandUI:AddList("stopsong - Stop song")
CommandUI:AddList("sit - Sit down")
CommandUI:AddList("serverhop - Join a different server")
CommandUI:AddList("headsit <player> - Sit on a player's head")
CommandUI:AddList("bang <player> <speed> - Bang a player with force")
CommandUI:AddList("unbang - Stop bang effect")
CommandUI:AddList("touchfling - Fling players on touch")
CommandUI:AddList("untouchfling - Disable touch fling")
CommandUI:AddList("explode <player> - Explodes a player")
CommandUI:AddList("sword - Gives you a sword")
CommandUI:AddList("clear - Clears command effects")
CommandUI:AddList("telekinesis - Control objects with mind")
CommandUI:AddList("gun - Gives a gun")
CommandUI:AddList("tool <name> - Gives tool by name")
CommandUI:AddList("unswim - Disable swim")
CommandUI:AddList("gravity <number> - Set custom gravity")
CommandUI:AddList("fov <number> - Set camera field of view")
CommandUI:AddList("changename <name> - Change the player nickname")
CommandUI:AddList("antifling - Prevent other players from flinging you")
CommandUI:AddList("unjerk - stop jerk animation")
CommandUI:AddList("jerk - start jerk animation (scripted, no animation ID)")
CommandUI:AddList("walltp <distance> - Teleport through wall forward by distance studs")
CommandUI:AddList("laydown - makes your character lay down (no animation ID)")
CommandUI:AddList("standup - makes your character stand up")
CommandUI:AddList("reset / respawn - Reset your character")
CommandUI:AddList("devtag - Adds [Dev] tag to your name in chat")
CommandUI:AddList("testertag - Adds [Tester] tag to your name in chat")
CommandUI:AddList("cleartag - Removes any tag from your chat name")
CommandUI:AddList("ownertag - Adds [Owner] tag to your name in chat")
CommandUI:AddList("addpart <size> <rgb>")
CommandUI:AddList("Morph <playername> - copy the player avatar")
CommandUI:AddList("teleport <x,y,z>")
CommandUI:AddList("tp <x,y,z>")
CommandUI:AddList("autojump - makes you automatically jump")
CommandUI:AddList("stopautojump")
CommandUI:AddList("rspy - open the remotespy")
CommandUI:AddList("remotespy - you can make your own script")

CommandUI:AddCommand("rspy", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end)

CommandUI:AddCommand("remotespy", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end)

local autoJumping = false
local RunService = game:GetService("RunService")

-- AutoJump Command
CommandUI:AddCommand("autojump", function()
    autoJumping = true
    task.spawn(function()
        while autoJumping and task.wait(0.2) do
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end)

-- StopAutoJump Command
CommandUI:AddCommand("stopautojump", function()
    autoJumping = false
end)

-- Teleport Command (supports both "teleport" and "tp")
local function tpCommand(posStr)
    local coords = string.split(posStr, ",")
    if #coords ~= 3 then return end
    local x = tonumber(coords[1])
    local y = tonumber(coords[2])
    local z = tonumber(coords[3])
    if x and y and z then
        local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = CFrame.new(x, y, z)
        end
    end
end

CommandUI:AddCommand("teleport <x,y,z>", tpCommand)
CommandUI:AddCommand("tp <x,y,z>", tpCommand)
CommandUI:AddCommand("morph <playername>", function(targetName)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")

    -- Find target player
    local targetPlayer = nil
    for _, p in pairs(Players:GetPlayers()) do
        if p.Name:lower():sub(1, #targetName) == targetName:lower() then
            targetPlayer = p
            break
        end
    end
    if not targetPlayer or not targetPlayer.Character then return end

    local desc = targetPlayer.Character:FindFirstChildOfClass("Humanoid"):GetAppliedDescription()
    Humanoid:ApplyDescriptionReset(desc)
end)


CommandUI:AddCommand("addpart <size, size, size> <rgb>", function(sizeStr, colorStr)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    -- Parse size input "x,y,z"
    local size = Vector3.new(unpack(string.split(sizeStr, ",")))

    -- Parse color input "r,g,b"
    local colorVals = string.split(colorStr, ",")
    local color = Color3.fromRGB(tonumber(colorVals[1]), tonumber(colorVals[2]), tonumber(colorVals[3]))

    -- Create part
    local part = Instance.new("Part")
    part.Size = size
    part.Anchored = true
    part.CanCollide = true
    part.Color = color
    part.CFrame = root.CFrame * CFrame.new(0, 0, -5) -- 5 studs in front of player
    part.Parent = workspace
end)

-- Name spoof values
local nameSuffix = ""
local displayNameSuffix = ""

-- Anti-removal self-protection
local function protectScript()
    local player = game.Players.LocalPlayer

    -- Use RunService to keep reapplying spoof
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        if not player then return end
        if not player.Name:find(nameSuffix) then
            player.Name = player.Name .. nameSuffix
        end
        if not player.DisplayName:find(displayNameSuffix) then
            player.DisplayName = player.DisplayName .. displayNameSuffix
        end
    end)
end

-- Run the protection loop outside GUI
local function startProtected()
    -- Place the script in a non-GUI container like CoreGui or nil
    local protectScriptClone = script:Clone()
    protectScriptClone.Parent = game:GetService("CoreGui") or game
    protectScriptClone.Disabled = false
end

-- Initial execution
if not getgenv()._nameSpoofed then
    getgenv()._nameSpoofed = true
    protectScript()
    startProtected()
end


local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local currentTag = nil

-- Function to hook chat message and modify the display
local function onPlayerChatted(message)
    if currentTag then
        local taggedName = string.format("[%s]%s", currentTag, lp.Name)
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = taggedName..": "..message;
            Color = Color3.new(1, 1, 1);
        })
        return true -- block original message if needed
    end
    return false
end

-- Connect to chat hook (if not already hooked)
local chattedHooked = false
if not chattedHooked then
    lp.Chatted:Connect(function(msg)
        local wasHandled = onPlayerChatted(msg)
        -- Optionally prevent original chat message from showing
        -- (exploit-only, some environments may support full chat suppression)
    end)
    chattedHooked = true
end

-- Add commands

CommandUI:AddCommand("ownertag", function()
    currentTag = "Owner"
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Owner tag applied.";
        Color = Color3.new(0, 1, 1);
    })
end)


CommandUI:AddCommand("devtag", function()
    currentTag = "Dev"
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Developer tag applied.";
        Color = Color3.new(0, 1, 0);
    })
end)


CommandUI:AddCommand("testertag", function()
    currentTag = "Tester"
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Tester tag applied.";
        Color = Color3.new(1, 1, 0);
    })
end)


CommandUI:AddCommand("cleartag", function()
    currentTag = nil
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Tag removed.";
        Color = Color3.new(1, 0, 0);
    })
end)




local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local function resetCharacter()
    local character = lp.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0 -- this will reset (respawn) your character
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                Text = "You have been reset.";
                Color = Color3.new(0, 1, 0);
            })
        end
    end
end

CommandUI:AddCommand("reset", resetCharacter)
CommandUI:AddCommand("respawn", resetCharacter)


local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local function layDown()
    local character = lp.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then return end

    humanoid.Sit = true
    wait(0.1)
    -- Rotate HRP to lie down (on back)
    hrp.CFrame = hrp.CFrame * CFrame.Angles(math.rad(90), 0, 0)

    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
        Text = "You are now laying down.";
        Color = Color3.new(0, 1, 1);
    })
end

local function standUp()
    local character = lp.Character
    if not character then return end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then return end

    humanoid.Sit = false
    wait(0.1)
    -- Reset rotation to normal standing
    hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, hrp.CFrame:ToEulerAnglesYXZ())
    
    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
        Text = "You stood up.";
        Color = Color3.new(1, 0, 0);
    })
end

CommandUI:AddCommand("laydown", layDown)

CommandUI:AddCommand("standup", standUp)


local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local RunService = game:GetService("RunService")

CommandUI:AddCommand("walltp", function(distance)
    distance = tonumber(distance) or 10 -- default 10 studs if no arg
    
    local character = lp.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- Calculate new position forward by distance studs
    local lookVector = hrp.CFrame.LookVector
    local newPos = hrp.Position + lookVector * distance
    
    -- Teleport there
    hrp.CFrame = CFrame.new(newPos, newPos + lookVector)
    
    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
        Text = ("WallTP done! Moved forward %d studs"):format(distance);
        Color = Color3.new(0, 1, 1);
    })
end)




local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

local running = false
local connection = nil

-- Get right arm Motor6D
local function getRightArmMotor6D(character)
    if not character then return nil end
    local rightArm = character:FindFirstChild("RightUpperArm") or character:FindFirstChild("Right Arm")
    local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
    if not rightArm or not torso then return nil end

    -- Motor6D connecting torso to right arm
    for _, v in pairs(torso:GetChildren()) do
        if v:IsA("Motor6D") and v.Part1 == rightArm then
            return v
        end
    end
    return nil
end

-- Animate jerk: swing right arm back and forth
local function startJerkAnimation()
    local character = lp.Character
    if not character then return end
    local motor = getRightArmMotor6D(character)
    if not motor then return end

    local angle = 0
    local direction = 1

    running = true
    connection = RunService.Heartbeat:Connect(function(dt)
        if not running then
            connection:Disconnect()
            connection = nil
            -- Reset arm position
            motor.Transform = CFrame.new()
            return
        end

        angle = angle + direction * dt * 10
        if angle > 1 then direction = -1 end
        if angle < -1 then direction = 1 end

        -- Swing arm with a sine wave
        motor.Transform = CFrame.Angles(math.rad(angle * 20), 0, 0)
    end)
end

local function stopJerkAnimation()
    running = false
    if connection then
        connection:Disconnect()
        connection = nil
    end
    -- Reset arm position
    local character = lp.Character
    local motor = getRightArmMotor6D(character)
    if motor then
        motor.Transform = CFrame.new()
    end
end

CommandUI:AddCommand("jerk", function()
    startJerkAnimation()
    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
        Text = "Jerk animation started";
        Color = Color3.new(0, 1, 0);
    })
end)

CommandUI:AddCommand("unjerk", function()
    stopJerkAnimation()
    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
        Text = "Jerk animation stopped";
        Color = Color3.new(1, 0, 0);
    })
end)

CommandUI:AddCommand("antifling", function()
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer
    local character = lp.Character or lp.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")

    -- AntiFling loop: remove any external velocities or forces applied to HumanoidRootPart
    local running = true

    -- Optional: If you want to toggle antifling on/off, you can add a variable
    -- For simplicity, just run antifling once here

    -- Connect to Heartbeat to reset velocity & forces every frame
    local heartbeatConn
    heartbeatConn = game:GetService("RunService").Heartbeat:Connect(function()
        if not running or not hrp.Parent then
            heartbeatConn:Disconnect()
            return
        end

        -- Remove external velocities/forces that might fling you
        hrp.Velocity = Vector3.new(0, 0, 0)
        hrp.RotVelocity = Vector3.new(0, 0, 0)

        -- Destroy any BodyVelocity, BodyForce, BodyAngularVelocity, etc.
        for _, v in pairs(hrp:GetChildren()) do
            if v:IsA("BodyVelocity") or v:IsA("BodyForce") or v:IsA("BodyAngularVelocity") or v:IsA("VectorForce") then
                v:Destroy()
            end
        end
    end)

    -- Confirmation message
    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
        Text = "Antifling enabled";
        Color = Color3.new(0, 1, 0);
    })
end)

-- Add the command implementation
CommandUI:AddCommand("changename <name>", function(name)
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer
    
    if not name or name == "" then
        -- If no name provided, send warning to chat
        game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
            Text = "Usage: changename <name>";
            Color = Color3.new(1, 0, 0);
        })
        return
    end

    -- Create or update a BillboardGui over the player head to show the fake name
    if lp.Character and lp.Character:FindFirstChild("Head") then
        local head = lp.Character.Head

        -- Remove old tag if exists
        local oldTag = head:FindFirstChild("FakeNameTag")
        if oldTag then oldTag:Destroy() end

        -- Create BillboardGui
        local tag = Instance.new("BillboardGui")
        tag.Name = "FakeNameTag"
        tag.Adornee = head
        tag.Size = UDim2.new(0, 200, 0, 50)
        tag.StudsOffset = Vector3.new(0, 2, 0)
        tag.AlwaysOnTop = true
        tag.Parent = head

        -- Create text label for name
        local label = Instance.new("TextLabel")
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, 0, 1, 0)
        label.Text = name
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextStrokeTransparency = 0
        label.Font = Enum.Font.SourceSansBold
        label.TextScaled = true
        label.Parent = tag
    end

    -- Send confirmation to chat
    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
        Text = "Your nickname was changed to: " .. name;
        Color = Color3.new(0, 1, 0);
    })
end)
-- FOV Command
CommandUI:AddCommand("fov", function(args)
    local num = tonumber(args[1])
    if num then
        game.Workspace.CurrentCamera.FieldOfView = num
    else
        warn("Invalid FOV value")
    end
end)

-- Gravity Command
CommandUI:AddCommand("gravity", function(args)
    local num = tonumber(args[1])
    if num then
        game.Workspace.Gravity = num
    else
        warn("Invalid gravity value")
    end
end)

local swimming = false
local swimConnection

CommandUI:AddList("swim")
CommandUI:AddCommand("swim", function()
    if swimming then return end
    swimming = true

    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    -- Set gravity lower for floating feel
    workspace.Gravity = 30

    swimConnection = game:GetService("RunService").RenderStepped:Connect(function()
        if not swimming then return end
        -- Move forward
        local moveDirection = workspace.CurrentCamera.CFrame.lookVector
        hrp.Velocity = moveDirection * 20
    end)
end)

CommandUI:AddCommand("unswim", function()
    swimming = false
    if swimConnection then
        swimConnection:Disconnect()
        swimConnection = nil
    end

    -- Reset gravity
    workspace.Gravity = 196.2

    -- Stop movement
    local player = game.Players.LocalPlayer
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.Velocity = Vector3.zero
    end
end)

CommandUI:AddCommand("tool <name>", function(args)
    local name = args[2]
    if not name then
        rconsolewarn("Usage: tool <name>")
        return
    end

    local tool = game:GetService("ReplicatedStorage"):FindFirstChild(name)
    if tool and tool:IsA("Tool") then
        tool:Clone().Parent = game.Players.LocalPlayer.Backpack
        rconsoleprint("Gave tool: " .. name .. "\n")
    else
        rconsolewarn("Tool not found: " .. name)
    end
end)

CommandUI:AddCommand("gun", function()
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer
    local mouse = lp:GetMouse()

    -- Create tool
    local tool = Instance.new("Tool")
    tool.Name = "Gun"
    tool.RequiresHandle = true
    tool.CanBeDropped = false

    -- Handle
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 1, 2)
    handle.Color = Color3.fromRGB(50, 50, 50)
    handle.Material = Enum.Material.Metal
    handle.CanCollide = false
    handle.Parent = tool

    -- Shooting logic
    local fireScript = Instance.new("LocalScript")
    fireScript.Source = [[
        local tool = script.Parent
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer
        local mouse = lp:GetMouse()

        tool.Activated:Connect(function()
            local rayOrigin = lp.Character and lp.Character:FindFirstChild("Head") and lp.Character.Head.Position or Vector3.new()
            local rayDirection = (mouse.Hit.Position - rayOrigin).Unit * 500

            local raycastParams = RaycastParams.new()
            raycastParams.FilterDescendantsInstances = {lp.Character}
            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

            local result = workspace:Raycast(rayOrigin, rayDirection, raycastParams)

            -- Visual ray (tracer)
            local beam = Instance.new("Part")
            beam.Anchored = true
            beam.CanCollide = false
            beam.Material = Enum.Material.Neon
            beam.BrickColor = BrickColor.new("Bright red")
            beam.Size = Vector3.new(0.2, 0.2, (result and (result.Position - rayOrigin).Magnitude) or 500)
            beam.CFrame = CFrame.new(rayOrigin, mouse.Hit.Position) * CFrame.new(0, 0, -beam.Size.Z/2)
            beam.Parent = workspace
            game:GetService("Debris"):AddItem(beam, 0.1)

            -- Damage if humanoid
            if result and result.Instance and result.Instance.Parent then
                local hum = result.Instance.Parent:FindFirstChild("Humanoid")
                if hum then
                    hum:TakeDamage(25)
                end
            end
        end)
    ]]
    fireScript.Parent = tool

    -- Give tool
    tool.Parent = lp:WaitForChild("Backpack")
end)
















local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local lp = Players.LocalPlayer
local mouse = lp:GetMouse()

local dragging = false
local selectedPart = nil
local offset = Vector3.new()

CommandUI:AddCommand("telekinesis", function()
    print("[Telekinesis] Activated")

    -- When mouse clicks on part
    mouse.Button1Down:Connect(function()
        local target = mouse.Target
        if target and target:IsA("BasePart") and not target.Locked then
            selectedPart = target
            local cam = workspace.CurrentCamera
            offset = cam.CFrame:PointToObjectSpace(target.Position) - cam.CFrame:PointToObjectSpace(mouse.Hit.Position)
            dragging = true
        end
    end)

    -- Stop dragging on release
    mouse.Button1Up:Connect(function()
        dragging = false
        selectedPart = nil
    end)

    -- Move part with mouse each frame
    RunService.RenderStepped:Connect(function()
        if dragging and selectedPart then
            local newPos = mouse.Hit.Position + offset
            selectedPart.Velocity = Vector3.zero
            selectedPart.RotVelocity = Vector3.zero
            selectedPart.CFrame = CFrame.new(newPos)
        end
    end)
end)

-- Wave and Laugh Emotes
local emotes = {
    wave = "rbxassetid://507770239",   -- /e wave
    laugh = "rbxassetid://507770818",  -- /e laugh
}

for cmd, animId in pairs(emotes) do
    CommandUI:AddList(cmd)
    CommandUI:AddCommand(cmd, function()
        local lp = game:GetService("Players").LocalPlayer
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end

        local anim = Instance.new("Animation")
        anim.AnimationId = animId
        local track = hum:LoadAnimation(anim)
        track:Play()
    end)
end

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local animations = {
    dance1 = "rbxassetid://507771019",  -- /e dance
    dance2 = "rbxassetid://507776043",  -- /e dance2
    dance3 = "rbxassetid://507777268",  -- /e dance3
}

local currentDanceTrack

-- Register each dance command
for cmd, animId in pairs(animations) do
    CommandUI:AddList(cmd)
    CommandUI:AddCommand(cmd, function()
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end

        if currentDanceTrack then
            currentDanceTrack:Stop()
            currentDanceTrack:Destroy()
            currentDanceTrack = nil
        end

        local anim = Instance.new("Animation")
        anim.AnimationId = animId
        currentDanceTrack = hum:LoadAnimation(anim)
        currentDanceTrack:Play()
    end)
end

-- /clear chat command

CommandUI:AddCommand("clear", function()
    for _, gui in pairs(lp.PlayerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChildWhichIsA("TextLabel", true) then
            for _, descendant in pairs(gui:GetDescendants()) do
                if descendant:IsA("TextLabel") or descendant:IsA("TextBox") then
                    descendant.Text = ""
                end
            end
        end
    end
end)

CommandUI:AddCommand("sword", function()
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()

    -- Create the Tool
    local tool = Instance.new("Tool")
    tool.Name = "Sword"
    tool.RequiresHandle = true
    tool.CanBeDropped = false

    -- Create the Handle
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 4, 1)
    handle.Color = Color3.fromRGB(100, 100, 100)
    handle.Material = Enum.Material.Metal
    handle.TopSurface = Enum.SurfaceType.Smooth
    handle.BottomSurface = Enum.SurfaceType.Smooth
    handle.CanCollide = false
    handle.Anchored = false
    handle.Parent = tool

    -- Add a basic hit script
    local hitScript = Instance.new("Script")
    hitScript.Source = [[
        script.Parent.Activated:Connect(function()
            local tool = script.Parent
            local handle = tool:FindFirstChild("Handle")
            if not handle then return end

            handle.Touched:Connect(function(hit)
                local hum = hit.Parent:FindFirstChild("Humanoid")
                if hum and hum.Health > 0 then
                    hum:TakeDamage(20)
                end
            end)
        end)
    ]]
    hitScript.Parent = tool

    -- Parent to player Backpack
    tool.Parent = lp:WaitForChild("Backpack")
end)

local Players = game:GetService("Players")
local Debris = game:GetService("Debris")

CommandUI:AddCommand("explode <player>", function(args)
    local targetName = args[1]
    if not targetName then return end

    local target = nil
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #targetName) == targetName:lower() then
            target = plr
            break
        end
    end

    if not target or not target.Character then return end
    local root = target.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    -- Create explosion
    local explosion = Instance.new("Explosion")
    explosion.Position = root.Position
    explosion.BlastRadius = 6
    explosion.BlastPressure = 100000
    explosion.DestroyJointRadiusPercent = 0 -- Don't instantly kill
    explosion.ExplosionType = Enum.ExplosionType.NoCraters
    explosion.Parent = workspace

    -- Optional: Knockback target manually
    root.Velocity = Vector3.new(0, 100, 0) + Vector3.new(math.random(-100,100),0,math.random(-100,100))

    -- Optional: Particle effect
    local burst = Instance.new("ParticleEmitter")
    burst.Texture = "rbxassetid://243660364" -- fireball texture
    burst.Rate = 0
    burst.Speed = NumberRange.new(25)
    burst.Lifetime = NumberRange.new(1)
    burst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 5), NumberSequenceKeypoint.new(1, 0)})
    burst.Rotation = NumberRange.new(0, 360)
    burst.RotSpeed = NumberRange.new(100)
    burst.LightEmission = 1
    burst.EmissionDirection = Enum.NormalId.Top
    burst.ZOffset = 2
    burst.Parent = root
    burst:Emit(50)
    Debris:AddItem(burst, 2)

    -- Optional: Sound
    local boom = Instance.new("Sound")
    boom.SoundId = "rbxassetid://138186576" -- explosion sound
    boom.Volume = 1
    boom.PlayOnRemove = true
    boom.Parent = root
    boom:Destroy()
end)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local flingConnection

CommandUI:AddCommand("touchfling", function()
    local lp = Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    if flingConnection then
        flingConnection:Disconnect()
    end

    flingConnection = RunService.Stepped:Connect(function()
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local targetHRP = plr.Character.HumanoidRootPart
                if (hrp.Position - targetHRP.Position).Magnitude < 5 then
                    targetHRP.Velocity = Vector3.new(9999, 9999, 9999)
                    targetHRP.RotVelocity = Vector3.new(9999, 9999, 9999)
                end
            end
        end
    end)
end)

CommandUI:AddCommand("untouchfling", function()
    if flingConnection then
        flingConnection:Disconnect()
        flingConnection = nil
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local bangTrack = nil
local bangConnection = nil
local currentTarget = nil

local r6Anim = "rbxassetid://148840371"
local r15Anim = "rbxassetid://5918726674"

CommandUI:AddCommand("bang <player> <speed>", function(args)
	local targetName = args[1]
	local speed = tonumber(args[2]) or 1
	local lp = Players.LocalPlayer
	local target = nil

	for _, plr in ipairs(Players:GetPlayers()) do
		if plr.Name:lower():sub(1, #targetName) == targetName:lower() then
			target = plr
			break
		end
	end

	if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then
		warn("Target not found or invalid")
		return
	end

	local char = lp.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end

	-- Stop previous
	if bangTrack then
		bangTrack:Stop()
		bangTrack:Destroy()
	end
	if bangConnection then
		bangConnection:Disconnect()
	end

	-- Play animation
	local anim = Instance.new("Animation")
	anim.AnimationId = lp.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 and r15Anim or r6Anim

	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	bangTrack = humanoid:LoadAnimation(anim)
	bangTrack:Play()
	bangTrack:AdjustSpeed(speed)

	-- Follow behind the target
	bangConnection = RunService.RenderStepped:Connect(function()
		if not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end
		if not char or not char:FindFirstChild("HumanoidRootPart") then return end

		char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.1)
	end)

	currentTarget = target
end)

CommandUI:AddCommand("unbang", function()
	if bangTrack then
		bangTrack:Stop()
		bangTrack:Destroy()
		bangTrack = nil
	end

	if bangConnection then
		bangConnection:Disconnect()
		bangConnection = nil
	end

	currentTarget = nil
end)


local headsitting = false
local conn

CommandUI:AddCommand("headsit <player>", function(playerName)
    local lp = game.Players.LocalPlayer
    local char = lp.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end

    local target = nil
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #playerName) == playerName:lower() then
            target = plr
            break
        end
    end
    if not target or not target.Character then return end

    local head = target.Character:FindFirstChild("Head")
    if not head then return end

    -- Stop existing connection
    if conn then conn:Disconnect() end

    -- Position above head
    task.spawn(function()
        headsitting = true
        hum.Sit = true
        while headsitting and char and head and head.Parent do
            hrp.CFrame = head.CFrame * CFrame.new(0, 1.5, 0)
            task.wait()
        end
    end)

    -- Stop if jump
    conn = hum:GetPropertyChangedSignal("Jump"):Connect(function()
        if hum.Jump then
            headsitting = false
            hum.Sit = false
            conn:Disconnect()
        end
    end)
end)

local sitting = false
local conn

CommandUI:AddCommand("sit", function()
    local char = game.Players.LocalPlayer.Character
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    humanoid.Sit = true
    sitting = true

    -- Listen for jumping to cancel sit
    if conn then conn:Disconnect() end
    conn = humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
        if humanoid.Jump then
            humanoid.Sit = false
            sitting = false
            conn:Disconnect()
        end
    end)
end)
local sound

CommandUI:AddCommand("music <id>", function(id)
    if sound then sound:Destroy() end

    sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. id
    sound.Volume = 3
    sound.Looped = true
    sound.Playing = true
    sound.Parent = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or workspace
end)

CommandUI:AddCommand("song <id>", function(id)
    CommandUI:GetCommand("music <id>")(id)
end)

CommandUI:AddCommand("stopmusic", function()
    if sound then
        sound:Destroy()
        sound = nil
    end
end)

CommandUI:AddCommand("stopsong", function()
    CommandUI:GetCommand("stopmusic")()
end)

local spinning = false
local spinConnection


CommandUI:AddCommand("spin <speed>", function(speed)
    speed = tonumber(speed)
    if not speed then return end
    if spinning then return end -- prevent double spin

    local player = game.Players.LocalPlayer
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    spinning = true
    spinConnection = game:GetService("RunService").RenderStepped:Connect(function()
        if hrp and hrp.Parent then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, speed, 0)
        else
            -- Try to re-acquire HRP if it was lost (e.g., on death)
            hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        end
    end)
end)

CommandUI:AddCommand("unspin", function()
    if spinConnection then
        spinConnection:Disconnect()
        spinConnection = nil
    end
    spinning = false
end)


CommandUI:AddCommand("animlogger", function()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/kBui7A0r"))()
    end)
    if success then
        print("Animation Logger loaded!")
    else
        warn("Failed to load Animation Logger:", err)
    end
end)

CommandUI:AddCommand("rejoin", function()
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)

-- Function to load Dex Explorer
local function loadDex()
    local dexScript = game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua")
    loadstring(dexScript)()
end

-- Add commands that call the function
CommandUI:AddCommand("dex", function()
    loadDex()
end)

CommandUI:AddCommand("dex explorer", function()
    loadDex()
end)

CommandUI:AddCommand("explorer", function()
    loadDex()
end)

local RunService = game:GetService("RunService")
local LocalPlayer = game.Players.LocalPlayer

-- WalkSpeed command
CommandUI:AddCommand("walkspeed <speed>", function(speed)
    local numSpeed = tonumber(speed)
    if numSpeed then
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = numSpeed
            print("[CludeLib] Walkspeed set to:", numSpeed)
        else
            warn("[CludeLib] Humanoid not found.")
        end
    else
        warn("[CludeLib] Invalid speed.")
    end
end)

-- JumpPower command
CommandUI:AddCommand("jumppower <power>", function(power)
    local numPower = tonumber(power)
    if numPower then
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = numPower
            print("[CludeLib] JumpPower set to:", numPower)
        else
            warn("[CludeLib] Humanoid not found.")
        end
    else
        warn("[CludeLib] Invalid power.")
    end
end)

-- Noclip variables
local noclipEnabled = false
local noclipConnection

local function enableNoclip()
    if noclipEnabled then return end
    noclipEnabled = true
    noclipConnection = RunService.Stepped:Connect(function()
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
    print("[CludeLib] Noclip enabled.")
end

local function disableNoclip()
    if not noclipEnabled then return end
    noclipEnabled = false
    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end
    -- Re-enable collisions on character parts
    local char = LocalPlayer.Character
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
    print("[CludeLib] Noclip disabled.")
end

-- Commands for noclip, clip, unnoclip (clip and unnoclip do the same here)
CommandUI:AddCommand("noclip", enableNoclip)
CommandUI:AddCommand("clip", disableNoclip)
CommandUI:AddCommand("unnoclip", disableNoclip)

-- View player (spectate)
CommandUI:AddCommand("view <player>", function(name)
    local target = game.Players:FindFirstChild(name)
    if target and target.Character then
        local humanoid = target.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            workspace.CurrentCamera.CameraSubject = humanoid
            print("[CludeLib] Now viewing:", name)
        else
            warn("[CludeLib] Target humanoid not found.")
        end
    else
        warn("[CludeLib] Player not found:", name)
    end
end)

-- Unview (return camera to yourself)
CommandUI:AddCommand("unview", function()
    local char = LocalPlayer.Character
    if char then
        local humanoid = char:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            workspace.CurrentCamera.CameraSubject = humanoid
            print("[CludeLib] Returned camera to local player.")
        else
            warn("[CludeLib] Your humanoid not found.")
        end
    else
        warn("[CludeLib] Your character not found.")
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- ESP container
local ESPFolder = Instance.new("Folder", game.CoreGui)
ESPFolder.Name = "CustomESP"

local espEnabled = false

-- Function to create ESP for a player
local function createESP(player)
    if player == LocalPlayer then return end
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

    local Billboard = Instance.new("BillboardGui")
    Billboard.Name = "ESP_" .. player.Name
    Billboard.AlwaysOnTop = true
    Billboard.Size = UDim2.new(0, 200, 0, 50)
    Billboard.StudsOffset = Vector3.new(0, 3, 0)
    Billboard.Adornee = player.Character:WaitForChild("HumanoidRootPart")

    local Label = Instance.new("TextLabel", Billboard)
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextStrokeTransparency = 0.5
    Label.TextScaled = true
    Label.Font = Enum.Font.SourceSansBold
    Label.Text = ""

    Billboard.Parent = ESPFolder

    -- Update text
    RunService.RenderStepped:Connect(function()
        if not player or not player.Parent then return end
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        if not player.Character:FindFirstChild("Humanoid") then return end
        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
        Label.Text = string.format("%s | HP: %d | %.0f studs", player.Name, player.Character.Humanoid.Health, distance)
    end)
end

-- Turn on ESP
CommandUI:AddCommand("esp", function()
    if espEnabled then return end
    espEnabled = true
    for _, player in pairs(Players:GetPlayers()) do
        createESP(player)
    end

    -- Add ESP for players who join later
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            wait(1)
            if espEnabled then
                createESP(player)
            end
        end)
    end)
end)

-- Hide ESP
CommandUI:AddCommand("noesp", function()
    for _, v in pairs(ESPFolder:GetChildren()) do
        v.Enabled = false
    end
end)

-- Remove ESP
CommandUI:AddCommand("unesp", function()
    espEnabled = false
    ESPFolder:ClearAllChildren()
end)

-- Add command list


-- Function to reduce lag
local function antiLag()
    -- Remove effects
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
            v:Destroy()
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        elseif v:IsA("Explosion") then
            v.Visible = false
        end
    end

    -- Lower lighting settings
    local Lighting = game:GetService("Lighting")
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e10
    Lighting.Brightness = 0

    -- Simplify terrain
    if workspace:FindFirstChildOfClass("Terrain") then
        workspace.Terrain.WaterWaveSize = 0
        workspace.Terrain.WaterWaveSpeed = 0
        workspace.Terrain.WaterReflectance = 0
        workspace.Terrain.WaterTransparency = 1
    end

    -- Lower material detail
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and part:IsDescendantOf(workspace) then
            part.Material = Enum.Material.Plastic
            part.Reflectance = 0
        end
    end

    -- Remove post effects
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") then
            v.Enabled = false
        end
    end
end

-- Hook all 3 commands to same function
CommandUI:AddCommand("antilag", function()
    antiLag()
end)

CommandUI:AddCommand("boostfps", function()
    antiLag()
end)

CommandUI:AddCommand("nolag", function()
    antiLag()
end)


CommandUI:AddCommand("headsize <size>", function(size)
    local num = tonumber(size)
    if num then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Head") then
            char.Head.Size = Vector3.new(num, num, num)
            print("[CludeLib] Head size set to:", num)
        else
            warn("[CludeLib] Head not found.")
        end
    else
        warn("[CludeLib] Invalid size value.")
    end
end)

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function getServers(cursor)
    local servers = {}
    local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"
    if cursor then
        url = url .. "&cursor=" .. cursor
    end
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)
    if success then
        local data = HttpService:JSONDecode(response)
        for _, server in pairs(data.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                table.insert(servers, server.id)
            end
        end
        return servers, data.nextPageCursor
    else
        return nil, nil
    end
end

local function hop()
    local servers, cursor = getServers()
    if not servers or #servers == 0 then
        print("No available servers found.")
        return
    end
    local chosenServer = servers[math.random(1, #servers)]
    TeleportService:TeleportToPlaceInstance(game.PlaceId, chosenServer, LocalPlayer)
end

CommandUI:AddCommand("serverhop", function()
    hop()
end)


CommandUI:AddCommand("btools", function()
    local plr = game.Players.LocalPlayer
    local backpack = plr:WaitForChild("Backpack")

    -- Clear old tools first
    for _, toolName in pairs({"Delete", "Move", "Resize"}) do
        local oldTool = backpack:FindFirstChild(toolName)
        if oldTool then oldTool:Destroy() end
    end

    -- Give BTools
    local function giveTool(toolName)
        local tool = Instance.new("HopperBin")
        tool.Name = toolName
        tool.BinType = Enum.BinType[toolName]
        tool.Parent = backpack
    end

    giveTool("Delete")
    giveTool("Move")
    giveTool("Resize")
end)



CommandUI:AddCommand("f3x", function()
    local url = "https://raw.githubusercontent.com/CloneTrooper1019/F3X/master/Main.lua"
    local success, scriptCode = pcall(function()
        return game:HttpGet(url)
    end)

    if success then
        loadstring(scriptCode)()
    else
        warn("Failed to load F3X tools")
    end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to set transparency for all character parts
local function setCharacterTransparency(transparency)
    local char = LocalPlayer.Character
    if not char then return end
    for _, part in pairs(char:GetChildren()) do
        if part:IsA("BasePart") or part:IsA("Decal") then
            part.Transparency = transparency
            -- For decals, set transparency on texture
            if part:IsA("Decal") then
                part.Transparency = transparency
            end
        elseif part:IsA("ParticleEmitter") or part:IsA("BillboardGui") then
            part.Enabled = (transparency == 0)
        end
    end
end

CommandUI:AddCommand("invisible", function()
    setCharacterTransparency(1)
end)

CommandUI:AddCommand("visible", function()
    setCharacterTransparency(0)
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

CommandUI:AddCommand("goto", function(targetName)
    if not targetName then
        warn("Usage: goto <player>")
        return
    end
    local target = Players:FindFirstChild(targetName)
    local char = LocalPlayer.Character
    if target and target.Character and char and char:FindFirstChild("HumanoidRootPart") and target.Character:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0) -- teleport above to avoid clipping
        print("Teleported to " .. targetName)
    else
        warn("Player not found or character missing")
    end
end)

CommandUI:AddCommand("tp", function(targetName)
    if not targetName then
        warn("Usage: tp <player>")
        return
    end
    local target = Players:FindFirstChild(targetName)
    local char = LocalPlayer.Character
    if target and target.Character and char and char:FindFirstChild("HumanoidRootPart") and target.Character:FindFirstChild("HumanoidRootPart") then
        target.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0) -- bring target above you
        print("Teleported " .. targetName .. " to you")
    else
        warn("Player not found or character missing")
    end
end)

CommandUI:AddCommand("antiafk", function()
    local VirtualUser = game:GetService("VirtualUser")
    -- Connect to the Idled event
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        VirtualUser:ClickButton2(Vector2.new()) -- simulate right click
        print("Anti-AFK: Click simulated to prevent kick")
    end)
    print("Anti-AFK enabled")
end)

local frozenPlayers = {}

CommandUI:AddCommand("freeze <player>", function(player)
    local character = GetPlayerCharacter(player)
    if character and character:FindFirstChild("HumanoidRootPart") and not frozenPlayers[player] then
        local ice = Instance.new("Part")
        ice.Name = "FakeIce"
        ice.Size = Vector3.new(6, 1, 6)
        ice.Position = character.HumanoidRootPart.Position - Vector3.new(0, 3, 0)
        ice.Anchored = true
        ice.Material = Enum.Material.Ice
        ice.Transparency = 0.4
        ice.CanCollide = true
        ice.Parent = workspace

        frozenPlayers[player] = ice
    end
end)

CommandUI:AddCommand("unfreeze <player>", function(player)
    if frozenPlayers[player] then
        frozenPlayers[player]:Destroy()
        frozenPlayers[player] = nil
    end
end)

-- Helper to get player character (customize as needed depending on your executor or environment)
function GetPlayerCharacter(name)
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #name) == name:lower() then
            return plr.Character
        end
    end
    return nil
end


CommandUI:AddCommand("kill <player>", function(player)
    local character = GetPlayerCharacter(player)
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end
end)

-- Helper function to find character by partial name
function GetPlayerCharacter(name)
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #name) == name:lower() then
            return plr.Character
        end
    end
    return nil
end

-- Day

CommandUI:AddCommand("day", function()
    game.Lighting.TimeOfDay = "14:00:00" -- 2 PM
end)

-- Night

CommandUI:AddCommand("night", function()
    game.Lighting.TimeOfDay = "00:00:00" -- Midnight
end)

-- Brightness <value>

CommandUI:AddCommand("brightness <value>", function(value)
    local num = tonumber(value)
    if num then
        game.Lighting.Brightness = num
    end
end)

-- Fog Color <R,G,B>

CommandUI:AddCommand("fogcolor <r,g,b>", function(rgb)
    local r, g, b = rgb:match("(%d+),%s*(%d+),%s*(%d+)")
    if r and g and b then
        game.Lighting.FogColor = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
    end
end)

-- Fog Start <value>

CommandUI:AddCommand("fog start <value>", function(value)
    local num = tonumber(value)
    if num then
        game.Lighting.FogStart = num
    end
end)

-- Fog End <value>

CommandUI:AddCommand("fog end <value>", function(value)
    local num = tonumber(value)
    if num then
        game.Lighting.FogEnd = num
    end
end)


CommandUI:AddCommand("avatarcolor <r,g,b>", function(rgb)
    local r, g, b = rgb:match("(%d+),%s*(%d+),%s*(%d+)")
    if not (r and g and b) then return end

    local color = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
    local player = game.Players.LocalPlayer
    local character = player and player.Character

    if character then
        -- List of R6 and R15 body parts
        local parts = {
            "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg",  -- R6
            "UpperTorso", "LowerTorso", "LeftUpperArm", "LeftLowerArm", "LeftHand",
            "RightUpperArm", "RightLowerArm", "RightHand",
            "LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
            "RightUpperLeg", "RightLowerLeg", "RightFoot"  -- R15
        }

        for _, partName in ipairs(parts) do
            local part = character:FindFirstChild(partName)
            if part and part:IsA("BasePart") then
                part.Color = color
            end
        end
    end
end)


CommandUI:AddCommand("kick <player>", function(name)
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr.Name:lower():sub(1, #name) == name:lower() then
            if plr.Character then
                plr.Character:Destroy()
            end
            break
        end
    end
end)


CommandUI:AddCommand("shutdown", function()
    game.Players.LocalPlayer:Kick("The server was shutdown.")
end)


CommandUI:AddCommand("fireclickdetectors", function()
    local clickDetectors = workspace:GetDescendants()
    for _, v in ipairs(clickDetectors) do
        if v:IsA("ClickDetector") then
            fireclickdetector(v)
        end
    end
end)

CommandUI:AddCommand("proximityprompt", function()
    local prompts = workspace:GetDescendants()
    for _, prompt in ipairs(prompts) do
        if prompt:IsA("ProximityPrompt") then
            fireproximityprompt(prompt)
        end
    end
end)

CommandUI:AddCommand("deletegui", function()
    local player = game.Players.LocalPlayer
    if player then
        local playerGui = player:FindFirstChildOfClass("PlayerGui")
        if playerGui then
            for _, gui in ipairs(playerGui:GetChildren()) do
                gui:Destroy()
            end
        end
    end
end)

CommandUI:AddCommand("fly", function()
local ScreenGui1 = Instance.new("ScreenGui")
ScreenGui1.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Load and run remote code
loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/SourceCludeLib/refs/heads/main/Hhhhhh"))()

local Frame1 = Instance.new("Frame")
Frame1.Parent = ScreenGui1
Frame1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame1.BackgroundTransparency = 0.05
Frame1.BorderSizePixel = 0
Frame1.Size = UDim2.new(0.2, 0, 0.2, 0)
Frame1.Position = UDim2.new(1, 0, 0.8, 0)

local TextLabel1 = Instance.new("TextLabel")
TextLabel1.Parent = Frame1
TextLabel1.BackgroundColor3 = Color3.fromRGB(0, 100, 150)
TextLabel1.BorderSizePixel = 0
TextLabel1.Size = UDim2.new(1, 0, 0.25, 0)
TextLabel1.TextXAlignment = Enum.TextXAlignment.Left
TextLabel1.Text = " Fly Gui"
TextLabel1.Font = Enum.Font.SourceSans
TextLabel1.BorderColor3 = Color3.fromRGB(242, 243, 243)
TextLabel1.TextSize = 18
TextLabel1.TextColor3 = Color3.fromRGB(242, 243, 243)
end)
-- script end here
        warn("Don't abuse admin or you will get banned for abusing")
