local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lp = Players.LocalPlayer
local Systems = ReplicatedStorage:WaitForChild("Systems")

_G.Job = {}
local xd = require(game:GetService("ReplicatedStorage").Systems.Score)
local encryptionKey = debug.getupvalue(xd.Start, 4)/69
local stuff = {}

for i,v in pairs(getconnections(Players.LocalPlayer.Idled)) do
    if v["Disable"] then
        v["Disable"](v)
    elseif v["Disconnect"] then
        v["Disconnect"](v)
    end
end

local function getchar()
    return lp.Character or lp.CharacterAdded:Wait()
end

local reg = getgc(true)
for i,v in pairs(reg) do
    if type(v) == "function" then
        local info = debug.getinfo(v)
        if string.find(info.source, "Score") then
            if info.name == "" then continue end
            stuff[info.name] = info.func
        end
    end
end

local function craftStr(amt)
    local actAmt = amt
    local rand = math.random
    local stringToSend = "speedScore=" .. amt .. ";driftScore=" .. rand(1,999) .. ";smashScore=" .. rand(1,999) .. ";airScore=" .. rand(1,10)
    return stringToSend
end

local function isvehicle()
    for i,v in next, workspace.Cars:GetChildren() do
        if (v:IsA("Model") and v:FindFirstChild("Owner") and v:FindFirstChild("Owner").Value == lp) then
            if v:FindFirstChild("CurrentDriver") and v:FindFirstChild("CurrentDriver").Value == lp then
                return true
            end
        end
    end
    return false
end

local function getvehicle()
    for i,v in next, workspace.Cars:GetChildren() do
        if v:IsA("Model") and v:FindFirstChild("Owner") and v:FindFirstChild("Owner").Value == lp then
            return v
        end
    end
    return
end


task.spawn(function()
    while task.wait() do
        if _G.Job["autodeliveryfood"] then
            pcall(function()
                if not isvehicle() then
                    local Cars = ReplicatedStorage:WaitForChild("PlayerData"):WaitForChild(lp.Name):WaitForChild("Inventory"):WaitForChild("Cars")
                    local Truck = Cars:FindFirstChild("FullE") or Cars:FindFirstChild("Casper")
                    local normalcar = Cars:FindFirstChildWhichIsA("Folder")
                    if Truck then
                        Systems:WaitForChild("Cars"):WaitForChild("SpawnPlayerCar"):InvokeServer(Truck)
                    else
                        Systems:WaitForChild("Cars"):WaitForChild("SpawnPlayerCar"):InvokeServer(normalcar)
                    end
                    task.wait(.5)
                    Systems:WaitForChild("Cars"):WaitForChild("EnterCar"):InvokeServer(getvehicle(), getvehicle():FindFirstChild("Seats"):FindFirstChild("Driver"))
                end
                local completepos
                local CompletionRegion
                local job = lp.PlayerGui.Interface.Score.Frame.Jobs
                repeat task.wait()
                    if job.Visible == false and _G.Job["autodeliveryfood"] then
                        Systems:WaitForChild("Jobs"):WaitForChild("StartJob"):InvokeServer("FoodDelivery","Tavern")
                    end
                until job.Visible == true or _G.Job["autodeliveryfood"] == false
                task.wait(25)
                CompletionRegion = workspace:FindFirstChild("CompletionRegion")
                if CompletionRegion:FindFirstChild("Primary") then
                    completepos = CompletionRegion:FindFirstChild("Primary").CFrame
                end
                if not isvehicle() or not _G.Job["autodeliveryfood"] then
                    return
                end
                Systems:WaitForChild("Navigate"):WaitForChild("Teleport"):InvokeServer(completepos)
                task.wait(.5)
                Systems:WaitForChild("Jobs"):WaitForChild("CompleteJob"):InvokeServer()
                task.wait(.5)
                if lp.PlayerGui.Interface.JobComplete.Enabled == true then
                    Systems:WaitForChild("Jobs"):WaitForChild("CashBankedEarnings"):FireServer()
                    firesignal(lp.PlayerGui.Interface.JobComplete.Window.Content.Buttons.Close.MouseButton1Click)
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.Job["autodelivery"] then
            pcall(function()
                if not isvehicle() then
                    local Cars = ReplicatedStorage:WaitForChild("PlayerData"):WaitForChild(lp.Name):WaitForChild("Inventory"):WaitForChild("Cars")
                    local Truck = Cars:FindFirstChild("FullE") or Cars:FindFirstChild("Casper")
                    local normalcar = Cars:FindFirstChildWhichIsA("Folder")
                    if Truck then
                        Systems:WaitForChild("Cars"):WaitForChild("SpawnPlayerCar"):InvokeServer(Truck)
                    else
                        Systems:WaitForChild("Cars"):WaitForChild("SpawnPlayerCar"):InvokeServer(normalcar)
                    end
                    task.wait(.5)
                    Systems:WaitForChild("Cars"):WaitForChild("EnterCar"):InvokeServer(getvehicle(), getvehicle():FindFirstChild("Seats"):FindFirstChild("Driver"))
                end
                local completepos
                local distance
                local jobDistance
                local CompletionRegion
                local job = lp.PlayerGui.Interface.Score.Frame.Jobs
                repeat task.wait()
                    if job.Visible == false and _G.Job["autodelivery"] then
                        Systems:WaitForChild("Jobs"):WaitForChild("StartJob"):InvokeServer("TrailerDelivery", "6")
                    end
                until job.Visible == true or _G.Job["autodelivery"] == false
                print("Start Job")
                repeat task.wait() 
                    CompletionRegion = workspace:WaitForChild("CompletionRegion", 3)
                    if CompletionRegion then
                        distance = CompletionRegion:FindFirstChild("Primary"):FindFirstChild("DestinationIndicator"):FindFirstChild("Distance").Text
                        local yeas = string.split(distance, " ")
                        for i,v in next, yeas do
                            if tonumber(v) then
                                if tonumber(v) < 2.1 or tonumber(v) > 100 then
                                    Systems:WaitForChild("Jobs"):WaitForChild("StartJob"):InvokeServer("TrailerDelivery", "6")
                                else
                                    jobDistance = v
                                    print("Trailer Job Distance : " .. jobDistance)
                                    break
                                end
                            end
                        end
                    end
                until jobDistance and tonumber(jobDistance) > 2.1 or _G.Job["autodelivery"] == false
                if CompletionRegion:FindFirstChild("Primary") then
                    completepos = CompletionRegion:FindFirstChild("Primary").CFrame
                end
                task.wait(25)
                if not _G.Job["autodelivery"] then return
                end
                Systems:WaitForChild("Navigate"):WaitForChild("Teleport"):InvokeServer(completepos)
                if not getvehicle() then return
                end
                task.wait(.5)
                Systems:WaitForChild("Jobs"):WaitForChild("CompleteJob"):InvokeServer()
                task.wait(.5)
                if lp.PlayerGui.Interface.JobComplete.Enabled == true then
                    Systems:WaitForChild("Jobs"):WaitForChild("CashBankedEarnings"):FireServer()
                    firesignal(lp.PlayerGui.Interface.JobComplete.Window.Content.Buttons.Close.MouseButton1Click)
                end
                print("Completed Job")    
            end)
        end
    end
end)


task.spawn(function()
    while task.wait() do
        if _G.Job["autocomplete"] then
            if isvehicle() then
                for i,v in next, workspace.Races:GetChildren() do
                    if (v:FindFirstChild("Checkpoints") and v:FindFirstChild("Active").Value == true and v:FindFirstChild("Checkpoints"):GetChildren()[1]:FindFirstChild("Forcefield")) then
                        for i = 1, v.TotalCheckpoints.Value  do
                            Systems:WaitForChild("Races"):WaitForChild("CheckpointTouched"):FireServer(i)
                            task.wait()
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        Systems.Score.Begin:FireServer()
        task.wait(10)
        Systems.Score.Redeem:FireServer(stuff.encode(encryptionKey, craftStr(999999999)))
    end
end)