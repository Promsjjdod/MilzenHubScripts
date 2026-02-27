--[[
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║          ███╗   ███╗██╗██╗     ███████╗███████╗███╗   ██╗        ║
║          ████╗ ████║██║██║     ╚══███╔╝██╔════╝████╗  ██║        ║
║          ██╔████╔██║██║██║       ███╔╝ █████╗  ██╔██╗ ██║        ║
║          ██║╚██╔╝██║██║██║      ███╔╝  ██╔══╝  ██║╚██╗██║        ║
║          ██║ ╚═╝ ██║██║███████╗███████╗███████╗██║ ╚████║        ║
║          ╚═╝     ╚═╝╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═══╝        ║
║                                                                  ║
║              SMART SERVER ANALYZER — PREMIUM HUB                 ║
║         Desarrollado con dedicación para Delta Executor           ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝

	Nombre:        Milzen Hub — Smart Server Analyzer
	Versión:       3.0.0 PREMIUM
	Motor:         Luau Optimizado
	Compatibilidad: Delta Executor / Mayoría de juegos Roblox
	
	Créditos:
		Credits     = "Desarrollado con dedicación para Delta Executor"
		Status      = "✅ Activo y Funcionando"
		Description = "Analizador inteligente de servidores en tiempo real"
	
	Arquitectura:
		- Módulo 1: Configuración Global
		- Módulo 2: Cache Inteligente
		- Módulo 3: Sistema de Logs
		- Módulo 4: Motor de UI Premium
		- Módulo 5: Server Health Monitor
		- Módulo 6: Admin Detector Inteligente
		- Módulo 7: Anti-Cheat Risk Scanner
		- Módulo 8: Smart Recommendation Engine
		- Módulo 9: Performance Optimizer
		- Módulo 10: Sistema de Notificaciones Toast
		- Módulo 11: Orquestador Principal
--]]

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 1: CONFIGURACIÓN GLOBAL                    ║
-- ╚══════════════════════════════════════════════════════════════╝

local CONFIG = {
	-- === Información del Hub ===
	HUB_NAME = "Milzen Hub",
	HUB_SUBTITLE = "Smart Server Analyzer",
	VERSION = "3.0.0",
	CREDITS = "Desarrollado con dedicación para Delta Executor",
	
	-- === Intervalos de Actualización (segundos) ===
	REFRESH_INTERVAL = 3,           -- Intervalo principal de análisis
	UI_UPDATE_INTERVAL = 1,         -- Actualización visual de métricas
	ADMIN_SCAN_INTERVAL = 10,       -- Escaneo de admins
	ANTICHEAT_SCAN_INTERVAL = 15,   -- Escaneo anti-cheat
	CACHE_LIFETIME = 5,             -- Tiempo de vida del caché
	
	-- === Umbrales de Rendimiento ===
	PING_THRESHOLDS = {
		GOOD = 80,      -- ms — por debajo es verde
		MEDIUM = 150,   -- ms — por debajo es amarillo
		-- Por encima es rojo
	},
	FPS_THRESHOLDS = {
		GOOD = 50,      -- Por encima es verde
		MEDIUM = 30,    -- Por encima es amarillo
		-- Por debajo es rojo
	},
	PLAYER_THRESHOLDS = {
		LOW = 10,       -- Pocos jugadores
		MEDIUM = 25,    -- Cantidad media
		-- Por encima es servidor lleno
	},
	
	-- === Umbrales de Recomendación ===
	RECOMMENDATION = {
		OPTIMAL_MIN_SCORE = 75,     -- Puntuación mínima para "Óptimo"
		ACCEPTABLE_MIN_SCORE = 45,  -- Puntuación mínima para "Aceptable"
		-- Por debajo es "Cambiar servidor"
	},
	
	-- === Tema Visual Premium ===
	THEME = {
		-- Colores principales
		BACKGROUND_PRIMARY = Color3.fromRGB(15, 15, 23),
		BACKGROUND_SECONDARY = Color3.fromRGB(22, 22, 35),
		BACKGROUND_TERTIARY = Color3.fromRGB(30, 30, 48),
		SURFACE = Color3.fromRGB(38, 38, 58),
		SURFACE_HOVER = Color3.fromRGB(48, 48, 72),
		
		-- Acentos
		ACCENT_PRIMARY = Color3.fromRGB(108, 92, 231),
		ACCENT_SECONDARY = Color3.fromRGB(162, 155, 254),
		ACCENT_GLOW = Color3.fromRGB(130, 120, 255),
		
		-- Estados
		SUCCESS = Color3.fromRGB(0, 209, 178),
		WARNING = Color3.fromRGB(255, 193, 7),
		DANGER = Color3.fromRGB(255, 71, 87),
		INFO = Color3.fromRGB(72, 152, 255),
		
		-- Texto
		TEXT_PRIMARY = Color3.fromRGB(240, 240, 255),
		TEXT_SECONDARY = Color3.fromRGB(160, 160, 190),
		TEXT_MUTED = Color3.fromRGB(100, 100, 130),
		
		-- Bordes
		BORDER = Color3.fromRGB(55, 55, 80),
		BORDER_ACCENT = Color3.fromRGB(108, 92, 231),
		
		-- Dimensiones
		CORNER_RADIUS = UDim.new(0, 10),
		CORNER_RADIUS_SMALL = UDim.new(0, 6),
		CORNER_RADIUS_LARGE = UDim.new(0, 14),
		
		-- Fuentes
		FONT_BOLD = Enum.Font.GothamBold,
		FONT_SEMIBOLD = Enum.Font.GothamSemibold,
		FONT_REGULAR = Enum.Font.Gotham,
		FONT_MEDIUM = Enum.Font.GothamMedium,
	},
	
	-- === Animaciones ===
	ANIM = {
		DURATION_FAST = 0.2,
		DURATION_NORMAL = 0.35,
		DURATION_SLOW = 0.5,
		STYLE = Enum.EasingStyle.Quint,
		DIRECTION = Enum.EasingDirection.Out,
	},
	
	-- === UI Dimensiones ===
	UI_SIZE = {
		MAIN_WIDTH = 520,
		MAIN_HEIGHT = 420,
		SIDEBAR_WIDTH = 170,
		HEADER_HEIGHT = 45,
		TOAST_WIDTH = 300,
		TOAST_HEIGHT = 50,
		MINIMIZED_WIDTH = 180,
		MINIMIZED_HEIGHT = 38,
	},
	
	-- === Admin Detection ===
	ADMIN_KEYWORDS = {
		"admin", "mod", "moderator", "staff", "owner", "dev",
		"developer", "manager", "supervisor", "helper", "support",
		"gamemaster", "gm", "creator", "founder", "lead",
	},
	ADMIN_GROUP_IDS = {
		-- IDs de grupos conocidos de moderación de Roblox
		-- Se pueden agregar más según necesidad
	},
	
	-- === Anti-Cheat Patterns ===
	ANTICHEAT_REMOTE_KEYWORDS = {
		"anticheat", "anti_cheat", "ac_", "detect", "validate",
		"verify", "security", "protection", "guard", "shield",
		"ban", "kick", "report", "check", "monitor", "scan",
		"integrity", "heartbeat", "pulse", "watchdog",
	},
	ANTICHEAT_SCRIPT_PATTERNS = {
		"AntiCheat", "AntiExploit", "SecurityScript",
		"ServerValidation", "Watchdog", "IntegrityCheck",
	},
	
	-- === Performance Optimizer ===
	OPTIMIZER = {
		REMOVE_PARTICLES = true,
		REDUCE_QUALITY = true,
		CLEAN_TERRAIN_DECOR = false,  -- Más agresivo
	},
	
	-- === Notificaciones ===
	MAX_TOASTS = 4,
	TOAST_DURATION = 4,
	
	-- === Logs ===
	MAX_LOG_ENTRIES = 100,
}

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 2: SERVICIOS Y REFERENCIAS                 ║
-- ╚══════════════════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local GroupService = game:GetService("GroupService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 3: SISTEMA ANTI-DUPLICADO                  ║
-- ╚══════════════════════════════════════════════════════════════╝

-- Eliminar instancias previas del hub para evitar duplicados
local UNIQUE_ID = "MilzenHub_SmartServerAnalyzer_v3"

local function CleanPreviousInstances()
	pcall(function()
		-- Buscar en CoreGui
		for _, child in ipairs(CoreGui:GetChildren()) do
			if child.Name == UNIQUE_ID then
				child:Destroy()
			end
		end
		-- Buscar en PlayerGui como fallback
		if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
			for _, child in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
				if child.Name == UNIQUE_ID then
					child:Destroy()
				end
			end
		end
	end)
end

CleanPreviousInstances()

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 4: CACHE INTELIGENTE                       ║
-- ╚══════════════════════════════════════════════════════════════╝

local CacheSystem = {}
CacheSystem.__index = CacheSystem

function CacheSystem.new()
	local self = setmetatable({}, CacheSystem)
	self._store = {}
	self._timestamps = {}
	self._hitCount = 0
	self._missCount = 0
	return self
end

-- Obtener valor del caché con verificación de expiración
function CacheSystem:Get(key)
	local timestamp = self._timestamps[key]
	if timestamp and (tick() - timestamp) < CONFIG.CACHE_LIFETIME then
		self._hitCount = self._hitCount + 1
		return self._store[key], true
	end
	self._missCount = self._missCount + 1
	return nil, false
end

-- Almacenar valor en caché
function CacheSystem:Set(key, value)
	self._store[key] = value
	self._timestamps[key] = tick()
end

-- Invalidar una entrada específica
function CacheSystem:Invalidate(key)
	self._store[key] = nil
	self._timestamps[key] = nil
end

-- Limpiar todo el caché
function CacheSystem:Clear()
	self._store = {}
	self._timestamps = {}
end

-- Obtener estadísticas del caché
function CacheSystem:GetStats()
	local total = self._hitCount + self._missCount
	return {
		Hits = self._hitCount,
		Misses = self._missCount,
		HitRate = total > 0 and math.floor((self._hitCount / total) * 100) or 0,
		Entries = 0, -- Calculado abajo
	}
end

-- Instancia global de caché
local Cache = CacheSystem.new()

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 5: SISTEMA DE LOGS INTERNO                 ║
-- ╚══════════════════════════════════════════════════════════════╝

local LogSystem = {}
LogSystem.__index = LogSystem

function LogSystem.new()
	local self = setmetatable({}, LogSystem)
	self._entries = {}
	self._maxEntries = CONFIG.MAX_LOG_ENTRIES
	return self
end

function LogSystem:Add(level, module, message)
	local entry = {
		Time = os.date("%H:%M:%S"),
		Timestamp = tick(),
		Level = level,        -- "INFO", "WARN", "ERROR", "DEBUG"
		Module = module,
		Message = message,
	}
	table.insert(self._entries, entry)
	
	-- Limitar cantidad de logs
	if #self._entries > self._maxEntries then
		table.remove(self._entries, 1)
	end
end

function LogSystem:Info(module, message)
	self:Add("INFO", module, message)
end

function LogSystem:Warn(module, message)
	self:Add("WARN", module, message)
end

function LogSystem:Error(module, message)
	self:Add("ERROR", module, message)
end

function LogSystem:Debug(module, message)
	self:Add("DEBUG", module, message)
end

function LogSystem:GetRecent(count)
	count = count or 10
	local result = {}
	local startIdx = math.max(1, #self._entries - count + 1)
	for i = startIdx, #self._entries do
		table.insert(result, self._entries[i])
	end
	return result
end

function LogSystem:Clear()
	self._entries = {}
end

-- Instancia global de logs
local Logger = LogSystem.new()

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 6: UTILIDADES DE UI                        ║
-- ╚══════════════════════════════════════════════════════════════╝

local UIUtils = {}

-- Crear TweenInfo reutilizable
function UIUtils.TweenInfo(duration, style, direction)
	return TweenInfo.new(
		duration or CONFIG.ANIM.DURATION_NORMAL,
		style or CONFIG.ANIM.STYLE,
		direction or CONFIG.ANIM.DIRECTION
	)
end

-- Animar propiedad con tween
function UIUtils.Tween(instance, properties, duration, callback)
	if not instance or not instance.Parent then return end
	local tweenInfo = UIUtils.TweenInfo(duration)
	local tween = TweenService:Create(instance, tweenInfo, properties)
	if callback then
		tween.Completed:Connect(callback)
	end
	tween:Play()
	return tween
end

-- Crear esquinas redondeadas
function UIUtils.AddCorner(parent, radius)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = radius or CONFIG.THEME.CORNER_RADIUS
	corner.Parent = parent
	return corner
end

-- Crear stroke (borde)
function UIUtils.AddStroke(parent, color, thickness, transparency)
	local stroke = Instance.new("UIStroke")
	stroke.Color = color or CONFIG.THEME.BORDER
	stroke.Thickness = thickness or 1
	stroke.Transparency = transparency or 0.5
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Parent = parent
	return stroke
end

-- Crear padding
function UIUtils.AddPadding(parent, top, right, bottom, left)
	local padding = Instance.new("UIPadding")
	padding.PaddingTop = UDim.new(0, top or 8)
	padding.PaddingRight = UDim.new(0, right or 8)
	padding.PaddingBottom = UDim.new(0, bottom or 8)
	padding.PaddingLeft = UDim.new(0, left or 8)
	padding.Parent = parent
	return padding
end

-- Crear gradiente
function UIUtils.AddGradient(parent, colorStart, colorEnd, rotation)
	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, colorStart),
		ColorSequenceKeypoint.new(1, colorEnd),
	})
	gradient.Rotation = rotation or 90
	gradient.Parent = parent
	return gradient
end

-- Crear sombra (emulada)
function UIUtils.AddShadow(parent)
	local shadow = Instance.new("ImageLabel")
	shadow.Name = "Shadow"
	shadow.BackgroundTransparency = 1
	shadow.Image = "rbxassetid://6014261993" -- Sombra difusa
	shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	shadow.ImageTransparency = 0.5
	shadow.ScaleType = Enum.ScaleType.Slice
	shadow.SliceCenter = Rect.new(49, 49, 450, 450)
	shadow.Size = UDim2.new(1, 30, 1, 30)
	shadow.Position = UDim2.new(0, -15, 0, -10)
	shadow.ZIndex = parent.ZIndex - 1
	shadow.Parent = parent
	return shadow
end

-- Formatear número con separador
function UIUtils.FormatNumber(n)
	if n >= 1000 then
		return string.format("%.1fK", n / 1000)
	end
	return tostring(math.floor(n))
end

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 7: MOTOR DE UI PREMIUM                     ║
-- ╚══════════════════════════════════════════════════════════════╝

local UIEngine = {}
UIEngine._references = {}    -- Referencias a elementos UI importantes
UIEngine._connections = {}   -- Conexiones para limpieza
UIEngine._isMinimized = false
UIEngine._isCompact = false
UIEngine._screenGui = nil
UIEngine._mainFrame = nil
UIEngine._toastContainer = nil
UIEngine._toasts = {}

-- === Crear la estructura base de UI ===
function UIEngine.Initialize()
	Logger:Info("UIEngine", "Inicializando motor de interfaz premium")
	
	-- ScreenGui principal
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = UNIQUE_ID
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 999
	
	-- Intentar CoreGui primero, fallback a PlayerGui
	local success = pcall(function()
		screenGui.Parent = CoreGui
	end)
	if not success then
		pcall(function()
			screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui", 5)
		end)
	end
	
	UIEngine._screenGui = screenGui
	
	-- Crear contenedor principal con animación de entrada
	UIEngine._BuildMainWindow(screenGui)
	UIEngine._BuildToastContainer(screenGui)
	
	-- Animación de entrada
	UIEngine._PlayEntryAnimation()
	
	Logger:Info("UIEngine", "Interfaz inicializada correctamente")
end

-- === Construir ventana principal ===
function UIEngine._BuildMainWindow(parent)
	-- Marco principal
	local mainFrame = Instance.new("Frame")
	mainFrame.Name = "MainWindow"
	mainFrame.Size = UDim2.new(0, CONFIG.UI_SIZE.MAIN_WIDTH, 0, CONFIG.UI_SIZE.MAIN_HEIGHT)
	mainFrame.Position = UDim2.new(0.5, -CONFIG.UI_SIZE.MAIN_WIDTH / 2, 0.5, -CONFIG.UI_SIZE.MAIN_HEIGHT / 2)
	mainFrame.BackgroundColor3 = CONFIG.THEME.BACKGROUND_PRIMARY
	mainFrame.BorderSizePixel = 0
	mainFrame.ClipsDescendants = true
	mainFrame.Parent = parent
	
	UIUtils.AddCorner(mainFrame, CONFIG.THEME.CORNER_RADIUS_LARGE)
	UIUtils.AddStroke(mainFrame, CONFIG.THEME.ACCENT_PRIMARY, 1.5, 0.6)
	UIUtils.AddShadow(mainFrame)
	
	UIEngine._mainFrame = mainFrame
	
	-- Header (barra superior)
	UIEngine._BuildHeader(mainFrame)
	
	-- Contenedor de contenido (sidebar + panel principal)
	local contentContainer = Instance.new("Frame")
	contentContainer.Name = "ContentContainer"
	contentContainer.Size = UDim2.new(1, 0, 1, -CONFIG.UI_SIZE.HEADER_HEIGHT)
	contentContainer.Position = UDim2.new(0, 0, 0, CONFIG.UI_SIZE.HEADER_HEIGHT)
	contentContainer.BackgroundTransparency = 1
	contentContainer.Parent = mainFrame
	
	UIEngine._references.ContentContainer = contentContainer
	
	-- Sidebar
	UIEngine._BuildSidebar(contentContainer)
	
	-- Panel principal
	UIEngine._BuildMainPanel(contentContainer)
	
	-- Footer sutil
	UIEngine._BuildFooter(mainFrame)
	
	-- Sistema de dragging
	UIEngine._SetupDragging(mainFrame)
end

-- === Construir Header ===
function UIEngine._BuildHeader(parent)
	local header = Instance.new("Frame")
	header.Name = "Header"
	header.Size = UDim2.new(1, 0, 0, CONFIG.UI_SIZE.HEADER_HEIGHT)
	header.Position = UDim2.new(0, 0, 0, 0)
	header.BackgroundColor3 = CONFIG.THEME.BACKGROUND_SECONDARY
	header.BorderSizePixel = 0
	header.Parent = parent
	
	-- Solo redondear esquinas superiores
	UIUtils.AddCorner(header, CONFIG.THEME.CORNER_RADIUS_LARGE)
	
	-- Cubrir esquinas inferiores del header
	local headerBottom = Instance.new("Frame")
	headerBottom.Name = "BottomCover"
	headerBottom.Size = UDim2.new(1, 0, 0, 14)
	headerBottom.Position = UDim2.new(0, 0, 1, -14)
	headerBottom.BackgroundColor3 = CONFIG.THEME.BACKGROUND_SECONDARY
	headerBottom.BorderSizePixel = 0
	headerBottom.Parent = header
	
	-- Línea separadora con gradiente
	local separator = Instance.new("Frame")
	separator.Name = "Separator"
	separator.Size = UDim2.new(1, -20, 0, 1)
	separator.Position = UDim2.new(0, 10, 1, -1)
	separator.BackgroundColor3 = CONFIG.THEME.ACCENT_PRIMARY
	separator.BorderSizePixel = 0
	separator.BackgroundTransparency = 0.6
	separator.Parent = header
	
	UIUtils.AddGradient(separator, CONFIG.THEME.ACCENT_PRIMARY, CONFIG.THEME.ACCENT_SECONDARY, 0)
	
	-- Indicador de punto de color (dot accent)
	local accentDot = Instance.new("Frame")
	accentDot.Name = "AccentDot"
	accentDot.Size = UDim2.new(0, 8, 0, 8)
	accentDot.Position = UDim2.new(0, 14, 0.5, -4)
	accentDot.BackgroundColor3 = CONFIG.THEME.ACCENT_PRIMARY
	accentDot.BorderSizePixel = 0
	accentDot.Parent = header
	UIUtils.AddCorner(accentDot, UDim.new(1, 0))
	
	-- Título del Hub
	local title = Instance.new("TextLabel")
	title.Name = "Title"
	title.Size = UDim2.new(0, 200, 1, 0)
	title.Position = UDim2.new(0, 28, 0, 0)
	title.BackgroundTransparency = 1
	title.Text = CONFIG.HUB_NAME
	title.TextColor3 = CONFIG.THEME.TEXT_PRIMARY
	title.TextSize = 16
	title.Font = CONFIG.THEME.FONT_BOLD
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Parent = header
	
	-- Subtítulo
	local subtitle = Instance.new("TextLabel")
	subtitle.Name = "Subtitle"
	subtitle.Size = UDim2.new(0, 200, 0, 14)
	subtitle.Position = UDim2.new(0, 28, 0.5, 3)
	subtitle.BackgroundTransparency = 1
	subtitle.Text = CONFIG.HUB_SUBTITLE .. " v" .. CONFIG.VERSION
	subtitle.TextColor3 = CONFIG.THEME.TEXT_MUTED
	subtitle.TextSize = 10
	subtitle.Font = CONFIG.THEME.FONT_REGULAR
	subtitle.TextXAlignment = Enum.TextXAlignment.Left
	subtitle.Parent = header
	
	-- Mover título arriba para acomodar subtítulo
	title.Position = UDim2.new(0, 28, 0.5, -12)
	
	-- Botones de control (cerrar, minimizar)
	local btnContainer = Instance.new("Frame")
	btnContainer.Name = "Controls"
	btnContainer.Size = UDim2.new(0, 70, 0, 30)
	btnContainer.Position = UDim2.new(1, -80, 0.5, -15)
	btnContainer.BackgroundTransparency = 1
	btnContainer.Parent = header
	
	-- Botón Minimizar
	local minimizeBtn = Instance.new("TextButton")
	minimizeBtn.Name = "MinimizeBtn"
	minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
	minimizeBtn.Position = UDim2.new(0, 0, 0, 1)
	minimizeBtn.BackgroundColor3 = CONFIG.THEME.SURFACE
	minimizeBtn.BorderSizePixel = 0
	minimizeBtn.Text = "—"
	minimizeBtn.TextColor3 = CONFIG.THEME.TEXT_SECONDARY
	minimizeBtn.TextSize = 14
	minimizeBtn.Font = CONFIG.THEME.FONT_BOLD
	minimizeBtn.AutoButtonColor = false
	minimizeBtn.Parent = btnContainer
	UIUtils.AddCorner(minimizeBtn, CONFIG.THEME.CORNER_RADIUS_SMALL)
	
	-- Hover effect minimizar
	minimizeBtn.MouseEnter:Connect(function()
		UIUtils.Tween(minimizeBtn, {BackgroundColor3 = CONFIG.THEME.WARNING}, CONFIG.ANIM.DURATION_FAST)
		UIUtils.Tween(minimizeBtn, {TextColor3 = CONFIG.THEME.BACKGROUND_PRIMARY}, CONFIG.ANIM.DURATION_FAST)
	end)
	minimizeBtn.MouseLeave:Connect(function()
		UIUtils.Tween(minimizeBtn, {BackgroundColor3 = CONFIG.THEME.SURFACE}, CONFIG.ANIM.DURATION_FAST)
		UIUtils.Tween(minimizeBtn, {TextColor3 = CONFIG.THEME.TEXT_SECONDARY}, CONFIG.ANIM.DURATION_FAST)
	end)
	
	-- Botón Cerrar
	local closeBtn = Instance.new("TextButton")
	closeBtn.Name = "CloseBtn"
	closeBtn.Size = UDim2.new(0, 28, 0, 28)
	closeBtn.Position = UDim2.new(0, 35, 0, 1)
	closeBtn.BackgroundColor3 = CONFIG.THEME.SURFACE
	closeBtn.BorderSizePixel = 0
	closeBtn.Text = "✕"
	closeBtn.TextColor3 = CONFIG.THEME.TEXT_SECONDARY
	closeBtn.TextSize = 13
	closeBtn.Font = CONFIG.THEME.FONT_BOLD
	closeBtn.AutoButtonColor = false
	closeBtn.Parent = btnContainer
	UIUtils.AddCorner(closeBtn, CONFIG.THEME.CORNER_RADIUS_SMALL)
	
	-- Hover effect cerrar
	closeBtn.MouseEnter:Connect(function()
		UIUtils.Tween(closeBtn, {BackgroundColor3 = CONFIG.THEME.DANGER}, CONFIG.ANIM.DURATION_FAST)
		UIUtils.Tween(closeBtn, {TextColor3 = Color3.fromRGB(255, 255, 255)}, CONFIG.ANIM.DURATION_FAST)
	end)
	closeBtn.MouseLeave:Connect(function()
		UIUtils.Tween(closeBtn, {BackgroundColor3 = CONFIG.THEME.SURFACE}, CONFIG.ANIM.DURATION_FAST)
		UIUtils.Tween(closeBtn, {TextColor3 = CONFIG.THEME.TEXT_SECONDARY}, CONFIG.ANIM.DURATION_FAST)
	end)
	
	-- Eventos de los botones
	minimizeBtn.MouseButton1Click:Connect(function()
		UIEngine.ToggleMinimize()
	end)
	
	closeBtn.MouseButton1Click:Connect(function()
		UIEngine.Close()
	end)
	
	UIEngine._references.Header = header
	UIEngine._references.MinimizeBtn = minimizeBtn
	UIEngine._references.CloseBtn = closeBtn
end

-- === Construir Sidebar ===
function UIEngine._BuildSidebar(parent)
	local sidebar = Instance.new("Frame")
	sidebar.Name = "Sidebar"
	sidebar.Size = UDim2.new(0, CONFIG.UI_SIZE.SIDEBAR_WIDTH, 1, -8)
	sidebar.Position = UDim2.new(0, 4, 0, 4)
	sidebar.BackgroundColor3 = CONFIG.THEME.BACKGROUND_SECONDARY
	sidebar.BorderSizePixel = 0
	sidebar.ClipsDescendants = true
	sidebar.Parent = parent
	
	UIUtils.AddCorner(sidebar, CONFIG.THEME.CORNER_RADIUS)
	UIUtils.AddPadding(sidebar, 10, 8, 10, 8)
	
	-- Título de sección
	local sectionTitle = Instance.new("TextLabel")
	sectionTitle.Name = "SectionTitle"
	sectionTitle.Size = UDim2.new(1, 0, 0, 18)
	sectionTitle.Position = UDim2.new(0, 0, 0, 0)
	sectionTitle.BackgroundTransparency = 1
	sectionTitle.Text = "📊 MÉTRICAS"
	sectionTitle.TextColor3 = CONFIG.THEME.ACCENT_SECONDARY
	sectionTitle.TextSize = 11
	sectionTitle.Font = CONFIG.THEME.FONT_BOLD
	sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
	sectionTitle.Parent = sidebar
	
	-- Contenedor de métricas con scroll
	local metricsContainer = Instance.new("Frame")
	metricsContainer.Name = "MetricsContainer"
	metricsContainer.Size = UDim2.new(1, 0, 1, -25)
	metricsContainer.Position = UDim2.new(0, 0, 0, 25)
	metricsContainer.BackgroundTransparency = 1
	metricsContainer.Parent = sidebar
	
	local listLayout = Instance.new("UIListLayout")
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout.Padding = UDim.new(0, 6)
	listLayout.Parent = metricsContainer
	
	-- Tarjetas de métricas
	local metricCards = {
		{Name = "Ping", Icon = "🌐", Unit = "ms", LayoutOrder = 1, Key = "PingCard"},
		{Name = "FPS", Icon = "⚡", Unit = "", LayoutOrder = 2, Key = "FPSCard"},
		{Name = "Jugadores", Icon = "👥", Unit = "", LayoutOrder = 3, Key = "PlayersCard"},
		{Name = "Admin", Icon = "🛡️", Unit = "", LayoutOrder = 4, Key = "AdminCard"},
		{Name = "Anti-Cheat", Icon = "🔒", Unit = "", LayoutOrder = 5, Key = "ACCard"},
	}
	
	for _, cardData in ipairs(metricCards) do
		local card = UIEngine._CreateMetricCard(cardData, metricsContainer)
		UIEngine._references[cardData.Key] = card
	end
	
	-- Toggle Modo Compacto
	local compactToggle = UIEngine._CreateToggle("Modo Compacto", "📐", metricsContainer, 6)
	compactToggle.Callback = function(enabled)
		UIEngine._isCompact = enabled
		UIEngine._ApplyCompactMode(enabled)
	end
	UIEngine._references.CompactToggle = compactToggle
	
	-- Toggle Performance Optimizer
	local perfToggle = UIEngine._CreateToggle("FPS Boost", "🚀", metricsContainer, 7)
	perfToggle.Callback = function(enabled)
		if enabled then
			PerformanceOptimizer.Enable()
		else
			PerformanceOptimizer.Disable()
		end
	end
	UIEngine._references.PerfToggle = perfToggle
	
	UIEngine._references.Sidebar = sidebar
	UIEngine._references.MetricsContainer = metricsContainer
end

-- === Crear tarjeta de métrica individual ===
function UIEngine._CreateMetricCard(data, parent)
	local card = Instance.new("Frame")
	card.Name = data.Key or data.Name
	card.Size = UDim2.new(1, 0, 0, 42)
	card.BackgroundColor3 = CONFIG.THEME.BACKGROUND_TERTIARY
	card.BorderSizePixel = 0
	card.LayoutOrder = data.LayoutOrder
	card.Parent = parent
	
	UIUtils.AddCorner(card, CONFIG.THEME.CORNER_RADIUS_SMALL)
	UIUtils.AddPadding(card, 6, 8, 6, 8)
	
	-- Icono
	local icon = Instance.new("TextLabel")
	icon.Name = "Icon"
	icon.Size = UDim2.new(0, 20, 0, 20)
	icon.Position = UDim2.new(0, 0, 0, 2)
	icon.BackgroundTransparency = 1
	icon.Text = data.Icon
	icon.TextSize = 14
	icon.Parent = card
	
	-- Nombre de la métrica
	local label = Instance.new("TextLabel")
	label.Name = "Label"
	label.Size = UDim2.new(1, -25, 0, 12)
	label.Position = UDim2.new(0, 24, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = data.Name
	label.TextColor3 = CONFIG.THEME.TEXT_SECONDARY
	label.TextSize = 10
	label.Font = CONFIG.THEME.FONT_MEDIUM
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = card
	
	-- Valor
	local value = Instance.new("TextLabel")
	value.Name = "Value"
	value.Size = UDim2.new(1, -25, 0, 16)
	value.Position = UDim2.new(0, 24, 0, 13)
	value.BackgroundTransparency = 1
	value.Text = "..."
	value.TextColor3 = CONFIG.THEME.TEXT_PRIMARY
	value.TextSize = 13
	value.Font = CONFIG.THEME.FONT_BOLD
	value.TextXAlignment = Enum.TextXAlignment.Left
	value.Parent = card
	
	-- Indicador de estado (pequeño punto de color)
	local statusDot = Instance.new("Frame")
	statusDot.Name = "StatusDot"
	statusDot.Size = UDim2.new(0, 6, 0, 6)
	statusDot.Position = UDim2.new(1, -6, 0, 3)
	statusDot.BackgroundColor3 = CONFIG.THEME.TEXT_MUTED
	statusDot.BorderSizePixel = 0
	statusDot.Parent = card
	UIUtils.AddCorner(statusDot, UDim.new(1, 0))
	
	return {
		Frame = card,
		Label = label,
		Value = value,
		StatusDot = statusDot,
		Icon = icon,
		Unit = data.Unit,
	}
end

-- === Crear Toggle Button ===
function UIEngine._CreateToggle(name, icon, parent, layoutOrder)
	local toggle = Instance.new("Frame")
	toggle.Name = "Toggle_" .. name
	toggle.Size = UDim2.new(1, 0, 0, 32)
	toggle.BackgroundColor3 = CONFIG.THEME.BACKGROUND_TERTIARY
	toggle.BorderSizePixel = 0
	toggle.LayoutOrder = layoutOrder
	toggle.Parent = parent
	
	UIUtils.AddCorner(toggle, CONFIG.THEME.CORNER_RADIUS_SMALL)
	UIUtils.AddPadding(toggle, 4, 8, 4, 8)
	
	-- Icono + Texto
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -40, 1, 0)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = icon .. " " .. name
	label.TextColor3 = CONFIG.THEME.TEXT_SECONDARY
	label.TextSize = 10
	label.Font = CONFIG.THEME.FONT_MEDIUM
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = toggle
	
	-- Switch visual
	local switchBg = Instance.new("Frame")
	switchBg.Name = "SwitchBg"
	switchBg.Size = UDim2.new(0, 30, 0, 16)
	switchBg.Position = UDim2.new(1, -30, 0.5, -8)
	switchBg.BackgroundColor3 = CONFIG.THEME.SURFACE
	switchBg.BorderSizePixel = 0
	switchBg.Parent = toggle
	UIUtils.AddCorner(switchBg, UDim.new(1, 0))
	
	local switchKnob = Instance.new("Frame")
	switchKnob.Name = "Knob"
	switchKnob.Size = UDim2.new(0, 12, 0, 12)
	switchKnob.Position = UDim2.new(0, 2, 0.5, -6)
	switchKnob.BackgroundColor3 = CONFIG.THEME.TEXT_MUTED
	switchKnob.BorderSizePixel = 0
	switchKnob.Parent = switchBg
	UIUtils.AddCorner(switchKnob, UDim.new(1, 0))
	
	-- Botón clickeable invisible
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.Parent = toggle
	
	local isEnabled = false
	local toggleData = {
		Frame = toggle,
		Enabled = false,
		Callback = nil,
	}
	
	btn.MouseButton1Click:Connect(function()
		isEnabled = not isEnabled
		toggleData.Enabled = isEnabled
		
		if isEnabled then
			UIUtils.Tween(switchBg, {BackgroundColor3 = CONFIG.THEME.ACCENT_PRIMARY}, CONFIG.ANIM.DURATION_FAST)
			UIUtils.Tween(switchKnob, {
				Position = UDim2.new(1, -14, 0.5, -6),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			}, CONFIG.ANIM.DURATION_FAST)
			UIUtils.Tween(label, {TextColor3 = CONFIG.THEME.TEXT_PRIMARY}, CONFIG.ANIM.DURATION_FAST)
		else
			UIUtils.Tween(switchBg, {BackgroundColor3 = CONFIG.THEME.SURFACE}, CONFIG.ANIM.DURATION_FAST)
			UIUtils.Tween(switchKnob, {
				Position = UDim2.new(0, 2, 0.5, -6),
				BackgroundColor3 = CONFIG.THEME.TEXT_MUTED,
			}, CONFIG.ANIM.DURATION_FAST)
			UIUtils.Tween(label, {TextColor3 = CONFIG.THEME.TEXT_SECONDARY}, CONFIG.ANIM.DURATION_FAST)
		end
		
		if toggleData.Callback then
			pcall(toggleData.Callback, isEnabled)
		end
	end)
	
	return toggleData
end

-- === Construir Panel Principal ===
function UIEngine._BuildMainPanel(parent)
	local panel = Instance.new("Frame")
	panel.Name = "MainPanel"
	panel.Size = UDim2.new(1, -(CONFIG.UI_SIZE.SIDEBAR_WIDTH + 12), 1, -8)
	panel.Position = UDim2.new(0, CONFIG.UI_SIZE.SIDEBAR_WIDTH + 8, 0, 4)
	panel.BackgroundColor3 = CONFIG.THEME.BACKGROUND_SECONDARY
	panel.BorderSizePixel = 0
	panel.ClipsDescendants = true
	panel.Parent = parent
	
	UIUtils.AddCorner(panel, CONFIG.THEME.CORNER_RADIUS)
	UIUtils.AddPadding(panel, 12, 12, 12, 12)
	
	-- Layout vertical
	local layout = Instance.new("UIListLayout")
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Padding = UDim.new(0, 8)
	layout.Parent = panel
	
	-- === Tarjeta de Estado del Servidor ===
	local statusCard = UIEngine._BuildStatusCard(panel)
	UIEngine._references.StatusCard = statusCard
	
	-- === Tarjeta de Recomendación ===
	local recomCard = UIEngine._BuildRecommendationCard(panel)
	UIEngine._references.RecomCard = recomCard
	
	-- === Tarjeta de Riesgo ===
	local riskCard = UIEngine._BuildRiskCard(panel)
	UIEngine._references.RiskCard = riskCard
	
	-- === Tarjeta de Detalles ===
	local detailsCard = UIEngine._BuildDetailsCard(panel)
	UIEngine._references.DetailsCard = detailsCard
	
	UIEngine._references.MainPanel = panel
end

-- === Tarjeta de Estado del Servidor ===
function UIEngine._BuildStatusCard(parent)
	local card = Instance.new("Frame")
	card.Name = "StatusCard"
	card.Size = UDim2.new(1, 0, 0, 65)
	card.BackgroundColor3 = CONFIG.THEME.BACKGROUND_TERTIARY
	card.BorderSizePixel = 0
	card.LayoutOrder = 1
	card.Parent = parent
	
	UIUtils.AddCorner(card, CONFIG.THEME.CORNER_RADIUS_SMALL)
	UIUtils.AddPadding(card, 10, 12, 10, 12)
	
	-- Título de sección
	local sectionLabel = Instance.new("TextLabel")
	sectionLabel.Name = "SectionLabel"
	sectionLabel.Size = UDim2.new(1, 0, 0, 14)
	sectionLabel.Position = UDim2.new(0, 0, 0, 0)
	sectionLabel.BackgroundTransparency = 1
	sectionLabel.Text = "ESTADO DEL SERVIDOR"
	sectionLabel.TextColor3 = CONFIG.THEME.TEXT_MUTED
	sectionLabel.TextSize = 9
	sectionLabel.Font = CONFIG.THEME.FONT_BOLD
	sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
	sectionLabel.Parent = card
	
	-- Indicador de estado grande
	local statusIndicator = Instance.new("Frame")
	statusIndicator.Name = "StatusIndicator"
	statusIndicator.Size = UDim2.new(0, 12, 0, 12)
	statusIndicator.Position = UDim2.new(0, 0, 0, 22)
	statusIndicator.BackgroundColor3 = CONFIG.THEME.TEXT_MUTED
	statusIndicator.BorderSizePixel = 0
	statusIndicator.Parent = card
	UIUtils.AddCorner(statusIndicator, UDim.new(1, 0))
	
	-- Texto de estado
	local statusText = Instance.new("TextLabel")
	statusText.Name = "StatusText"
	statusText.Size = UDim2.new(1, -20, 0, 20)
	statusText.Position = UDim2.new(0, 18, 0, 19)
	statusText.BackgroundTransparency = 1
	statusText.Text = "Analizando..."
	statusText.TextColor3 = CONFIG.THEME.TEXT_PRIMARY
	statusText.TextSize = 15
	statusText.Font = CONFIG.THEME.FONT_BOLD
	statusText.TextXAlignment = Enum.TextXAlignment.Left
	statusText.Parent = card
	
	return {
		Frame = card,
		Indicator = statusIndicator,
		Text = statusText,
	}
end

-- === Tarjeta de Recomendación ===
function UIEngine._BuildRecommendationCard(parent)
	local card = Instance.new("Frame")
	card.Name = "RecommendationCard"
	card.Size = UDim2.new(1, 0, 0, 55)
	card.BackgroundColor3 = CONFIG.THEME.BACKGROUND_TERTIARY
	card.BorderSizePixel = 0
	card.LayoutOrder = 2
	card.Parent = parent
	
	UIUtils.AddCorner(card, CONFIG.THEME.CORNER_RADIUS_SMALL)
	UIUtils.AddPadding(card, 8, 12, 8, 12)
	
	-- Barra de color de acento izquierdo
	local accentBar = Instance.new("Frame")
	accentBar.Name = "AccentBar"
	accentBar.Size = UDim2.new(0, 3, 0.7, 0)
	accentBar.Position = UDim2.new(0, -8, 0.15, 0)
	accentBar.BackgroundColor3 = CONFIG.THEME.ACCENT_PRIMARY
	accentBar.BorderSizePixel = 0
	accentBar.Parent = card
	UIUtils.AddCorner(accentBar, UDim.new(1, 0))
	
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Name = "Title"
	titleLabel.Size = UDim2.new(1, 0, 0, 12)
	titleLabel.Position = UDim2.new(0, 0, 0, 0)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = "💡 RECOMENDACIÓN"
	titleLabel.TextColor3 = CONFIG.THEME.TEXT_MUTED
	titleLabel.TextSize = 9
	titleLabel.Font = CONFIG.THEME.FONT_BOLD
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = card
	
	local recomText = Instance.new("TextLabel")
	recomText.Name = "RecomText"
	recomText.Size = UDim2.new(1, 0, 0, 18)
	recomText.Position = UDim2.new(0, 0, 0, 16)
	recomText.BackgroundTransparency = 1
	recomText.Text = "Calculando recomendación..."
	recomText.TextColor3 = CONFIG.THEME.TEXT_PRIMARY
	recomText.TextSize = 12
	recomText.Font = CONFIG.THEME.FONT_SEMIBOLD
	recomText.TextXAlignment = Enum.TextXAlignment.Left
	recomText.TextWrapped = true
	recomText.Parent = card
	
	return {
		Frame = card,
		Text = recomText,
		AccentBar = accentBar,
		Title = titleLabel,
	}
end

-- === Tarjeta de Riesgo ===
function UIEngine._BuildRiskCard(parent)
	local card = Instance.new("Frame")
	card.Name = "RiskCard"
	card.Size = UDim2.new(1, 0, 0, 50)
	card.BackgroundColor3 = CONFIG.THEME.BACKGROUND_TERTIARY
	card.BorderSizePixel = 0
	card.LayoutOrder = 3
	card.Parent = parent
	
	UIUtils.AddCorner(card, CONFIG.THEME.CORNER_RADIUS_SMALL)
	UIUtils.AddPadding(card, 8, 12, 8, 12)
	
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Name = "Title"
	titleLabel.Size = UDim2.new(0.5, 0, 0, 12)
	titleLabel.Position = UDim2.new(0, 0, 0, 0)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = "🔒 NIVEL DE RIESGO"
	titleLabel.TextColor3 = CONFIG.THEME.TEXT_MUTED
	titleLabel.TextSize = 9
	titleLabel.Font = CONFIG.THEME.FONT_BOLD
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = card
	
	-- Barra de progreso de riesgo
	local progressBg = Instance.new("Frame")
	progressBg.Name = "ProgressBg"
	progressBg.Size = UDim2.new(1, 0, 0, 8)
	progressBg.Position = UDim2.new(0, 0, 0, 26)
	progressBg.BackgroundColor3 = CONFIG.THEME.SURFACE
	progressBg.BorderSizePixel = 0
	progressBg.Parent = card
	UIUtils.AddCorner(progressBg, UDim.new(1, 0))
	
	local progressFill = Instance.new("Frame")
	progressFill.Name = "ProgressFill"
	progressFill.Size = UDim2.new(0.1, 0, 1, 0)
	progressFill.BackgroundColor3 = CONFIG.THEME.SUCCESS
	progressFill.BorderSizePixel = 0
	progressFill.Parent = progressBg
	UIUtils.AddCorner(progressFill, UDim.new(1, 0))
	
	-- Etiqueta de riesgo
	local riskLabel = Instance.new("TextLabel")
	riskLabel.Name = "RiskLabel"
	riskLabel.Size = UDim2.new(0.5, 0, 0, 12)
	riskLabel.Position = UDim2.new(0.5, 0, 0, 0)
	riskLabel.BackgroundTransparency = 1
	riskLabel.Text = "Bajo"
	riskLabel.TextColor3 = CONFIG.THEME.SUCCESS
	riskLabel.TextSize = 11
	riskLabel.Font = CONFIG.THEME.FONT_BOLD
	riskLabel.TextXAlignment = Enum.TextXAlignment.Right
	riskLabel.Parent = card
	
	return {
		Frame = card,
		ProgressFill = progressFill,
		RiskLabel = riskLabel,
	}
end

-- === Tarjeta de Detalles ===
function UIEngine._BuildDetailsCard(parent)
	local card = Instance.new("Frame")
	card.Name = "DetailsCard"
	card.Size = UDim2.new(1, 0, 0, 72)
	card.BackgroundColor3 = CONFIG.THEME.BACKGROUND_TERTIARY
	card.BorderSizePixel = 0
	card.LayoutOrder = 4
	card.Parent = parent
	
	UIUtils.AddCorner(card, CONFIG.THEME.CORNER_RADIUS_SMALL)
	UIUtils.AddPadding(card, 8, 12, 8, 12)
	
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Name = "Title"
	titleLabel.Size = UDim2.new(1, 0, 0, 12)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = "📋 DETALLES DEL ANÁLISIS"
	titleLabel.TextColor3 = CONFIG.THEME.TEXT_MUTED
	titleLabel.TextSize = 9
	titleLabel.Font = CONFIG.THEME.FONT_BOLD
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = card
	
	-- Contenedor de info detallada (dos columnas)
	local detailLeft = Instance.new("TextLabel")
	detailLeft.Name = "DetailLeft"
	detailLeft.Size = UDim2.new(0.5, 0, 0, 38)
	detailLeft.Position = UDim2.new(0, 0, 0, 18)
	detailLeft.BackgroundTransparency = 1
	detailLeft.Text = "Servidor: —\nJuego: —"
	detailLeft.TextColor3 = CONFIG.THEME.TEXT_SECONDARY
	detailLeft.TextSize = 10
	detailLeft.Font = CONFIG.THEME.FONT_REGULAR
	detailLeft.TextXAlignment = Enum.TextXAlignment.Left
	detailLeft.TextYAlignment = Enum.TextYAlignment.Top
	detailLeft.Parent = card
	
	local detailRight = Instance.new("TextLabel")
	detailRight.Name = "DetailRight"
	detailRight.Size = UDim2.new(0.5, 0, 0, 38)
	detailRight.Position = UDim2.new(0.5, 0, 0, 18)
	detailRight.BackgroundTransparency = 1
	detailRight.Text = "Puntuación: —\nÚltimo scan: —"
	detailRight.TextColor3 = CONFIG.THEME.TEXT_SECONDARY
	detailRight.TextSize = 10
	detailRight.Font = CONFIG.THEME.FONT_REGULAR
	detailRight.TextXAlignment = Enum.TextXAlignment.Left
	detailRight.TextYAlignment = Enum.TextYAlignment.Top
	detailRight.Parent = card
	
	return {
		Frame = card,
		DetailLeft = detailLeft,
		DetailRight = detailRight,
	}
end

-- === Construir Footer ===
function UIEngine._BuildFooter(parent)
	local footer = Instance.new("TextLabel")
	footer.Name = "Footer"
	footer.Size = UDim2.new(1, -20, 0, 14)
	footer.Position = UDim2.new(0, 10, 1, -16)
	footer.BackgroundTransparency = 1
	footer.Text = CONFIG.CREDITS .. "  •  ✅ Activo"
	footer.TextColor3 = CONFIG.THEME.TEXT_MUTED
	footer.TextSize = 8
	footer.Font = CONFIG.THEME.FONT_REGULAR
	footer.TextXAlignment = Enum.TextXAlignment.Center
	footer.Parent = parent
	
	UIEngine._references.Footer = footer
end

-- === Contenedor de Toast Notifications ===
function UIEngine._BuildToastContainer(parent)
	local container = Instance.new("Frame")
	container.Name = "ToastContainer"
	container.Size = UDim2.new(0, CONFIG.UI_SIZE.TOAST_WIDTH, 1, -20)
	container.Position = UDim2.new(1, -(CONFIG.UI_SIZE.TOAST_WIDTH + 15), 0, 10)
	container.BackgroundTransparency = 1
	container.Parent = parent
	
	local layout = Instance.new("UIListLayout")
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Padding = UDim.new(0, 6)
	layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	layout.Parent = container
	
	UIEngine._toastContainer = container
end

-- === Sistema de Dragging ===
function UIEngine._SetupDragging(frame)
	local dragging = false
	local dragInput
	local dragStart
	local startPos
	
	local header = UIEngine._references.Header
	if not header then return end
	
	header.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or
			input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	header.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or
			input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

-- === Animación de Entrada ===
function UIEngine._PlayEntryAnimation()
	local frame = UIEngine._mainFrame
	if not frame then return end
	
	-- Empezar invisible y pequeño
	frame.BackgroundTransparency = 1
	frame.Size = UDim2.new(0, CONFIG.UI_SIZE.MAIN_WIDTH * 0.85, 0, CONFIG.UI_SIZE.MAIN_HEIGHT * 0.85)
	
	-- Hacer todos los hijos invisibles temporalmente
	for _, child in ipairs(frame:GetDescendants()) do
		if child:IsA("Frame") and child.Name ~= "Shadow" then
			child.BackgroundTransparency = 1
		elseif child:IsA("TextLabel") or child:IsA("TextButton") then
			child.TextTransparency = 1
		end
	end
	
	-- Animación de entrada
	task.wait(0.1)
	
	UIUtils.Tween(frame, {
		BackgroundTransparency = 0,
		Size = UDim2.new(0, CONFIG.UI_SIZE.MAIN_WIDTH, 0, CONFIG.UI_SIZE.MAIN_HEIGHT),
	}, CONFIG.ANIM.DURATION_SLOW)
	
	task.wait(0.15)
	
	-- Restaurar visibilidad de hijos
	for _, child in ipairs(frame:GetDescendants()) do
		if child:IsA("Frame") and child.Name ~= "Shadow" then
			pcall(function()
				UIUtils.Tween(child, {BackgroundTransparency = 0}, CONFIG.ANIM.DURATION_NORMAL)
			end)
		elseif child:IsA("TextLabel") or child:IsA("TextButton") then
			pcall(function()
				UIUtils.Tween(child, {TextTransparency = 0}, CONFIG.ANIM.DURATION_NORMAL)
			end)
		end
	end
	
	-- Restaurar transparencias especiales
	task.wait(0.2)
	for _, child in ipairs(frame:GetDescendants()) do
		if child.Name == "Shadow" then
			child.ImageTransparency = 0.5
		end
	end
end

-- === Toggle Minimizar ===
function UIEngine.ToggleMinimize()
	local frame = UIEngine._mainFrame
	if not frame then return end
	
	UIEngine._isMinimized = not UIEngine._isMinimized
	
	if UIEngine._isMinimized then
		-- Minimizar
		UIUtils.Tween(frame, {
			Size = UDim2.new(0, CONFIG.UI_SIZE.MINIMIZED_WIDTH, 0, CONFIG.UI_SIZE.MINIMIZED_HEIGHT),
		}, CONFIG.ANIM.DURATION_NORMAL)
		
		-- Ocultar contenido
		if UIEngine._references.ContentContainer then
			UIUtils.Tween(UIEngine._references.ContentContainer, {
				Size = UDim2.new(0, 0, 0, 0),
			}, CONFIG.ANIM.DURATION_FAST)
		end
		
		Logger:Info("UIEngine", "Ventana minimizada")
	else
		-- Restaurar
		UIUtils.Tween(frame, {
			Size = UDim2.new(0, CONFIG.UI_SIZE.MAIN_WIDTH, 0, CONFIG.UI_SIZE.MAIN_HEIGHT),
		}, CONFIG.ANIM.DURATION_NORMAL)
		
		task.wait(0.15)
		
		if UIEngine._references.ContentContainer then
			UIUtils.Tween(UIEngine._references.ContentContainer, {
				Size = UDim2.new(1, 0, 1, -CONFIG.UI_SIZE.HEADER_HEIGHT),
			}, CONFIG.ANIM.DURATION_FAST)
		end
		
		Logger:Info("UIEngine", "Ventana restaurada")
	end
end

-- === Cerrar Hub ===
function UIEngine.Close()
	local frame = UIEngine._mainFrame
	if not frame then return end
	
	Logger:Info("UIEngine", "Cerrando hub...")
	
	-- Animación de salida
	UIUtils.Tween(frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, CONFIG.UI_SIZE.MAIN_WIDTH * 0.85, 0, CONFIG.UI_SIZE.MAIN_HEIGHT * 0.85),
	}, CONFIG.ANIM.DURATION_NORMAL, function()
		if UIEngine._screenGui then
			UIEngine._screenGui:Destroy()
		end
	end)
	
	-- Ocultar contenido rápido
	for _, child in ipairs(frame:GetDescendants()) do
		pcall(function()
			if child:IsA("Frame") then
				UIUtils.Tween(child, {BackgroundTransparency = 1}, CONFIG.ANIM.DURATION_FAST)
			elseif child:IsA("TextLabel") or child:IsA("TextButton") then
				UIUtils.Tween(child, {TextTransparency = 1}, CONFIG.ANIM.DURATION_FAST)
			end
		end)
	end
	
	-- Limpiar conexiones
	for _, conn in ipairs(UIEngine._connections) do
		pcall(function() conn:Disconnect() end)
	end
	
	-- Restaurar performance si estaba activado
	pcall(function() PerformanceOptimizer.Disable() end)
end

-- === Modo Compacto ===
function UIEngine._ApplyCompactMode(enabled)
	if not UIEngine._mainFrame then return end
	
	if enabled then
		UIUtils.Tween(UIEngine._mainFrame, {
			Size = UDim2.new(0, CONFIG.UI_SIZE.MAIN_WIDTH * 0.8, 0, CONFIG.UI_SIZE.MAIN_HEIGHT * 0.75),
		}, CONFIG.ANIM.DURATION_NORMAL)
	else
		UIUtils.Tween(UIEngine._mainFrame, {
			Size = UDim2.new(0, CONFIG.UI_SIZE.MAIN_WIDTH, 0, CONFIG.UI_SIZE.MAIN_HEIGHT),
		}, CONFIG.ANIM.DURATION_NORMAL)
	end
end

-- === Mostrar Toast Notification ===
function UIEngine.ShowToast(message, toastType, duration)
	if not UIEngine._toastContainer then return end
	
	toastType = toastType or "INFO"
	duration = duration or CONFIG.TOAST_DURATION
	
	-- Limitar cantidad de toasts
	if #UIEngine._toasts >= CONFIG.MAX_TOASTS then
		local oldest = table.remove(UIEngine._toasts, 1)
		if oldest and oldest.Parent then
			oldest:Destroy()
		end
	end
	
	-- Color según tipo
	local accentColor
	local icon
	if toastType == "SUCCESS" then
		accentColor = CONFIG.THEME.SUCCESS
		icon = "✅"
	elseif toastType == "WARNING" then
		accentColor = CONFIG.THEME.WARNING
		icon = "⚠️"
	elseif toastType == "ERROR" then
		accentColor = CONFIG.THEME.DANGER
		icon = "❌"
	else
		accentColor = CONFIG.THEME.INFO
		icon = "ℹ️"
	end
	
	-- Crear toast
	local toast = Instance.new("Frame")
	toast.Name = "Toast"
	toast.Size = UDim2.new(1, 0, 0, CONFIG.UI_SIZE.TOAST_HEIGHT)
	toast.BackgroundColor3 = CONFIG.THEME.BACKGROUND_SECONDARY
	toast.BorderSizePixel = 0
	toast.BackgroundTransparency = 1
	toast.LayoutOrder = tick()
	toast.Parent = UIEngine._toastContainer
	
	UIUtils.AddCorner(toast, CONFIG.THEME.CORNER_RADIUS_SMALL)
	UIUtils.AddStroke(toast, accentColor, 1, 0.5)
	
	-- Barra de acento izquierda
	local accent = Instance.new("Frame")
	accent.Size = UDim2.new(0, 3, 0.7, 0)
	accent.Position = UDim2.new(0, 4, 0.15, 0)
	accent.BackgroundColor3 = accentColor
	accent.BorderSizePixel = 0
	accent.BackgroundTransparency = 1
	accent.Parent = toast
	UIUtils.AddCorner(accent, UDim.new(1, 0))
	
	-- Texto
	local text = Instance.new("TextLabel")
	text.Size = UDim2.new(1, -20, 1, 0)
	text.Position = UDim2.new(0, 14, 0, 0)
	text.BackgroundTransparency = 1
	text.Text = icon .. " " .. message
	text.TextColor3 = CONFIG.THEME.TEXT_PRIMARY
	text.TextSize = 11
	text.Font = CONFIG.THEME.FONT_MEDIUM
	text.TextXAlignment = Enum.TextXAlignment.Left
	text.TextWrapped = true
	text.TextTransparency = 1
	text.Parent = toast
	
	table.insert(UIEngine._toasts, toast)
	
	-- Animación de entrada
	UIUtils.Tween(toast, {BackgroundTransparency = 0}, CONFIG.ANIM.DURATION_FAST)
	UIUtils.Tween(accent, {BackgroundTransparency = 0}, CONFIG.ANIM.DURATION_FAST)
	UIUtils.Tween(text, {TextTransparency = 0}, CONFIG.ANIM.DURATION_FAST)
	
	-- Auto-remover
	task.delay(duration, function()
		if toast and toast.Parent then
			UIUtils.Tween(toast, {BackgroundTransparency = 1}, CONFIG.ANIM.DURATION_FAST)
			UIUtils.Tween(text, {TextTransparency = 1}, CONFIG.ANIM.DURATION_FAST, function()
				if toast and toast.Parent then
					toast:Destroy()
				end
			end)
			
			-- Remover de la tabla
			for i, t in ipairs(UIEngine._toasts) do
				if t == toast then
					table.remove(UIEngine._toasts, i)
					break
				end
			end
		end
	end)
end

-- === Actualizar Tarjeta de Métrica ===
function UIEngine.UpdateMetricCard(key, value, statusColor, unit)
	local card = UIEngine._references[key]
	if not card then return end
	
	pcall(function()
		local displayText = tostring(value)
		if unit and unit ~= "" then
			displayText = displayText .. " " .. unit
		end
		card.Value.Text = displayText
		
		if statusColor then
			UIUtils.Tween(card.StatusDot, {BackgroundColor3 = statusColor}, CONFIG.ANIM.DURATION_FAST)
			UIUtils.Tween(card.Value, {TextColor3 = statusColor}, CONFIG.ANIM.DURATION_FAST)
		end
	end)
end

-- === Actualizar Estado del Servidor ===
function UIEngine.UpdateServerStatus(statusText, statusColor)
	local statusCard = UIEngine._references.StatusCard
	if not statusCard then return end
	
	pcall(function()
		statusCard.Text.Text = statusText
		UIUtils.Tween(statusCard.Indicator, {BackgroundColor3 = statusColor}, CONFIG.ANIM.DURATION_FAST)
		UIUtils.Tween(statusCard.Text, {TextColor3 = statusColor}, CONFIG.ANIM.DURATION_FAST)
	end)
end

-- === Actualizar Recomendación ===
function UIEngine.UpdateRecommendation(text, color)
	local recomCard = UIEngine._references.RecomCard
	if not recomCard then return end
	
	pcall(function()
		recomCard.Text.Text = text
		UIUtils.Tween(recomCard.Text, {TextColor3 = color}, CONFIG.ANIM.DURATION_FAST)
		UIUtils.Tween(recomCard.AccentBar, {BackgroundColor3 = color}, CONFIG.ANIM.DURATION_FAST)
	end)
end

-- === Actualizar Nivel de Riesgo ===
function UIEngine.UpdateRiskLevel(percentage, label, color)
	local riskCard = UIEngine._references.RiskCard
	if not riskCard then return end
	
	pcall(function()
		UIUtils.Tween(riskCard.ProgressFill, {
			Size = UDim2.new(math.clamp(percentage / 100, 0.02, 1), 0, 1, 0),
			BackgroundColor3 = color,
		}, CONFIG.ANIM.DURATION_NORMAL)
		
		riskCard.RiskLabel.Text = label
		UIUtils.Tween(riskCard.RiskLabel, {TextColor3 = color}, CONFIG.ANIM.DURATION_FAST)
	end)
end

-- === Actualizar Detalles ===
function UIEngine.UpdateDetails(leftText, rightText)
	local detailsCard = UIEngine._references.DetailsCard
	if not detailsCard then return end
	
	pcall(function()
		detailsCard.DetailLeft.Text = leftText
		detailsCard.DetailRight.Text = rightText
	end)
end

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 8: SERVER HEALTH MONITOR                   ║
-- ╚══════════════════════════════════════════════════════════════╝

local ServerHealthMonitor = {}
ServerHealthMonitor._lastPing = 0
ServerHealthMonitor._lastFPS = 60
ServerHealthMonitor._fpsHistory = {}
ServerHealthMonitor._pingHistory = {}
ServerHealthMonitor._stabilityScore = 100

-- Obtener ping actual del jugador
function ServerHealthMonitor.GetPing()
	local cached, hit = Cache:Get("ping")
	if hit then return cached end
	
	local ping = 0
	local success = pcall(function()
		ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
	end)
	
	if not success then
		-- Fallback: intentar con PerformanceStats
		pcall(function()
			ping = LocalPlayer:GetNetworkPing() * 1000
		end)
	end
	
	ping = math.floor(ping)
	ServerHealthMonitor._lastPing = ping
	
	-- Almacenar en historial
	table.insert(ServerHealthMonitor._pingHistory, ping)
	if #ServerHealthMonitor._pingHistory > 30 then
		table.remove(ServerHealthMonitor._pingHistory, 1)
	end
	
	Cache:Set("ping", ping)
	return ping
end

-- Obtener FPS actual del cliente
function ServerHealthMonitor.GetFPS()
	local cached, hit = Cache:Get("fps")
	if hit then return cached end
	
	local fps = 0
	local success = pcall(function()
		fps = math.floor(1 / RunService.RenderStepped:Wait())
	end)
	
	if not success then
		fps = 60 -- Default
	end
	
	fps = math.clamp(fps, 0, 240)
	ServerHealthMonitor._lastFPS = fps
	
	-- Almacenar en historial
	table.insert(ServerHealthMonitor._fpsHistory, fps)
	if #ServerHealthMonitor._fpsHistory > 30 then
		table.remove(ServerHealthMonitor._fpsHistory, 1)
	end
	
	Cache:Set("fps", fps)
	return fps
end

-- Obtener cantidad de jugadores
function ServerHealthMonitor.GetPlayerCount()
	local cached, hit = Cache:Get("playerCount")
	if hit then return cached end
	
	local count = 0
	pcall(function()
		count = #Players:GetPlayers()
	end)
	
	Cache:Set("playerCount", count)
	return count
end

-- Obtener max players del servidor
function ServerHealthMonitor.GetMaxPlayers()
	local maxP = 0
	pcall(function()
		maxP = Players.MaxPlayers
	end)
	return maxP
end

-- Calcular estabilidad del servidor (0-100)
function ServerHealthMonitor.CalculateStability()
	local ping = ServerHealthMonitor.GetPing()
	local fps = ServerHealthMonitor.GetFPS()
	local playerCount = ServerHealthMonitor.GetPlayerCount()
	
	-- Puntuación basada en ping (0-35 puntos)
	local pingScore = 35
	if ping > CONFIG.PING_THRESHOLDS.MEDIUM then
		pingScore = math.max(0, 35 - ((ping - CONFIG.PING_THRESHOLDS.MEDIUM) / 10))
	elseif ping > CONFIG.PING_THRESHOLDS.GOOD then
		pingScore = 35 - ((ping - CONFIG.PING_THRESHOLDS.GOOD) / 10)
	end
	pingScore = math.clamp(pingScore, 0, 35)
	
	-- Puntuación basada en FPS (0-35 puntos)
	local fpsScore = 35
	if fps < CONFIG.FPS_THRESHOLDS.MEDIUM then
		fpsScore = math.max(0, fps / CONFIG.FPS_THRESHOLDS.MEDIUM * 15)
	elseif fps < CONFIG.FPS_THRESHOLDS.GOOD then
		fpsScore = 15 + ((fps - CONFIG.FPS_THRESHOLDS.MEDIUM) / (CONFIG.FPS_THRESHOLDS.GOOD - CONFIG.FPS_THRESHOLDS.MEDIUM) * 20)
	end
	fpsScore = math.clamp(fpsScore, 0, 35)
	
	-- Variabilidad del ping (0-15 puntos) — menos variación = más estable
	local pingVariability = 15
	if #ServerHealthMonitor._pingHistory > 3 then
		local sum = 0
		local avg = 0
		for _, p in ipairs(ServerHealthMonitor._pingHistory) do
			sum = sum + p
		end
		avg = sum / #ServerHealthMonitor._pingHistory
		
		local variance = 0
		for _, p in ipairs(ServerHealthMonitor._pingHistory) do
			variance = variance + (p - avg) ^ 2
		end
		variance = variance / #ServerHealthMonitor._pingHistory
		local stddev = math.sqrt(variance)
		
		pingVariability = math.clamp(15 - (stddev / 5), 0, 15)
	end
	
	-- Puntuación de jugadores (0-15 puntos) — menos jugadores = más recursos
	local maxP = ServerHealthMonitor.GetMaxPlayers()
	local playerScore = 15
	if maxP > 0 then
		local ratio = playerCount / maxP
		if ratio > 0.9 then
			playerScore = 3
		elseif ratio > 0.7 then
			playerScore = 8
		elseif ratio > 0.5 then
			playerScore = 12
		end
	end
	
	local totalScore = math.floor(pingScore + fpsScore + pingVariability + playerScore)
	totalScore = math.clamp(totalScore, 0, 100)
	
	ServerHealthMonitor._stabilityScore = totalScore
	Cache:Set("stability", totalScore)
	
	return totalScore
end

-- Obtener estado en texto y color
function ServerHealthMonitor.GetStatusInfo()
	local score = ServerHealthMonitor.CalculateStability()
	local ping = ServerHealthMonitor._lastPing
	local fps = ServerHealthMonitor._lastFPS
	
	local status, color
	
	if score >= 75 then
		status = "🟢 Estable"
		color = CONFIG.THEME.SUCCESS
	elseif score >= 45 then
		status = "🟡 Medio"
		color = CONFIG.THEME.WARNING
	else
		status = "🔴 Inestable"
		color = CONFIG.THEME.DANGER
	end
	
	return {
		Score = score,
		Status = status,
		Color = color,
		Ping = ping,
		FPS = fps,
		PlayerCount = ServerHealthMonitor.GetPlayerCount(),
		MaxPlayers = ServerHealthMonitor.GetMaxPlayers(),
	}
end

-- Obtener color para valor de ping
function ServerHealthMonitor.GetPingColor(ping)
	if ping <= CONFIG.PING_THRESHOLDS.GOOD then
		return CONFIG.THEME.SUCCESS
	elseif ping <= CONFIG.PING_THRESHOLDS.MEDIUM then
		return CONFIG.THEME.WARNING
	else
		return CONFIG.THEME.DANGER
	end
end

-- Obtener color para valor de FPS
function ServerHealthMonitor.GetFPSColor(fps)
	if fps >= CONFIG.FPS_THRESHOLDS.GOOD then
		return CONFIG.THEME.SUCCESS
	elseif fps >= CONFIG.FPS_THRESHOLDS.MEDIUM then
		return CONFIG.THEME.WARNING
	else
		return CONFIG.THEME.DANGER
	end
end

Logger:Info("ServerHealth", "Módulo de monitoreo de salud inicializado")

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 9: ADMIN DETECTOR INTELIGENTE              ║
-- ╚══════════════════════════════════════════════════════════════╝

local AdminDetector = {}
AdminDetector._suspiciousPlayers = {}
AdminDetector._lastScanTime = 0
AdminDetector._detectionLevel = "NONE" -- NONE, LOW, MEDIUM, HIGH
AdminDetector._confidence = 0

-- Verificar si un nombre contiene keywords sospechosas
function AdminDetector._CheckNameForKeywords(name)
	local lowerName = string.lower(name)
	local matchCount = 0
	local matchedKeywords = {}
	
	for _, keyword in ipairs(CONFIG.ADMIN_KEYWORDS) do
		if string.find(lowerName, keyword) then
			matchCount = matchCount + 1
			table.insert(matchedKeywords, keyword)
		end
	end
	
	return matchCount, matchedKeywords
end

-- Verificar si un jugador tiene permisos especiales (heurístico)
function AdminDetector._CheckPlayerPermissions(player)
	local indicators = 0
	
	-- Verificar si el DisplayName es diferente (posible personalización de admin)
	pcall(function()
		if player.DisplayName ~= player.Name then
			-- No necesariamente admin, pero un indicador menor
		end
	end)
	
	-- Verificar si tiene ciertos accesorios o características
	pcall(function()
		local character = player.Character
		if character then
			-- Verificar herramientas especiales
			for _, tool in ipairs(character:GetChildren()) do
				if tool:IsA("Tool") then
					local toolLower = string.lower(tool.Name)
					if string.find(toolLower, "admin") or
						string.find(toolLower, "ban") or
						string.find(toolLower, "kick") or
						string.find(toolLower, "mod") then
						indicators = indicators + 2
					end
				end
			end
		end
	end)
	
	-- Verificar Backpack
	pcall(function()
		local backpack = player:FindFirstChild("Backpack")
		if backpack then
			for _, tool in ipairs(backpack:GetChildren()) do
				if tool:IsA("Tool") then
					local toolLower = string.lower(tool.Name)
					if string.find(toolLower, "admin") or
						string.find(toolLower, "command") then
						indicators = indicators + 2
					end
				end
			end
		end
	end)
	
	-- Verificar PlayerGui por GUIs de admin
	pcall(function()
		local playerGui = player:FindFirstChild("PlayerGui")
		if playerGui then
			for _, gui in ipairs(playerGui:GetChildren()) do
				local guiLower = string.lower(gui.Name)
				if string.find(guiLower, "admin") or
					string.find(guiLower, "command") or
					string.find(guiLower, "modpanel") then
					indicators = indicators + 3
				end
			end
		end
	end)
	
	return indicators
end

-- Verificar grupos de admin (intento, puede fallar por seguridad)
function AdminDetector._CheckAdminGroups(player)
	local groupIndicators = 0
	
	pcall(function()
		-- Verificar si es amigo del creador o tiene rangos altos en el grupo del juego
		local gameCreator = game.CreatorId
		if game.CreatorType == Enum.CreatorType.Group then
			-- Verificar rango del jugador en el grupo creador
			local success, rank = pcall(function()
				return player:GetRankInGroup(gameCreator)
			end)
			if success and rank then
				if rank >= 200 then
					groupIndicators = groupIndicators + 5  -- Alto rango
				elseif rank >= 100 then
					groupIndicators = groupIndicators + 3  -- Rango medio-alto
				elseif rank >= 50 then
					groupIndicators = groupIndicators + 1  -- Rango medio
				end
			end
		elseif game.CreatorType == Enum.CreatorType.User then
			-- Si el jugador es el creador del juego
			if player.UserId == gameCreator then
				groupIndicators = groupIndicators + 10
			end
		end
	end)
	
	return groupIndicators
end

-- Escaneo completo de admins
function AdminDetector.Scan()
	-- Verificar caché
	local cached, hit = Cache:Get("adminScan")
	if hit then return cached end
	
	local suspiciousPlayers = {}
	local maxThreat = 0
	
	pcall(function()
		for _, player in ipairs(Players:GetPlayers()) do
			if player == LocalPlayer then continue end
			
			local threatScore = 0
			local reasons = {}
			
			-- Check 1: Nombre sospechoso
			local nameMatches, keywords = AdminDetector._CheckNameForKeywords(player.Name)
			if nameMatches > 0 then
				threatScore = threatScore + (nameMatches * 2)
				table.insert(reasons, "Nombre sospechoso: " .. table.concat(keywords, ", "))
			end
			
			-- Check 2: DisplayName sospechoso
			local displayMatches, displayKeywords = AdminDetector._CheckNameForKeywords(player.DisplayName)
			if displayMatches > 0 then
				threatScore = threatScore + (displayMatches * 1.5)
				table.insert(reasons, "DisplayName: " .. table.concat(displayKeywords, ", "))
			end
			
			-- Check 3: Permisos/herramientas
			local permScore = AdminDetector._CheckPlayerPermissions(player)
			if permScore > 0 then
				threatScore = threatScore + permScore
				table.insert(reasons, "Herramientas/GUI sospechosas")
			end
			
			-- Check 4: Grupos
			local groupScore = AdminDetector._CheckAdminGroups(player)
			if groupScore > 0 then
				threatScore = threatScore + groupScore
				table.insert(reasons, "Rango alto en grupo del juego")
			end
			
			-- Check 5: Cuenta verificada o muy antigua
			pcall(function()
				if player.AccountAge < 30 then
					-- Cuenta nueva, menos probable que sea admin real
					threatScore = math.max(0, threatScore - 2)
				elseif player.AccountAge > 1500 then
					-- Cuenta antigua, podría ser staff
					threatScore = threatScore + 1
				end
			end)
			
			if threatScore >= 3 then
				-- Determinar nivel de confianza
				local confidence
				if threatScore >= 10 then
					confidence = "ALTO"
				elseif threatScore >= 6 then
					confidence = "MEDIO"
				else
					confidence = "BAJO"
				end
				
				table.insert(suspiciousPlayers, {
					Player = player,
					Name = player.Name,
					DisplayName = player.DisplayName,
					ThreatScore = threatScore,
					Confidence = confidence,
					Reasons = reasons,
				})
				
				if threatScore > maxThreat then
					maxThreat = threatScore
				end
			end
		end
	end)
	
	-- Determinar nivel de detección general
	if maxThreat >= 10 then
		AdminDetector._detectionLevel = "HIGH"
		AdminDetector._confidence = math.min(95, maxThreat * 8)
	elseif maxThreat >= 6 then
		AdminDetector._detectionLevel = "MEDIUM"
		AdminDetector._confidence = math.min(75, maxThreat * 10)
	elseif maxThreat >= 3 then
		AdminDetector._detectionLevel = "LOW"
		AdminDetector._confidence = math.min(50, maxThreat * 12)
	else
		AdminDetector._detectionLevel = "NONE"
		AdminDetector._confidence = 0
	end
	
	AdminDetector._suspiciousPlayers = suspiciousPlayers
	AdminDetector._lastScanTime = tick()
	
	local result = {
		SuspiciousPlayers = suspiciousPlayers,
		DetectionLevel = AdminDetector._detectionLevel,
		Confidence = AdminDetector._confidence,
		Count = #suspiciousPlayers,
	}
	
	Cache:Set("adminScan", result)
	Logger:Info("AdminDetector", string.format("Scan completado: %d sospechosos, nivel %s", #suspiciousPlayers, AdminDetector._detectionLevel))
	
	return result
end

-- Obtener resumen para UI
function AdminDetector.GetSummary()
	local result = AdminDetector.Scan()
	
	if result.Count == 0 then
		return "Sin admins", CONFIG.THEME.SUCCESS
	elseif result.DetectionLevel == "HIGH" then
		return "⚠️ Admin detectado (" .. result.Confidence .. "%)", CONFIG.THEME.DANGER
	elseif result.DetectionLevel == "MEDIUM" then
		return "⚠️ Posible admin (" .. result.Confidence .. "%)", CONFIG.THEME.WARNING
	else
		return "Bajo sospecha (" .. result.Confidence .. "%)", CONFIG.THEME.INFO
	end
end

Logger:Info("AdminDetector", "Módulo de detección de admins inicializado")

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 10: ANTI-CHEAT RISK SCANNER                ║
-- ╚══════════════════════════════════════════════════════════════╝

local AntiCheatScanner = {}
AntiCheatScanner._riskLevel = "LOW"
AntiCheatScanner._riskScore = 0
AntiCheatScanner._detections = {}
AntiCheatScanner._lastScanTime = 0

-- Escanear RemoteEvents sospechosos
function AntiCheatScanner._ScanRemotes()
	local suspiciousRemotes = {}
	local score = 0
	
	pcall(function()
		-- Escanear ReplicatedStorage
		local function scanContainer(container, path)
			for _, child in ipairs(container:GetDescendants()) do
				if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
					local childLower = string.lower(child.Name)
					for _, keyword in ipairs(CONFIG.ANTICHEAT_REMOTE_KEYWORDS) do
						if string.find(childLower, keyword) then
							table.insert(suspiciousRemotes, {
								Name = child.Name,
								Type = child.ClassName,
								Path = path .. "/" .. child:GetFullName(),
								Keyword = keyword,
							})
							score = score + 3
							break
						end
					end
				end
			end
		end
		
		scanContainer(ReplicatedStorage, "ReplicatedStorage")
		
		-- También escanear Workspace por scripts
		pcall(function()
			for _, child in ipairs(workspace:GetDescendants()) do
				if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
					local childLower = string.lower(child.Name)
					for _, keyword in ipairs(CONFIG.ANTICHEAT_REMOTE_KEYWORDS) do
						if string.find(childLower, keyword) then
							table.insert(suspiciousRemotes, {
								Name = child.Name,
								Type = child.ClassName,
								Path = "Workspace/" .. child:GetFullName(),
								Keyword = keyword,
							})
							score = score + 2
							break
						end
					end
				end
			end
		end)
	end)
	
	return suspiciousRemotes, score
end

-- Escanear scripts anti-cheat en ReplicatedStorage / ReplicatedFirst
function AntiCheatScanner._ScanScripts()
	local suspiciousScripts = {}
	local score = 0
	
	pcall(function()
		local containers = {
			ReplicatedStorage,
			game:GetService("ReplicatedFirst"),
			game:GetService("StarterPlayer"),
		}
		
		for _, container in ipairs(containers) do
			pcall(function()
				for _, child in ipairs(container:GetDescendants()) do
					if child:IsA("LocalScript") or child:IsA("ModuleScript") then
						local childName = child.Name
						for _, pattern in ipairs(CONFIG.ANTICHEAT_SCRIPT_PATTERNS) do
							if string.find(childName, pattern) then
								table.insert(suspiciousScripts, {
									Name = childName,
									Type = child.ClassName,
									Path = child:GetFullName(),
									Pattern = pattern,
								})
								score = score + 4
								break
							end
						end
					end
				end
			end)
		end
	end)
	
	return suspiciousScripts, score
end

-- Escanear cambios inusuales en ReplicatedStorage (estructura compleja)
function AntiCheatScanner._ScanStructure()
	local anomalies = {}
	local score = 0
	
	pcall(function()
		-- Contar la cantidad de RemoteEvents/Functions (muchos = posible AC)
		local remoteCount = 0
		for _, child in ipairs(ReplicatedStorage:GetDescendants()) do
			if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
				remoteCount = remoteCount + 1
			end
		end
		
		if remoteCount > 50 then
			table.insert(anomalies, {
				Type = "HighRemoteCount",
				Detail = "Cantidad alta de RemoteEvents: " .. remoteCount,
			})
			score = score + 3
		end
		
		-- Verificar si hay BindableEvents (a veces usados en AC)
		local bindableCount = 0
		for _, child in ipairs(ReplicatedStorage:GetDescendants()) do
			if child:IsA("BindableEvent") or child:IsA("BindableFunction") then
				bindableCount = bindableCount + 1
				local childLower = string.lower(child.Name)
				for _, keyword in ipairs(CONFIG.ANTICHEAT_REMOTE_KEYWORDS) do
					if string.find(childLower, keyword) then
						score = score + 2
						break
					end
				end
			end
		end
		
		-- Verificar heartbeat remotes (común en AC avanzados)
		for _, child in ipairs(ReplicatedStorage:GetDescendants()) do
			if child:IsA("RemoteEvent") then
				local childLower = string.lower(child.Name)
				if string.find(childLower, "heartbeat") or
					string.find(childLower, "pulse") or
					string.find(childLower, "alive") or
					string.find(childLower, "ping") then
					table.insert(anomalies, {
						Type = "HeartbeatRemote",
						Detail = "Posible heartbeat AC: " .. child.Name,
					})
					score = score + 5
				end
			end
		end
	end)
	
	return anomalies, score
end

-- Escaneo completo
function AntiCheatScanner.Scan()
	local cached, hit = Cache:Get("acScan")
	if hit then return cached end
	
	local totalScore = 0
	local allDetections = {}
	
	-- Escanear remotos
	local remotes, remoteScore = AntiCheatScanner._ScanRemotes()
	totalScore = totalScore + remoteScore
	for _, r in ipairs(remotes) do
		table.insert(allDetections, {
			Category = "Remote",
			Detail = r.Name .. " (" .. r.Keyword .. ")",
		})
	end
	
	-- Escanear scripts
	local scripts, scriptScore = AntiCheatScanner._ScanScripts()
	totalScore = totalScore + scriptScore
	for _, s in ipairs(scripts) do
		table.insert(allDetections, {
			Category = "Script",
			Detail = s.Name .. " (" .. s.Pattern .. ")",
		})
	end
	
	-- Escanear estructura
	local anomalies, structScore = AntiCheatScanner._ScanStructure()
	totalScore = totalScore + structScore
	for _, a in ipairs(anomalies) do
		table.insert(allDetections, {
			Category = "Structure",
			Detail = a.Detail,
		})
	end
	
	-- Determinar nivel de riesgo
	local riskLevel, riskPercentage
	if totalScore >= 20 then
		riskLevel = "HIGH"
		riskPercentage = math.min(100, 60 + totalScore)
	elseif totalScore >= 10 then
		riskLevel = "MEDIUM"
		riskPercentage = math.min(80, 30 + totalScore * 2)
	elseif totalScore >= 3 then
		riskLevel = "LOW_MEDIUM"
		riskPercentage = math.min(50, 15 + totalScore * 3)
	else
		riskLevel = "LOW"
		riskPercentage = math.max(5, totalScore * 5)
	end
	
	AntiCheatScanner._riskLevel = riskLevel
	AntiCheatScanner._riskScore = totalScore
	AntiCheatScanner._detections = allDetections
	AntiCheatScanner._lastScanTime = tick()
	
	local result = {
		RiskLevel = riskLevel,
		RiskScore = totalScore,
		RiskPercentage = riskPercentage,
		Detections = allDetections,
		DetectionCount = #allDetections,
		RemoteCount = #remotes,
		ScriptCount = #scripts,
		AnomalyCount = #anomalies,
	}
	
	Cache:Set("acScan", result)
	Logger:Info("ACScanner", string.format("Scan completado: Score=%d, Nivel=%s, %d detecciones", totalScore, riskLevel, #allDetections))
	
	return result
end

-- Obtener resumen para UI
function AntiCheatScanner.GetSummary()
	local result = AntiCheatScanner.Scan()
	
	if result.RiskLevel == "HIGH" then
		return "Riesgo Alto", CONFIG.THEME.DANGER, result.RiskPercentage
	elseif result.RiskLevel == "MEDIUM" then
		return "Riesgo Medio", CONFIG.THEME.WARNING, result.RiskPercentage
	elseif result.RiskLevel == "LOW_MEDIUM" then
		return "Riesgo Bajo-Medio", CONFIG.THEME.WARNING, result.RiskPercentage
	else
		return "Riesgo Bajo", CONFIG.THEME.SUCCESS, result.RiskPercentage
	end
end

Logger:Info("ACScanner", "Módulo de escaneo anti-cheat inicializado")

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 11: SMART RECOMMENDATION ENGINE            ║
-- ╚══════════════════════════════════════════════════════════════╝

local RecommendationEngine = {}
RecommendationEngine._currentRecommendation = ""
RecommendationEngine._currentScore = 0
RecommendationEngine._history = {}

-- Calcular puntuación global y generar recomendación
function RecommendationEngine.Evaluate()
	-- Recopilar datos de todos los módulos
	local healthInfo = ServerHealthMonitor.GetStatusInfo()
	local adminResult = AdminDetector.Scan()
	local acResult = AntiCheatScanner.Scan()
	
	-- === Calcular puntuación compuesta (0-100) ===
	local score = 0
	local factors = {}
	
	-- Factor 1: Salud del servidor (peso: 40%)
	local healthWeight = 0.40
	local healthScore = healthInfo.Score
	score = score + (healthScore * healthWeight)
	table.insert(factors, {Name = "Salud del Servidor", Score = healthScore, Weight = healthWeight})
	
	-- Factor 2: Ping (peso: 15%)
	local pingWeight = 0.15
	local pingScore = 100
	if healthInfo.Ping > CONFIG.PING_THRESHOLDS.MEDIUM then
		pingScore = math.max(0, 100 - ((healthInfo.Ping - CONFIG.PING_THRESHOLDS.MEDIUM) / 3))
	elseif healthInfo.Ping > CONFIG.PING_THRESHOLDS.GOOD then
		pingScore = 100 - ((healthInfo.Ping - CONFIG.PING_THRESHOLDS.GOOD) / 2)
	end
	pingScore = math.clamp(pingScore, 0, 100)
	score = score + (pingScore * pingWeight)
	table.insert(factors, {Name = "Ping", Score = pingScore, Weight = pingWeight})
	
	-- Factor 3: FPS (peso: 15%)
	local fpsWeight = 0.15
	local fpsScore = math.clamp((healthInfo.FPS / 60) * 100, 0, 100)
	score = score + (fpsScore * fpsWeight)
	table.insert(factors, {Name = "FPS", Score = fpsScore, Weight = fpsWeight})
	
	-- Factor 4: Riesgo de Admin (peso: 15%)
	local adminWeight = 0.15
	local adminScore = 100
	if adminResult.DetectionLevel == "HIGH" then
		adminScore = 15
	elseif adminResult.DetectionLevel == "MEDIUM" then
		adminScore = 45
	elseif adminResult.DetectionLevel == "LOW" then
		adminScore = 70
	end
	score = score + (adminScore * adminWeight)
	table.insert(factors, {Name = "Riesgo Admin", Score = adminScore, Weight = adminWeight})
	
	-- Factor 5: Riesgo Anti-Cheat (peso: 15%)
	local acWeight = 0.15
	local acScore = 100 - acResult.RiskPercentage
	score = score + (acScore * acWeight)
	table.insert(factors, {Name = "Riesgo AC", Score = acScore, Weight = acWeight})
	
	-- Redondear puntuación final
	score = math.floor(math.clamp(score, 0, 100))
	
	-- === Generar recomendación basada en la puntuación ===
	local recommendation, recomColor, recomIcon
	
	if score >= CONFIG.RECOMMENDATION.OPTIMAL_MIN_SCORE then
		recommendation = "✅ Servidor óptimo para jugar"
		recomColor = CONFIG.THEME.SUCCESS
		recomIcon = "optimal"
	elseif score >= CONFIG.RECOMMENDATION.ACCEPTABLE_MIN_SCORE then
		recommendation = "⚠️ Servidor aceptable"
		recomColor = CONFIG.THEME.WARNING
		recomIcon = "acceptable"
		
		-- Agregar detalle de qué está bajo
		local worstFactor = nil
		local worstScore = 100
		for _, factor in ipairs(factors) do
			if factor.Score < worstScore then
				worstScore = factor.Score
				worstFactor = factor.Name
			end
		end
		if worstFactor then
			recommendation = recommendation .. " — " .. worstFactor .. " bajo"
		end
	else
		recommendation = "❌ Recomendado cambiar de servidor"
		recomColor = CONFIG.THEME.DANGER
		recomIcon = "change"
		
		-- Dar razón principal
		local reasons = {}
		for _, factor in ipairs(factors) do
			if factor.Score < 40 then
				table.insert(reasons, factor.Name)
			end
		end
		if #reasons > 0 then
			recommendation = recommendation .. " (" .. table.concat(reasons, ", ") .. ")"
		end
	end
	
	RecommendationEngine._currentRecommendation = recommendation
	RecommendationEngine._currentScore = score
	
	-- Guardar en historial
	table.insert(RecommendationEngine._history, {
		Time = tick(),
		Score = score,
		Recommendation = recommendation,
	})
	if #RecommendationEngine._history > 50 then
		table.remove(RecommendationEngine._history, 1)
	end
	
	return {
		Score = score,
		Recommendation = recommendation,
		Color = recomColor,
		Icon = recomIcon,
		Factors = factors,
	}
end

-- Obtener tendencia (mejorando/empeorando)
function RecommendationEngine.GetTrend()
	if #RecommendationEngine._history < 3 then
		return "STABLE", "—"
	end
	
	local recent = RecommendationEngine._history
	local latest = recent[#recent].Score
	local previous = recent[#recent - 2].Score
	
	local diff = latest - previous
	if diff > 5 then
		return "IMPROVING", "↑ Mejorando"
	elseif diff < -5 then
		return "DECLINING", "↓ Empeorando"
	else
		return "STABLE", "→ Estable"
	end
end

Logger:Info("RecomEngine", "Motor de recomendaciones inicializado")

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 12: PERFORMANCE OPTIMIZER                  ║
-- ╚══════════════════════════════════════════════════════════════╝

PerformanceOptimizer = {}
PerformanceOptimizer._isEnabled = false
PerformanceOptimizer._removedParticles = {}
PerformanceOptimizer._originalSettings = {}
PerformanceOptimizer._cleanedCount = 0

-- Activar optimizador
function PerformanceOptimizer.Enable()
	if PerformanceOptimizer._isEnabled then return end
	PerformanceOptimizer._isEnabled = true
	
	Logger:Info("PerfOptimizer", "Activando optimizador de rendimiento")
	
	-- === Limpiar partículas locales ===
	if CONFIG.OPTIMIZER.REMOVE_PARTICLES then
		PerformanceOptimizer._CleanParticles()
	end
	
	-- === Optimizar gráficos locales ===
	if CONFIG.OPTIMIZER.REDUCE_QUALITY then
		PerformanceOptimizer._ReduceGraphics()
	end
	
	UIEngine.ShowToast("FPS Boost activado", "SUCCESS")
	Logger:Info("PerfOptimizer", string.format("Optimización completada: %d partículas removidas", PerformanceOptimizer._cleanedCount))
end

-- Desactivar optimizador y restaurar
function PerformanceOptimizer.Disable()
	if not PerformanceOptimizer._isEnabled then return end
	PerformanceOptimizer._isEnabled = false
	
	Logger:Info("PerfOptimizer", "Desactivando optimizador, restaurando configuración")
	
	-- Restaurar partículas
	PerformanceOptimizer._RestoreParticles()
	
	-- Restaurar gráficos
	PerformanceOptimizer._RestoreGraphics()
	
	PerformanceOptimizer._cleanedCount = 0
	UIEngine.ShowToast("FPS Boost desactivado", "INFO")
end

-- Limpiar partículas y efectos visuales pesados
function PerformanceOptimizer._CleanParticles()
	local count = 0
	
	pcall(function()
		local particleTypes = {
			"ParticleEmitter", "Fire", "Smoke", "Sparkles",
			"Trail", "Beam", "PointLight", "SpotLight", "SurfaceLight",
		}
		
		for _, descendant in ipairs(workspace:GetDescendants()) do
			for _, particleType in ipairs(particleTypes) do
				if descendant:IsA(particleType) then
					-- Guardar referencia para restaurar
					table.insert(PerformanceOptimizer._removedParticles, {
						Instance = descendant,
						Parent = descendant.Parent,
						Enabled = descendant:IsA("ParticleEmitter") and descendant.Enabled or nil,
					})
					
					-- Desactivar en vez de destruir
					if descendant:IsA("ParticleEmitter") then
						descendant.Enabled = false
					elseif descendant:IsA("Fire") or descendant:IsA("Smoke") or descendant:IsA("Sparkles") then
						descendant.Enabled = false
					elseif descendant:IsA("Trail") then
						descendant.Enabled = false
					elseif descendant:IsA("Beam") then
						descendant.Enabled = false
					elseif descendant:IsA("PointLight") or descendant:IsA("SpotLight") or descendant:IsA("SurfaceLight") then
						descendant.Enabled = false
					end
					
					count = count + 1
					break
				end
			end
		end
	end)
	
	PerformanceOptimizer._cleanedCount = count
end

-- Restaurar partículas
function PerformanceOptimizer._RestoreParticles()
	for _, data in ipairs(PerformanceOptimizer._removedParticles) do
		pcall(function()
			if data.Instance and data.Instance.Parent then
				data.Instance.Enabled = true
			end
		end)
	end
	PerformanceOptimizer._removedParticles = {}
end

-- Reducir calidad gráfica
function PerformanceOptimizer._ReduceGraphics()
	pcall(function()
		-- Guardar configuración original
		PerformanceOptimizer._originalSettings = {
			GlobalShadows = Lighting.GlobalShadows,
			FogEnd = Lighting.FogEnd,
			Quality = settings().Rendering.QualityLevel,
		}
		
		-- Aplicar optimizaciones
		Lighting.GlobalShadows = false
		
		-- Reducir calidad de rendering
		pcall(function()
			settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		end)
	end)
end

-- Restaurar gráficos
function PerformanceOptimizer._RestoreGraphics()
	pcall(function()
		local orig = PerformanceOptimizer._originalSettings
		if orig.GlobalShadows ~= nil then
			Lighting.GlobalShadows = orig.GlobalShadows
		end
		if orig.Quality ~= nil then
			pcall(function()
				settings().Rendering.QualityLevel = orig.Quality
			end)
		end
	end)
	PerformanceOptimizer._originalSettings = {}
end

Logger:Info("PerfOptimizer", "Módulo de optimización de rendimiento inicializado")

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 13: ORQUESTADOR PRINCIPAL                  ║
-- ╚══════════════════════════════════════════════════════════════╝

local Orchestrator = {}
Orchestrator._running = false
Orchestrator._updateThread = nil
Orchestrator._adminScanThread = nil
Orchestrator._acScanThread = nil
Orchestrator._scanCount = 0
Orchestrator._startTime = tick()

-- Inicializar todo el sistema
function Orchestrator.Start()
	Logger:Info("Orchestrator", "═══ Iniciando Milzen Hub — Smart Server Analyzer ═══")
	Logger:Info("Orchestrator", "Versión: " .. CONFIG.VERSION)
	
	-- Paso 1: Inicializar UI
	Logger:Info("Orchestrator", "Paso 1/4: Inicializando interfaz...")
	UIEngine.Initialize()
	task.wait(0.5)
	
	-- Paso 2: Primer escaneo
	Logger:Info("Orchestrator", "Paso 2/4: Ejecutando análisis inicial...")
	Orchestrator._PerformFullAnalysis()
	task.wait(0.3)
	
	-- Paso 3: Toast de bienvenida
	UIEngine.ShowToast("Milzen Hub iniciado correctamente", "SUCCESS")
	task.wait(0.5)
	UIEngine.ShowToast("Analizando servidor en tiempo real...", "INFO")
	
	-- Paso 4: Iniciar loops de actualización
	Logger:Info("Orchestrator", "Paso 3/4: Iniciando loops de actualización...")
	Orchestrator._running = true
	Orchestrator._StartUpdateLoops()
	
	Logger:Info("Orchestrator", "Paso 4/4: Sistema completamente operativo ✅")
	Logger:Info("Orchestrator", "═══════════════════════════════════════════════════")
end

-- Realizar análisis completo
function Orchestrator._PerformFullAnalysis()
	Orchestrator._scanCount = Orchestrator._scanCount + 1
	
	pcall(function()
		-- Invalidar caché para forzar datos frescos
		Cache:Invalidate("ping")
		Cache:Invalidate("fps")
		Cache:Invalidate("playerCount")
		Cache:Invalidate("stability")
		Cache:Invalidate("adminScan")
		Cache:Invalidate("acScan")
		
		-- === Obtener métricas de salud ===
		local healthInfo = ServerHealthMonitor.GetStatusInfo()
		
		-- Actualizar UI de métricas
		local pingColor = ServerHealthMonitor.GetPingColor(healthInfo.Ping)
		local fpsColor = ServerHealthMonitor.GetFPSColor(healthInfo.FPS)
		
		UIEngine.UpdateMetricCard("PingCard", healthInfo.Ping, pingColor, "ms")
		UIEngine.UpdateMetricCard("FPSCard", healthInfo.FPS, fpsColor, "")
		UIEngine.UpdateMetricCard("PlayersCard",
			healthInfo.PlayerCount .. "/" .. healthInfo.MaxPlayers,
			healthInfo.PlayerCount > CONFIG.PLAYER_THRESHOLDS.MEDIUM and CONFIG.THEME.WARNING or CONFIG.THEME.SUCCESS,
			""
		)
		
		-- Actualizar estado del servidor
		UIEngine.UpdateServerStatus(healthInfo.Status, healthInfo.Color)
		
		-- === Admin Detection ===
		local adminText, adminColor = AdminDetector.GetSummary()
		UIEngine.UpdateMetricCard("AdminCard", adminText, adminColor, "")
		
		-- === Anti-Cheat Scan ===
		local acText, acColor, acPercentage = AntiCheatScanner.GetSummary()
		UIEngine.UpdateMetricCard("ACCard", acText, acColor, "")
		
		-- Actualizar nivel de riesgo
		local riskLabel, riskColor
		if acPercentage >= 60 then
			riskLabel = "Alto (" .. acPercentage .. "%)"
			riskColor = CONFIG.THEME.DANGER
		elseif acPercentage >= 30 then
			riskLabel = "Medio (" .. acPercentage .. "%)"
			riskColor = CONFIG.THEME.WARNING
		else
			riskLabel = "Bajo (" .. acPercentage .. "%)"
			riskColor = CONFIG.THEME.SUCCESS
		end
		UIEngine.UpdateRiskLevel(acPercentage, riskLabel, riskColor)
		
		-- === Recommendation Engine ===
		local recomResult = RecommendationEngine.Evaluate()
		UIEngine.UpdateRecommendation(recomResult.Recommendation, recomResult.Color)
		
		-- === Actualizar Detalles ===
		local trendDir, trendText = RecommendationEngine.GetTrend()
		local gameName = "—"
		pcall(function()
			gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
		end)
		if gameName == "—" then
			pcall(function()
				gameName = game.PlaceId and ("PlaceID: " .. game.PlaceId) or "—"
			end)
		end
		
		local leftText = string.format("Servidor: %s\nJuego: %s",
			healthInfo.Status,
			gameName
		)
		local rightText = string.format("Puntuación: %d/100 %s\nÚltimo scan: %s",
			recomResult.Score,
			trendText,
			os.date("%H:%M:%S")
		)
		UIEngine.UpdateDetails(leftText, rightText)
		
		-- === Notificaciones inteligentes ===
		if Orchestrator._scanCount > 1 then
			-- Notificar cambios significativos
			if recomResult.Score < 30 and Orchestrator._scanCount % 5 == 0 then
				UIEngine.ShowToast("Servidor en mal estado, considera cambiar", "WARNING")
			end
		end
	end)
end

-- Iniciar loops de actualización
function Orchestrator._StartUpdateLoops()
	-- Loop principal de actualización rápida (métricas ligeras)
	Orchestrator._updateThread = task.spawn(function()
		while Orchestrator._running do
			pcall(function()
				-- Actualizar solo métricas ligeras
				local ping = ServerHealthMonitor.GetPing()
				local fps = ServerHealthMonitor.GetFPS()
				local playerCount = ServerHealthMonitor.GetPlayerCount()
				
				local pingColor = ServerHealthMonitor.GetPingColor(ping)
				local fpsColor = ServerHealthMonitor.GetFPSColor(fps)
				
				UIEngine.UpdateMetricCard("PingCard", ping, pingColor, "ms")
				UIEngine.UpdateMetricCard("FPSCard", fps, fpsColor, "")
				UIEngine.UpdateMetricCard("PlayersCard",
					playerCount .. "/" .. ServerHealthMonitor.GetMaxPlayers(),
					playerCount > CONFIG.PLAYER_THRESHOLDS.MEDIUM and CONFIG.THEME.WARNING or CONFIG.THEME.SUCCESS,
					""
				)
			end)
			task.wait(CONFIG.UI_UPDATE_INTERVAL)
		end
	end)
	
	-- Loop de análisis completo (menos frecuente)
	Orchestrator._adminScanThread = task.spawn(function()
		while Orchestrator._running do
			task.wait(CONFIG.REFRESH_INTERVAL)
			pcall(function()
				Orchestrator._PerformFullAnalysis()
			end)
		end
	end)
	
	-- Loop de escaneo de admin (aún menos frecuente)
	task.spawn(function()
		while Orchestrator._running do
			task.wait(CONFIG.ADMIN_SCAN_INTERVAL)
			pcall(function()
				Cache:Invalidate("adminScan")
				local adminText, adminColor = AdminDetector.GetSummary()
				UIEngine.UpdateMetricCard("AdminCard", adminText, adminColor, "")
			end)
		end
	end)
	
	-- Loop de escaneo anti-cheat (el menos frecuente)
	task.spawn(function()
		while Orchestrator._running do
			task.wait(CONFIG.ANTICHEAT_SCAN_INTERVAL)
			pcall(function()
				Cache:Invalidate("acScan")
				local acText, acColor, acPercentage = AntiCheatScanner.GetSummary()
				UIEngine.UpdateMetricCard("ACCard", acText, acColor, "")
				
				-- Actualizar barra de riesgo
				local riskLabel, riskColor
				if acPercentage >= 60 then
					riskLabel = "Alto (" .. acPercentage .. "%)"
					riskColor = CONFIG.THEME.DANGER
				elseif acPercentage >= 30 then
					riskLabel = "Medio (" .. acPercentage .. "%)"
					riskColor = CONFIG.THEME.WARNING
				else
					riskLabel = "Bajo (" .. acPercentage .. "%)"
					riskColor = CONFIG.THEME.SUCCESS
				end
				UIEngine.UpdateRiskLevel(acPercentage, riskLabel, riskColor)
			end)
		end
	end)
	
	-- Listener: jugador nuevo se une o se va
	local playerAddedConn = Players.PlayerAdded:Connect(function(player)
		Cache:Invalidate("playerCount")
		Cache:Invalidate("adminScan")
		task.wait(1)
		pcall(function()
			UIEngine.ShowToast(player.Name .. " se unió al servidor", "INFO", 3)
		end)
	end)
	table.insert(UIEngine._connections, playerAddedConn)
	
	local playerRemovingConn = Players.PlayerRemoving:Connect(function(player)
		Cache:Invalidate("playerCount")
		Cache:Invalidate("adminScan")
		pcall(function()
			UIEngine.ShowToast(player.Name .. " salió del servidor", "INFO", 3)
		end)
	end)
	table.insert(UIEngine._connections, playerRemovingConn)
	
	Logger:Info("Orchestrator", "Todos los loops de actualización iniciados")
end

-- Detener todo
function Orchestrator.Stop()
	Orchestrator._running = false
	Logger:Info("Orchestrator", "Sistema detenido")
end

-- ╔══════════════════════════════════════════════════════════════╗
-- ║           MÓDULO 14: PUNTO DE ENTRADA                       ║
-- ╚══════════════════════════════════════════════════════════════╝

-- Proteger todo el inicio con pcall
local initSuccess, initError = pcall(function()
	Orchestrator.Start()
end)

if not initSuccess then
	warn("[Milzen Hub] Error de inicialización: " .. tostring(initError))
	-- Intentar mostrar al menos un mensaje
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = "Milzen Hub",
			Text = "Error al iniciar: " .. tostring(initError),
			Duration = 5,
		})
	end)
end

--[[
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║                    FIN DEL SCRIPT PRINCIPAL                      ║
║                                                                  ║
║  Milzen Hub — Smart Server Analyzer v3.0.0 PREMIUM               ║
║  Desarrollado con dedicación para Delta Executor                 ║
║  ✅ Activo y Funcionando                                         ║
║                                                                  ║
║  Módulos cargados:                                               ║
║   ✓ Configuración Global                                        ║
║   ✓ Sistema Anti-Duplicado                                       ║
║   ✓ Cache Inteligente                                            ║
║   ✓ Sistema de Logs                                              ║
║   ✓ Motor de UI Premium                                         ║
║   ✓ Server Health Monitor                                        ║
║   ✓ Admin Detector Inteligente                                   ║
║   ✓ Anti-Cheat Risk Scanner                                     ║
║   ✓ Smart Recommendation Engine                                  ║
║   ✓ Performance Optimizer                                        ║
║   ✓ Sistema de Notificaciones Toast                              ║
║   ✓ Orquestador Principal                                        ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
--]]