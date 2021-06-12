print("Credits to Vep for Ui Libray")
--// Libray \\--
local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vep1032/VepStuff/main/VL"))()

--// Get Player \\--
local GetPlayer = game:GetService("Players")["LocalPlayer"]

--// Other stuffs with Player \\--
local NinjitsuFarm = GetPlayer:WaitForChild("ninjaEvent")
local InfinityJump = GetPlayer:FindFirstChild("multiJumpCount")

--// Script Configure this \\--
local AutoFarmers = {
    AutoSwing = false;
    AutoSell = false;
}
local SystemWait = {
    AutoSwingTime = 1;
    AutoSellTime = 2;
}
local SellArea = {
    Area = "sellAreaCircle";
    Test = "0000001";
}

--// Ui Creation \\--
local s = VLib:Window("Clicker Hub", "Ninja Legends", "G")
local ss = s:Tab("Auto Farm")

ss:Label("Auto Farm Configuration")

ss:Toggle("Auto Swing",function(t)
    AutoFarmers.AutoSwing = t
if t then
    doAutoFarmSwing();
end
end)

ss:Textbox("Auto Swing Speed", true,function(t)
    SystemWait.AutoSwingTime = t
end)

ss:Toggle("Auto Sell",function(t)
    AutoFarmers.AutoSell = t
if t then
    doAutoSell();
end
end)

ss:Textbox("Auto Sell Speed", true,function(t)
    SystemWait.AutoSellTime = t
end)

ss:Dropdown("Dropdown",{"sellAreaCircle", "sellAreaCircle2", "sellAreaCircle3", "sellAreaCircle4", "sellAreaCircle5", "sellAreaCircle6", "sellAreaCircle7", "sellAreaCircle8", "sellAreaCircle9", "sellAreaCircle10", "sellAreaCircle11", "sellAreaCircle12", "sellAreaCircle13", "sellAreaCircle14", "sellAreaCircle15", "sellAreaCircle16"},function(t)
    SellArea.Area = t
end)

--// Functions \\--
function doAutoFarmSwing()
    spawn(function()
         while AutoFarmers.AutoSwing == true do
            wait(SystemWait.AutoSwingTime)
        NinjitsuFarm:FireServer("swingKatana")
end
end)
end
function doAutoSell()
    spawn(function()
         while AutoFarmers.AutoSell == true do
    wait(SystemWait.AutoSellTime)
local A = game:GetService("Workspace").sellAreaCircles
local B = SellArea.Area
local C = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
A[B].circleInner.CFrame = C
end
end)
end
