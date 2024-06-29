local uis = game:GetService("UserInputService")
_G.gnSpeedEnabled = true
local iswpressed = false
local isspressed = false
local iscpressed = false

uis.InputBegan:Connect(function(input)
    if _G.gnSpeedEnabled then
    if input.KeyCode == Enum.KeyCode.W then
        iswpressed = true
        while iswpressed do
            for _,v in pairs(workspace.Cars:GetChildren()) do
                if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
                    v.Main.Velocity += v.Main.CFrame.LookVector * Vector3.new(1.16,0,1.16) - Vector3.new(0,0,0)
                end
            end
            wait()
        end
    end

    if input.KeyCode == Enum.KeyCode.S then
        isspressed = true
        while isspressed do
            for _,v in pairs(workspace.Cars:GetChildren()) do
                if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
                    v.Main.Velocity -= v.Main.CFrame.LookVector * Vector3.new(3,0,3) + Vector3.new(0,1,0)
                end
            end
            wait()
        end
    end

    if input.KeyCode == Enum.KeyCode.C then
        iscpressed = true
        while iscpressed do
            for _,v in pairs(workspace.Cars:GetChildren()) do
                if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
                    v.Main.Velocity += v.Main.CFrame.LookVector * Vector3.new(0,0,0) + Vector3.new(0,10,0)
                end
            end
            wait()
        end
    end
    end
end)

uis.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then
        iswpressed = false
    end

    if input.KeyCode == Enum.KeyCode.S then
        isspressed = false
    end

    if input.KeyCode == Enum.KeyCode.C then
        iscpressed = false
    end
end)