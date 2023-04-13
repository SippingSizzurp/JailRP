local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local TweenService = game:GetService("TweenService")


local function tweenCharacterToPosition(character, targetPosition)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local currentPosition = humanoidRootPart.Position
        local targetPosition1 = currentPosition + Vector3.new(0, 60, 0) -- Move up on the y-axis by 50 units
        local escapePosition = targetPosition + Vector3.new(0, 60, 0)
        
        -- Move up by 50 units
        local distance1 = (targetPosition1 - currentPosition).Magnitude
        local duration1 = distance1 / 50
        local tweenInfo1 = TweenInfo.new(duration1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local goal1 = {CFrame = CFrame.new(targetPosition1)}
        local tween1 = TweenService:Create(humanoidRootPart, tweenInfo1, goal1)
        tween1:Play()
        tween1.Completed:Wait()
        
        -- Move to the escape position
        local distance2 = (escapePosition - targetPosition1).Magnitude
        local duration2 = distance2 / 60
        local tweenInfo2 = TweenInfo.new(duration2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local goal2 = {CFrame = CFrame.new(escapePosition)}
        local tween2 = TweenService:Create(humanoidRootPart, tweenInfo2, goal2)
        tween2:Play()
        tween2.Completed:Wait()
        
        -- Move up to the target position
        local distance3 = (targetPosition - escapePosition).Magnitude
        local duration3 = distance3 / 50
        local tweenInfo3 = TweenInfo.new(duration3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local goal3 = {CFrame = CFrame.new(targetPosition)}
        local tween3 = TweenService:Create(humanoidRootPart, tweenInfo3, goal3)
        tween3:Play()
        tween3.Completed:Wait()
    end
end



local Window = Rayfield:CreateWindow({
	Name = "Jail RP",
	LoadingTitle = "County Jail Roleplay",
	LoadingSubtitle = "by SippingSizzurp"
})


local Tab2 = Window:CreateTab("Main", 4483362458) -- Title, Image
local Tab = Window:CreateTab("Teleports", 4483362458) -- Title, Image
local Tab3 = Window:CreateTab("Teleport Config", 4483362458) -- Title, Image
local Tab4 = Window:CreateTab("Map Mods", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
    Name = "Escape",
    Callback = function()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        
        escapebase = Vector3.new(359.111847, -2.47301316, 394.23941, 0.498577297, 0, 0.86684531, 0, 1, 0, -0.86684531, 0, 0.498577297)
        tweenCharacterToPosition(character, escapebase)
        end
    
})

local Button = Tab:CreateButton({
    Name = "Min/Med Cell Block",
    Callback = function()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        escapebase = Vector3.new(-98.9181442, -6.73332405, -467.862579, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        tweenCharacterToPosition(character, escapebase)
        end
    
})

local Button = Tab:CreateButton({
    Name = "Jail Armory",
    Callback = function()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        escapebase = Vector3.new(-228.899414, -7.50251245, -120.616341, -0.997090995, 0.000156366819, 0.0762202591, 0.000125520644, 0.999999881, -0.00040948813, -0.0762203187, -0.000398729724, -0.997090936)
        tweenCharacterToPosition(character, escapebase)
        end
    
})

local Button = Tab:CreateButton({
    Name = "Jail Lobby",
    Callback = function()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        escapebase = Vector3.new(-87.482193, -5.49444199, -143.427048, -0.206077099, -1.06416877e-07, 0.978535771, -3.57924463e-08, 1, 1.01213345e-07, -0.978535771, -1.4166436e-08, -0.206077099)
        tweenCharacterToPosition(character, escapebase)
        end
    
})

local nofence = false
local fenceparts = game:GetService("Workspace").Fence.FenceChain:GetChildren()

local Toggle = Tab2:CreateToggle({
	Name = "No Fences",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		nofence = Value
		if nofence then
		    for i, v in ipairs(fenceparts) do
		        v.CanCollide = false
		    end
	    else
	        for i, v in ipairs(fenceparts) do
		        v.CanCollide = true
		    end
		end
		    
	end,
})


local savedpos = Vector3.new(359.111847, -2.47301316, 394.23941, 0.498577297, 0, 0.86684531, 0, 1, 0, -0.86684531, 0, 0.498577297)

local Keybind = Tab3:CreateKeybind({
	Name = "Save Position",
	CurrentKeybind = "Q",
	HoldToInteract = false,
	Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Keybind)
	    local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
		savedpos = character.HumanoidRootPart.CFrame
	end,
})

local Button = Tab:CreateButton({
    Name = "Teleport to Saved Location",
    Callback = function()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        tweenCharacterToPosition(character, savedpos.Position)
        end
    
})

local playername

local Input = Tab3:CreateInput({
	Name = "Player Name",
	PlaceholderText = "Name",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		playername = Text
	end,
})

local Button = Tab:CreateButton({
    Name = "TP to Player",
    Callback = function()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local player2 = Players[playername].character
        escapebase = player2.HumanoidRootPart.CFrame.Position
        tweenCharacterToPosition(character, escapebase)
        end
    
})

local Toggle = Tab2:CreateToggle({
	Name = "Show Chat",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		
		local Players = game:GetService("Players")
        local me = Players.LocalPlayer
        me.PlayerGui.Chat.Frame.Visible = Value
        me.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = Value
	end,
})


local Label = Tab4:CreateLabel("These are permanent. Use the rejoin feature to reset anything done in here.")
local Button = Tab4:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
        end
})

local Button = Tab4:CreateButton({
    Name = "Delete Everything (WIP)",
    Callback = function()
        local map = game:GetService("Workspace").Map:GetChildren()
        local map1 = game:GetService("Workspace").TopFloor:GetChildren()
        local map2 = game:GetService("Workspace").Fence:GetChildren()
        local map3 = game:GetService("Workspace").Doors:GetChildren()
        for i, v in ipairs(map) do
            v:Destroy()
        end
        for i, v in ipairs(map1) do
            v:Destroy()
        end
        for i, v in ipairs(map2) do
            v:Destroy()
        end
        for i, v in ipairs(map3) do
            v:Destroy()
        end
    end
    
})

local Button = Tab4:CreateButton({
    Name = "Delete Doors",
    Callback = function()
        local map = game:GetService("Workspace").Doors:GetChildren()
        local map1 = game:GetService("Workspace").Map:GetChildren()
        local map2 = game:GetService("Workspace").TopFloor:GetChildren()
        local searchString = "Door"

        for i, v in ipairs(map2) do
            if string.find(v.Name, "Model") then
                local subfolder = v:GetChildren()
                for j, child in ipairs(subfolder) do
                    if string.find(child.Name, "WindowMetalDoor") then 
                        child:Destroy()
                    end
                end
            end
            
            if string.find(v.Name, "WoodDoor") then
                v:Destroy()
            end
            
            if string.find(v.Name, "WindowMetalDoor") or v.name == "GlassDoor" then
                v:Destroy()
            end
            
            if v.name == "MetalDoor" then
                v:Destroy()
            end
        end

        for i, v in ipairs(map) do
            if string.find(v.Name, searchString) then
                v:Destroy()
            end
        end

        for i, v in ipairs(map1) do
            if string.find(v.Name, searchString) then
                v:Destroy()
            end
            
            if v:IsA("Folder") and string.find(v.Name, "Cell") then
                local subfolder = v:GetChildren()
                for j, child in ipairs(subfolder) do
                    if string.find(child.Name, searchString) then 
                        child:Destroy()
                    end
                end
            end
            
            if v:IsA("Folder") and string.find(v.Name, "Model") then
                local subfolder = v:GetChildren()
                for j, child in ipairs(subfolder) do
                    if string.find(child.Name, searchString) then 
                        child:Destroy()
                    end
                end
            end
        end
    end
})

local Button = Tab4:CreateButton({
    Name = "Delete min/med",
    Callback = function()
        
        local map1 = game:GetService("Workspace").Map:GetChildren()
        local searchString = "wall"
        
        for i, v in ipairs(map1) do
            if v:IsA("Folder") and string.find(v.Name, "Cell") then
                v:Destroy()
            end
            
            if string.find(v.Name, "HitboxNoclimb") then
                v:Destroy()
            end
            
            if string.find(v.Name, "Model") then
                v:Destroy()
            end
            
            if v:IsA("Folder") and string.find(v.Name, "Bricks") then
                v:Destroy()
            end
            
            if v.Name == "Part" and v.Color == Color3.fromRGB(172, 172, 172) then
                v:Destroy()
            end
        end
    end
    
})
