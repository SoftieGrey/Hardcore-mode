--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local test=false
if game.ReplicatedStorage:FindFirstChild("Test") then
test = true
end
local seed=game.ReplicatedStorage.GameData.RandomSeed.Value
--[[

    NOTE: Custom shop items will NOT cost any real knobs

]]--
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
function ach(name,desc,reason,img)
local img2=img
if img:find("rbxassetid://") then
else
   local path="achievements/"..name.."/icon.png"
    if not isfile(path) then
    writefile(path, game:HttpGet(img))
    print("Added "..path.."!")
    else
    appendfile(path, game:HttpGet(img))
    print("if the file had an update the achievement icon for "..name.." should have been changed, file path:" ..path)
    end
   img2 =  getcustomasset(path)
end
achievementGiver({
    Title = name,
    Desc = desc,
    Reason = reason,
    Image = img2
})
end

local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()


-- Create your tool here
local Lantern = LoadCustomInstance("https://raw.githubusercontent.com/softbf395/DoorsTheTialsModeAssets/refs/heads/main/entitymodels/Lantern.rbxm")


-- Create custom shop item
--[[CustomShop.CreateItem(Lantern, {
    Title = "Lantern",
    Desc = "Light up those annoying dark rooms!",
    Image = "rbxassetid://18249762827",
    Price = 0,
    Stack = 1,
})--]]
local StarterGui=game:GetService("StarterGui")
if not game:FindFirstChild("TrialsModeRan", true) then
Instance.new("BoolValue", game.ReplicatedStorage).Name="TrialsModeRan"
 function displayMessages()
    -- Green Text Message
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "<font color='#00FF00'>Loaded Aedaniss7’s The Trials Mode for doors!<br/>If you encounter any bugs, report it to Aedaniss7’s hub on scriptblox!<br/>Version: 0.0.2</font>";
        Font = Enum.Font.SourceSansBold;
        TextSize = 18;
    })

    -- Red Text Message
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "<font color='#FF0000'>Good luck! You’ll need it.. ;)</font>";
        Font = Enum.Font.SourceSansBold;
        TextSize = 18;
    })
end
displayMessages()
ach("Trials mode enabled!", "Good luck, You'll need it ;)", "Activate The Trials Mode.", "https://static.wikia.nocookie.net/doors-game/images/9/90/Welcome_Badge.png/revision/latest?cb=20220810040126")
workspace.Ambience_Dark.SoundId="rbxassetid://3466798390"
--===setup entities===--
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

function setup(name, asset, E, Speed, delay, Reverse, Reboundsm, ReboundsX, ReboundDelay, Rebounds, Damage, DmgRange, CrossBreak, CrossResist, CrossEnabled,DeathType, DeathMessages, Jumpscare, achName, achDesc, achR, achImg)
   ---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = name,
		Asset = asset,
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = E or false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = Speed*100,
		Delay = delay,
		Reversed = Reverse
	},
	Rebounding = {
		Enabled = Rebounds,
		Type = "Ambush", -- "Blitz"
		Min = Reboundsm,
		Max = ReboundsX,
		Delay = ReboundDelay
	},
	Damage = {
		Enabled = true,
		Range = DmgRange,
		Amount = Damage
	},
	Crucifixion = {
		Enabled = CrossEnabled,
		Range = 40,
		Resist = CrossResist,
		Break = CrossBreak
	},
	Death = {
		Type = DeathType,
		Hints = DeathMessages,
		Cause = ""
	}
})
entity:SetCallback("OnDespawning", function()
    ach(achName, achDesc, achR, achImg)
end)
return entity
end

--create entity func
function makeEntity(ent)
   ent:Run()
end
local crucifixchance=10
local lanternchance=50
local TIMEChance={number=20, inAChance=100, roomMin=5}
local SPEEDChance={number=15, inAChance=100, roomMin=25}

if test==true then
SPEEDChance={number=100, inAChance=100, roomMin=0}
end
function getimglink(imgname)
    return "https://raw.githubusercontent.com/Softiegrey/Hardcore-mode/refs/heads/main/"..imgname
end
local doorNumV:IntValue=game.ReplicatedStorage.GameData.LatestRoom
doorNumV.Changed:Connect(function()
	if math.random(1,40) <=20 then
				local isCrucifix=false
				
		if Random.new(seed):NextNumber(1,100) <=TIMEChance.number and doorNumV.Value>=TIMEChance.roomMin then
                        local time=setup("Quick", "https://raw.githubusercontent.com/SoftieGrey/Hardcore-mode/refs/heads/main/DoorsHC/quick.rbxm",  true, 1.5, 0, false, 1, 2, 0, true, 100, 40, true, false, true, "Guiding", {"You Died To Who You Call Quick.", "Listen for any cues that might hint at it's arrival.", "Find a hiding spot quickly!", "It's speed has been proven to be quite menacing."}, function() end, "Watch yo jet", "WATCH YP JET!!", "Survive Quick", getimglink("ayowatchyojet.png"))
			time:Run()
                elseif Random.new(seed):NextNumber(1,100) <=SPEEDChance.number and doorNumV.Value>=TIMEChance.roomMin then
                        local time=setup("Tackle", "https://raw.githubusercontent.com/SoftieGrey/Hardcore-mode/refs/heads/main/DoorsHC/Tackle.rbxm",  true, 7.5, 2, false, 5, 10, 1, true, 300, 40, false, false, true, "Guiding", {"You died to Tackle.", "Its a tricky one.", "use what you learned from quick.", "and ambush-"}, function() end, "Charging at Front", "Look Out!", "Successfully Survive Tackle", getimglink("chargingatfront.png"))
			time:Run()
		end
	end
end)
else
function displayMessages()
    -- Green Text Message
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "<font color='#00FF00'>Already Ran: Aedaniss7’s The Trials Mode for doors!<br/>If you encounter any bugs, report it to Aedaniss7’s hub on scriptblox!<br/>Version: 0.0.2</font>";
        Font = Enum.Font.SourceSansBold;
        TextSize = 18;
    })

    -- Red Text Message
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "<font color='#FF0000'>Good luck! You’ll need it.. ;)</font>";
        Font = Enum.Font.SourceSansBold;
        TextSize = 18;
    })
end
displayMessages()
ach("HARDCORE mode failed!!", "Its active already!", "Activate The Trials Mode again.", "https://static.wikia.nocookie.net/doors-game/images/5/51/QA_Tester_Badge.png/revision/latest?cb=20230211003716")
end
