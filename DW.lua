local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local Gui = Library:Create {
    Name = "gnHub",
    Theme = Library.Themes.Dark,
    Size = UDim2.fromOffset(600, 400),
    Link = "https://github.com/deeeity/mercury-lib",
    ToggleKey = Enum.KeyCode.Delete,
}

local Main = Gui:Tab {
    Name = "Main",
    Icon = "rbxassetid://13773498965"
}

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F3 then
        _G.WRDESPEnabled = not (_G.WRDESPEnabled)
	end
    if input.KeyCode == Enum.KeyCode.F4 then
        _G.gnSpeedEnabled = not (_G.gnSpeedEnabled)
        local istrue = "Disable" 
        if _G.gnSpeedEnabled then
            istrue = "Enable"
        end
        game.StarterGui:SetCore("SendNotification", {Title=istrue; Text="gnSpeed"; Duration=1;})
	end
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    if afOn then
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end
end)

Main:Button({
    Name = "Rejoin",
    Description = "Re Join",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})

Main:Button({
    Name = "ESP START",
    Description = "Toggle: F3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gdnoob1324/gnHub/main/esp.lua"))()
    end
})

Main:Button({
    Name = "ESP START",
    Description = "Toggle: F4",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gdnoob1324/gnHub/main/DW_.lua"))()
    end
})

Main:Toggle({
    Name = "Test",
	StartingState = false,
    Description = nil,
	Callback = function(state)
    end
})

Gui:Credit {
    Name = "gdnoob1324",
    Description = "Made the script",
    V3rm = "https://v3rmillion.net/member.php?action=profile&uid=3143401",
    Discord = "지디늅#6134"
}

Gui:Credit{
    Name = "x3Fall3nAngel",
    Description = "Made the script",
    V3rm = "https://v3rmillion.net/member.php?action=profile&uid=2270329",
    Discord = "https://discord.gg/b9QX5rnkT5"
}

Gui:Set_status("Made by gdnoob1324")