local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ParryEvent = ReplicatedStorage:WaitForChild("ParryEvent")

local stunnedEnemies = {}

ParryEvent.OnServerEvent:Connect(function(player, enemy)
    if enemy and enemy:IsA("Model") and not stunnedEnemies[enemy] then
        stunnedEnemies[enemy] = true
        local aiScript = enemy:FindFirstChild("AI")
        if aiScript then
            aiScript.Disabled = true
        end
        ParryEvent:FireClient(player, true)
        wait(1)
        stunnedEnemies[enemy] = false
        if aiScript then
            aiScript.Disabled = false
        end
    end
end)
