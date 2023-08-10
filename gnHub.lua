local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/gdnoob1324/mercury-lib-edit/main/src.lua"))()

local Gui = Library:Create {
    Name = "gnHub",
    Theme = Library.Themes.Dark,
    Size = UDim2.fromOffset(600, 400),
    Link = "https://github.com/deeeity/mercury-lib"
}

local Main = Gui:Tab {
    Name = "Main",
    Icon = "rbxassetid://2174510075"
}

local DriveWorld = Gui:Tab {
    Name = "Drive World",
    Icon = "rbxassetid://13773498965" --8569322835
}

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F3 then
        _G.WRDESPEnabled = not (_G.WRDESPEnabled)
	end	
end)

local afOn = false
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

local ESP_ON = false
Main:Button({
    Name = "ESP START",
    Description = "Toggle: F3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gdnoob1324/gnHub/main/esp.lua"))()
        ESP_ON = true
    end
})

DriveWorld:Toggle({
    Name = "Anti Afk",
	StartingState = false,
    Description = "anti afk kick",
	Callback = function(state)
        afOn = state
    end
})

DriveWorld:Button({
    Name = "MaxHub(Drive World)",
    Description = "Only for Super Car :D",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ufouzzed/m/main/CarShitterHub.lua"))()
    end
})

DriveWorld:Button({
    Name = "Start",
    Description = "First",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gdnoob1324/gnHub/main/DWjob.lua"))()
    end
})

DriveWorld:Toggle({
    Name = "Auto Delivery Trailer",
	StartingState = false,
    Description = "Use Full-E or Casper for more money(work in USA map only)",
	Callback = function(state)
        _G.Job["autodelivery"] = state
    end
})

DriveWorld:Toggle({
    Name = "Auto Delivery Food",
	StartingState = false,
    Description = "easier for quest",
	Callback = function(state)
        _G.Job["autodeliveryfood"] = state
    end
})

DriveWorld:Toggle({
    Name = "Auto Complete Race",
	StartingState = false,
    Description = nil,
	Callback = function(state)
        _G.Job["autocomplete"] = state
    end
})


Gui:Credit {
    Name = "gdnoob1324",
    Description = "3 years old",
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