local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/gdnoob1324/mercury-lib-edit/main/src.lua"))()

local Gui = Library:Create {
    Name = "gnHub",
    Theme = Library.Themes.Dark,
    Size = UDim2.fromOffset(600, 400),
    Link = "https://github.com/deeeity/mercury-lib"
}

local Main = Gui:tab {
    Name = "Main",
    Icon = "rbxassetid://2174510075"
}

local DriveWorld = Gui:tab {
    Name = "Drive World",
    Icon = "rbxassetid://13773498965" --8569322835
}

Main:button({
    Name = "Run Script",
    Description = nil,
    Callback = function()
        Gui:Notification {
            Title = "Test",
            Text = "TEXT",
            Duration = 3,
            Callback = function() end
        }
    end
})

Main:Toggle {
    Name = "Toggle",
    StartingState = false,
    Description = nil,
    Callback = function(state)
    end
}

Main:Slider {
    Name = "Slider",
    Default = 50,
    Min = 0,
    Max = 100,
    Callback = function() end
}

DriveWorld:button({
    Name = "MaxHub(Drive World)",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ufouzzed/m/main/CarShitterHub.lua"))()
    end
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lp = Players.LocalPlayer
local Systems = ReplicatedStorage:WaitForChild("Systems")

local Job = {}
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


DriveWorld:Toggle({
    Name = "Auto Delivery Trailer",
	StartingState = false,
    Description = "Use Full-E or Casper for more money(work in USA map only)",
	Callback = function(state)
        Job["autodelivery"] = state
    end
})

DriveWorld:Toggle({
    Name = "Auto Delivery Food",
	StartingState = false,
    Description = "easier for quest",
	Callback = function(state)
        Job["autodeliveryfood"] = state
    end
})

task.spawn(function()
    while task.wait() do
        if Job["autodeliveryfood"] then
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
                    if job.Visible == false and Job["autodeliveryfood"] then
                        Systems:WaitForChild("Jobs"):WaitForChild("StartJob"):InvokeServer("FoodDelivery","Tavern")
                    end
                until job.Visible == true or Job["autodeliveryfood"] == false
                task.wait(25)
                CompletionRegion = workspace:FindFirstChild("CompletionRegion")
                if CompletionRegion:FindFirstChild("Primary") then
                    completepos = CompletionRegion:FindFirstChild("Primary").CFrame
                end
                if not isvehicle() or not Job["autodeliveryfood"] then
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
        if Job["autodelivery"] then
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
                local epic
                local CompletionRegion
                local job = lp.PlayerGui.Interface.Score.Frame.Jobs
                repeat task.wait()
                    if job.Visible == false and Job["autodelivery"] then
                        Systems:WaitForChild("Jobs"):WaitForChild("StartJob"):InvokeServer("TrailerDelivery", "9")
                    end
                until job.Visible == true or Job["autodelivery"] == false
                print("Start Job")
                task.wait(.5)
                repeat task.wait() 
                    CompletionRegion = workspace:FindFirstChild("CompletionRegion")
                    if CompletionRegion then
                        distance = CompletionRegion:FindFirstChild("Primary"):FindFirstChild("DestinationIndicator"):FindFirstChild("Distance").Text
                        local yeas = string.split(distance, " ")
                        for i,v in next, yeas do
                            if tonumber(v) then
                                if tonumber(v) < 2 then
                                    Systems:WaitForChild("Jobs"):WaitForChild("StartJob"):InvokeServer("TrailerDelivery", "9")
                                else 
                                    epic = v
                                    break
                                end
                            end
                        end
                    end
                until epic and tonumber(epic) >= 2 or Job["autodelivery"] == false
                if CompletionRegion:FindFirstChild("Primary") then
                    completepos = CompletionRegion:FindFirstChild("Primary").CFrame
                end
                task.wait(25)
                Systems:WaitForChild("Navigate"):WaitForChild("Teleport"):InvokeServer(completepos)
                if not getvehicle() or not Job["autodelivery"] then
                    return
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
        Systems.Score.Begin:FireServer()
        task.wait(10)
        Systems.Score.Redeem:FireServer(stuff.encode(encryptionKey, craftStr(999999999)))
    end
end)

Gui:Credit {
    Name = "gdnoob1324",
    Description = "Helped with the script",
    V3rm = "https://v3rmillion.net/member.php?action=profile&uid=3143401",
    Discord = "지디늅#6134"
}

Gui:Credit{
    Name = "x3Fall3nAngel",
    Description = "Made the script",
    V3rm = "https://v3rmillion.net/member.php?action=profile&uid=2270329",
    Discord = "https://discord.gg/b9QX5rnkT5"
}

Gui:set_status("Active")