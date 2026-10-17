-- Сгенерированный и полностью оживленный код GUI DNG
local DNG = Instance.new("ScreenGui")
-- Безопасная инициализация интерфейса для читов (чтобы не ломалось при перезаходе)
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("DNG") then CoreGui.DNG:Destroy() end
DNG.Name = "DNG"
DNG.Parent = CoreGui
DNG.ResetOnSpawn = false

local Holder = Instance.new("Frame")
Holder.Name = "Holder"
Holder.Size = UDim2.new(0, 380, 0, 243)
Holder.Position = UDim2.new(0.435, 0, 0.246, 0)
Holder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Holder.BorderSizePixel = 0
Holder.Visible = true
Holder.Parent = DNG

-- Делаем меню перетаскиваемым мышкой (актуально для читов)
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    Holder.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
Holder.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true dragStart = input.Position startPos = Holder.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
Holder.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseBehavior or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input) if input == dragInput and dragging then update(input) end end)

local Holder_Stroke = Instance.new("UIStroke")
Holder_Stroke.Color = Color3.fromRGB(255, 255, 255)
Holder_Stroke.Parent = Holder

-- Заголовок меню
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 380, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "DNG"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.BorderSizePixel = 0
Title.Parent = Holder

local Title_Stroke = Instance.new("UIStroke")
Title_Stroke.Color = Color3.fromRGB(50, 50, 50)
Title_Stroke.Parent = Title

-- СОЗДАНИЕ СТРАНИЦ-ВКЛАДОК
local pages = {}

local function createPage(name, isVisible)
    local P = Instance.new("Frame")
    P.Name = name
    P.Size = UDim2.new(0, 361, 0, 156)
    P.Position = UDim2.new(0.021, 0, 0.185, 0)
    P.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    P.BorderSizePixel = 0
    P.Visible = isVisible
    P.Parent = Holder
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(40, 40, 40)
    stroke.Parent = P
    pages[name] = P
    return P
end

local P1 = createPage("P1", false)
local P2 = createPage("P2", false)
local P3 = createPage("P3", false)
local P4 = createPage("P4", false)
local P5 = createPage("P5", false)
local P6 = createPage("P6", false)
local Cr = createPage("Cr", true) -- Стартовая страница (Credits)
local Ex = createPage("Ex", false) -- Вкладка встроенного инжектора

-- Функция для быстрого переключения страниц
local function showPage(pageFrame)
    for _, p in pairs(pages) do p.Visible = false end
    pageFrame.Visible = true
end

-- НАПОЛНЕНИЕ СТРАНИЦЫ КРЕДИТОВ (Cr)
local Hello = Instance.new("TextLabel")
Hello.Size = UDim2.new(0, 100, 0, 34)
Hello.BackgroundTransparency = 1
Hello.TextColor3 = Color3.fromRGB(255, 255, 255)
Hello.Text = "Hello, "
Hello.Font = Enum.Font.SourceSans
Hello.TextSize = 20
Hello.Parent = Cr

local User = Instance.new("TextLabel")
User.Size = UDim2.new(0, 167, 0, 34)
User.Position = UDim2.new(0.25, 0, 0, 0)
User.BackgroundTransparency = 1
User.TextColor3 = Color3.fromRGB(0, 255, 150)
User.Text = game:GetService("Players").LocalPlayer.Name .. "!"
User.Font = Enum.Font.SourceSansBold
User.TextSize = 20
User.Parent = Cr

local Dev = Instance.new("TextLabel")
Dev.Size = UDim2.new(0, 333, 0, 20)
Dev.Position = UDim2.new(0, 0, 0.256, 0)
Dev.BackgroundTransparency = 1
Dev.TextColor3 = Color3.fromRGB(255, 255, 255)
Dev.Text = "Developer of GUI: Dubstep Namaz"
Dev.Font = Enum.Font.SourceSans
Dev.TextSize = 16
Dev.Parent = Cr

local AudioBypass = Instance.new("TextLabel")
AudioBypass.Size = UDim2.new(0, 335, 0, 26)
AudioBypass.Position = UDim2.new(0, 0, 0.384, 0)
AudioBypass.BackgroundTransparency = 1
AudioBypass.TextColor3 = Color3.fromRGB(255, 255, 255)
AudioBypass.Text = "Audio Bypass by: 777ililo"
AudioBypass.Font = Enum.Font.SourceSans
AudioBypass.TextSize = 16
AudioBypass.Parent = Cr

local OpenExecBtn = Instance.new("TextButton")
OpenExecBtn.Size = UDim2.new(0, 344, 0, 35)
OpenExecBtn.Position = UDim2.new(0.025, 0, 0.731, 0)
OpenExecBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
OpenExecBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenExecBtn.Text = "Open Executor"
OpenExecBtn.Font = Enum.Font.SourceSansBold
OpenExecBtn.TextSize = 16
OpenExecBtn.Parent = Cr
local ExecBtn_Stroke = Instance.new("UIStroke")
ExecBtn_Stroke.Color = Color3.fromRGB(100, 100, 100)
ExecBtn_Stroke.Parent = OpenExecBtn
OpenExecBtn.MouseButton1Click:Connect(function() showPage(Ex) end)

-- НАПОЛНЕНИЕ СТРАНИЦЫ ВНУТРЕННЕГО ЭКСПЛОЙТА (Ex)
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0, 346, 0, 97)
TextBox.Position = UDim2.new(0.021, 0, 0.038, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TextBox.TextColor3 = Color3.fromRGB(255, 43, 237)
TextBox.Text = ""
TextBox.ClearTextOnFocus = false
TextBox.MultiLine = true
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 14
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.PlaceholderText = "Type there ur stupid script"
TextBox.Parent = Ex
local Box_Stroke = Instance.new("UIStroke")
Box_Stroke.Color = Color3.fromRGB(255, 43, 237)
Box_Stroke.Parent = TextBox

local ClearBtn = Instance.new("TextButton")
ClearBtn.Size = UDim2.new(0, 166, 0, 35)
ClearBtn.Position = UDim2.new(0.522, 0, 0.735, 0)
ClearBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ClearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearBtn.Text = "Clear"
ClearBtn.Font = Enum.Font.SourceSans
ClearBtn.TextSize = 16
ClearBtn.Parent = Ex
local Clear_Str = Instance.new("UIStroke")
Clear_Str.Parent = ClearBtn
ClearBtn.MouseButton1Click:Connect(function() TextBox.Text = "" end)

local ExecuteBtn = Instance.new("TextButton")
ExecuteBtn.Size = UDim2.new(0, 174, 0, 35)
ExecuteBtn.Position = UDim2.new(0.021, 0, 0.735, 0)
ExecuteBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ExecuteBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
ExecuteBtn.Text = "Execute"
ExecuteBtn.Font = Enum.Font.SourceSansBold
ExecuteBtn.TextSize = 16
ExecuteBtn.Parent = Ex
local Exec_Str = Instance.new("UIStroke")
Exec_Str.Color = Color3.fromRGB(0, 255, 0)
Exec_Str.Parent = ExecuteBtn
ExecuteBtn.MouseButton1Click:Connect(function()
    local c = TextBox.Text
    if c ~= "" then
        local success, err = pcall(function()
            local func = loadstring(c)
            if func then func() else warn("Ошибка компиляции кода!") end
        end)
        if not success then warn("Ошибка выполнения: " .. tostring(err)) end
    end
end)

-- СОЗДАНИЕ КНОПОК НАВИГАЦИИ (Переключение вкладок)
local function createNavButton(name, text, pos, targetPage)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 50, 0, 31)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    btn.Parent = Holder
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(80, 80, 80)
    stroke.Parent = btn
    btn.MouseButton1Click:Connect(function() showPage(targetPage) end)
    return btn
end

createNavButton("Page1", "Page 1", UDim2.new(0, 0, 0.872, 0), P1)
createNavButton("Page2", "Page 2", UDim2.new(0.152, 0, 0.872, 0), P2)
createNavButton("Page3", "Page 3", UDim2.new(0.305, 0, 0.872, 0), P3)
createNavButton("Page4", "Page 4", UDim2.new(0.457, 0, 0.872, 0), P4)
createNavButton("Page5", "Page 5", UDim2.new(0.613, 0, 0.872, 0), P5)
createNavButton("Page6", "Page 6", UDim2.new(0.765, 0, 0.872, 0), P6)
createNavButton("Credits", "Creds", UDim2.new(0.918, 0, 0.872, 0), Cr)

-- СОЗДАНИЕ КНОПОК ФУНКЦИЙ НА СТРАНИЦЕ 1 (Для примера)
local function createHackButton(parent, text, pos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 107, 0, 35)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 14
    btn.Parent = parent
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(60, 60, 60)
    stroke.Parent = btn
    if callback then btn.MouseButton1Click:Connect(callback) end
    return btn
end

-- Пример привязки функции к кнопке Particles на Page 1
createHackButton(P1, "Particles", UDim2.new(0.013, 0, 0.054, 0), function()
    print("Вы нажали на Particles! Чит активирован.")
    -- Сюда вы будете вставлять скрипты функций
end)

createHackButton(P1, "Decal spam", UDim2.new(0.353, 0, 0.053, 0))
createHackButton(P1, "Team spam", UDim2.new(0.696, 0, 0.053, 0))
