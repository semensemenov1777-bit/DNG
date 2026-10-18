local LocalScript = Instance.new("LocalScript")
LocalScript.Source = '-- DNG_OriginalStyle_LocalScript.lua
-- Put this LocalScript in StarterPlayer > StarterPlayerScripts.
-- Recreates the screenshot's black background, magenta outlines, white headers.
-- Navigation, dragging, credits/info, and status feedback work. Executor/destructive
-- actions are intentionally not implemented; they need legitimate game-side logic.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local previous = playerGui:FindFirstChild("DNG")
if previous then previous:Destroy() end

local PINK = Color3.fromRGB(249, 36, 255)
local BLACK = Color3.fromRGB(7, 7, 7)
local WHITE = Color3.fromRGB(245, 245, 245)
local GREY = Color3.fromRGB(190, 190, 190)
local FONT = Enum.Font.SourceSans

local function make(className, props, parent)
	local obj = Instance.new(className)
	for key, value in pairs(props or {}) do obj[key] = value end
	obj.Parent = parent
	return obj
end
local function stroke(obj, thickness)
	return make("UIStroke", {Color=PINK, Thickness=thickness or 1,
		ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
		LineJoinMode=Enum.LineJoinMode.Miter}, obj)
end
local function textLabel(parent, text, size, pos, fontSize, color)
	return make("TextLabel", {BackgroundTransparency=1, BorderSizePixel=0,
		Text=text, TextColor3=color or WHITE, Font=FONT, TextSize=fontSize or 14,
		TextWrapped=true, Size=size, Position=pos}, parent)
end
local function textButton(parent, text, size, pos, fontSize, color)
	local b = make("TextButton", {BackgroundColor3=BLACK, BorderSizePixel=0,
		Text=text, TextColor3=color or PINK, Font=Enum.Font.SourceSansBold,
		TextSize=fontSize or 14, TextWrapped=true, AutoButtonColor=true,
		Size=size, Position=pos}, parent)
	stroke(b, 1)
	return b
end

local gui = make("ScreenGui", {Name="DNG", ResetOnSpawn=false,
	IgnoreGuiInset=true, ZIndexBehavior=Enum.ZIndexBehavior.Sibling}, playerGui)
local status = textLabel(gui, "Ready", UDim2.fromOffset(500, 20),
	UDim2.new(0.5, -250, 1, -24), 14, GREY)
status.Name = "DNGStatus"
local function setStatus(s) if status.Parent then status.Text = s end end

-- Left compact panel, matching the reference screenshot.
local left = make("Frame", {Name="Holder", BackgroundColor3=BLACK,
	BorderSizePixel=0, Size=UDim2.fromOffset(392, 303),
	Position=UDim2.new(0.055, 0, 0.11, 0), Active=true}, gui)
stroke(left, 2)
textLabel(left, "DNG", UDim2.new(1,0,0,32), UDim2.new(0,0,0,5), 21, WHITE)
textLabel(left, "DNG • UI demo", UDim2.new(1,0,0,20), UDim2.new(0,0,0,43), 13, GREY)
local content = make("Frame", {Name="PageContent", BackgroundTransparency=1,
	Position=UDim2.fromOffset(18,78), Size=UDim2.new(1,-36,1,-112)}, left)
local pageLabel = textLabel(left, "Page 1", UDim2.new(1,0,0,18),
	UDim2.new(0,0,0,65), 12, GREY)
pageLabel.Visible = false

local pageItems = {
	[1]={"Particles","Decal","Message","Chat","Burn all","Screamer"},
	[2]={"Decal spam","Team spam","Message","Chat spam","Hint","Billboard"},
	[3]={"Animated Skybox","Skeletons","Avatar preview","Particles","Decal","Message"},
	[4]={"Info","Credits","UI status"},
	[5]={"Theme preview","Reset page","Close UI"},
	[6]={"About DNG","Credits","Close UI"},
}
local currentPage = 1
local leftButtons, pageButtons = {}, {}
local showPage
local function clearButtons()
	for _, b in ipairs(leftButtons) do b:Destroy() end
	table.clear(leftButtons)
end
local function actionFor(name)
	if name == "Close UI" then gui:Destroy()
	elseif name == "Reset page" then showPage(1)
	elseif name == "Info" or name == "About DNG" then setStatus("DNG • UI demo • black/magenta theme")
	elseif name == "Credits" then setStatus("DNG UI demo • Credits")
	elseif name == "UI status" then setStatus("UI loaded • Page " .. currentPage)
	elseif name == "Theme preview" then setStatus("Theme: black background, magenta borders, white text")
	else setStatus(name .. " — no game action is configured") end
end
showPage = function(page)
	currentPage = math.clamp(page, 1, 6)
	pageLabel.Text = "Page " .. currentPage
	clearButtons()
	for i, name in ipairs(pageItems[currentPage]) do
		local col = (i-1)%3
		local row = math.floor((i-1)/3)
		local b = textButton(content, name,
			UDim2.new(1/3,-8,0,42), UDim2.new(col/3, col==0 and 0 or 4, 0, row*47), 14)
		table.insert(leftButtons, b)
		b.Activated:Connect(function() actionFor(name) end)
	end
	for i, b in ipairs(pageButtons) do b.TextColor3 = (i==currentPage) and WHITE or PINK end
	setStatus("Page " .. currentPage)
end
for i=1,6 do
	local b = textButton(left, "Page "..i, UDim2.fromOffset(57,20),
		UDim2.new(0, 61+(i-1)*61, 1, -24), 11)
	b.Name = "Page "..i
	table.insert(pageButtons,b)
	b.Activated:Connect(function() showPage(i) end)
end
local info = textButton(left, "Info", UDim2.fromOffset(42,20),
	UDim2.new(0,12,1,-24), 11)
info.Activated:Connect(function() setStatus("DNG • UI demo") end)

-- Right framed panel from the screenshots.
local right = make("Frame", {Name="DNGMainPanel", BackgroundColor3=BLACK,
	BorderSizePixel=0, Size=UDim2.fromOffset(390,250),
	Position=UDim2.new(0.49,0,0.115,0), Active=true}, gui)
stroke(right,4)
local header = textLabel(right,"DNG",UDim2.new(1,-4,0,36),UDim2.new(0,2,0,1),36,WHITE)
header.BackgroundColor3=BLACK
header.BackgroundTransparency=0
stroke(header,2)
local inner = make("Frame",{Name="Inner",BackgroundColor3=BLACK,BorderSizePixel=0,
	Position=UDim2.fromOffset(8,43),Size=UDim2.new(1,-16,1,-83)},right)
stroke(inner,2)
textLabel(inner,"Hello,   pote whiz",UDim2.new(1,-12,0,34),UDim2.new(0,6,0,4),26,WHITE)
textLabel(inner,"Developer of GUI: Dubstep Namaz",UDim2.new(1,-12,0,24),UDim2.new(0,6,0,40),16,WHITE)
textLabel(inner,"Audio Bypass by: 777ikilo",UDim2.new(1,-12,0,24),UDim2.new(0,6,0,62),19,WHITE)
local executor = make("TextButton",{Name="Executor",BackgroundColor3=BLACK,BorderSizePixel=0,
	Text="Executor",TextColor3=WHITE,Font=FONT,TextSize=26,
	Size=UDim2.new(1,-16,0,38),Position=UDim2.new(0,8,1,-43),AutoButtonColor=true},inner)
stroke(executor,1)
executor.Activated:Connect(function()
	setStatus("Executor is not available in a normal Roblox Studio LocalScript")
end)
local rightPages = make("Frame",{Name="RightPageButtons",BackgroundTransparency=1,
	Position=UDim2.new(0,4,1,-35),Size=UDim2.new(1,-8,0,31)},right)
make("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,
	HorizontalAlignment=Enum.HorizontalAlignment.Center,
	VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,
	Padding=UDim.new(0,3)},rightPages)
for i=1,6 do
	local b=make("TextButton",{Name="Page "..i,BackgroundColor3=BLACK,BorderSizePixel=0,
		Text="Page "..i,TextColor3=WHITE,Font=FONT,TextSize=16,
		Size=UDim2.new(0,54,1,0),LayoutOrder=i,AutoButtonColor=true},rightPages)
	stroke(b,2)
	b.Activated:Connect(function() showPage(i) end)
end
local credits=make("TextButton",{Name="Credits",BackgroundColor3=BLACK,BorderSizePixel=0,
	Text="Credits",TextColor3=WHITE,Font=FONT,TextSize=10,
	Size=UDim2.new(0,38,1,0),LayoutOrder=7,AutoButtonColor=true},rightPages)
stroke(credits,1)
credits.Activated:Connect(function() setStatus("DNG UI demo • Credits") end)

-- Drag windows by their headers/background; supports mouse and touch.
local function draggable(frame, handle)
	local dragging, startInput, startPos = false, nil, nil
	handle.InputBegan:Connect(function(input)
		if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
			dragging=true; startInput=input.Position; startPos=frame.Position
			input.Changed:Connect(function()
				if input.UserInputState==Enum.UserInputState.End then dragging=false end
			end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
			local d=input.Position-startInput
			frame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
		end
	end)
end
draggable(left,left)
draggable(right,header)
showPage(1)
setStatus("Ready • Page 1")
'
LocalScript.Parent = game.StarterPlayer.StarterPlayerScripts
