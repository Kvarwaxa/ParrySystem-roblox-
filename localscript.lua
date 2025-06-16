local UserInputService = game:GetService("UserInputService")
local parryWindow = 0.5
local isParrying = false

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ParryEvent = ReplicatedStorage:WaitForChild("ParryEvent")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function showNotification(text)
    local screenGui = Instance.new("ScreenGui")
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 200, 0, 50)
    label.Position = UDim2.new(0.5, -100, 0.3, 0)
    label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    label.BackgroundTransparency = 0.5
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.SourceSansBold
    label.TextScaled = true
    label.Text = text
    label.Parent = screenGui

    delay(1.5, function()
        screenGui:Destroy()
    end)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then
        if not isParrying then
            isParrying = true
            wait(parryWindow)
            isParrying = false
        end
    end
end)

ParryEvent.OnClientEvent:Connect(function(success)
    if success then
        showNotification("Parried Successfully!")
    end
end)
