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

-- Защита от создания дубликатов при перезапуске
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

-- Функция создания кнопок переключения страниц
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

-- Кнопки страниц (1-6)
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

-- Словарь для хранения страниц
local pages = {}

-- Функция переключения вкладок
local function showPage(pageName)
	for name, page in pairs(pages) do
		page.Visible = (name == pageName)
	end
end

-- Создание контейнера для страниц
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

-- Создаем сами страницы
local P1 = createPageFrame("P1")
local P2 = createPageFrame("P2")
local P3 = createPageFrame("P3")
local P4 = createPageFrame("P4")
local P5 = createPageFrame("P5")
local P6 = createPageFrame("P6")
local Cr = createPageFrame("Cr")

-- Текст-заглушка для страниц 1-6, чтобы они не были пустыми
for i, pageObj in ipairs({P1, P2, P3, P4, P5, P6}) do
	local lbl = Instance.new("TextLabel", pageObj)
	lbl.Size = UDim2.new(1, 0, 1, 0)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
	lbl.TextSize = 22
	lbl.Text = "Страница " .. i
	lbl.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
end

-- Привязка кнопок страниц
G2L["4"].MouseButton1Click:Connect(function() showPage("P1") end)
G2L["7"].MouseButton1Click:Connect(function() showPage("P2") end)
G2L["a"].MouseButton1Click:Connect(function() showPage("P3") end)
G2L["d"].MouseButton1Click:Connect(function() showPage("P4") end)
G2L["13"].MouseButton1Click:Connect(function() showPage("P5") end)
G2L["10"].MouseButton1Click:Connect(function() showPage("P6") end)

-- Перетаскивание GUI (Drag)
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

-- Кнопка Credits (справа внизу)
local CreditsBtn = Instance.new("TextButton", G2L["2"])
CreditsBtn.Size = UDim2.new(0, 31, 0, 31)
CreditsBtn.Position = UDim2.new(0.91842, 0, 0.87243, 0)
CreditsBtn.Text = "Cr"
CreditsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CreditsBtn.TextScaled = true
CreditsBtn.BorderSizePixel = 0

local creditStroke = Instance.new("UIStroke", CreditsBtn)
creditStroke.Thickness = 3
creditStroke.Color = Color3.fromRGB(255, 15, 255)
creditStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

CreditsBtn.MouseButton1Click:Connect(function() showPage("Cr") end)

-- Оформление вкладки Credits
local creditTitle = Instance.new("TextLabel", Cr)
creditTitle.Size = UDim2.new(1, 0, 0, 40)
creditTitle.Position = UDim2.new(0, 0, 0.1, 0)
creditTitle.BackgroundTransparency = 1
creditTitle.TextColor3 = Color3.fromRGB(255, 0, 235)
creditTitle.TextSize = 24
creditTitle.Text = "CREDITS"
creditTitle.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)

local creditDesc = Instance.new("TextLabel", Cr)
creditDesc.Size = UDim2.new(1, 0, 0, 30)
creditDesc.Position = UDim2.new(0, 0, 0.4, 0)
creditDesc.BackgroundTransparency = 1
creditDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
creditDesc.TextSize = 18
creditDesc.Text = "Developer / User:"

local userLabel = Instance.new("TextLabel", Cr)
userLabel.Size = UDim2.new(1, 0, 0, 40)
userLabel.Position = UDim2.new(0, 0, 0.6, 0)
userLabel.BackgroundTransparency = 1
userLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
userLabel.TextSize = 22
userLabel.Text = LocalPlayer.Name
userLabel.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)

-- По умолчанию при запуске открываем Page 1
showPage("P1")

return G2L["1"]
