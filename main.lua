--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Защита от создания дубликатов при респавне, если скрипт в StarterCharacterScripts
if PlayerGui:FindFirstChild("DNG") then
	PlayerGui["DNG"]:Destroy()
end

local G2L = {};

-- StarterGui.DNG
G2L["1"] = Instance.new("ScreenGui", PlayerGui);
G2L["1"]["Name"] = [[DNG]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;

-- StarterGui.DNG.Holder
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Size"] = UDim2.new(0, 380, 0, 243);
G2L["2"]["Position"] = UDim2.new(0.43522, 0, 0.24691, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[Holder]];

-- StarterGui.DNG.Holder.UIStroke
G2L["3"] = Instance.new("UIStroke", G2L["2"]);
G2L["3"]["Thickness"] = 5;
G2L["3"]["Color"] = Color3.fromRGB(249, 36, 255);
G2L["3"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["3"]["LineJoinMode"] = Enum.LineJoinMode.Miter;

-- Функция создания страниц (для удобства)
local function createPageButton(parent, name, text, posX)
	local btn = Instance.new("TextButton", parent)
	btn.TextWrapped = true
	btn.BorderSizePixel = 0
	btn.TextSize = 14
	btn.TextScaled = true
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	btn.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	btn.Size = UDim2.new(0, 50, 0, 31)
	btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	btn.Text = text
	btn.Name = name
	btn.Position = UDim2.new(posX, 0, 0.87243, 0)

	local stroke = Instance.new("UIStroke", btn)
	stroke.Thickness = 3
	stroke.Color = Color3.fromRGB(255, 15, 255)
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.LineJoinMode = Enum.LineJoinMode.Miter
	
	return btn
end

-- Кнопки страниц
G2L["4"] = createPageButton(G2L["2"], "Page 1", "Page 1", 0)
G2L["7"] = createPageButton(G2L["2"], "Page 2", "Page 2", 0.15263)
G2L["a"] = createPageButton(G2L["2"], "Page 3", "Page 3", 0.30526)
G2L["d"] = createPageButton(G2L["2"], "Page 4", "Page 4", 0.45789)
G2L["13"] = createPageButton(G2L["2"], "Page 5", "Page 5", 0.61316)
G2L["10"] = createPageButton(G2L["2"], "Page 6", "Page 6", 0.76579)

-- Title
G2L["16"] = Instance.new("TextLabel", G2L["2"]);
G2L["16"]["TextWrapped"] = true;
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["TextSize"] = 50;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["16"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["Size"] = UDim2.new(0, 380, 0, 30);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[DNG]];
G2L["16"]["Name"] = [[Title]];

G2L["17"] = Instance.new("UIStroke", G2L["16"]);
G2L["17"]["Thickness"] = 3.7;
G2L["17"]["Color"] = Color3.fromRGB(255, 0, 235);
G2L["17"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- Функция переключения вкладок
local pages = {}
local function showPage(pageName)
	for _, page in pairs(pages) do
		page.Visible = (page.Name == pageName)
	end
end

-- Создание фреймов страниц (P1 - P6, Cr, Ex)
local function createPageFrame(name)
	local frame = Instance.new("Frame", G2L["2"])
	frame.Visible = false
	frame.BorderSizePixel = 0
	frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	frame.Size = UDim2.new(0, 361, 0, 156)
	frame.Position = UDim2.new(0.02105, 0, 0.18519, 0)
	frame.Name = name

	local stroke = Instance.new("UIStroke", frame)
	stroke.Thickness = 3
	stroke.Color = Color3.fromRGB(255, 0, 222)
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	pages[name] = frame
	return frame
end

local P1 = createPageFrame("P1")
local P2 = createPageFrame("P2")
local P3 = createPageFrame("P3")
local P4 = createPageFrame("P4")
local P5 = createPageFrame("P5")
local P6 = createPageFrame("P6")
local Cr = createPageFrame("Cr")
local Ex = createPageFrame("Ex")

-- Привязка кнопок страниц к переключению
G2L["4"].MouseButton1Click:Connect(function() showPage("P1") end)
G2L["7"].MouseButton1Click:Connect(function() showPage("P2") end)
G2L["a"].MouseButton1Click:Connect(function() showPage("P3") end)
G2L["d"].MouseButton1Click:Connect(function() showPage("P4") end)
G2L["13"].MouseButton1Click:Connect(function() showPage("P5") end)
G2L["10"].MouseButton1Click:Connect(function() showPage("P6") end)

-- Открытие первой страницы по умолчанию
P1.Visible = true

-- Drag (Перетаскивание GUI мышкой/пальцем)
local UserInputService = game:GetService("UserInputService")
local gui = G2L["2"]
local dragging, dragStart, startPos

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- Кнопка Credits
local CreditsBtn = Instance.new("TextButton", G2L["2"])
CreditsBtn.Size = UDim2.new(0, 31, 0, 31)
CreditsBtn.Position = UDim2.new(0.91842, 0, 0.87243, 0)
CreditsBtn.Text = "Credits"
CreditsBtn.TextColor3 = Color3.new(1,1,1)
CreditsBtn.BackgroundColor3 = Color3.new(0,0,0)
CreditsBtn.TextScaled = true
CreditsBtn.MouseButton1Click:Connect(function() showPage("Cr") end)

-- Приветствие в Credits
local userLabel = Instance.new("TextLabel", Cr)
userLabel.Size = UDim2.new(0, 167, 0, 34)
userLabel.Position = UDim2.new(0.24654, 0, -0.01282, 0)
userLabel.BackgroundTransparency = 1
userLabel.TextColor3 = Color3.new(1,1,1)
userLabel.TextScaled = true
userLabel.Text = LocalPlayer.Name

return G2L["1"]
