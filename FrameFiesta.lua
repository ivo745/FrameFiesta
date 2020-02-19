local FF = LibStub("AceAddon-3.0"):NewAddon("FrameFiesta")
local LSM = LibStub("LibSharedMedia-3.0")
local LW = LibStub("LibWindow-1.1")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local ADB = LibStub("AceDB-3.0")
local ADBO = LibStub("AceDBOptions-3.0")
local LDS = LibStub("LibDualSpec-1.0")

local type, tonumber, next, pairs, ipairs = type, tonumber, next, pairs, ipairs
local insert = table.insert
local _G = _G
local dbStructContainer = {}
local shownFrames = {}

local db
local defaults = {
	profile = {
	},
	global = {
		hasUpdate = false,
		hasChildren = false,
		hasName = false,
		isVisible = false,
	}
}

local alphabet = {
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
}

local options = {
	name = "FrameFiesta",
	type = "group",
	handler = FF,
	childGroups = "tab",
	args = {
		settings = {
			order = 1,
			type = "group",
			name = "settings",
			childGroups = "tab",
			args = {
				version = {
					order = 1,
					type = "description",
					name = "hi"
				},
			},
		},
		framesTab = {
			order = 2,
			type = "group",
			name = "frames",
			childGroups = "tab",
			args = {
				toggleVisible = {
					type = "execute",
					order = 1,
					name = "Refresh",
					desc = "",
					func = "createFrames",
				},
				frames = {
					order = 2,
					type = "group",
					name = "Frames",
					childGroups = "tab",
					args = {
						A = {
							order = 1,
							type = "group",
							name = "A",
							childGroups = "tab",
							args = {}
						},
						B = {
							order = 2,
							type = "group",
							name = "B",
							childGroups = "tab",
							args = {}
						},
						C = {
							order = 3,
							type = "group",
							name = "C",
							childGroups = "tab",
							args = {}
						},
						D = {
							order = 4,
							type = "group",
							name = "D",
							childGroups = "tab",
							args = {}
						},
						E = {
							order = 5,
							type = "group",
							name = "E",
							childGroups = "tab",
							args = {}
						},
						F = {
							order = 6,
							type = "group",
							name = "F",
							childGroups = "tab",
							args = {}
						},
						G = {
							order = 7,
							type = "group",
							name = "G",
							childGroups = "tab",
							args = {}
						},
						H = {
							order = 8,
							type = "group",
							name = "H",
							childGroups = "tab",
							args = {}
						},
						I = {
							order = 9,
							type = "group",
							name = "I",
							childGroups = "tab",
							args = {}
						},
						J = {
							order = 10,
							type = "group",
							name = "J",
							childGroups = "tab",
							args = {}
						},
						K = {
							order = 11,
							type = "group",
							name = "K",
							childGroups = "tab",
							args = {}
						},
						L = {
							order = 12,
							type = "group",
							name = "L",
							childGroups = "tab",
							args = {}
						},
						M = {
							order = 13,
							type = "group",
							name = "M",
							childGroups = "tab",
							args = {}
						},
						N = {
							order = 14,
							type = "group",
							name = "N",
							childGroups = "tab",
							args = {}
						},
						O = {
							order = 15,
							type = "group",
							name = "O",
							childGroups = "tab",
							args = {}
						},
						P = {
							order = 16,
							type = "group",
							name = "P",
							childGroups = "tab",
							args = {}
						},
						Q = {
							order = 17,
							type = "group",
							name = "Q",
							childGroups = "tab",
							args = {}
						},
						R = {
							order = 18,
							type = "group",
							name = "R",
							childGroups = "tab",
							args = {}
						},
						S = {
							order = 19,
							type = "group",
							name = "S",
							childGroups = "tab",
							args = {}
						},
						T = {
							order = 20,
							type = "group",
							name = "T",
							childGroups = "tab",
							args = {}
						},
						U = {
							order = 21,
							type = "group",
							name = "U",
							childGroups = "tab",
							args = {}
						},
						V = {
							order = 22,
							type = "group",
							name = "V",
							childGroups = "tab",
							args = {}
						},
						W = {
							order = 23,
							type = "group",
							name = "W",
							childGroups = "tab",
							args = {}
						},
						X = {
							order = 24,
							type = "group",
							name = "X",
							childGroups = "tab",
							args = {}
						},
						Y = {
							order = 25,
							type = "group",
							name = "Y",
							childGroups = "tab",
							args = {}
						},
						Z = {
							order = 26,
							type = "group",
							name = "Z",
							childGroups = "tab",
							args = {}
						},
					}
				},
				childframes = {
					order = 3,
					type = "group",
					name = "Children",
					childGroups = "tab",
					args = {
						A = {
							order = 1,
							type = "group",
							name = "A",
							childGroups = "tab",
							args = {}
						},
						B = {
							order = 2,
							type = "group",
							name = "B",
							childGroups = "tab",
							args = {}
						},
						C = {
							order = 3,
							type = "group",
							name = "C",
							childGroups = "tab",
							args = {}
						},
						D = {
							order = 4,
							type = "group",
							name = "D",
							childGroups = "tab",
							args = {}
						},
						E = {
							order = 5,
							type = "group",
							name = "E",
							childGroups = "tab",
							args = {}
						},
						F = {
							order = 6,
							type = "group",
							name = "F",
							childGroups = "tab",
							args = {}
						},
						G = {
							order = 7,
							type = "group",
							name = "G",
							childGroups = "tab",
							args = {}
						},
						H = {
							order = 8,
							type = "group",
							name = "H",
							childGroups = "tab",
							args = {}
						},
						I = {
							order = 9,
							type = "group",
							name = "I",
							childGroups = "tab",
							args = {}
						},
						J = {
							order = 10,
							type = "group",
							name = "J",
							childGroups = "tab",
							args = {}
						},
						K = {
							order = 11,
							type = "group",
							name = "K",
							childGroups = "tab",
							args = {}
						},
						L = {
							order = 12,
							type = "group",
							name = "L",
							childGroups = "tab",
							args = {}
						},
						M = {
							order = 13,
							type = "group",
							name = "M",
							childGroups = "tab",
							args = {}
						},
						N = {
							order = 14,
							type = "group",
							name = "N",
							childGroups = "tab",
							args = {}
						},
						O = {
							order = 15,
							type = "group",
							name = "O",
							childGroups = "tab",
							args = {}
						},
						P = {
							order = 16,
							type = "group",
							name = "P",
							childGroups = "tab",
							args = {}
						},
						Q = {
							order = 17,
							type = "group",
							name = "Q",
							childGroups = "tab",
							args = {}
						},
						R = {
							order = 18,
							type = "group",
							name = "R",
							childGroups = "tab",
							args = {}
						},
						S = {
							order = 19,
							type = "group",
							name = "S",
							childGroups = "tab",
							args = {}
						},
						T = {
							order = 20,
							type = "group",
							name = "T",
							childGroups = "tab",
							args = {}
						},
						U = {
							order = 21,
							type = "group",
							name = "U",
							childGroups = "tab",
							args = {}
						},
						V = {
							order = 22,
							type = "group",
							name = "V",
							childGroups = "tab",
							args = {}
						},
						W = {
							order = 23,
							type = "group",
							name = "W",
							childGroups = "tab",
							args = {}
						},
						X = {
							order = 24,
							type = "group",
							name = "X",
							childGroups = "tab",
							args = {}
						},
						Y = {
							order = 25,
							type = "group",
							name = "Y",
							childGroups = "tab",
							args = {}
						},
						Z = {
							order = 26,
							type = "group",
							name = "Z",
							childGroups = "tab",
							args = {}
						},
					},
				}
			}
		},
		generalOptions = {
			order = 4,
			type = "group",
			name = "General Settings",
			args = {
				toggleVisible = {
					type = "toggle",
					order = 1,
					name = "isVisible",
					desc = "",
					set = function(info, value)
						FF.db.global.isVisible = value
					end,
					get = function(info) return FF.db.global.isVisible end
				},
				toggleChildren = {
					type = "toggle",
					order = 2,
					name = "hasChildren",
					desc = "",
					set = function(info, value)
						FF.db.global.hasChildren = value
					end,
					get = function(info) return FF.db.global.hasChildren end
				},
				toggleName = {
					type = "toggle",
					order = 3,
					name = "hasName",
					desc = "",
					set = function(info, value)
						FF.db.global.hasName = value
					end,
					get = function(info) return FF.db.global.hasName end
				},
				toggleUpdate = {
					type = "toggle",
					order = 4,
					name = "hasUpdate",
					desc = "",
					set = function(info, value)
						FF.db.global.hasUpdate = value
					end,
					get = function(info) return FF.db.global.hasUpdate end
				},
			},
		},
		responseOptions = {
			order = 5,
			type = "group",
			name = "hi",
			args = {
				autoPass = {
					order = 1,
					name = "hi",
					type = "toggle",
				},
			},
		}
	}
}

local function emptyTable(container)
	if next(container) ~= nil then
		for k,v in pairs(container) do container[k]=nil end
	end
end

local function deepcopy(...)
	local step = 0
    local copy = {}
    for k, v in ipairs(...) do
		if v ~= nil then
			step = step + 1
			copy[k] = v
		end
    end
    return copy
end

local children = {}
local lastChunk = 0

local function printkids(orig, k)
	local copy = {}
	local mini = lastChunk+1
	local maxi = lastChunk +tonumber(orig[k])
	for i = mini, maxi do
		copy[i] = children[i]
	end
	lastChunk = lastChunk+orig[k]
	return copy
end

local function iterateparent(frame, shown, list)
	local step = 0
	for k, v in pairs(options.args.framesTab.args.frames.args) do
		v.args = {}
		for kk, vv in pairs(frame) do
			step = step + 1
			insert(v.args, {
					order = step,
					type = "toggle",
					name = tostring(vv),
					values = printkids(list, kk),
					set = function(info, key, value)
						childShown[key] = _G[children[key]]:IsShown()
						if childShown[key] then
							_G[children[key]]:Hide()
						else
							_G[children[key]]:Show()
						end
						childShown[key] = _G[children[key]]:IsShown()
						end,
					get = function(info, key) return childShown[key] end
				}
			)
		end
	end
end

local function iteratelone(frame, shown)
	local step = 0
	for k, v in pairs(options.args.framesTab.args.frames.args) do
		for kk, vv in pairs(frame) do
			if string.sub(vv, 1, 1) == k then -- equals alphabettical character
				step = step + 1
				insert(v.args, {
					order = step,
					type = "toggle",
					enabled = shown[kk],
					name = tostring(vv),
					set = function(info, value)
						shown[kk] = _G[vv]:IsShown()
						if shown[kk] then
							_G[vv]:Hide()
						else
							_G[vv]:Show()
						end
						shown[kk] = _G[vv]:IsShown()
						end,
					get = function(info) return shown[kk] end
				}
			)
			end
		end
	end
end

SLASH_FRAMEFIESTA1 = "/ff"
SlashCmdList["FRAMEFIESTA"] = function(msg)
	local cmd = msg:lower()
	if cmd == "" then
		InterfaceOptionsFrame_OpenToCategory("FrameFiesta")
		InterfaceOptionsFrame_OpenToCategory("FrameFiesta")
		InterfaceOptionsFrame_OpenToCategory("FrameFiesta")
	end
end

local MyAddon_UpdateInterval = 1.0;
local updateInterval = 0;

function MyAddon_OnUpdate(self, elapsed)
	updateInterval = updateInterval + elapsed
	while (updateInterval > MyAddon_UpdateInterval) do

		updateInterval = updateInterval - MyAddon_UpdateInterval;
	end
end

function FF:createFrames()
	local frame = EnumerateFrames()
	local dbStruct = {}
	local parentShown = {}
	local parentName = {}
	local isParent = {}
	local childShown = {}
	local list = {}
	local loneFrame = {}
	local loneFrameShown = {}

	emptyTable(dbStructContainer)
	emptyTable(dbStruct)
	emptyTable(parentName)
	emptyTable(isParent)
	emptyTable(childShown)
	emptyTable(list)
	emptyTable(parentShown)
	emptyTable(loneFrame)
	emptyTable(loneFrameShown)

	while frame do
		local gotoback = false
		if frame:GetName() == nil then
			gotoback = true;
		elseif frame:IsProtected() then
			gotoback = true;
		elseif FF.db.global.isVisible and not frame:IsVisible() then
			gotoback = true;
		elseif not FF.db.global.isVisible and frame:IsVisible() then
			gotoback = true;
		end
		if not gotoback then
			if FF.db.global.hasChildren then
				if (frame:GetChildren()) then
					insert(parentName, frame:GetName())
					insert(parentShown, frame:IsShown())
					local num = 0
					local kids = deepcopy({frame:GetChildren()})
					for k, v in pairs(kids) do
						if tostring(v:GetName()) ~= "nil" then
							insert(children, tostring(v:GetName()))
							insert(childShown, v:IsShown())
							num = num + 1
						end
					end
					insert(list, num)
				end
			else
				insert(loneFrame, frame:GetName())
				insert(loneFrameShown, frame:IsShown())
			end
		end
		frame = EnumerateFrames(frame)
	end
	local step = 0
	for k, v in pairs(options.args.framesTab.args.childframes.args) do
		for kk, vv in pairs(parentName) do
			if string.sub(vv, 1, 1) == k then -- equals alphabettical character
				step = step + 1
				insert(v.args, {
						order = step,
						type = "multiselect",
						name = tostring(vv),
						values = printkids(list, kk),
						set = function(info, key, value)
							childShown[key] = _G[children[key]]:IsShown()
							if childShown[key] then
								_G[children[key]]:Hide()
							else
								_G[children[key]]:Show()
							end
							childShown[key] = _G[children[key]]:IsShown()
							end,
						get = function(info, key) return childShown[key] end
					}
				)
			end
		end
	end
	for k, v in pairs(options.args.framesTab.args.frames.args) do
		for kk, vv in pairs(loneFrame) do
			if string.sub(vv, 1, 1) == k then -- equals alphabettical character
				step = step + 1
				insert(v.args, {
					order = step,
					type = "toggle",
					enabled = loneFrameShown[kk],
					name = tostring(vv),
					set = function(info, value)
						loneFrameShown[kk] = _G[vv]:IsShown()
						if loneFrameShown[kk] then
							_G[vv]:Hide()
						else
							_G[vv]:Show()
						end
						loneFrameShown[kk] = _G[vv]:IsShown()
						end,
					get = function(info) return loneFrameShown[kk] end
				}
			)
			end
		end
	end

	--table.sort(argss, function(a, b) return a < b end)
	--for k, v in pairs(argss) do
	--	argssargss[k] = dbStructContainer[k]
	--end
	FF.db.global.args = options.args.framesTab.args.frames.args
end

function FF:OnInitialize()
	print("|cffDA2820FrameFiesta|r|cffFFFF00:|r |cff00FF00/ff|r |cffFFFF00for options.|r")
	FF.db = ADB:New("FrameFiestaDB", defaults, true)
	InterfaceOptions_AddCategory("FrameFiesta")
	ACD:AddToBlizOptions("FrameFiesta")
	--ACD:AddToBlizOptions("NoNoGoGoProfiles", "Profiles", "NoNoGoGo")
	AC:RegisterOptionsTable("FrameFiesta", options)
	AC:RegisterOptionsTable("FrameFiestaProfiles", ADBO:GetOptionsTable(FF.db))
	--LDS:EnhanceDatabase(FF.db, "FrameFiestaDB")
	--LDS:EnhanceOptions(ADBO:GetOptionsTable(FF.db), FF.db)
	--FF.db.RegisterCallback(self, "OnProfileChanged", "RefreshSettings")
	--FF.db.RegisterCallback(self, "OnProfileCopied", "RefreshSettings")
	--FF.db.RegisterCallback(self, "OnProfileReset", "RefreshSettings")

	FF.OnInitialize = nil
end