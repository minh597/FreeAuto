local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteFunction = ReplicatedStorage:WaitForChild("RemoteFunction")
local player = game.Players.LocalPlayer

local guiPath = player:WaitForChild("PlayerGui")
    :WaitForChild("ReactUniversalHotbar")
    :WaitForChild("Frame")
    :WaitForChild("values")
    :WaitForChild("cash")
    :WaitForChild("amount")

local function getCash()
    local rawText = guiPath.Text or ""
    local cleaned = rawText:gsub("[^%d%-]", "")
    return tonumber(cleaned) or 0
end

local function waitForCash(minAmount)
    while getCash() < minAmount do
        task.wait(1)
    end
end

local function safeInvoke(args, cost)
    waitForCash(cost)
    local success, err = pcall(function()
        remoteFunction:InvokeServer(unpack(args))
    end)
    task.wait(1)
end

local sequence = {
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(4.668, 2.349, -37.184) }, "Shotgunner" }, cost = 300 },
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(-1.643, 2.349, -36.870) }, "Shotgunner" }, cost = 300 },
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(4.487, 2.386, -34.154) }, "Shotgunner" }, cost = 300 },
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(-1.185, 2.386, -33.905) }, "Shotgunner" }, cost = 300 },
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(-0.616, 2.386, -30.504) }, "Shotgunner" }, cost = 300 },

    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(7.143, 2.350, -39.064) }, "Trapper" }, cost = 500 },
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(7.671, 2.386, -35.299) }, "Trapper" }, cost = 500 },
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(-4.269, 2.349, -38.972) }, "Trapper" }, cost = 500 },
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(4.907, 2.386, -31.026) }, "Trapper" }, cost = 500 },
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(7.948, 2.386, -30.539) }, "Trapper" }, cost = 500 },
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(0.052, 2.386, -27.333) }, "Trapper" }, cost = 500 },
    { args = { "Troops", "Pl\208\176ce", { Rotation = CFrame.new(), Position = Vector3.new(3.450, 2.386, -25.265) }, "Trapper" }, cost = 500 },
}

for _, step in ipairs(sequence) do
    safeInvoke(step.args, step.cost)
end

local towerFolder = workspace:WaitForChild("Towers")
while true do
    local towers = towerFolder:GetChildren()
    for i, tower in ipairs(towers) do
        local args = {
            "Troops",
            "Upgrade",
            "Set",
            {
                Troop = tower,
                Path = 1
            }
        }
        pcall(function()
            remoteFunction:InvokeServer(unpack(args))
        end)
    end
    task.wait(1)
end
