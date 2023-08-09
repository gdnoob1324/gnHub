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

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F3 then
        _G.WRDESPEnabled = not (_G.WRDESPEnabled)
	end	
end)

Main:button({
    Name = "Rejoin",
    Description = "Re Join",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})

local ESP_ON = false
Main:button({
    Name = "ESP START",
    Description = "Edited Kiriot ESP",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gdnoob1324/gnHub/main/e.lua"))()
        ESP_ON = true
    end
})

Main:button({
    Name = "Auto Clicker",
    Description = "Auto Clicker!",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/JustEzpi/ROBLOX-Scripts/main/ROBLOX_AutoClicker"))()
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
    Callback = function(value)

    end
}

DriveWorld:button({
    Name = "MaxHub(Drive World)",
    Description = "Only for Super Car :D",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ufouzzed/m/main/CarShitterHub.lua"))()
    end
})

DriveWorld:Toggle({
    Name = "Start",
	StartingState = false,
    Description = "First",
	Callback = function(state)
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