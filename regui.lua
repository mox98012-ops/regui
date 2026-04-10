
if (getgenv().nil_solutions) then
    return;
end;
getgenv().nil_solutions = true;

if (not game:IsLoaded()) then game.Loaded:Wait(); end;

if (game.GameId ~= 1390601379) then
    return; 
end;

local userinputservice = cloneref(game:GetService("UserInputService"));
local collectionservice = game:GetService("CollectionService");
local teleportservice = game:GetService("TeleportService");
local repstorage = game:GetService("ReplicatedStorage");
local tweenservice = game:GetService("TweenService");
local httpservice = game:GetService("HttpService");
local runservice = game:GetService("RunService");
local workspace = game:GetService("Workspace");
local players = game:GetService("Players");

local localplayer = players.LocalPlayer or players:GetPropertyChangedSignal("LocalPlayer"):Wait() and players.LocalPlayer;

local character = localplayer.Character or localplayer.CharacterAdded:Wait();
local humanoidrootpart = character:WaitForChild("HumanoidRootPart");
local humanoid = character:WaitForChild("Humanoid");
local camera = workspace.CurrentCamera;

local vector3_new = Vector3.new;
local cframe_new = CFrame.new;
local cframe_angles = CFrame.Angles;
local drawing_new = Drawing.new;
local math_random = math.random;
local math_sin = math.sin;
local math_cos = math.cos;
local math_floor = math.floor;
local vector2_new = Vector2.new;
local task_spawn = task.spawn;

localplayer:WaitForChild("DataLoaded");
repstorage:WaitForChild("ClientInitFinished");
repstorage:WaitForChild("ServerInitFinished");

workspace.FallenPartsDestroyHeight = -math.huge;
for _, void in pairs(workspace:GetDescendants()) do
	if (void.Name == "VoidCollidePart" and void:IsA("Part")) then
        void.CanTouch = false;
		void:GetPropertyChangedSignal("CanTouch"):Connect(function() 
            if (void.CanTouch ~= false) then 
                void.CanTouch = false; 
            end; 
        end);
	end;
end;

workspace:GetPropertyChangedSignal("FallenPartsDestroyHeight"):Connect(function() 
    if (workspace.FallenPartsDestroyHeight ~= -math.huge) then 
        workspace.FallenPartsDestroyHeight = -math.huge; 
    end; 
end);

if (not LPH_OBFUSCATED) then
	LPH_NO_VIRTUALIZE = newcclosure(function(...) return ...; end);
	LPH_NO_UPVALUES = newcclosure(function(...) return ...; end);
	LPH_JIT_MAX = newcclosure(function(...) return ...; end);
	LPH_CRASH = newcclosure(function(...) return ...; end);
	LPH_JIT = newcclosure(function(...) return ...; end);
end;

local Data = Data;
if not Data then Data = {InviteToDiscord = false, Intro = true, KillSayStuff = {Normal = {"bro, respawn faster, I need more %XP% XP", "can someone hvh me?? im guessing nobody can 🤣", "你的WiFi是土豆吗, %Died%?", "你打游戏好像老奶奶一样", "Atleast u died to SERENIUM, %Died%", "你是NPC吗, %Died%?", "你的技能和样老", "fix ur aim %Died%", "damn is 😂", "听说你用Internet Explorer在玩游戏", "お前の反応はカタツムリより遅いぞ", "你在玩手机上吗, %Died%?", "你刚才是睡着了吗?", "🤖 你是一台机器人吗, %Died%?", "Internet says 'how to dodge in combat warriors'", "turn off 'get beaten by skids' in cw settings", "左, 右, 晚安 :skull:", "お前はもう死んでいる", "ты был удалён с сервера", "איפה הכבוד שלך, %Died%?", "あなたはゲームをやめるべきです", "your kd is negative btw %Died%", "你的存活率比0%还低", "parrying 💔💔", "Internet says 'how to recover from public humiliation'", "get this script at /SERENIUM !", "tired of cheaters? become one yourself and combat them! /SERENIUM", "Outplayed by SERENIUM.", }, Assist = {"你没死于我, 是死于团队合作", "split my %XP% XP and %Credits% credits with a random, ty for the donation %Died%", "お前は味方にやられた", "ты просто статистика", "你被团队协作打败了", "didnt need an assist to kill u %Died%", "谁帮我补刀的? 这次算你赚到", "yo %Died%, we both know I didn't need the assist", }, Finish = {"你的账号已被暂停, %Died%", "bro got sent to the shadow realm by a %Weapon%", "%Died%, should've dodged, oh wait… too late 💀", "yo %Died%, your Roblox career ended faster than a limited item stock", "Ты уничтожен", "ur name should be 'free kill', %Died%", "%Died% died so fast that Roblox lagged 💀", "お前の敗北は確定していた", "お前の人生はチェックメイト", "fatality.", "bro went out like a YouTube tutorial dummy", "bro got cooked, fried, and served", "bro's internet provider officially disowned him", "Mustache Man once said: 'The greatest defeat comes when one refuses to accept their fate.'", "Napoleon once declared: 'The war is won in the mind before the battlefield.'", "Sun Tzu once wrote: 'The battlefield is not just a place, it is a state of mind.'", "Genghis Khan once proclaimed: 'A warrior's life ends when they fail to adapt to the changing tides.'", "Einstein once said: 'In the end, only the smart survive.'", }, Glory = { "你的死亡动画很美, %Died%", "someone clip that dawg, %Died% just got packed", "%Died%, wanna see my recoil script? (it's called skill)", "yo %Died%, ur gameplay lookin like a speedrun to the death screen", "bro's last words: 'I got this' 💀", "удар был смертельным", "ur name should be 'free kill', %Died%", "%Died% died so fast that Roblox lagged 💀", "お前の存在が消えた", "я сохранил этот момент", "bro thought he was the protagonist, I made sure he wasn't", "Google says 'how to recover from a humiliation kill'", "%Died%, that was a fatality, not a kill", "bro got deleted so hard, he's gonna respawn in another server", "I'm screenshotting this kill for my collection %Died%", "你只是我今天的另一个XP点数 ", "お前は何だったの？", "left right goodnight :skull:", "clip that, I need it for my mixtape", "bro got an express ticket to spectate mode", "100% uninstall speedrun, new record %Died%", "bro thought he had a chance, but the script said no", "Mustache Man once said: 'Victory is a sweet taste for those who dare to fight without hesitation.'", "Sun Tzu once wrote: 'The only true defeat is one suffered without a fight.'", "Einstein once said: 'It's not about how fast you run, but how you use your momentum.'", "Genghis Khan once declared: 'A battle is not won by strength alone, but by will and intellect.'", "Napoleon said: 'The best way to predict the future is to make it.'", }, }, }; end;
local modules, framework;

do
    setstackhidden(1, true);

    local hooked_functions = {};
    local detected_field, kill_environment, adonis_event;

    local function is_adonis(obj)
        if (obj:IsA("RemoteEvent") and string.match(obj.Name, "^%w%w%w%w%w%w%w%w%-%w%w%w%w%-%w%w%w%w%-%w%w%w%w%-%w%w%w%w%w%w%w%w%w%w%w%w$")) then
            local remote_function = obj:FindFirstChild("__FUNCTION");
            if (remote_function and remote_function:IsA("RemoteFunction")) then
                return true;
            end
        end
        return false;
    end;

    for _, obj in ipairs(repstorage:GetChildren()) do
        if (is_adonis(obj)) then
            adonis_event = obj;
            break;
        end;
    end;

    local blacklisted_names = {"createBodyMover", "getIsAcDisabled"};

    local function is_spooky(str)
        if (type(str) ~= "string" or #str < 4) then
            return false;
        end;
        if (str:sub(-17) == ".AntiCheatHandler") then
            return false;
        end;
        return str:lower():find("anti") ~= nil;
    end;

    setthreadidentity(2);
    for _, obj in getgc(true) do
        if (typeof(obj) == "table") then
            local detected_env = rawget(obj, "Detected");
            if (typeof(detected_env) == "function" and not detected_field) then
                detected_field = detected_env;
                local function_info = newcclosure(function()
                    return debug.getinfo(detected_field, "u");
                end)();
                if (function_info and function_info.nups) then
                    for i = 1, function_info.nups do
                        local s, v = newcclosure(pcall(function()
                            return true, debug.getupvalue(detected_field, i);
                        end))();
                        if (s and (typeof(v) == "userdata" or typeof(v) == "Instance")) then
                            pcall(newcclosure(function()
                                debug.setupvalue(detected_field, i, nil);
                            end));
                        end;
                    end;
                end;
                table.insert(hooked_functions, detected_field);
            end;
        end;
    end;
    setthreadidentity(7);

    for _, obj in pairs(getreg()) do
        if (type(obj) == "thread") then
            local success, source = pcall(debug.info, obj, 1, "s");
            if (success and is_spooky(source)) then task.cancel(obj); end;
        end;
    end;

    for _, obj in pairs(getgc(true)) do
        if (type(obj) == "function") then
            local success, source = pcall(debug.info, obj, "s");
            if (success) then
                if (is_spooky(source)) then
                elseif (source:find(".AntiCheatHandler")) then
                    local success2, uv = pcall(debug.getupvalues, obj);
                    if (success2 and #uv ~= 2) then end;
                end;
            end;
        elseif (type(obj) == "table") then
            local success, val = pcall(rawget, obj, "getIsBodyMoverCreatedByGame");
            if (success and val) then
                for k, v in pairs(obj) do
                    if (type(v) == "function" and not table.find(blacklisted_names, k)) then end;
                end;
            end;
        end;
    end;
end;

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xectray1/linoria-fork/refs/heads/main/linoria.lua"))();
local savemanager = loadstring(game:HttpGet("https://raw.githubusercontent.com/xectray1/savemanager/refs/heads/main/linoria.lua"))();
local thememanager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/refs/heads/main/addons/ThemeManager.lua"))();
setthreadidentity(8);
local window = library:CreateWindow({Title = "                                                    nil.solutions - discord.gg/serenium     					<font color=\"#ff0000\">combat warriors</font>", Center = true, AutoShow = true, TabPadding = 8, MenuFadeTime = 0});
setthreadidentity(7);
local tabs = {main = window:AddTab('main'), ranged = window:AddTab("ranged"); charactertab = window:AddTab("character"), misc = window:AddTab("misc"), visuals = window:AddTab("visuals"), settings = window:AddTab("settings")};

main = tabs.main:AddLeftGroupbox("main");
strafe_tab = tabs.main:AddLeftGroupbox("strafe");
parrysection2 = tabs.main:AddRightGroupbox("auto parry")
parrysection = tabs.main:AddRightGroupbox("modifications")
mmisc = tabs.misc:AddLeftGroupbox("main");
miscauto = tabs.misc:AddLeftGroupbox("auto");
misc = tabs.misc:AddLeftGroupbox("cosmetic");
crates = tabs.misc:AddLeftGroupbox("crates");
misc_tab = tabs.misc:AddRightTabbox();
auto = tabs.misc:AddRightGroupbox("others")
charactertab = tabs.charactertab:AddLeftGroupbox("character");
othertabs = tabs.charactertab:AddLeftGroupbox("others");
exploit = tabs.charactertab:AddRightGroupbox("exploits");
exploit1 = tabs.charactertab:AddRightGroupbox("character exploits");
settings_tab = tabs.settings:AddLeftGroupbox("settings");
gunmods = tabs.ranged:AddLeftGroupbox("gun mods");
espsection = tabs.visuals:AddLeftGroupbox("esp");

local fly_cframe = nil;
local whitelist = {};
local viewing;

local function player_characters() 
    return workspace:FindFirstChild("PlayerCharacters") or workspace:FindFirstChild("Characters") or workspace; 
end;

PlayerCharacters = player_characters();
local ParryingCharacters = {};

local spinspeed = 10;
local spineabled = false;
local KADebounce = false;
local anti_parry_void = false;
local ap_unequipped = false;
local OnTp = false;
local Active = true;

local Ignored = {};

local Classes = setmetatable({}, {
    __index = function(t, k)
        return Toggles[k] or Options[k];
    end; 
});

local settings = {
    antifling = false;
    infstamina = false;
    canalwaysjump = false;
    noclipenabled = false;
    velocityenabled = false;
    velocityspeed = nil;
    flyenabled = false;
    walkspeedenabled = false;
    antiswim = false;
    spinenabled = false;
    jumppower = 50;
    godmode = false;
    dmgmultiplier = false;
    mulamount = 1;
    onehit = false;
    anticc = false;
    instanthits = false;
    nocooldown = false;
    parryduration = false;
    resizer = 1;
    safezonebypass = false;
    gkacbypass = false;
    walkspeed = 16;
    flyspeed = 16;
    killaura = false;
    ragebot = false;
    fakeswing = false;
    swingsound = false;
    autostompshove = false;
    autoglory = false;
    always_head = false;
    hbe = false;
    showhbe = false;
    hbe_part = "Head";
    hbesize = 1;
    stompshoverange = 10;
    glorydelay = 1;
    gloryrange = 10;
    silentAimTarget = nil;
    voidonparry = false;
    nnt = false;
    nut = false;
    nps = false;
    nps2 = false;
    noflash = false;
    nhe = false;
    ngpe = false;
    nkb = false;
    fno = false;
    nocancel = false;
    ndcd = false;
    nfd = false;
    desync = false;
    fastrespawn = false;
    loopspawn = false;
    loopkillall = false;
    loopkilltarget = false;
    stick = false;
    tpenemy = false;
    ar = false;
    hideweapon = false;
    autoequip = false;
    BeartrapEnemy = false;
    AutoAttachC4 = false;
    AutoDetonateC4 = false;
    vcenabled = false;
    voidenabled = false;
    anti_mod = false;
    killsay = false;
    devicespoofer = false;
    selecteddevice = "pc";
    multiplier = 0.15;
    base = 0;
    strafe_void_spam = false;
    strafe_void_in = 0;
    strafe_void_out = 0;
    strafe_extra = {};
    last_parry_tick = 0;
    is_voiding = false;
    last_void_tick = 0;
    avoid_walls = false;
};

local teleport = function(CFrame) 
    game:GetService("TweenService"):Create(humanoidrootpart,TweenInfo.new(0),{CFrame = CFrame }):Play(); 
end;

local function should_skip_by_whitelist(player, skip_type)
    if not player then return false; end;
    if not Toggles.check_whitelist_global or not Toggles.check_whitelist_global.Value then return false; end;
    
    local types_raw = Options.global_whitelist_type and Options.global_whitelist_type.Value;
    if not types_raw then return false; end;
    
    local types = {};
    if type(types_raw) == "table" then types = types_raw; elseif type(types_raw) == "string" then types = {[types_raw] = true}; end;
    
    if skip_type and not types[skip_type] then return false; end;

    local raw = Options.global_whitelist_mode and Options.global_whitelist_mode.Value;
    if not raw then return false; end;
    
    local modes = {};
    if type(raw) == "table" then modes = raw; elseif type(raw) == "string" then modes = {[raw] = true}; end;

    if modes["whitelist"] and table.find(whitelist, player.Name) then
        return true;
    end;
    if modes["friend"] and localplayer:IsFriendsWith(player.UserId) then
        return true;
    end;
    if modes["team"] and localplayer.Team and player.Team == localplayer.Team then
        return true;
    end;
    if modes["clan"] then
        local ok, clan_data = pcall(function()
            return framework:get_clan_data();
        end);
        if ok and clan_data and clan_data.members then
            local my_member = clan_data.members[tostring(localplayer.UserId)];
            if my_member and clan_data.members[tostring(player.UserId)] then
                return true;
            end;
        end;
    end;
    
    return false;
end;

local function whitelisted(player)
	if not player then return false; end;
	if table.find(whitelist, player.Name) then
        return true;
    end;
	return false;
end;

do
    local frame_spoofed = false;
	local typeofcache = typeof;
	local tickcache = tick;
	local renderstepped = runservice.RenderStepped;
	local connection, currentlooptype, cframecallback, currentactive;
	local stopspoofing, executing = false, false;
	local activespoofs, registeredspoofs, persistentloops = {}, {}, {};
	local function oncharacter(char)
		character = char;
		humanoid = char:WaitForChild("Humanoid");
		humanoidrootpart = char:WaitForChild("HumanoidRootPart");
		primarypart = humanoidrootpart;
		clientcframe = primarypart.CFrame;
	end;
	if localplayer.Character then
		oncharacter(localplayer.Character);
	end;
	localplayer.CharacterAdded:Connect(oncharacter);
	local mt = getrawmetatable(game);
	local originalindex = mt.__index;
	setreadonly(mt, false);
	mt.__index = LPH_JIT_MAX(newcclosure(function(self, property)
		if (not checkcaller() and self == primarypart and property == "CFrame" and isspoofing) then
			return clientcframe;
		end;
		return originalindex(self, property);
	end));
	setreadonly(mt, true);
	local looptypes = {
		heartbeat = runservice.Heartbeat,
		renderstepped = runservice.RenderStepped,
		stepped = runservice.Stepped
	};
	local function evaluatecurrent()
		local best;
		for _, v in ipairs(activespoofs) do
			if not best then
				best = v;
			else
				if v.priority > best.priority then
					best = v;
				elseif v.priority == best.priority and v.timestamp < best.timestamp then
					best = v;
				end;
			end;
		end;
		currentactive = best;
	end;
	local function refreshconnection()
		if not currentactive then
			if connection then
				connection:Disconnect();
				connection = nil;
				currentlooptype = nil;
			end;
			return;
		end;
		local looptype = currentactive.looptype;
		if connection and currentlooptype == looptype then
			return;
		end;
		if connection then
			connection:Disconnect();
			connection = nil;
		end;
		currentlooptype = looptype;
		local event = looptypes[looptype] or runservice.Heartbeat;
		connection = event:Connect(function()
			if stopspoofing or executing then return; end;
			if not (primarypart and primarypart.Parent) then return; end;
			local spoof = currentactive;
			if not spoof then return; end;
			executing = true;
			clientcframe = primarypart.CFrame;
			local success, result = pcall(spoof.callback, clientcframe);
			if success and result and typeofcache(result) == "CFrame" then
                frame_spoofed = true;
				isspoofing = true;
				local target = result;
				for _, v in ipairs(activespoofs) do
					if v ~= spoof and v.ignore_priority then
						local ok, res = pcall(v.callback, clientcframe);
						if ok and res and typeofcache(res) == "CFrame" then
							target = target * res;
						end;
					end;
				end;
				if spoof.direction then
					local _, _, _, r00, r01, r02, r10, r11, r12, r20, r21, r22 = target:GetComponents();
					local pos = clientcframe.Position + target.Position;
					target = cframe_new(pos.X, pos.Y, pos.Z, r00, r01, r02, r10, r11, r12, r20, r21, r22);
				end;
				primarypart.CFrame = target;
				renderstepped:Wait();
				primarypart.CFrame = clientcframe;
				isspoofing = false;
				if cframecallback then
                    cframecallback(target);
                end;
                frame_spoofed = false;
			elseif not success then
				warn("callback error . .. spoof.name .. : " .. tostring(result));
			end;
			executing = false;
		end);
	end;
	serverposition = function(looptype, logicname, targetlogic, priority, direction, ignore_priority)
		if typeofcache(logicname) ~= "string" then
			warn("invalid logic name");
			return;
		end;
		if registeredspoofs[logicname] then
			warn("logic already registered: " .. logicname);
			return;
		end;
		if typeofcache(targetlogic) ~= "function" then
			warn("invalid callback for: " .. logicname);
			return;
		end;
		if priority ~= nil and typeofcache(priority) ~= "number" then
			warn("invalid priority for: " .. logicname);
			return;
		end;
		if typeofcache(looptype) ~= "string" then
			warn("invalid looptype for: " .. logicname);
			return;
		end;
		local lt = looptype:lower();
		registeredspoofs[logicname] = {
			priority = priority or 0,
			timestamp = tickcache(),
			callback = targetlogic,
			looptype = lt,
			name = logicname,
			direction = direction == true,
			ignore_priority = (direction == true) and (ignore_priority == true),
		};
	end;
	setrunning = function(logicname, booleanref, persistent)
		local spoofdata = registeredspoofs[logicname];
		if not spoofdata then
			warn("invalid name: " .. tostring(logicname));
			return;
		end;
		local function applystatus(s)
			local status = s;
			if typeofcache(s) == "function" then
				status = s();
			end;
			if status == true then
				for _, v in ipairs(activespoofs) do
					if v.name == logicname then
						return;
					end;
				end;
				table.insert(activespoofs, spoofdata);
				if not currentactive then
					currentactive = spoofdata;
				else
					if spoofdata.priority > currentactive.priority or (spoofdata.priority == currentactive.priority and spoofdata.timestamp < currentactive.timestamp) then
						currentactive = spoofdata;
					end;
				end;
				refreshconnection();
			else
				local removedcurrent = false;
				for i, v in ipairs(activespoofs) do
					if v.name == logicname then
						if v == currentactive then
                            removedcurrent = true;
                        end;
						table.remove(activespoofs, i);
						break;
					end;
				end;
				if removedcurrent then
                    evaluatecurrent();
                end;
				refreshconnection();
			end;
		end;
		applystatus(booleanref);
		if persistent then
			persistentloops[logicname] = persistentloops[logicname] or {};
			persistentloops[logicname].paused = false;
			persistentloops[logicname].getter = booleanref;
			if not persistentloops[logicname].connection then
				persistentloops[logicname].connection = runservice.Heartbeat:Connect(LPH_JIT(function()
					local loop = persistentloops[logicname];
					if not loop.paused then
						local desired;
						if typeofcache(loop.getter) == "function" then
							desired = loop.getter();
						else
							desired = loop.getter;
						end;
						if desired ~= getrunning(logicname) then
							applystatus(loop.getter);
						end;
					end;
				end));
			end;
		end;
	end;
	getrunning = function(logicname)
		if not registeredspoofs[logicname] then
			return false;
		end;
		for _, v in ipairs(activespoofs) do
			if v.name == logicname then
				return true;
			end;
		end;
		return false;
	end;
	resetcframe = function()
		stopspoofing = true;
		isspoofing = false;
		executing = false;
		if primarypart and clientcframe then
			primarypart.CFrame = clientcframe;
		end;
		for name, _ in pairs(registeredspoofs) do
			for _, v in ipairs(activespoofs) do
				if v.name == name then
					table.remove(activespoofs, _);
					break;
				end;
			end;
			if persistentloops[name] then
				persistentloops[name].paused = true;
			end;
		end;
		currentactive = nil;
		if connection then
			connection:Disconnect();
			connection = nil;
			currentlooptype = nil;
		end;
		stopspoofing = false;
	end;
	clearspoofs = function()
		for _, v in pairs(persistentloops) do
			if v.connection then
				v.connection:Disconnect();
			end;
		end;
		activespoofs = {};
		registeredspoofs = {};
		persistentloops = {};
		currentactive = nil;
		if connection then
			connection:Disconnect();
			connection = nil;
			currentlooptype = nil;
		end;
	end;
	retrieve_position = function(callback)
		if typeof(callback) ~= "function" then
			warn("invalid callback for retrieve_position");
			return;
		end;
		cframecallback = LPH_JIT_MAX(function(cf)
			local is_spoofing = frame_spoofed and currentactive and currentactive.name ~= "exclude";
			callback(cf, is_spoofing);
		end);
	end;
end;

do
    local space_down = false;
	local c_down = false;
    local spinrad = math.rad(spinspeed);

    serverposition("heartbeat", "exclude", LPH_JIT(function(cf)
        return cf;
    end), -9999999);
    setrunning("exclude", true);

    local function target_cframe(cf)
        if settings.tpenemy and settings.follow_strafe_target and current_target and is_teleport_valid(current_target) then
            local target_character = current_target.Character;
            local target_root = target_character and target_character:FindFirstChild("HumanoidRootPart");
            if target_root then
                local targetpos = target_root.Position;
                local x = targetpos.X + math_random(-5, 5);
                local y = math_random(-1000, 0);
                local z = targetpos.Z + math_random(-5, 5);
                return cframe_new(x, y, z);
            end;
        end;
        local basepos = cf.Position;
        local x = basepos.X;
        local y = math_random(-1000, 0);
        local z = basepos.Z;
        return cframe_new(x, y, z);
    end;

    serverposition("heartbeat", "voidhidelogic", LPH_JIT(function(cf)
        return target_cframe(cf);
    end), 3);

	userinputservice.InputBegan:Connect(function(input, gpe)
		if gpe then return; end;
		if input.KeyCode == Enum.KeyCode.Space then
            space_down = true;
        end;
		if input.KeyCode == Enum.KeyCode.C then
            c_down = true;
        end;
	end);

	userinputservice.InputEnded:Connect(function(input, gpe)
		if input.KeyCode == Enum.KeyCode.Space then
            space_down = false;
        end;
		if input.KeyCode == Enum.KeyCode.C then
            c_down = false;
        end;
	end);

    runservice.Heartbeat:Connect(LPH_JIT(function(delta_time)
        local strafe_active = settings.tpenemy;
        local extra = settings.strafe_extra or {};
        local forg = (os.clock() - (settings.last_parry_tick or 0) < 3);
        local is_baiting = extra["bait parry"];

        if settings.voidenabled or (strafe_active and (settings.strafe_void_spam or (is_baiting and not forg))) then
            local hum = localplayer.Character and localplayer.Character:FindFirstChild("Humanoid");
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Freefall);
            end;
        end;

        if not humanoidrootpart then return; end;

        if settings.flyenabled then
            fly_cframe = fly_cframe or humanoidrootpart.CFrame;
            humanoidrootpart.Velocity = Vector3.zero;
            humanoidrootpart.RotVelocity = Vector3.zero;
            local camera_cframe = workspace.CurrentCamera.CFrame;
            local move_direction = humanoid.MoveDirection
            local vertical = (space_down and 1 or 0) - (c_down and 1 or 0);
            local move = (move_direction.Magnitude > 0 or vertical ~= 0) and ((camera_cframe.LookVector * move_direction:Dot(vector3_new(camera_cframe.LookVector.X, 0, camera_cframe.LookVector.Z).Unit) + camera_cframe.RightVector * move_direction:Dot(vector3_new(camera_cframe.RightVector.X, 0, camera_cframe.RightVector.Z).Unit) + vector3_new(0, 1, 0) * vertical)).Unit or Vector3.zero;
            local next_pos = (fly_cframe + move * settings.flyspeed * delta_time).Position;
            fly_cframe = cframe_new(next_pos, next_pos + camera_cframe.LookVector)
            humanoidrootpart.CFrame = fly_cframe
        else
            fly_cframe = nil;
        end;

        if not settings.flyenabled and settings.velocityenabled and settings.velocityspeed then
            local vy = humanoidrootpart.AssemblyLinearVelocity.Y;
            local move_direction = humanoid.MoveDirection;
            if move_direction.Magnitude > 0 then
                local horizontal = vector3_new(move_direction.X, 0, move_direction.Z).Unit;
                local spd = settings.velocityspeed;
                humanoidrootpart.AssemblyLinearVelocity = vector3_new(horizontal.X * spd, vy, horizontal.Z * spd);
            else
                humanoidrootpart.AssemblyLinearVelocity = vector3_new(0, vy, 0);
            end;
        end;
    end));

    if settings.spinenabled and humanoidrootpart then
        local angle = (spinrad * dt * 60) % TAU;
        if settings.flyenabled then
            fly_cframe = fly_cframe * cframe_angles(0, angle, 0);
        else
            humanoidrootpart.CFrame = humanoidrootpart.CFrame * cframe_angles(0, angle, 0);
        end;
    end;
    
    serverposition("heartbeat", "body_direction", LPH_JIT(function(cf)
        local x = Options.desync_x and math.rad(Options.desync_x.Value) or 0;
        local y = Options.desync_y and math.rad(Options.desync_y.Value) or 0;
        local z = Options.desync_z and math.rad(Options.desync_z.Value) or 0;
        
        local ox = Options.desync_off_x and Options.desync_off_x.Value or 0;
        local oy = Options.desync_off_y and Options.desync_off_y.Value or 0;
        local oz = Options.desync_off_z and Options.desync_off_z.Value or 0;

        local off_speed = 30;
        if off_speed > 0 then
            local t = os.clock() * (off_speed * 1.5);
            ox = math_sin(t * 0.7) * ox;
            oy = math_cos(t * 0.9) * oy;
            oz = math_sin(t * 1.2) * oz;
        end;
        if Toggles.desync_random_rotation and Toggles.desync_random_rotation.Value then
            local speed = Options.desync_random_speed and Options.desync_random_speed.Value or 5;
            local t = os.clock() * (speed * 0.5);
            
            x = (t * 1.3) + math_sin(t * 0.5);
            y = (-t * 1.7) + math_cos(t * 0.8);
            z = (t * 2.1) + math_sin(t * 1.1);
        end;

        if (Toggles.desync_look and Toggles.desync_look.Value) then
            local _, real_y, _ = cf:ToEulerAnglesYXZ();
            y = real_y;
        end;
        if Toggles.desync_avoid_walls and Toggles.desync_avoid_walls.Value then
            local ray_origin = cf.Position;
            local ray_direction = vector3_new(ox, oy, oz);
            if ray_direction.Magnitude > 0.01 then
                local ray_params = RaycastParams.new();
                ray_params.FilterType = Enum.RaycastFilterType.Exclude;
                ray_params.FilterDescendantsInstances = {character, camera};
                local ray_result = workspace:Raycast(ray_origin, ray_direction, ray_params);
                if ray_result then
                    local hit_pos = ray_result.Position;
                    local new_pos = hit_pos + ray_result.Normal * 0.5;
                    local new_offset = new_pos - ray_origin;
                    ox, oy, oz = new_offset.X, new_offset.Y, new_offset.Z;
                end;
            end;
        end;

        return cframe_new(ox, oy, oz) * cframe_angles(x, y, z);
    end), 0, true, true);

    local noclip_parts = {};
    local function noclip(char)
        noclip_parts = {};
        if not char then return end;
        for _, v in ipairs(char:GetDescendants()) do 
            if v:IsA("BasePart") then 
                table.insert(noclip_parts, v); 
            end; 
        end;
        char.DescendantAdded:Connect(function(v) 
            if v:IsA("BasePart") then 
                table.insert(noclip_parts, v); 
            end; 
        end);
    end;
    noclip(character);
    localplayer.CharacterAdded:Connect(noclip);
    
    local noclip_tick = 0;
    runservice.Stepped:Connect(LPH_JIT(function()
        if not settings.noclipenabled then return; end;
        local now = tick();
        if now - noclip_tick < 0.05 then return; end;
        noclip_tick = now;
        local i = #noclip_parts;
        while i > 0 do
            local v = noclip_parts[i];
            if not v or not v.Parent then
                table.remove(noclip_parts, i);
            else
                v.CanCollide = false;
            end;
            i = i - 1;
        end;
    end));
end;

local hitdetection_impl = {
    Sounds = {
        OSU = "rbxassetid://7149255551";
        Neverlose = "rbxassetid://8679627751";
        Bameware = "rbxassetid://3124331820";
        skeet = "rbxassetid://5633695679";
        Rust = "rbxassetid://5043539486";
        ["Lazer Beam"] = "rbxassetid://130791043";
        ["Bow Hit"] = "rbxassetid://1053296915";
        ["TF2 Hitsound"] = "rbxassetid://2868331684";
        ["TF2 Critical"] = "rbxassetid://296102734";
    };
    Labels = {}; 
    yo_offset = 0;
    last_clone_time = 0;
};

hitdetection_impl.create_log = function(text)
    local screen = workspace.CurrentCamera.ViewportSize;
    local prefix_nil = "nil";
    local prefix_dot = ".";
    local prefix_solutions = "solutions";
    local full_prefix = "nil.solutions";
    local rest_of_text = text:sub(#full_prefix + 1);
    local nil_color = Color3.fromRGB(148, 131, 255);
    local text_size = 19;
    local text_font = 2;
    local nil_label = drawing_new("Text");
    nil_label.Text = prefix_nil;
    nil_label.Size = text_size;
    nil_label.Font = text_font;
    nil_label.Outline = true;
    nil_label.Color = nil_color;
    nil_label.Visible = true;
    nil_label.Transparency = 0;
    nil_label.ZIndex = 15;
    local label_dot = drawing_new("Text");
    label_dot.Text = prefix_dot;
    label_dot.Size = text_size;
    label_dot.Font = text_font;
    label_dot.Outline = true;
    label_dot.Color = Color3.new(1, 1, 1);
    label_dot.Visible = true;
    label_dot.Transparency = 0;
    label_dot.ZIndex = 15;
    local label_solutions = drawing_new("Text");
    label_solutions.Text = prefix_solutions;
    label_solutions.Size = text_size;
    label_solutions.Font = text_font;
    label_solutions.Outline = true;
    label_solutions.Color = Color3.new(1, 1, 1);
    label_solutions.Visible = true;
    label_solutions.Transparency = 0;
    label_solutions.ZIndex = 15;
    local label_rest = drawing_new("Text");
    label_rest.Text = rest_of_text;
    label_rest.Size = text_size;
    label_rest.Font = text_font;
    label_rest.Outline = true;
    label_rest.Color = Color3.new(1, 1, 1);
    label_rest.Visible = true;
    label_rest.Transparency = 0;
    label_rest.ZIndex = 15;
    local target_x = screen.X / 2;
    local target_y = screen.Y - 180 - hitdetection_impl.yo_offset;
    local width = nil_label.TextBounds.X + label_dot.TextBounds.X + label_solutions.TextBounds.X + label_rest.TextBounds.X;
    local center_offset = width / 2;
    local function set_position(current_x_axis)
        nil_label.Position = vector2_new(current_x_axis - center_offset, target_y);
        label_dot.Position = vector2_new(nil_label.Position.X + nil_label.TextBounds.X, target_y);
        label_solutions.Position = vector2_new(label_dot.Position.X + label_dot.TextBounds.X, target_y);
        label_rest.Position = vector2_new(label_solutions.Position.X + label_solutions.TextBounds.X, target_y);
    end;
    set_position(target_x - 30);
    table.insert(hitdetection_impl.Labels, {nil_label, label_dot, label_solutions, label_rest});
    hitdetection_impl.yo_offset = hitdetection_impl.yo_offset + 22;
    task_spawn(LPH_JIT(function()
        local slide_steps = 10;
        for i = 1, slide_steps do
            local progress = i / slide_steps;
            local current_x_axis = (target_x - 30) + (30 * progress);
            nil_label.Transparency = progress;
            label_dot.Transparency = progress;
            label_solutions.Transparency = progress;
            label_rest.Transparency = progress;
            set_position(current_x_axis);
            task.wait(0.015);
        end;
        task.wait(1.6)
        for i = 1, 10 do
            local trans = 1 - (i / 10);
            nil_label.Transparency = trans;
            label_dot.Transparency = trans;
            label_solutions.Transparency = trans;
            label_rest.Transparency = trans;
            task.wait(0.04);
        end;
        nil_label.Visible = false;
        label_dot.Visible = false;
        label_solutions.Visible = false;
        label_rest.Visible = false;
        nil_label:Remove();
        label_dot:Remove();
        label_solutions:Remove();
        label_rest:Remove();
        for i, v in ipairs(hitdetection_impl.Labels) do
            if v[1] == nil_label then
                table.remove(hitdetection_impl.Labels, i);
                break;
            end;
        end;
        if #hitdetection_impl.Labels == 0 then 
            hitdetection_impl.yo_offset = 0;
        end;
        if hitdetection_impl.yo_offset > 300 then 
            hitdetection_impl.yo_offset = 0;
        end;
    end));
end;

hitdetection_impl.play_sound = function(soundName, volume)
    if soundName == "None" or not hitdetection_impl.Sounds[soundName] then return; end;
    local sound = Instance.new("Sound");
    sound.SoundId = hitdetection_impl.Sounds[soundName];
    sound.Volume = volume or 1;
    sound.Parent = game:GetService("SoundService");
    sound:Play();
    sound.Ended:Connect(function() 
        sound:Destroy(); 
    end);
end;

hitdetection_impl.CreateEffect = LPH_JIT(function(effect_type, part, color, damage)
    if not part or not part.Position or part.Name == "hitbox" then return; end;
    local main_color = color or Color3.new(1, 1, 1)
    if effect_type == "Clone (Forcefield)" or effect_type == "Clone (Neon)" then
        if tick() - hitdetection_impl.last_clone_time < 0.5 then return; end;
        hitdetection_impl.last_clone_time = tick();
        local target_character = part:FindFirstAncestorOfClass("Model");
        if not target_character or not target_character:FindFirstChild("Humanoid") then return; end;
        target_character.Archivable = true;
        local clone = target_character:Clone();
        clone.Name = "clone";
        local clone_humanoid = clone:FindFirstChildOfClass("Humanoid");
        if clone_humanoid then 
            clone_humanoid:Destroy();
        end;
        local hrp = clone:FindFirstChild("HumanoidRootPart");
        if hrp then 
            hrp:Destroy();
        end;
        local is_neon = effect_type == "Clone (Neon)";
        local function property_collision(v)
            if v:IsA("BasePart") then
                v.CanCollide = false;
                v.CanTouch = false;
                v.CanQuery = false;
                v.Anchored = true;
                v.Massless = true;
                v.Velocity = Vector3.zero;
                v.RotVelocity = Vector3.zero;
                v.Material = is_neon and Enum.Material.Neon or Enum.Material.ForceField;
                v.Color = main_color;
                if v:IsA("MeshPart") then 
                    v.TextureID = ""; 
                end;
            end;
        end;
        for _, v in pairs(clone:GetDescendants()) do
            if v:IsA("BasePart") then
                property_collision(v);
            elseif v:IsA("SpecialMesh") then
                v.TextureId = "";
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy();
            elseif v:IsA("Clothing") or v:IsA("ShirtGraphic") then
                v:Destroy();
            elseif v:IsA("JointInstance") or v:IsA("TouchTransmitter") then
                v:Destroy();
            elseif v:IsA("Accessory") or v:IsA("Tool") then
                if is_neon then
                    v:Destroy();
                else
                    for _, accessory_parts in pairs(v:GetDescendants()) do 
                        property_collision(accessory_parts);
                    end;
                end;
            elseif v:IsA("LocalScript") or v:IsA("Script") or v:IsA("Animator") then 
                v:Destroy(); 
            end;
        end;
        for _, v in pairs(target_character:GetDescendants()) do
            if v:IsA("BasePart") then
                local clone_part = clone:FindFirstChild(v.Name, true);
                if clone_part and clone_part:IsA("BasePart") then
                    clone_part.CFrame = v.CFrame; 
                end;
            end;
        end;
        local lp_character = localplayer.Character;
        if lp_character and lp_character:FindFirstChild("HumanoidRootPart") then
            local root = lp_character.HumanoidRootPart;
            clone:PivotTo(target_character:GetPivot() + vector3_new(root.CFrame.LookVector.X * 1.5, 0, root.CFrame.LookVector.Z * 1.5));
        end;
        clone.DescendantAdded:Connect(function(v) 
            property_collision(v); 
        end);
        clone.Parent = workspace.Terrain;
        target_character.Archivable = false;
        game:GetService("Debris"):AddItem(clone, 2);
    elseif effect_type == "Pulse" then
        local attachment = Instance.new("Attachment");
        attachment.Parent = part;
        attachment.WorldPosition = part.Position;
        local function create_emitter(name, orientation)
            local p = Instance.new("ParticleEmitter");
            p.Name = name;
            p.LightEmission = 3;
            p.Transparency = NumberSequence.new(0);
            p.Color = ColorSequence.new(main_color);
            p.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 6, 1.2)});
            p.Rotation = NumberRange.new(0);
            p.RotSpeed = NumberRange.new(0);
            p.Enabled = false;
            p.Rate = 2;
            p.Lifetime = NumberRange.new(0.25);
            p.Speed = NumberRange.new(0.1);
            p.Squash = NumberSequence.new(0);
            p.ZOffset = 1;
            p.Texture = "rbxassetid://2916153928";
            p.Orientation = orientation;
            p.Shape = Enum.ParticleEmitterShape.Box;
            p.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward;
            p.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume;
            p.Parent = attachment;
            return p;
        end;
        local p1 = create_emitter("Particle1", Enum.ParticleOrientation.VelocityPerpendicular);
        local p2 = create_emitter("Particle2", Enum.ParticleOrientation.FacingCamera);
        p1:Emit(1);
        p2:Emit(1);
        game:GetService("Debris"):AddItem(attachment, 1);
    elseif effect_type == "Impact" then
        local pulse_part = Instance.new("Part");
        pulse_part.Name = "HitEffect_Impact";
        pulse_part.Shape = Enum.PartType.Ball;
        pulse_part.Size = vector3_new(1, 1, 1);
        pulse_part.Position = part.Position;
        pulse_part.Anchored = true;
        pulse_part.CanCollide = false;
        pulse_part.CanTouch = false;
        pulse_part.CanQuery = false;
        pulse_part.Material = Enum.Material.Neon;
        pulse_part.Color = main_color;
        pulse_part.Transparency = 0.5;
        pulse_part.Parent = workspace.Terrain;
        local tween = tweenservice:Create(pulse_part, TweenInfo.new(0.4), {Transparency = 1, Size = vector3_new(6, 6, 6)});
        tween:Play()
        tween.Completed:Connect(function()
            pulse_part:Destroy(); 
        end);
    elseif effect_type == "Fortnite" then
        local damage_hit = damage or 0;
        local damage_text = tostring(math_floor(damage_hit));
        local target_part = part
        if not target_part or not target_part.Parent then return; end;
        if target_part.Name == "hitbox" then 
            target_part = target_part.Parent:FindFirstChild("Head") or target_part.Parent:FindFirstChild("Torso") or target_part.Parent:FindFirstChild("HumanoidRootPart") or target_part; 
        end;
        local world_pivot = target_part.Position + vector3_new(math_random(-10, 10) / 10, 2, math_random(-10, 10) / 10);
        local float_offset = vector3_new(math_random(-5, 5) / 10, 3, 0);
        local function create_label()
            local l = drawing_new("Text");
            l.Text = damage_text;
            l.Color = color;
            l.Center = true;
            l.Outline = true;
            l.OutlineColor = Color3.new(0, 0, 0);
            l.Font = 2;
            l.Visible = false;
            l.Transparency = 1;
            l.ZIndex = 20;
            return l;
        end;
        local label1 = create_label()
        local label2 = create_label()
        task_spawn(LPH_JIT(function()
            local start_time = tick();
            local duration = 0.8;
            while tick() - start_time < duration do
                local elapsed = tick() - start_time;
                local current_pivot = world_pivot + (float_offset * math_sin((elapsed / duration) * (math.pi / 2)));
                local screen_position, on_screen = camera:WorldToViewportPoint(current_pivot);
                if on_screen then
                    label1.Visible = true;
                    label2.Visible = true;
                    label1.Position = vector2_new(screen_position.X, screen_position.Y);
                    label2.Position = vector2_new(screen_position.X + 0.5, screen_position.Y + 0.5);
                    local size = 45;
                    local trans = 1;
                    if elapsed < 0.1 then
                        size = 25 + (25 * (elapsed / 0.1));
                        trans = elapsed / 0.1;
                    elseif elapsed < 0.2 then
                        size = 50 - (5 * ((elapsed - 0.1) / 0.1));
                    elseif elapsed > 0.5 then
                        local fade_progress = (elapsed - 0.5) / 0.3;
                        trans = 1 - fade_progress;
                        size = 45 - (10 * fade_progress);
                    end;
                    label1.Size = size;
                    label2.Size = size;
                    label1.Transparency = trans;
                    label2.Transparency = trans;
                else
                    label1.Visible = false;
                    label2.Visible = false;
                end;
                runservice.RenderStepped:Wait();
            end;
            label1.Visible = false;
            label2.Visible = false;
            label1:Remove();
            label2:Remove();
        end));
    end;
end);

local last_hits = {};
local OnHit = LPH_JIT(function(target_player, hit_part, damage, hit_type)
    if not target_player then return; end;
    if not Toggles or not Toggles.HitDetectionEnabled or not Toggles.HitDetectionEnabled.Value then return; end;
    local selected_type = Options.HitDetectionType and Options.HitDetectionType.Value or "Both";
    if selected_type ~= "Both" and hit_type and selected_type ~= hit_type then return; end;
    if hit_part and hit_part.Name == "hitbox" and hit_part.Parent then 
        hit_part = hit_part.Parent:FindFirstChild("Head") or hit_part.Parent:FindFirstChild("Torso");
    end;
    local now = tick();
    local hitId = tostring(target_player.UserId);
    if last_hits[hitId] and now - last_hits[hitId] < 0.12 then return; end;
    last_hits[hitId] = now;
    local function trigger_effects()
        if Options.HitSound and Options.HitSound.Value ~= "None" then
            local volume = Options.HitSoundVolume and Options.HitSoundVolume.Value or 1;
            hitdetection_impl.play_sound(Options.HitSound.Value, volume);
        end;
        if Options.HitEffects and Options.HitEffects.Value and hit_part then
            local color = Options.HitEffectColor and Options.HitEffectColor.Value or Color3.new(1,1,1);
            for effect_type, enabled in pairs(Options.HitEffects.Value) do
                if enabled then
                    task_spawn(LPH_JIT(function()
                        if hit_part and hit_part.Parent then
                            hitdetection_impl.CreateEffect(effect_type, hit_part, color, damage);
                        end;
                    end));
                end;
            end;
        end;
        if Toggles.HitLogs and Toggles.HitLogs.Value then
            local part_name = hit_part and hit_part.Name or "Unknown";
            local headshot = part_name == "Head";
            local display_damage = damage or 0;
            local damage_text = string.format("%.0f", display_damage);
            hitdetection_impl.create_log( "nil.solutions | hit " .. target_player.Name .. " for " .. damage_text .. " damage (" .. (headshot and "head" or part_name) .. ")" );
        end;
    end;
    trigger_effects();
end);

modules = {Name = {}, Id = {} };
local utilityids = {};
local weaponids = {};

local critical_modules = {
    "Network", "RoduxStore", "Signal", "WeaponMetadata", "WeaponIds", "UtilityIds",
    "UtilityMetadata", "WeaponsInOrder", "MeleeWeaponClient", "RangedWeaponClient",
    "RangedWeaponHandler", "DataHandler", "ParryHandlerClient", "JumpHandlerClient",
    "WalkSpeedHandlerClient", "AutoRotateHandlerClient", "KnockbackHandler",
    "HealthHandler", "StunHandlerClient", "RagdollableClient", "SoundHandler",
    "CharacterUtil", "DefaultStaminaHandlerClient", "DashConstants", "JumpConstants",
    "AirConstants", "ParryConstants", "PlatformHandlerClient", "ToolHandlerClient",
    "CoreGuiHandlerClient", "EnvironmentCommunication", "MockPlayerHandler",
    "KillStreakConfigs", "ModHandler", "AdminHandler", "EmotesInOrder",
    "ItemAttachmentHandlerClient", "WaterHandler", "InstancePropsHandler",
    "ClaymoreTrapPartClient", "OpenBearTrapPartClient", "RangedHitVisuals",
    "VFXClient", "ToastNotificationActionsClient", "CaseMetadata",
    "ClanRanksConfigs",
};

local criticalset = {};

for i = 1, #critical_modules do 
    criticalset[critical_modules[i]] = true; 
end;

setthreadidentity(2);
for _, child in pairs(repstorage:GetDescendants()) do
    if child:IsA("ModuleScript") and criticalset[child.Name] then
        local success, module = pcall(require, child);
        if success then
            modules.Name[child.Name] = module;
        end;
    end;
end;
setthreadidentity(8);

for i, v in modules.Name["UtilityIds"] do 
    utilityids[i:lower()] = v;
end;

for i, v in modules.Name["WeaponIds"] do 
    weaponids[i:lower()] = v;
end;

local network = modules.Name["Network"];
local eventhandler;
local remotes;

if eventhandler then 
    remotes = getupvalue(eventhandler, 1);
end;

framework = {};
local hooks = {};
local modify = {};
local signal = modules.Name["Signal"];
local onfireserver = network.FireServer;
local old_fireserver;
local hooks = {};
local modify = {};

local function handle(self, Name, ...)
	local Args = { ... };

	if modify[Name] then
		local can_hook = modify[Name].Check(Name, unpack(Args));
		if can_hook then
			if typeof(can_hook) == "table" then
				for i, v in pairs(can_hook) do
					Args[i] = v;
				end;
			else
				if can_hook == "Blocked" then
					return;
				end;
				for i, v in pairs(modify[Name].Args) do
					Args[i] = v;
				end;
			end;
		end;
	end;

	local hook = hooks[Name] or hooks["*"];
	if hook then
		return hook(old_fireserver, self, Name, unpack(Args));
	end;

	return old_fireserver(self, Name, unpack(Args));
end;

old_fireserver = hookfunction(network.FireServer, newcclosure(function(self, Name, ...)
	return handle(self, Name, ...);
end));

local cache = { };
for _, v in getgc() do
    if (type(v) ~= "function") then
        continue;
    end;
    local name = debug.info(v, "n");
    if (name ~= "FireServer" and name ~= "InvokeServerWithTimeout") then
        continue;
    end;
    local source = debug.info(v, "s");
    if (source and source:find(".Vendor.Network")) then
        cache[name] = v;
    end;
end;

if (not cache.FireServer or not cache.InvokeServerWithTimeout) then
    return warn("game updated (1)");
end;

local fire_server = function(...)
    cache.FireServer(network, ...);
end;

local invoke_server = function(...)
    return cache.InvokeServerWithTimeout(network, nil, ...);
end;

function framework:addhook(Name, Function) 
    hooks[Name] = Function;
end;

function framework:argmodify(Name, ToModify, Check) 
    modify[Name] = {Args = ToModify, Check = Check };
end;

function framework:removehook(Name)
    table.remove(hooks, table.find(hooks, Name));
end;

function framework:removeargmodifier(Name, ToModify) 
    table.remove(Modify, table.find(Modify, Name));
end;

function framework:hookclient(Table, Name, new_function)
	if not remotes then return; end;
	local to_hook;
	for i, v in pairs(getconnections(remotes[Name].remote.OnClientEvent)) do
		to_hook = v.Function;
		break;
	end;
	local old_hook; old_hook = hookfunction(to_hook, newcclosure(function(...)
        return new_function(...)
    end));
	return old_hook;
end;

function framework:getmetadata(ItemName, ItemId)
	local key = ItemName:lower():gsub(" ", ""):gsub("_","");
	local id = weaponids[key] or ItemId;
	if not id then return; end;
	return modules.Name["WeaponMetadata"][id];
end;

function framework:getutility(ItemName, ItemId)
	if not utilityids[ItemName:lower():gsub(" ", "")] then return; end;
	return ItemName and modules.Name["UtilityMetadata"][utilityids[ItemName:lower():gsub(" ", "")]] or modules.Name["UtilityMetadata"][ItemId];
end;

function framework:get_weapon(Player)
	local Player = Player or localplayer;
	if not Player then return; end;
	local Character = Player.Character or Player.CharacterAdded:Wait();
	if not Character then return; end;
	for i, v in Character:GetChildren() do
		if not v:IsA("Tool") then continue; end;
		if v:GetAttribute("ItemType") == "weapon" and modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")] and modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")].class:lower():match("melee") then return
            v, modules.Name["MeleeWeaponClient"].getObj(v);
        end;
	end;
	return;
end;

function framework:get_ranged(Player)
	local Player = Player or localplayer;
	if not Player then return; end;
	local Character = Player.Character or Player.CharacterAdded:Wait();
	if not Character then return; end;
	for i, v in Character:GetChildren() do
		if not v:IsA("Tool") then continue; end;
		if v:GetAttribute("ItemType") == "weapon" and modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")] and modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")].class:lower():match("ranged") then
            return v, modules.Name["RangedWeaponClient"].getObj(v);
        end;
	end;
	return;
end;

function framework:GetState() 
    return modules.Name["RoduxStore"].store:getState();
end;

function framework:GetSessionData(player) 
    return modules.Name["DataHandler"].getSessionDataRoduxStoreForPlayer(player or localplayer);
end;

function framework:in_menu(Player)
	local is_menu = true;
	if not Player.Character then
        return is_menu;
    end;
	for i, v in Player.Character:GetChildren() do 
        if v:GetAttribute("ParryShieldId") then 
            is_menu = false; 
        end; 
    end;
	return is_menu;
end;

local cachedplayers = {};
local function update_cached()
    local lp = localplayer;
    local cache = cachedplayers;
    local current = players:GetPlayers();
    local inserver = {};
    for i = 1, #current do
        local p = current[i];
        if p ~= lp then
            cache[p] = true;
            inserver[p] = true;
        end;
    end;
    for p in pairs(cache) do
        if not inserver[p] then
            cache[p] = nil;
        end;
    end;
end

players.PlayerAdded:Connect(update_cached)
players.PlayerRemoving:Connect(update_cached)
update_cached()

function framework:get_closest(Distance, Priority, check_function)
    local n = function(Player)
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 and not Player.Character:GetAttribute("IsRagdolled") and not Player.Character:GetAttribute("Downed") and not whitelisted(Player) then
            return true; 
        end;
        return false;
    end;
    local Distance = Distance or math.huge;
    local check_function = check_function or n;
    local ClosestPlayers = {};
    for v, _ in pairs(cachedplayers) do
        if v == localplayer then continue; end;
        if Ignored and table.find(Ignored, v.Name) then continue; end;
        local check_success, check_result = pcall(check_function, v)
        if not check_success or not check_result then continue; end;

        if framework:in_menu(v) then continue; end;
        local HRP = v.Character.HumanoidRootPart;
        local Magnitude = (HRP.Position - humanoidrootpart.Position).Magnitude;
        if Magnitude < Distance then
            Distance = Magnitude;
            ClosestPlayers[v.Name] = v.Character.Humanoid.Health;
        end;
    end;

    if Priority then
        local Sorted = {};
        for k, _ in pairs(ClosestPlayers) do
            table.insert(Sorted, k);
        end;
        table.sort(Sorted);
    end;
    return ClosestPlayers;
end;

function framework:get_closest_2(Distance, check_function)
    local n = LPH_JIT(function(Player)
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 and not Player.Character:GetAttribute("IsRagdolled") and not Player.Character:GetAttribute("Downed") and not Player.Character:FindFirstChildOfClass("ForceField") and not whitelisted(Player) and not should_skip_by_whitelist(Player, "ragebot") then
            return true; 
        end;
		return false;
	end);
	local Distance = Distance or math.huge;
	local check_function = check_function or n;
	local closest_player = nil;
	local self_position = humanoidrootpart and humanoidrootpart.Position;
	if not self_position then return nil; end;
	for player, _ in pairs(cachedplayers) do
		if player == localplayer then continue; end;
		if should_skip_by_whitelist(player, "ragebot") then continue; end;
		local char = player.Character;
		if not char then continue; end;
		local humanoid_root = char:FindFirstChild("HumanoidRootPart");
		if not humanoid_root then continue; end;
		local check_success, check_result = pcall(check_function, player)
        if not check_success or not check_result then continue; end;
		local inmenu = false;
		local ok = pcall(function()
            inmenu = framework:in_menu(player);
        end);
		if inmenu then continue; end;
		local Magnitude = (humanoid_root.Position - self_position).Magnitude;
		if Magnitude < Distance then
			Distance = Magnitude;
			closest_player = player.Name;
		end;
	end;
	return closest_player and {[closest_player] = true } or nil;
end;

function framework:closest_to_mouse(Distance, Priority, check_function, max_distance_3d)
	local n = LPH_JIT(function(Player)
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health ~= 0 and not whitelisted(Player) and not should_skip_by_whitelist(Player, "silent aim") then
            return true;
        end;
		return false;
	end);
	local Distance = Distance or math.huge;
	local check_function = check_function or n;
	local closest_player = nil;
	local mouse_position = userinputservice:GetMouseLocation();
	for player, _ in pairs(cachedplayers) do
		if player == localplayer then continue; end;
		if Ignored and table.find(Ignored, player.Name) then continue; end;
		if should_skip_by_whitelist(player, "silent aim") then continue; end;
		local check_success, check_result = pcall(check_function, player)
		if not check_success or not check_result then continue; end;
		if framework:in_menu(player) then continue; end;
		local humanoid_root = player.Character and player.Character:FindFirstChild("HumanoidRootPart");
		if not humanoid_root then continue; end;
		local vector, on_screen = camera:WorldToScreenPoint(humanoid_root.Position);
		if on_screen then 
            if max_distance_3d and (humanoid_root.Position - camera.CFrame.Position).Magnitude > max_distance_3d then
                on_screen = false;
            end;
        end;
		if on_screen then
			local Magnitude = (mouse_position - vector2_new(vector.X, vector.Y)).Magnitude;
			if Magnitude < Distance then
				Distance = Magnitude;
				closest_player = player;
			end;
		end;
	end;
	return closest_player;
end;

function framework:is_parrying(Player)
	local State = self:GetSessionData():getState();
	return State.parry.isParrying;
end;

function framework:get_current_gamemode()
	local CurrentMap = Map:FindFirstChildOfClass("Model");
	if CurrentMap then
		local Gamemodes = CurrentMap.MapConfiguration.Gamemodes;
		for i, v in pairs(Gamemodes:GetDescendants()) do
            if v:IsA("ObjectValue") then
                return v:FindFirstAncestorOfClass("Folder");
            end;
        end;
	end;
	return nil;
end;

function framework:get_enemy_point(Gamemode)
	for i, v in pairs(Gamemode:GetDescendants()) do
        if v:IsA("ObjectValue") and v.Value and v.Value:FindFirstChild("Inner") then
            if v.Value.Inner.BrickColor ~= localplayer.Team.TeamColor then
                return v.Parent;
            end;
        end;
    end;
	return nil;
end;

function framework:get_team_point(Gamemode)
	for i, v in pairs(Gamemode:GetDescendants()) do
        if v:IsA("ObjectValue") and v.Value and v.Value:FindFirstChild("Inner") then
            if v.Value.Inner.BrickColor == localplayer.Team.TeamColor then
                return v.Parent;
            end;
        end;
    end;
	return nil;
end;

function framework:closest_characters_origin(Origin, Dist)
	local folder = player_characters();
	for i, v in pairs(folder:GetChildren()) do
		local Player = players:GetPlayerFromCharacter(v);
		if not Player then continue; end;
		if whitelisted(Player) then continue; end;
		if table.find(Ignored, v.Name) then continue; end;
		if should_skip_by_whitelist(Player, "ragebot") then continue; end;
		if v == character then continue; end;
		local hrp = v:FindFirstChild("HumanoidRootPart");
		local head = v:FindFirstChild("Head");
		local humanoid = v:FindFirstChildOfClass("Humanoid");
		if not hrp or not head or not humanoid or humanoid.Health <= 0 then continue; end;
		local magnitude = (hrp.Position - Origin).Magnitude;
		if magnitude < Dist then
			dis = magnitude;
			target = v;
		end;
	end;
	return target, dis;
end;

function framework:closest_characters_to_origin(Origin, Dist)
	local closests = {};
	local folder = player_characters();
	for i, v in pairs(folder:GetChildren()) do
		local Player = players:GetPlayerFromCharacter(v);
		if not Player then continue; end;
		if whitelisted(Player) then continue; end;
		if table.find(Ignored, v.Name) then continue; end;
		if should_skip_by_whitelist(Player, "ragebot") then continue; end;
		if v == character then continue; end;
		local hrp = v:FindFirstChild("HumanoidRootPart");
		local head = v:FindFirstChild("Head");
		local humanoid = v:FindFirstChildOfClass("Humanoid");
		if not hrp or not head or not humanoid or humanoid.Health <= 0 then continue; end;
		local magnitude = (hrp.Position - Origin).Magnitude;
		if magnitude < Dist then
            table.insert(closests, v);
        end;
	end;
	return closests;
end;

function framework:Chance(number)
    return (math_floor(Random.new():NextNumber(0, 1) * 100) / 100) <= math_floor(number) / 100;
end;

function framework:IsPartClose(Part, Distance)
	if not humanoidrootpart then
        return false;
    end;
	if not Distance then
        return false;
    end;
	if Part and Part:IsA("BasePart") and Part.Parent then
		local Mag = (Part.Position - humanoidrootpart.Position).Magnitude;
		if Mag <= Distance then
            return true;
        end;
	end;
	return false;
end;

function framework:GetMeleeFuncs(Table)
	local tool = Table:get_weapon();
	if not tool then
		return {
            parry = function()
            end;
        };
	end;
	for i, v in pairs(getconnections(tool.Equipped)) do
		if v.Function then
			local uv = getupvalues(v.Function);
			if #uv == 1 and uv[1].singleWeaponMetadata then
                return uv[1];
            end;
		end;
	end;
	return nil;
end;

local function slow_tween(CF)
	local part = humanoidrootpart or fly_cframe;
	local dist = (part.Position - CF.Position).Magnitude;
	local speed = 60;
	local time = dist / speed;
	local tween = tweenservice:Create(part, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = CF});
	tween:Play();
	tween.Completed:Wait();
end;

function framework:teleport(CF)
	if safe_mode then
		slow_tween(CF);
		return;
	end;
	if fly_cframe then
		fly_cframe = CF;
	else
		teleport(CF);
	end;
	local start = os.clock();
	local maxtime = 3;
	local owned = false;
	local notowner = false;
	repeat
		local owns = isnetworkowner(humanoidrootpart);
		if owns then
			owned = true;
		elseif owned then
			notowner = true;
			local tool = localplayer.Backpack:GetChildren()[1];
			if tool then
				humanoid:EquipTool(tool);
				task.wait();
				humanoid:UnequipTools();
			end;
		end;
		task.wait();
	until notowner or (os.clock() - start) >= maxtime;
	task.wait(0.5);
	if notowner then
		if fly_cframe then
			humanoidrootpart.CFrame = CF;
		else
			teleport(CF);
		end;
	end;
end;

local active_rendersteps = {}
function framework:BindToRenderStep(to_bind, delay_time, priority)
    local name = httpservice:GenerateGUID(false)
    table.insert(active_rendersteps, name)
	local isDelayed = false;
	runservice:BindToRenderStep(name, (priority and priority or Enum.RenderPriority.First).Value, delay_time and LPH_JIT(function()
        if isDelayed then return; end;
        isDelayed = true;
		task_spawn(to_bind);
		task.wait(delay_time);
		isDelayed = false;
    end) or to_bind);
    return name;
end;

function framework:unbind_all()
    for _, name in ipairs(active_rendersteps) do
        pcall(function() 
            runservice:UnbindFromRenderStep(name);
        end);
    end;
    active_rendersteps = {};
end;

function framework:in_menu(Player)
	local is_menu = true;
	local Player = Player or localplayer
	if not Player.Character then
        return is_menu;
    end;
	for i, v in pairs(Player.Character:GetChildren()) do
        if v:GetAttribute("ParryShieldId") then
            is_menu = false;
        end;
    end;
	return is_menu;
end;

function framework:check(self, Character)
	local success, result = pcall(function()
		if not Character then return true; end;
		if table.find(ParryingCharacters, Character) then return false; end;
		if not Character.Parent then return false; end;
		local Humanoid = Character:FindFirstChildOfClass("Humanoid");
		local Player = players:GetPlayerFromCharacter(Character);
		if Player then
			local Rodux = framework:GetSessionData(Player);
			local state = Rodux and Rodux:getState();
			if state and state.parry and state.parry.isParrying then
                return false;
            end;
		end;
		if Humanoid then
			local Animator = Humanoid:FindFirstChild("Animator");
			if Animator then
				local PlayingAnimations = Animator:GetPlayingAnimationTracks();
				for i, v in pairs(PlayingAnimations) do
                    if v.Animation and v.Animation.Name and v.Animation.Name:match("Parry") then 
						return false;
                    end;
                end;
			end;
		end;
		for i, v in pairs(Character:GetChildren()) do
            if v:GetAttribute("ParryShieldId") and #v:GetChildren() == 1 then
				local shieldPart = v:GetChildren()[1];
				if shieldPart:IsA("BasePart") then
					return shieldPart.Transparency == 1;
				end;
            end;
        end;
		return true;
	end)
	if not success then
        return true;
    end;
	return result;
end;

local clan_store = nil;
local clan_ranks = modules.Name["ClanRanksConfigs"];

local function get_clan_store()
    if not clan_store then
        local ok, store = pcall(function()
            return modules.Name["DataHandler"].getSessionDataRoduxStoreForPlayer(localplayer);
        end);
        if ok and store then
            clan_store = store;
        end;
    end;
    return clan_store;
end;

function framework:get_clan_data()
    local store = get_clan_store();
    if not store then return nil; end;
    local ok, state = pcall(function()
        return store:getState();
    end);
    if not ok or not state then
        return nil;
    end;
    return state.clanClient and state.clanClient.data or nil;
end;

function framework:wait_for_descendant(Root, Name, Condition, Timeout)
	local Descendant = nil;
	local Timedout = false;
	task.delay(Timeout or 9e9, function() 
        Timedout = true; 
    end);
	repeat
		local Instance = Root:FindFirstChild(Name, true);
		if Instance and Condition(Instance) then
			Descendant = Instance;
			break;
		end;
		runservice.RenderStepped:Wait();
	until Descendant or Timedout;
	return Descendant;
end;

local rangedog = {};
local weaponorder = {};
local ranged = {};

for i, v in pairs(modules.Name["WeaponsInOrder"]) do
    weaponorder[v.id] = v;
end;

for name, id in pairs(modules.Name["WeaponIds"]) do
	local meta = modules.Name["WeaponMetadata"][id];
	if meta and meta.class == "ranged" then
        table.insert(ranged, name);
    end;
end;

for i, v in pairs(ranged) do
	local m = framework:getmetadata(v) or framework:getutility(v);
	if m then
        table.insert(rangedog, {
            name = v, og = table.clone(m);
        });
    end;
end;

local function deepmodify(tbl, key, val)
	if type(tbl) ~= "table" then return; end;
	if tbl[key] ~= nil then tbl[key] = val; end;
	for _, v in pairs(tbl) do
        if type(v) == "table" then
            deepmodify(v, key, val);
        end;
    end;
end;

function modifyranged(name, val)
	for _, v in pairs(rangedog) do
		local m = framework:getmetadata(v.name) or framework:getutility(v.name);
		if m then
            deepmodify(m, name, val);
        end;
	end;
end;

local function revert(tbl, original, key)
	if type(tbl) ~= "table" then return; end;
	if original[key] ~= nil then
        tbl[key] = original[key];
    end;
	for k, v in pairs(tbl) do
        if type(v) == "table" and type(original[k]) == "table" then
            revert(v, original[k], key);
        end;
    end;
end;

function revertranged(name)
	for _, v in pairs(rangedog) do
		local m = framework:getmetadata(v.name) or framework:getutility(v.name);
		if m then
            revert(m, v.og, name);
        end;
	end;
end;

do
    local applied = false;
    local appliedmultiplier = nil;
    local originalregen = nil;
    local originaldelay = nil;
    local stamina = nil;
    local keepalive_connection = nil;
    local ok, s = pcall(function()
        return modules.Name["DefaultStaminaHandlerClient"].getDefaultStamina();
    end);
    if ok and s then
        stamina = s;
        originalregen = stamina.gainPerSecond;
        originaldelay = stamina.gainDelay;
    end;
    local function stop_keepalive()
        if keepalive_connection then
            keepalive_connection:Disconnect();
            keepalive_connection = nil;
        end;
    end;
    local function start_keepalive()
        stop_keepalive();
        keepalive_connection = runservice.Heartbeat:Connect(LPH_JIT(function()
            if stamina and settings.infstamina and stamenabled then
                stamina:setStamina(stamina:getMaxStamina());
            else
                stop_keepalive();
            end;
        end));
    end;
    local function apply_multiplier()
        if applied or not stamina then return; end;
        local multiplier = 1e6 / stamina._baseMaxStamina;
        stamina:addMaxStaminaMultiplier(multiplier);
        appliedmultiplier = multiplier;
        applied = true;
        start_keepalive();
    end;
    local function remove_multiplier()
        if not applied or not stamina then return; end;
        stamina:removeMaxStaminaMultiplier(appliedmultiplier);
        stamina:setStamina(stamina:getMaxStamina());
        applied = false;
        appliedmultiplier = nil;
        stop_keepalive();
    end;
    local function apply_regen()
        if not stamina then return; end;
        local wantedregen = stamregentoggle and (stamregenrate or originalregen) or originalregen;
        local wanteddelay = stamdelaystate and (stamindelayamount or originaldelay) or originaldelay;
        if stamina.gainPerSecond ~= wantedregen then
            stamina.gainPerSecond = wantedregen;
        end;
        if stamina.gainDelay ~= wanteddelay then
            stamina.gainDelay = wanteddelay;
        end;
    end;
    local function restore_regen()
        if not stamina then return; end;
        if stamina.gainPerSecond ~= originalregen then
            stamina.gainPerSecond = originalregen;
        end;
        if stamina.gainDelay ~= originaldelay then
            stamina.gainDelay = originaldelay;
        end;
    end;
    stamina_sett_changed = function()
        if not stamina then return; end;
        if not stamenabled then
            remove_multiplier();
            restore_regen();
            return;
        end;
        if settings.infstamina then
            apply_multiplier();
        else
            remove_multiplier();
        end;
        apply_regen();
    end;
end;

local Map = workspace:FindFirstChild("Map");

local hitboxes = {};

Config = Config or {
    HitboxSize = 20;
    ShowHitbox = false;
    HitboxExpand = false;
    HBEPart = "Torso";
    HitboxColor = Color3.fromRGB(100, 83, 255);
    Wallbang = false;
    always_head = false;
};

local R6BodyParts = {
    "Head",
    "Torso",
    "Left Arm",
    "Right Arm",
    "Left Leg",
    "Right Leg",
    "Random";
};

local hbe_size = vector3_new(Config.HitboxSize, Config.HitboxSize, Config.HitboxSize);
local hitbox_blast_size = Config.HitboxSize;

local function update_hitbox(v, wanted_trans, hitbox_color, hbe_size, expand)
    if not v:IsDescendantOf(game) then return false; end;
    if v.Parent then
        local to_expand = v.Parent:FindFirstChild(Config.HBEPart);
        if to_expand and v.Weld and v.Weld.Part0 ~= to_expand then
            v.Weld.Part0 = to_expand;
        end;
    end;
    if v.Transparency ~= wanted_trans then v.Transparency = wanted_trans; end;
    if v.Color ~= hitbox_color then v.Color = hitbox_color; end;
    local effective_size = expand and hbe_size or vector3_new(0, 0, 0);
    if v.Size ~= effective_size then v.Size = effective_size; end;
    v:SetAttribute("IsCharacterHitbox", expand);
    if not expand then
        if not v:HasTag("RANGED_CASTER_IGNORE_LIST") then
            v:AddTag("RANGED_CASTER_IGNORE_LIST");
        end;
    else
        if v:HasTag("RANGED_CASTER_IGNORE_LIST") then
            v:RemoveTag("RANGED_CASTER_IGNORE_LIST");
        end;
    end;
    return true;
end;

local function on_hitbox_added(v)
    local expand = Config.HitboxExpand;
    local wanted_trans = (expand and Config.ShowHitbox) and 0.7 or 1;
    if Config.HitboxSize ~= hitbox_blast_size then
        hbe_size = vector3_new(Config.HitboxSize, Config.HitboxSize, Config.HitboxSize);
        hitbox_blast_size = Config.HitboxSize;
    end;
    update_hitbox(v, wanted_trans, Config.HitboxColor, hbe_size, expand);
end;

local function apply_hitbox(Character)
    if Character:FindFirstChild("hitbox") then return; end;
    local expand = Config.HitboxExpand;
    local hitbox = Instance.new("Part");
    hitbox.Size = hbe_size;
    hitbox.CanCollide = false;
    hitbox.Transparency = (expand and Config.ShowHitbox) and 0.7 or 1;
    hitbox.Name = "hitbox";
    hitbox.Color = Config.HitboxColor;
    hitbox:SetAttribute("IsCharacterHitbox", expand);
    hitbox.Massless = true;
    hitbox.CastShadow = false;
    hitbox.Parent = Character;
    if not expand then
        hitbox:AddTag("RANGED_CASTER_IGNORE_LIST");
    end;
    local Weld = Instance.new("Weld");
    Weld.Part0 = Character:WaitForChild("HumanoidRootPart");
    Weld.Part1 = hitbox;
    Weld.Parent = hitbox;
    table.insert(hitboxes, hitbox);
end;

local function apply_all_hitboxes()
    local expand = Config.HitboxExpand;
    local show_hitbox = Config.ShowHitbox;
    local hitbox_color = Config.HitboxColor;
    local hitbox_sizen = Config.HitboxSize;
    local wanted_trans = (expand and show_hitbox) and 0.7 or 1;
    if hitbox_sizen ~= hitbox_blast_size then
        hbe_size = vector3_new(hitbox_sizen, hitbox_sizen, hitbox_sizen);
        hitbox_blast_size = hitbox_sizen;
    end;
    local i = #hitboxes;
    while i > 0 do
        local v = hitboxes[i];
        if not update_hitbox(v, wanted_trans, hitbox_color, hbe_size, expand) then
            table.remove(hitboxes, i);
        end;
        i = i - 1;
    end;
end;

task_spawn(LPH_JIT(function()
    task.wait(0.3);
    for _, v in PlayerCharacters:GetChildren() do
        if v ~= localplayer.Character then
            apply_hitbox(v);
        end;
    end;
    for player in pairs(cachedplayers) do
        if player ~= localplayer then
            if player.Character then
                apply_hitbox(player.Character);
            end;
            player.CharacterAdded:Connect(apply_hitbox);
        end;
    end;
end));

players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(apply_hitbox);
end);

if modules.Name["RangedHitVisuals"] and modules.Name["RangedHitVisuals"].defaultHit then
    local old = modules.Name["RangedHitVisuals"].defaultHit;
    modules.Name["RangedHitVisuals"].defaultHit = LPH_JIT_MAX(function(player, tool, cfg, hitpart, hit_cframe, normal, material, cosmetic)
        local new_hit_cframe = hit_cframe;
        if (Config.HitboxExpand and hitpart and hitpart.Name == "hitbox") then
            local part = hitpart.Parent:FindFirstChild(Config.HBEPart == "Random" and R6BodyParts[math_random(1, #R6BodyParts)] or Config.HBEPart ) or hitpart.Parent:FindFirstChild("Torso");
            if part then
                local metadata = framework:getmetadata(tool.Name);
                if metadata and metadata.speed then
                    task.wait((hit_cframe.Position - part.Position).Magnitude / metadata.speed);
                end;
                new_hit_cframe = part.CFrame * cosmetic.CFrame.Rotation * cframe_new( math_random(-1,1) * (part.Size.X / 2), math_random(-1,1) * (part.Size.Y / 2), math_random(-1,1) * (part.Size.Z / 2) );
            end;
        end;
        return old(player, tool, cfg, hitpart, new_hit_cframe, normal, material, cosmetic);
    end);
end;

if modules.Name["RangedWeaponClient"] and modules.Name["RangedWeaponClient"].updateIgnoreList then
    modules.Name["RangedWeaponClient"].updateIgnoreList = LPH_JIT_MAX(function(ranged_data)
        if tick() - (ranged_data._lastIgnoreListUpdateTick or 0) < 5 then return ranged_data._ignoreList end
        ranged_data._lastIgnoreListUpdateTick = tick()
        local character = ranged_data._character
        local tagged = collectionservice:GetTagged("RANGED_CASTER_IGNORE_LIST");
        table.insert(tagged, character);
        if Config.Wallbang and Map then
            table.insert(tagged, Map);
            table.insert(tagged, Workspace.Terrain);
        end;
        ranged_data._ignoreList = tagged;
        return tagged;
    end);
end;

local spin = Instance.new("Animation");
spin.AnimationId = "rbxassetid://188632011";
local Loaded = {};

function framework:spinning()
	if spineabled and not Loaded[humanoid] then
		Loaded[humanoid] = humanoid:LoadAnimation(spin);
	elseif spineabled and Loaded[humanoid] then
		Loaded[humanoid].Priority = Enum.AnimationPriority.Action4;
		Loaded[humanoid].Looped = true;
		Loaded[humanoid]:AdjustSpeed(spinspeed)
		if not Loaded[humanoid].IsPlaying then
            Loaded[humanoid]:Play();
        end;
	end;
	if not spineabled and Loaded[humanoid] then
        Loaded[humanoid]:Stop();
    end;
end;

mmisc:AddToggle("Killsay", {
    Text = "killsay";
    Default = false;
	Callback = function(v)
		settings.killsay = v;
	end;
});

do
    local old = {};
    local old1 = modules.Name["RoduxStore"].store.dispatch;
    local function hook(modulename, funcname, newfunc)
        local mod = modules.Name[modulename];
        if not mod or not mod[funcname] then return; end;
        local original; original = hookfunction(mod[funcname], newcclosure(function(...)
            return newfunc(original, ...)
        end));
        old[modulename .. "_" .. funcname] = original;
    end;

	hook("JumpHandlerClient", "getCanJump", function(oldfunc, ...)
		if settings.canalwaysjump then 
            return true;
        end;
		return oldfunc(...);
	end);

	hook("ParryHandlerClient", "createStateToggler", function(oldfunc, ...)
		if settings.nps then
            return;
        end;
		return oldfunc(...);
	end);

	hook("PlatformHandlerClient", "getPlatformType", function(oldfunc, ...)
		if (settings.devicespoofer and settings.selecteddevice) then
            return tostring(settings.selecteddevice);
        end;
		return oldfunc(...);
	end);

    framework:argmodify("MeleeDamage", {}, LPH_JIT_MAX(function(n,...)
        local args = {...};
        if AntiParry and args[2] and args[2].Parent and not framework:check(args[2].Parent) then
            local modes = Classes.AntiParryModes and Classes.AntiParryModes.Value or {silent = true;};
            if modes.silent then
                return {[1] = nil};
            end;
        end;
        if Config.HitboxExpand and args[2] and args[2].Name == "hitbox" then
            local part = args[2].Parent:FindFirstChild(Config.HBEPart == "Random" and R6BodyParts[math_random(1, #R6BodyParts)] or Config.HBEPart) or args[2].Parent:FindFirstChild("Torso")
            if part then 
                return {
                    [2] = part,
                    [5] = cframe_new((math_random() * math_random(-1, 1)) * (part.Size.X / 2), (math_random() * math_random(-1, 1)) * (part.Size.Y / 2), (math_random() * math_random(-1, 1)) * (part.Size.Z / 2) )
                };
            end;
        end;
        return;
    end));

    framework:argmodify("MeleeFinish", {}, LPH_JIT_MAX(function(n,...)
        local args = {...}
        if Config.HitboxExpand and args[2].Name == "hitbox" then
            local part = args[2].Parent:FindFirstChild(Config.HBEPart == "Random" and R6BodyParts[math_random(1, #R6BodyParts)] or Config.HBEPart) or args[2].Parent:FindFirstChild("Torso")
            if part then
                return {[2] = part};
            end;
        end;
        return;
    end));

    framework:argmodify("RangedHit",{}, LPH_JIT_MAX(function(n,...)
        local args = {...}
        if Config.HitboxExpand and args[2].Name == "hitbox" then
            local part = args[2].Parent:FindFirstChild(Config.HBEPart == "Random" and R6BodyParts[math_random(1, #R6BodyParts)] or Config.HBEPart) or args[2].Parent:FindFirstChild("Torso");
            if part then
                return {
                    [2] = part;
                    [4] = part.Position;
                    [5] = cframe_angles(args[5]:ToEulerAnglesYXZ()) * cframe_new( (math_random() * math_random(-1, 1)) * (part.Size.X / 2), (math_random() * math_random(-1, 1)) * (part.Size.Y / 2), (math_random() * math_random(-1, 1)) * (part.Size.Z / 2))
                };
            end;
        end;
        if settings.always_head then 
            return {[2] = args[2].Parent:FindFirstChild("Head")};
        end;
        return;
    end));

    framework:argmodify("RangedExplode",{}, LPH_JIT_MAX(function(n,...)
        local args = {...}
        if Config.HitboxExpand and args[2].Name == "hitbox" then
            local part = args[2].Parent:FindFirstChild(Config.HBEPart == "Random" and R6BodyParts[math_random(1, #R6BodyParts)] or Config.HBEPart) or args[2].Parent:FindFirstChild("Torso")
            if part then
                return {
                    [2] = part,
                    [4] = part.Position,
                    [5] = cframe_angles(args[5]:ToEulerAnglesYXZ()) * cframe_new( (math_random() * math_random(-1, 1)) * (part.Size.X / 2), (math_random() * math_random(-1, 1)) * (part.Size.Y / 2), (math_random() * math_random(-1, 1)) * (part.Size.Z / 2))
                };
            end;
        end;
        if settings.always_head then
            return {
                [2] = args[2].Parent:FindFirstChild("Head")
            };
        end;
        return;
    end));

	framework:argmodify("StartFallDamage", {}, LPH_JIT_MAX(function(n, ...)
		if (not checkcaller() and settings.nfd) then
            return;
        end;
		return;
	end));

	framework:argmodify("TakeFallDamage", {}, LPH_JIT_MAX(function(n, ...)
		if (not checkcaller() and settings.nfd) then
            return;
        end;
		return;
	end));

	hook("ClaymoreTrapPartClient", "new", LPH_JIT_MAX(function(oldfunc, ...)
		if settings.nut then
            return;
        end;
		return oldfunc(...);
	end));

	hook("OpenBearTrapPartClient", "new", LPH_JIT_MAX(function(oldfunc, ...)
		if settings.nut then
            return;
        end;
		return oldfunc(...);
	end));

	hook("HealthHandler", "getRealHealth", function(oldfunc, ...)
		if settings.nhe then
            return math.huge;
        end;
		return oldfunc(...);
	end);

	hook("RangedWeaponClient", "cancelReload", function(oldfunc,...)
		if settings.nocancel then
            return;
        end;
		return oldfunc(...);
	end);
    
	hook("InstancePropsHandler", "add", function(oldfunc, a, b, c, ...)
		if settings.ngpe and a ~= character and c == "GHOST_POTION" then
            return;
        end;
		return oldfunc(a, b, c, ...);
	end);

	hook("ItemAttachmentHandlerClient", "addItemAttachment", function(oldfunc, ...)
        if settings.hideweapon then
            return;
        end;
        return oldfunc(...);
    end);

    hook("WaterHandler", "getBoundsIsInWater", function(oldfunc, ...)
        if settings.antiswim then
            return;
        end;
        return oldfunc(...);
    end);

	local function nkb(funckey)
		return function(oldfunc, self, ...)
			local char = character or (localplayer and localplayer.Character);
			if settings.nkb and char then
				for i = 1, select("#", ...) do
					local v = select(i, ...);
					if typeof(v) == "Instance" and (v == char or v:IsDescendantOf(char)) then
                        return;
                    end;
				end;
			end;
			return oldfunc(self, ...)
		end;
	end;

	hook("KnockbackHandler", "knockbackCharacterPart", nkb("KnockbackHandler_knockbackCharacterPart"));
	hook("KnockbackHandler", "knockbackCharacterPartAngular", nkb("KnockbackHandler_knockbackCharacterPartAngular"));
	hook("KnockbackHandler", "impulseCharacterPart", nkb("KnockbackHandler_impulseCharacterPart"));
	hook("KnockbackHandler", "impulseCharacterPartAngular", nkb("KnockbackHandler_impulseCharacterPartAngular"));

	if remotes then
		local flashbang = remotes.ApplyFlashbangEffect;
		local flashbomb = remotes.ApplyFlashbombEffect;
		if flashbang and flashbang.Callbacks then
			local old2 = flashbang.Callbacks[1];
			flashbang.Callbacks = {function(...)
                if settings.noflash then
                    return;
                end;
                return old2(...);
			end;
        };
		end;

		if flashbomb and flashbomb.Callbacks then
			local old = flashbomb.Callbacks[1];
			flashbomb.Callbacks = {function(...)
                if settings.noflash then
                    return;
                end;
                return old(...);
            end; };
		end;
	end;

    framework:argmodify("UpdateIsCrouching", {[1] = false }, function(Name, ...)
        if settings.nnt then
            return true;
        end;
        return nil;
    end);

	framework:argmodify("UpdateHasVc", {[1] = true }, function(n, ...)
		if settings.vcenabled then
            return true;
        end;
		return;
	end);

	local store = modules.Name["RoduxStore"].store;
	local olddispatch = store.dispatch;

	store.dispatch = LPH_JIT(function(table, sigma, ...)
		if typeof(sigma) == "table" then
			if sigma.type == "PARRY_IS_PARRIED_CHANGE" or sigma.type == "PARRY_IS_KNEELED_CHANGE" then
				parrystununtil = tick() + 0.35;
				if settings.voidonparry and (tick() - (last_void_parry or 0) > 3) then
					last_void_parry = tick();
					task_spawn(LPH_JIT(function()
						pcall(function()
							if Toggles.voidenabled.Value and Options.voidenabledkey:GetState() then
								setrunning("voidhidelogic", true);
							else
								void_lock = true;
								setrunning("voidhidelogic", true);
								task_spawn(LPH_JIT(function()
									while void_lock do
										setrunning("voidhidelogic", true);
										task.wait();
									end;
								end));
								task.delay(2, function()
									void_lock = false;
                                    setrunning("voidhidelogic", voidenabled);
								end);
							end;
						end);
					end));
				end;
				if settings.nps then
					local JumpPower = modules.Name["JumpHandlerClient"];
					local Walkspeed = modules.Name["WalkSpeedHandlerClient"];
					local AutoRotate = modules.Name["AutoRotateHandlerClient"];
					if JumpPower and Walkspeed and AutoRotate then
						local WSContainer = Walkspeed.getValueContainer();
						local JPContainer = JumpPower.getJumpPowerValueContainer();
						local ARContainer = AutoRotate.getAutoRotateToggleCounter();
						task_spawn(LPH_JIT(function()
							task.wait(0.1);
							modules.Name["CoreGuiHandlerClient"].toggleBackpack(true);
							modules.Name["CoreGuiHandlerClient"].toggleResetButton(true);
							olddispatch(table, {
                                type = "STUN_CLIENT_IS_STUNNED_COUNT_DECREMENT"
                            });
							modules.Name["ToolHandlerClient"].reEquipToolSet();
							modules.Name["EnvironmentCommunication"]:Fire( "ToggleAnimationKind", "idle", "parried", false, {playTransitionTime = 0.1, stopTransitionTime = 0.1 } );
							WSContainer:removeFromZeroValueCount();
							JPContainer:removeFromZeroValueCount();
							ARContainer:add(1000);
						end));
					end;
				end;
			elseif sigma.type == "PARRY_CLIENT_IS_AFTER_PARRY_STUNNED_CHANGE" then
				parrystununtil = tick() + 0.35;
				if settings.nps2 then
					local JumpPower = modules.Name["JumpHandlerClient"];
					local Walkspeed = modules.Name["WalkSpeedHandlerClient"];
					local AutoRotate = modules.Name["AutoRotateHandlerClient"];
					if JumpPower and Walkspeed and AutoRotate then
						local WSContainer = Walkspeed.getValueContainer();
						local JPContainer = JumpPower.getJumpPowerValueContainer();
						local ARContainer = AutoRotate.getAutoRotateToggleCounter();
						WSContainer:removeFromZeroValueCount();
						JPContainer:removeFromZeroValueCount();
						ARContainer:add(1000);
					end;
					return;
				end;
			end;
		end;
		return olddispatch(table, sigma, ...);
	end);
end;

local function connect(char)
    character = char;
    humanoid = char:WaitForChild("Humanoid");
    humanoidrootpart = char:WaitForChild("HumanoidRootPart");
    task.wait();
end;

localplayer.CharacterAdded:Connect(connect);
if localplayer.Character then
    connect(localplayer.Character);
end;

network:BindEvents({
    CreateAntiCheatNotification = function(data)
        if data.punishType == "rectified" and settings.fno and humanoidrootpart then
            repeat
                local tool = localplayer.Backpack:GetChildren()[1];
                if tool then
                    humanoid:EquipTool(tool);
                    task.wait();
                    humanoid:UnequipTools();
                else
                    task.wait();
                end;
            until humanoidrootpart.ReceiveAge == 0;
        end;
    end;
});

local activeloops = {};
local function updatefeature(togglename, keyname, setter)
    if activeloops[togglename] then return; end;
    activeloops[togglename] = true;
    task_spawn(LPH_JIT(function()
        while task.wait() do
            local toggleon = Toggles[togglename].Value;
            local keyon = Options[keyname]:GetState();
            setter(toggleon and keyon);
        end;
    end));
end;

do
    local camera = workspace.CurrentCamera;
    local character = localplayer.Character or localplayer.CharacterAdded:Wait();
    local keybind_state = false;
    setthreadidentity(8);
    local main_ranged = tabs.ranged:AddRightTabbox();
    local silent_tab = main_ranged:AddTab("silent aim");
    local aimbot_tab = main_ranged:AddTab("aimbot");
    local ragebotsection = tabs.ranged:AddRightGroupbox("ragebot");
    setthreadidentity(7);

    players.PlayerRemoving:Connect(function(player)
        cachedplayers[player] = nil
        if locked_target == player then
            locked_target = nil;
        end;
    end);

    aimbot_tab:AddToggle("aimbot_toggle", {
        Text = "aimbot";
        Callback = function(value)
            if value then
                aimbot_enabled = true;
                locked_target = nil;
                task_spawn(LPH_JIT(function()
                    while aimbot_enabled do
                        runservice.RenderStepped:Wait();
                        local key_pressed = Options.AimbotKeybind:GetState();
                        if key_pressed then
                            local mouse = localplayer:GetMouse();
                            local fov_radius = Options.FOVCircleSize.Value or 500;
                            local hitpart_name = Options.AimbotHitPart.Value or "Head";
                            local needs_new_target = not locked_target or not locked_target.Character or not locked_target.Character:FindFirstChild("Humanoid") or locked_target.Character.Humanoid.Health <= 0;
                            local keybind_just_pressed = key_pressed and not keybind_state;
                            if Toggles.AutoSelect.Value or needs_new_target or (not Toggles.AutoSelect.Value and keybind_just_pressed) then
                                local closest_target = nil;
                                local closest_distance = math.huge;
                                for player,_ in pairs(cachedplayers) do
                                    if player and player.Parent and player ~= localplayer and player.Character then
                                        local humanoid = player.Character:FindFirstChild("Humanoid");
                                        local hrp = player.Character:FindFirstChild("HumanoidRootPart");
                                        local target_part = player.Character:FindFirstChild(hitpart_name)
                                        if humanoid and humanoid.Health > 0 and hrp and target_part then
                                            local screen_position, on_screen = camera:WorldToViewportPoint(target_part.Position);
                                            if on_screen then
                                                local mouse_position = vector2_new(mouse.X,mouse.Y);
                                                local target_position = vector2_new(screen_position.X,screen_position.Y);
                                                local distance = (mouse_position - target_position).Magnitude;
                                                if distance < fov_radius and distance < closest_distance then
                                                    closest_distance = distance;
                                                    closest_target = player;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                                locked_target = closest_target;
                            end;
                            keybind_state = key_pressed;
                            if locked_target and locked_target.Character then
                                local target_part = locked_target.Character:FindFirstChild(hitpart_name) or locked_target.Character:FindFirstChild("HumanoidRootPart");
                                if target_part then
                                    local aim_position = target_part.Position;
                                    if Toggles.Prediction.Value then
                                        local hrp = locked_target.Character:FindFirstChild("HumanoidRootPart");
                                        if hrp then
                                            local targetVelocity = hrp.Velocity;
                                            local predictionAmount = Options.PredictionAmount.Value or 0.13;
                                            aim_position = aim_position + (targetVelocity * predictionAmount);
                                        end;
                                    end;
                                    if Toggles.Smooth.Value then
                                        local smooth_amount = Options.SmoothAmount.Value or 0.15;
                                        local current_cframe = camera.CFrame;
                                        local target_cframe = cframe_new(camera.CFrame.Position, aim_position);
                                        camera.CFrame = current_cframe:Lerp(target_cframe, smooth_amount);
                                    else
                                        camera.CFrame = cframe_new(camera.CFrame.Position, aim_position);
                                    end;
                                end;
                            end;
                        else
                            keybind_state = key_pressed;
                        end;
                    end;
                end));
            else
                aimbot_enabled = false;
                locked_target = nil;
            end;
        end;
    }):AddKeyPicker("AimbotKeybind", {
        Default = "MB2";
        SyncToggleState = false;
        Mode = "Hold";
        Text = "aimbot";
        NoUI = false;
    });

    silent_tab:AddToggle("SilentAim", {
        Default = false,
        Text = "silent aim";
    });

    silent_tab:AddToggle("stickyaim", {
        Text = "sticky aim";
        Default = false;
        Callback = function()
            local state = Toggles.stickyaim.Value and Options.stickbind:GetState();
            settings.stick = state;
            if not state then
                stick_target = nil;
            end;
        end;
    }):AddKeyPicker("stickbind", {
        Text = "sticky aim";
        Default = "T";
        NoUi = true;
        Callback = function()
            local state = Toggles.stickyaim.Value and Options.stickbind:GetState();
            settings.stick = state;
            if not state then
                stick_target = nil;
            end;
        end;
    });

    local silent_children = silent_tab:AddDependencyBox();

    silent_children:AddToggle("ShowFOV", {
        Text = "show fov";
        Default = false;
    }):AddColorPicker("FOVCircleColor", {
        Default = Color3.new(1, 1, 1);
        Title = "fov color";
    });

    silent_children:AddToggle("FOVCircleFill", {
        Text = "fill fov";
        Default = false;
    }):AddColorPicker("FOVCircleFillColor", {
        Default = Color3.new(1, 1, 1);
        Title = "fill color";
        Transparency = 0.5;
    });

    silent_children:AddToggle("FOVCircleOutline", {
        Text = "outline";
        Default = false;
    }):AddColorPicker("FOVCircleOutlineColor", {
        Default = Color3.new(0, 0, 0);
        Title = "outline color";
    });

    silent_children:AddSlider("FOVCircleSmoothing", {
        Text = "smoothing";
        Default = 1;
        Min = 1;
        Max = 20;
        Rounding = 0;
        Compact = true;
    });

    silent_children:AddSlider("FOVSize", {
        Text = "size";
        Default = 100;
        Min = 10;
        Max = 1000;
        Rounding = 0;
        Compact = true;
    });

    silent_children:AddToggle("Resolver", {
        Text = "resolver";
        Default = false;
    });

    silent_children:AddToggle("avoidprojectiles", {
        Text = "avoid projectiles";
        Default = false;
    });

    silent_children:AddDropdown("ClosestType", {
        Text = "check type";
        Default = "Closest To Mouse";
        Values = {"Closest To Mouse", "Closest To Arrow", "Only Redirect To Target"};
    });

    silent_children:AddDropdown("SilentHitPart", {
        Text = "hit part";
        Default = "Head";
        Values = {"Head", "Torso", "Random"};
    });

    silent_children:AddSlider("SilentAimRange", {
        Text = "velocity";
        Default = 1;
        Min = 1;
        Max = 40;
        Rounding = 0;
        Compact = true;
        Suffix = " studs";
        Tooltip = "lower for more accuracy, higher for faster projectiles";
    });

    silent_children:AddSlider("HitChance", {
        Text = "hit chance";
        Default = 100;
        Min = 1;
        Max = 100;
        Rounding = 0;
        Compact = true;
        Suffix = "%";
    });

    silent_children:SetupDependencies({
        {Toggles.SilentAim, true; };
    });

    ragebotsection:AddToggle("Ragebot", {
        Text = "ragebot";
        Default = false;
        Callback = function()
            updatefeature("Ragebot", "ragebotkey", function(state)
                settings.ragebot = state;
            end);
        end;
    }):AddKeyPicker("ragebotkey", {
        Text = "ragebot";
        Default = "H";
        Callback = function()
            updatefeature("Ragebot", "ragebotkey", function(state)
                settings.ragebot = state;
            end);
        end;
    });

    local ragebot_children = ragebotsection:AddDependencyBox();

    ragebot_children:AddToggle("ShowRageBotTarget", {
    Text = "show ragebot target";
    Default = false;
        Callback = function(value)
            if not value then
                if ragebot_highlight then
                    ragebot_highlight.Adornee = nil;
                end;
            end;
        end;
    });

    ragebot_children:AddToggle("safe_mode_ragebot", {
        Text = "<font color=\"#ff0000\">safe mode</font>";
        Default = false;
        Tooltip = "0.4 min to avoid meow/40";
    });

    local safe_mode_slider = ragebot_children:AddDependencyBox();

    safe_mode_slider:AddSlider("safe_mode_slider1", {
        Text = "cooldown";
        Default = 1;
        Min = 0.1;
        Max = 3;
        Rounding = 1;
        Compact = true;
        Tooltip = "adds on to the cooldown";
    })
    ragebot_children:AddSlider("RagebotDist", {
        Text = "ragebot distance";
        Default = 19;
        Min = 1;
        Max = 1000;
        Rounding = 0;
        Compact = true;
        Suffix = " studs";
    });

    ragebot_children:SetupDependencies({
        {Toggles.Ragebot, true };
    });

    safe_mode_slider:SetupDependencies({
        {Toggles.safe_mode_ragebot, true };
    });

    aimbot_tab:AddToggle("AutoSelect", {
        Text = "auto select";
        Default = false;
    });

    aimbot_tab:AddToggle("Smooth", {
        Text = "smooth out";
        Default = false;
    });

    aimbot_tab:AddSlider("SmoothAmount", {
        Text = "smooth amount";
        Default = 0.15;
        Min = 0.01;
        Max = 1;
        Rounding = 2;
        Compact = true;
    });

    aimbot_tab:AddToggle("Prediction", {
        Text = "prediction";
        Default = false;
    });

    aimbot_tab:AddSlider("PredictionAmount", {
        Text = "prediction amount";
        Default = 0.13;
        Min = 0.01;
        Max = 0.5;
        Rounding = 2;
        Compact = true;
    });

    aimbot_tab:AddDropdown("AimbotHitPart", {
        Text = "hit part";
        Default = "Head";
        Values = {"Head", "Torso", "Random"};
    });

    main:AddToggle("KillAura", {
        Text = "kill aura";
        Default = false;
        Callback = function()
            updatefeature("KillAura", "killaurabind", function(state)
                settings.killaura = state;
            end);
        end;
    }):AddKeyPicker("killaurabind", {
        Text = "kill aura";
        Default = "B";
        NoUi = true;
        Callback = function()
            updatefeature("KillAura", "killaurabind", function(state)
                settings.killaura = state;
            end);
        end;
    });

    main:AddSlider("KillAuraRange", {
        Text = "kill aura range";
        Default = 15;
        Min = 1;
        Max = 15;
        Rounding = 0;
        Compact = true;
    });

    main:AddDropdown("KillAuraType", {
        Values = {"single person", "multiple people"};
        Default = "single person";
        Multi = false;
        Text = "kill aura type";
    });

    main:AddToggle("PlayAnimation", {
        Text = "play animation";
        Default = false;
    });

    strafe_tab:AddToggle("tpenemy", {
        Text = "strafe enemy";
        Default = false;
        Callback = function()
            updatefeature("tpenemy", "tpenemybind", function(state)
                settings.tpenemy = state;
            end);
        end;
    }):AddKeyPicker("tpenemybind", {
        Text = "strafe enemy";
        Default = "T";
        NoUi = true;
        Callback = function()
            updatefeature("tpenemy", "tpenemybind", function(state)
                settings.tpenemy = state;
            end);
        end;
    });

    local strafe_dep = strafe_tab:AddDependencyBox();

    strafe_dep:SetupDependencies({
        {Toggles.tpenemy, true; };
    });

    strafe_dep:AddToggle("strafe_look", {
        Text = "look";
        Default = false;
    });

    strafe_dep:AddToggle("strafe_random_toggle", {
        Text = "random";
        Default = false;
    });

    local orbit_dep = strafe_dep:AddDependencyBox();

    orbit_dep:SetupDependencies({
        {Toggles.tpenemy, true; };
        {Toggles.strafe_random_toggle, false; };
    });

    orbit_dep:AddSlider("orbit_radius_x", {
        Text = "range";
        Default = 5;
        Min = 0;
        Max = 20;
        Rounding = 0;
        Compact = true;
    });

    orbit_dep:AddSlider("orbit_height_y", {
        Text = "height";
        Default = 0;
        Min = -10;
        Max = 10;
        Rounding = 0;
        Compact = true;
    });

    local random_dep = strafe_dep:AddDependencyBox();

    random_dep:SetupDependencies({
        {Toggles.tpenemy, true; };
        {Toggles.strafe_random_toggle, true; };
    });

    random_dep:AddSlider("random_range", {
        Text = "range";
        Default = 5;
        Min = 1;
        Max = 20;
        Rounding = 0;
        Compact = true;
    });

    strafe_dep:AddSlider("strafe_speed", {
        Text = "speed";
        Default = 10;
        Min = 1;
        Max = 100;
        Rounding = 0;
        Compact = true;
        Callback = function(Value)
            tpspeed = Value;
        end;
    });

    strafe_dep:AddToggle("strafe_prediction", {
        Text = "prediction";
        Default = false;
        Tooltip = "uses weld exploit if disabled";
    });

    local pred_dep = strafe_dep:AddDependencyBox();

    pred_dep:SetupDependencies({
        {Toggles.tpenemy, true; };
        {Toggles.strafe_prediction, true };
    });

    pred_dep:AddSlider("strafe_pred_base", {
        Text = "base";
        Default = 0;
        Min = 0;
        Max = 2;
        Rounding = 2;
        Compact = true;
        Tooltip = "predicts Y axis";
    });

    pred_dep:AddSlider("strafe_pred_mult", {
        Text = "multiplier";
        Default = 1;
        Min = 0;
        Max = 8;
        Rounding = 1;
        Compact = true;
    });

    strafe_dep:AddDropdown("strafe_extra", {
        Values = {"bait parry", "avoid walls"};
        Default = 0;
        Multi = true;
        Text = "settings";
        Callback = function(Value)
            settings.strafe_extra = Value;
        end;
    });

    strafe_dep:AddToggle("strafe_void_spam", {
        Text = "void spam";
        Default = false;
        Callback = function(Value)
            settings.strafe_void_spam = Value;
        end;
    });

    local strafe_void_dep = strafe_dep:AddDependencyBox();

    strafe_void_dep:SetupDependencies({
        {Toggles.tpenemy, true; };
        {Toggles.strafe_void_spam, true; };
    });

    strafe_void_dep:AddSlider("strafe_void_in", {
        Text = "void in";
        Default = 0;
        Min = 0;
        Max = 1;
        Rounding = 1;
        Compact = true;
        Callback = function(Value)
            settings.strafe_void_in = Value;
        end;
    });

    strafe_void_dep:AddSlider("strafe_void_out", {
        Text = "void out";
        Default = 0;
        Min = 0;
        Max = 1;
        Rounding = 1;
        Compact = true;
        Callback = function(Value)
            settings.strafe_void_out = Value;
        end;
    });
end;

main:AddToggle("spectateneemy", {
    Text = "spectate enemy";
	Default = false;
	Callback = function()
		updatefeature("spectateneemy", "spectateneemybind", function(state)
            spectateneemy = state;
        end);
	end;
}):AddKeyPicker("spectateneemybind", {
    Text = "spectate enemy";
	Default = "N";
	NoUi = true;
	Callback = function()
		updatefeature("spectateneemy", "spectateneemybind", function(state)
            spectateneemy = state;
        end);
	end;
});

main:AddToggle("RageAutoParry", {
    Text = "rage auto parry";
    Default = false;
    Callback = function(value)
        Classes.RageAutoParry.Value = value;
    end;
});

local function yield_timeout(signal, timeout)
	if not signal then return
        "Signal creation failed";
    end;
	local result = nil;
    local timed_out = false;
    local connection;
    connection = signal:Connect(function(...)
        result = {...};
        connection:Disconnect();
    end);
    task.delay(timeout, function()
        if connection.Connected then
            timed_out = true;
            connection:Disconnect();
        end;
    end);
    repeat task.wait(); until result or timed_out;
    if timed_out then
        return "Timed out";
    end;
	return unpack(result);
end;

do
    local effectsjunk = workspace:WaitForChild("EffectsJunk");
    local map = workspace:FindFirstChild("Map");
    local processed = {};
    local targets = {};

    function safe_add(obj)
        if obj then 
            targets[obj] = true;
        end;
    end;

    safe_add(effectsjunk:FindFirstChild("OpenBearTrap"));
    safe_add(effectsjunk:FindFirstChild("utility5Proxy"));
    safe_add(effectsjunk:FindFirstChild("utility7Proxy"));
    safe_add(effectsjunk:FindFirstChild("utility10Proxy"));
    local pars_cache = effectsjunk:FindFirstChild("PartCache");

    if pars_cache then
        safe_add(pars_cache:FindFirstChild("Kunai"));
        safe_add(pars_cache:FindFirstChild("Arrow"));
        safe_add(pars_cache:FindFirstChild("Shuriken"));
    end;

    if map then
        safe_add(map:FindFirstChild("PlacedClaymore"));
    end;

    function should_disable(part)
        if part:GetAttribute("DamagePerSecond") then
            return true;
        end;
        for root in pairs(targets) do 
            if root and part:IsDescendantOf(root) then
                return true;
            end;
        end;
        return false;
    end;

    local process_part = LPH_JIT(function(part)
        if not settings.nut then return; end;
        if processed[part] then return; end;
        if not part:IsA("BasePart") then
            processed[part] = true;
            return;
        end;
        processed[part] = true;
        if not should_disable(part) then return; end;
        part.CanCollide = false;
        part.CanTouch = false;
        part.CanQuery = false;
        if part:GetAttribute("DamagePerSecond") then
            part:SetAttribute("DamagePerSecond", nil);
        end;
    end);

    for _, obj in ipairs(effectsjunk:GetDescendants()) do
        process_part(obj);
    end;

    if map then
        for _, obj in ipairs(map:GetDescendants()) do
            process_part(obj);
        end;
    end;

    effectsjunk.DescendantAdded:Connect(process_part)

    if map then
        map.DescendantAdded:Connect(process_part);
    end;
end;

do
	local ping_unstable_notified = false;
	local ping_frozen = false;
	local last_ping_value = nil;
	local last_ping_change_time = tick();
	local pingfreeze_threshold = 3;
	local pinghigh_threshold = 700;

	local function get_ping()
		return game:GetService("Stats"):WaitForChild("Network"):WaitForChild("ServerStatsItem")["Data Ping"]:GetValue();
	end;

	local function check_ping_status()
		local current_ping = get_ping();
		local now = tick();
		if current_ping ~= last_ping_value then
			last_ping_value = current_ping;
			last_ping_change_time = now;
			if ping_frozen then
				ping_frozen = false;
				library:Notify("ping has unfrozen, kill aura resumed", 3);
			end;
		else
			if not ping_frozen and (now - last_ping_change_time) >= pingfreeze_threshold then
				ping_frozen = true;
				ping_unstable_notified = false;
				library:Notify("ping is frozen, kill aura paused", 3);
			end;
		end;
		if not ping_frozen then
			if current_ping >= pinghigh_threshold then
				if not ping_unstable_notified then
					ping_unstable_notified = true;
					library:Notify("ping is unstable, kill aura may not work properly", 3);
				end;
				return false;
			else
				if ping_unstable_notified then
					ping_unstable_notified = false;
					library:Notify("ping stabilized, kill aura resumed", 3);
				end;
			end;
		end;
		if ping_frozen then
            return false;
        end;
		return true;
	end;

	function framework:get_closest_ka(max_distance, Priority, check_function)
		local default_check = function(Player)
			local Character = Player.Character;
			if Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Humanoid") and Character.Humanoid.Health > 0 and not Character:GetAttribute("IsRagdolled") and not Character:GetAttribute("Downed") then
                return true;
            end;
			return false;
		end;
		max_distance = max_distance or math.huge;
		check_function = check_function or default_check;
		local ClosestPlayers = {}
		for _, player in ipairs(players:GetPlayers()) do
			if player == localplayer then continue; end;
			if Ignored and table.find(Ignored, player.Name) then continue; end;
			local success, result = pcall(check_function, player)
			if not success or not result then continue; end;
			if framework:in_menu(player) then continue; end;
            if should_skip_by_whitelist(player, "kill aura") then continue; end;
			local Character = player.Character;
			local HRP = Character and Character:FindFirstChild("HumanoidRootPart");
			local Humanoid = Character and Character:FindFirstChild("Humanoid");
			if not HRP or not Humanoid then continue; end;
			local magnitude = (HRP.Position - humanoidrootpart.Position).Magnitude;
			if magnitude <= max_distance then 
                ClosestPlayers[player] = {Distance = magnitude, Health = Humanoid.Health };
            end;
		end;
		return ClosestPlayers;
	end;

	framework.Check = function(self, Character)
		local success, result = pcall(function()
			if not Character or table.find(ParryingCharacters, Character) then return false; end;
			if not Character.Parent then return false; end;
			local Humanoid = Character:FindFirstChildOfClass("Humanoid");
			local Player = players:GetPlayerFromCharacter(Character);
			if Player then
				local Rodux = framework:GetSessionData(Player);
				if Rodux and Rodux:getState().parry.isParrying then return false; end;
			end;
			if Humanoid then
				local Animator = Humanoid:FindFirstChild("Animator");
				if Animator then
					local PlayingAnimations = Animator:GetPlayingAnimationTracks();
					for i, v in pairs(PlayingAnimations) do
                        if v.Animation.Name:match("Parry") then
                            return false;
                        end;
                    end;
				end;
			end;
			for i, v in pairs(Character:GetChildren()) do 
                if v:GetAttribute("ParryShieldId") and #v:GetChildren() == 1 then
                    return v:GetChildren()[1].Transparency == 1;
                end;
            end;
			return true;
		end)
		if not success then
            return false;
        end;
		return result
	end;

	gethitpart = function(character)
		local head = character:FindFirstChild("Head");
		if head then return head; end;
		local hrp = character:FindFirstChild("Torso");
		if hrp then return hrp; end;
	end;

	meleehitboxes = function(metadata)
		if not metadata then return nil; end;
		local success, result;
		local retries = 0;
		repeat
			success, result = pcall(function() return metadata.meleeHitboxes; end)
			if not success or result == nil then
				task.wait(0.05);
				retries = retries + 1;
			end;
		until (success and result) or retries > 10;
		return result;
	end;

	local killaura_interval = 0.08;
	local kill_aura_tick = 0;
	local cachedkaweapon = nil;
	local cachedkametadata = nil;
	local kaweapontick = 0;

	framework:BindToRenderStep(LPH_JIT(function()
		if not settings.killaura or KADebounce then return; end;
		if not check_ping_status() then return; end;
		local mychar = localplayer.Character;
		if not mychar then return; end;
		local myhrp = mychar:FindFirstChild("HumanoidRootPart");
		if not myhrp then return; end;
		local now = tick();
		if now - kill_aura_tick < killaura_interval then return; end;
		kill_aura_tick = now;
		if now - kaweapontick > 0.5 then
			local w, m = framework:get_weapon();
			if w ~= cachedkaweapon then
				cachedkaweapon = w;
				cachedkametadata = m;
			end;
			kaweapontick = now;
		end;
		local weapon = cachedkaweapon;
		local metadata = cachedkametadata;
		if not weapon or not metadata then return; end;
		local itemConfig = metadata._itemConfig;
		if not itemConfig then return; end;
		local cooldown = itemConfig.cooldown;
		local threshold = 0.765;
		local buffer = (1 - threshold) * cooldown;
		local last_slash = metadata._lastSlashTick or 0;
		if (now - last_slash) < (cooldown - buffer) then return; end;
		local karange = Classes.KillAuraRange.Value;
		local closest = framework:get_closest_ka(karange, true);
		if not closest or not next(closest) then return; end;
		KADebounce = true;
		if not Classes.PlayAnimation.Value then
			local hitboxes = meleehitboxes(metadata);
			if not hitboxes then KADebounce = false; return; end;
			local my_character = localplayer.Character;
			local my_hrp = my_character and my_character:FindFirstChild("HumanoidRootPart");
			if not my_hrp then KADebounce = false; return; end;
			local slash_index = math_random(1, #itemConfig.slashMetadata);
			fire_server("MeleeSwing", weapon, slash_index);
			metadata._lastSlashTick = now;
			local issingle = Classes.KillAuraType.Value == "single person";
			task.defer(LPH_JIT(function()
				local ok, err = pcall(function()
					for i, hitbox in pairs(hitboxes) do
						for player, data in pairs(closest) do
							if data.Health == 0 then continue; end;
							local character = player.Character;
							if not character or not framework:Check(character) then continue; end;
							local session = framework:GetSessionData(player);
							if not session or session:getState().parry.isParrying then continue; end;
							local hitpart = gethitpart(character);
							if not hitpart then continue; end;
							fire_server("MeleeDamage",
                                weapon,
                                hitpart,
                                i,
                                hitpart.Position,
                                hitpart.CFrame:ToObjectSpace(cframe_new(hitpart.Position)),
                                my_hrp.CFrame.LookVector,
                                Vector3.zero,
                                Vector3.yAxis,
                                now - metadata._lastSlashTick
                            );
							if issingle then break; end;
						end;
						break;
					end;
				end)
				KADebounce = false;
			end));
        else
			if metadata:getShouldSlash() then
				metadata._activateSignal:Fire();
				local anim = metadata.animations.slashes[metadata._currSlashCount];
				local success, response = pcall(function()
                    return yield_timeout(anim:GetMarkerReachedSignal("startHitDetection"), 2);
                end);
				if success and response ~= "Timed out" and response ~= "Wait failed" and response ~= "Signal creation failed" then
					for i, v in metadata.meleeHitboxes do
						v.HitboxStopTime = 1;
						for target_player, data in pairs(closest) do
							if not target_player or not target_player.Character or not target_player.Character:FindFirstChild("Head") or data.Health == 0 or not framework:Check(target_player.Character) then continue; end;
							if table.find(whitelist, target_player.Name) then continue; end;
							local character = target_player.Character;
							local session_data = framework:GetSessionData(target_player);
							if session_data and not session_data:getState().parry.isParrying then
								local head = character:FindFirstChild("Head");
								local targetHum = character:FindFirstChildOfClass("Humanoid");
								if head and targetHum then
									v.OnHit:Fire( head, targetHum, {Distance = 1, Instance = head, Material = Enum.Material.SmoothPlastic, Position = head.Position, Normal = Vector3.yAxis, }, head.Position, head.Position );
									local base_damage = itemConfig.damage or itemConfig.base_damage or 0
									local final_damage = base_damage
									if head.Name == "Head" then
										local mult = itemConfig.headshotMultiplier or 1.75
										final_damage = final_damage * mult
									end
									OnHit(target_player, head, final_damage, "Melee")
								end;
								if Classes.KillAuraType.Value == "single person" then break; end;
							end;
						end;
					end;
				end;
			end;
			KADebounce = false;
		end;
	end));
end;

framework:BindToRenderStep(LPH_JIT(function()
	if not settings.autoequip and not settings.BeartrapEnemy and not settings.AutoAttachC4 and not settings.AutoDetonateC4 then return; end;
	if not weapon and settings.autoequip then
		local Character = localplayer.Character;
		for _, v in pairs(localplayer.Backpack:GetChildren()) do
			if v:IsA("Tool") and (v:FindFirstChild("Hitboxes") or v:GetAttribute("IsRangedWeapon")) then
				Character.Humanoid:EquipTool(v);
				break;
			end;
		end;
	end;
	local Character = localplayer.Character;
	if Character and not framework:in_menu(localplayer) then
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart");
		if not HumanoidRootPart then return end;
		local Closest = framework:get_closest(15, true);
		local CurrentTool = Character:FindFirstChildOfClass("Tool");
		if next(Closest) then
			local TargetPlayer = players:FindFirstChild(next(Closest));
			if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				if settings.BeartrapEnemy and CurrentTool and CurrentTool.Name == "Bear Trap" then
                    local target_root = TargetPlayer.Character:FindFirstChild("HumanoidRootPart")
					if target_root then
                        invoke_server("PlaceBearTrap", CurrentTool, target_root.CFrame * cframe_new(0, -1, 0) );
                    end;
				end;
				if settings.AutoAttachC4 and CurrentTool and CurrentTool.Name == "C4" then
					local Head = TargetPlayer.Character:FindFirstChild("Head");
					if Head then
						local Distance = (HumanoidRootPart.Position - Head.Position).Magnitude;
						if Distance <= 15 then
							local final_posiiton = Head.Position + (Head.Velocity * (Distance / 100));
							pcall(function()
                                invoke_server("ReplicateThrowable", CurrentTool, final_posiiton, final_posiiton);
                            end);
						end;
					end;
				end;
			end;
		end;
		if settings.AutoDetonateC4 and CurrentTool and CurrentTool.Name == "C4" then
			pcall(function()
                fire_server("DetonateC4", CurrentTool);
            end);
		end;
	end;
end));

do
    local fastrespawn_delay = 0.5
    local loopspawn_delay = 1
    local datahandler = modules.Name["DataHandler"];
    local store = nil;
    local revive_conn = nil;

    do_loopspawn = function()
        if not settings.loopspawn then return; end;
        if not framework:in_menu(localplayer) then return; end;
        invoke_server("SpawnCharacter");
    end;

    bind_loopspawn = function(char)
        if not char then return; end;
        char.ChildAdded:Connect(function(child)
            child:GetAttributeChangedSignal("ParryShieldId"):Connect(function()
                if child:GetAttribute("ParryShieldId") == nil then
                    do_loopspawn();
                end;
            end);
        end);

        char.ChildRemoved:Connect(function()
            if framework:in_menu(localplayer) then
                do_loopspawn();
            end;
        end);
        for _, child in ipairs(char:GetChildren()) do
            child:GetAttributeChangedSignal("ParryShieldId"):Connect(function()
                if child:GetAttribute("ParryShieldId") == nil then
                    do_loopspawn();
                end;
            end);
        end;
        if framework:in_menu(localplayer) then
            do_loopspawn();
        end;
    end;

	bind_autorevive = function()
		store = datahandler.getSessionDataRoduxStoreForPlayer(localplayer);
		if not store then return; end;
		if revive_conn then
			revive_conn:disconnect();
			revive_conn = nil;
		end;
		revive_conn = store.changed:connect(function(newState)
			if not settings.ar then return; end;
			if newState.down and newState.down.isDowned then
				fire_server("SelfReviveStart");
				fire_server("SelfRevive");
			end;
		end);
	end;
    
    do_fakeswing = function()
        if Debounce then return; end;
        local weapon, metadata = framework:get_weapon();
        if weapon and metadata then
            Debounce = true;
            metadata.animations.slashes[math_random(1, #metadata.animations.slashes)]:Play();
            task.delay(0.5, function()
                Debounce = false;
            end);
        end;
    end;

    bind_fastrespawn = function(char)
        local hum = char:WaitForChild("Humanoid");
        hum.Died:Connect(function()
            while settings.fastrespawn and hum.Health == 0 do
                fire_server("StartFastRespawn");
                invoke_server("CompleteFastRespawn");
                task.wait(fastrespawn_delay);
            end;
        end);
    end;
    localplayer.CharacterAdded:Connect(function(char)
        humanoid = char:WaitForChild("Humanoid");
        bind_fastrespawn(char);
        bind_autorevive();
        bind_loopspawn(char);
        task.wait(loopspawn_delay);
        do_loopspawn();
    end);

    if localplayer.Character then
        bind_fastrespawn(localplayer.Character);
        bind_autorevive();
        bind_loopspawn(localplayer.Character);
    end;

    local stompthrottle = 0;
    local glorythrottle = 0;
    local cachedstomptool = nil;
    local cachedstompmeta = nil;
    local stomptoolttick = 0;
    local cachedglorytool = nil;
    local glorytoolttick = 0;

    framework:BindToRenderStep(LPH_JIT(function()
        local s = settings;
        if not s.autostompshove and not s.autoglory and s.loopkillall then return; end;
        local now = tick();
        if s.autostompshove and now - stompthrottle >= 0.05 then
            stompthrottle = now;
            local char = localplayer.Character;
            local stomp = char and char:FindFirstChild("Stomp");
            if char and stomp then
                if now - stomptoolttick > 1 then
                    cachedstompmeta = modules.Name["MeleeWeaponClient"].getObj(stomp);
                    stomptoolttick = now;
                end;
                local metadata = cachedstompmeta;
                if metadata and metadata._cooldownProgressTimer:getValue() > 0.75 then
                    local closest = framework:get_closest(s.stompshoverange, true);
                    if closest and next(closest) then
                        local slashdata = metadata._itemConfig.slashMetadata[metadata._currSlashCount];
                        local hitbox = slashdata.getHitboxInfo(metadata.tool);
                        local hitboxes = metadata:getHitboxesToUseFromHitboxParts(hitbox.hitboxPartsToUse);
                        for i, v in hitboxes do
                            if not v.HitboxPendingRemoval then
                                for playername, health in closest do
                                    local targetplayer = players:FindFirstChild(playername);
                                    if not targetplayer or not targetplayer.Character then continue; end;
                                    local tchar = targetplayer.Character;
                                    local thead = tchar:FindFirstChild("Head");
                                    local thum = tchar:FindFirstChild("Humanoid");
                                    if not thead or not thum then continue; end;
                                    if health == 0 then continue; end;
                                    local data = framework:GetSessionData(targetplayer);
                                    local state = data and data:getState();
                                    if health <= 15 or (state and state.parry.isParried) or thum:GetAttribute("IsRagdolledServer") then
                                        setthreadidentity(2);
                                        metadata:slash();
                                        setthreadidentity(8);
                                        v.OnHit:Fire(thead, thum, {
                                            Distance = 1,
                                            Instance = thead,
                                            Material = Enum.Material.SmoothPlastic,
                                            Position = thead.Position,
                                            Normal = Vector3.yAxis;
                                        }, thead.Position, thead.Position);
                                    end;
                                end;
                                break;
                            end;
                        end;
                    end;
                end;
            end;
        end;

        if s.autoglory and now - glorythrottle >= math.max(0.05, s.glorydelay or 0) then
            glorythrottle = now;
            local closest = framework:get_closest(s.gloryrange, true);
            local tool = framework:get_weapon();
            if tool and closest and next(closest) then
                local targetplayer = players:FindFirstChild(next(closest));
                if targetplayer and targetplayer.Character then
                    local thum = targetplayer.Character:FindFirstChild("Humanoid");
                    if thum and thum.Health <= 20 then
                        fire_server("StartGloryKill", tool, targetplayer.Character, cframe_new(), vector3_new());
                    end;
                end;
            end;
        end;
    end), nil, Enum.RenderPriority.Character);
end;

do
    local angle = 0;
    local random_t = 0;
    local StickTarget;
    current_target = nil;

    serverposition("heartbeat", "combat_teleport", LPH_JIT(function(real_cframe)
        local Character = localplayer.Character;
        if not Character then return; end;
        local hrp = Character:FindFirstChild("HumanoidRootPart");
        if not hrp then return; end;
        local target = current_target;
        if not target then return; end;
        local target_character = target.Character;
        if not target_character then return; end;
        local target_root = target_character:FindFirstChild("HumanoidRootPart");
        if not target_root then return; end;
        if not settings.tpenemy then return; end;

        local extra = settings.strafe_extra or {};
        local is_baiting = extra["bait parry"];
        local avoid_walls = extra["avoid walls"];

        if table.find(ParryingCharacters, target_character) or table.find(ParryingCharacters, Character) then
            settings.last_parry_tick = os.clock();
        end;

        local in_forgiveness = (os.clock() - (settings.last_parry_tick or 0) < 3);
        if settings.strafe_void_spam or (is_baiting and not in_forgiveness) then
            local now = os.clock();
            local vin = settings.strafe_void_in or 0;
            local vout = settings.strafe_void_out or 0;
            
            if is_baiting and not in_forgiveness then
                vin = settings.bait_random_vin or 0.25;
                vout = settings.bait_random_vout or 0.25;
            else
            if vin == 0 then vin = 0.01; end;
            if vout == 0 then vout = 0.01; end;
            end;
            if settings.is_voiding then
                if now - (settings.last_void_tick or 0) >= vout then
                    settings.is_voiding = false;
                    settings.last_void_tick = now;
                    if is_baiting then
                        settings.bait_random_vout = math_random(30, 80) / 100;
                    end;
                end;
            else
                if now - (settings.last_void_tick or 0) >= vin then
                    settings.is_voiding = true;
                    settings.last_void_tick = now;
                    if is_baiting then
                        settings.bait_random_vin = math_random(25, 80) / 100;
                    end;
                end;
            end;
            if settings.is_voiding then
                return cframe_new(target_root.Position.X + math_random(-5, 5), math_random(-1000, 0), target_root.Position.Z + math_random(-5, 5));
            end;
        end;
		local predicted_cframe = target_root.CFrame;
		if (Toggles.strafe_prediction and Toggles.strafe_prediction.Value) then
			local vel = target_root.AssemblyLinearVelocity;
			local base = Options.strafe_pred_base and Options.strafe_pred_base.Value or 0;
			local mult = Options.strafe_pred_mult and Options.strafe_pred_mult.Value or 1;
			predicted_cframe = predicted_cframe + vector3_new(vel.X * mult, vel.Y * base, vel.Z * mult);
		else
			sethiddenproperty(hrp, "PhysicsRepRootPart", target_root);
		end;
		local function apply_look(pos)
			if Toggles.strafe_look and Toggles.strafe_look.Value then
				return cframe_new(pos, predicted_cframe.Position);
			end;
			return cframe_new(pos, pos + predicted_cframe.LookVector);
		end;
        local pos;
		if (Toggles.strafe_random_toggle and Toggles.strafe_random_toggle.Value) then
			local range = Options.random_range and Options.random_range.Value or 5;
			local nx = math.noise(random_t, 1.7) * range * 2;
			local ny = math.noise(random_t, 3.1) * range * 2;
			local nz = math.noise(random_t, 5.3) * range * 2;
			pos = predicted_cframe.Position + vector3_new(nx, ny, nz);
		else
			local rx = Options.orbit_radius_x and Options.orbit_radius_x.Value or 5;
			local ry = Options.orbit_height_y and Options.orbit_height_y.Value or 0;
			pos = predicted_cframe.Position + vector3_new(math_cos(angle) * rx, ry, math_sin(angle) * rx);
		end;

        if avoid_walls then
            local ray_params = RaycastParams.new();
            ray_params.FilterType = Enum.RaycastFilterType.Exclude;
            ray_params.FilterDescendantsInstances = {PlayerCharacters, character, workspace:FindFirstChild("Ignore"), workspace:FindFirstChild("EffectsJunk")};
            
            local result = workspace:Raycast(predicted_cframe.Position, pos - predicted_cframe.Position, ray_params);
            if result then
                pos = result.Position + result.Normal * 1.5;
            end;
        end;

        return apply_look(pos);
    end), 1);

    function is_teleport_valid(player)
        if not player then return false; end;
        if player.Parent ~= players then return false; end;
        local char = player.Character;
        if not char then return false; end;
        local hum = char:FindFirstChildOfClass("Humanoid");
        local hrp = char:FindFirstChild("HumanoidRootPart");
        if not hum or not hrp then return false end;
        if hum.Health <= 0 then return false; end;
        if framework:in_menu(player) then return false; end;
        return true;
    end;

    runservice.Heartbeat:Connect(LPH_JIT(function(dt)
		if Active then
			local speed_value = (Options.strafe_speed and Options.strafe_speed.Value) or tpspeed or 10;
			angle = (angle + dt * speed_value) % (2 * math.pi);
			random_t = random_t + dt * (speed_value * 0.75);
		end;
        local Character = localplayer.Character;
        if not Character then
            current_target = nil;
            setrunning("combat_teleport", false);
            return;
        end;
        local camerasubject;
        local camattr = Character:GetAttribute("CameraSubject");
        if camattr then
            camerasubject = Character:FindFirstChild(camattr);
        else
            camerasubject = Character:FindFirstChildOfClass("Humanoid");
        end;
        local s = settings;
        if not s.stick and not targeting_player then
            StickTarget = nil;
            stick_target = nil;
        end;
        local closestplayer = nil;
        local needstarget = s.tpenemy or s.stick or targeting_player or spectateneemy;
        if needstarget then
            if (s.stick or targeting_player) and StickTarget then
                closestplayer = StickTarget;
            elseif targeting_player then
                closestplayer = SelectedPlayer;
            else
                local closestdist = math.huge;
                local mousepos = userinputservice:GetMouseLocation();
                for player in pairs(cachedplayers) do
                    if player == localplayer then continue; end;
                    if should_skip_by_whitelist(player, "strafe") then continue; end;
                    local char = player.Character;
                    if not char then continue; end;
                    local hrp = char:FindFirstChild("HumanoidRootPart");
                    local hum = char:FindFirstChildOfClass("Humanoid");
                    if not hrp or not hum or hum.Health <= 0 or framework:in_menu(player) then continue; end;
                    local screenpos, onscreen = camera:WorldToViewportPoint(hrp.Position);
                    if onscreen then
                        local dist = (vector2_new(screenpos.X, screenpos.Y) - mousepos).Magnitude;
                        if dist < closestdist then
                            closestdist = dist;
                            closestplayer = player;
                        end;
                    end;
                end;
                if s.stick and closestplayer then StickTarget = closestplayer; stick_target = closestplayer; end;
            end;
        end;
        current_target = closestplayer;
        if current_target and is_teleport_valid(current_target) and not should_skip_by_whitelist(current_target, "strafe") then
            setrunning("combat_teleport", true);
        else
            setrunning("combat_teleport", false);
        end;
        if spectateneemy and current_target and not whitelisted(current_target) then
            local targethum = current_target.Character and current_target.Character:FindFirstChildOfClass("Humanoid");
            if targethum and targethum.Health > 0 and not framework:in_menu(current_target) then
                camera.CameraSubject = targethum;
            else
                camera.CameraSubject = camerasubject;
            end;
        else
            camera.CameraSubject = camerasubject;
        end;
    end))
end;

local kill_phase = 0;
serverposition("heartbeat", "initattemptkill", LPH_JIT(function(cf)
    if kill_phase == 1 then
        return cf + vector3_new(0, 1000, 0);
    elseif kill_phase == 2 then
        fire_server("StartFallDamage");
        return cf + vector3_new(0, -1000, 0);
    end;
    return cf;
end), 4);

do

    local function Parry(metadata)
        local apdelay = math.round(Classes.APDelay.Value or 0);
        if apdelay > 0 then task.wait(apdelay); end;
        if Classes.APType.Value == "remote" then
            fire_server("Parry");
        elseif Classes.APType.Value == "both" then
            fire_server("Parry");
            keypress(0x46);
            keyrelease(0x46);
        else
            keypress(0x46);
            keyrelease(0x46);
        end;
    end;

    local scraped = {};
    local function getevent(animation_id)
        if scraped[animation_id] then 
            return scraped[animation_id];
        end;
        local markers = {};
        local ks;
        local s, _ = pcall(function()
            ks = game:GetService("KeyframeSequenceProvider"):GetKeyframeSequenceAsync(animation_id);
        end);
        if s and ks then
            local function recurse(parent)
                for _, child in pairs(parent:GetChildren()) do
                    if child:IsA("KeyframeMarker") then
                        local kf = child:FindFirstAncestor("Keyframe");
                        if kf then
                            markers[child.Name] = kf.Time;
                        end;
                    end;
                    if #child:GetChildren() > 0 then
                        recurse(child);
                    end;
                end;
            end;
            recurse(ks);
            scraped[animation_id] = markers;
            return markers;
        end;
        return nil;
    end;

    local blacklisted_IDS = {
        ["106649093705106"] = true;
        ["9745796833"] = true;
        ["9745345487"] = true;
        ["0"] = true;
        ["9745344365"] = true;
    };

    local slashes = {};
    local parries = {};
    task_spawn(LPH_JIT(function()
        task.wait(0.5);
        for _, obj in pairs(getgc(true)) do
            if type(obj) == "table" and rawget(obj, "slashMetadata") and rawget(obj, "parryMetadata") ~= nil then
                if obj.slashMetadata then
                    for _, meta in ipairs(obj.slashMetadata) do
                        if meta.animation and meta.animation.AnimationId then
                            local id = string.gsub(meta.animation.AnimationId, "rbxassetid://", "");
                            if not blacklisted_IDS[id] then
                                slashes[id] = "Slash";
                            end;
                        end;
                    end;
                end;
                if obj.parryMetadata then
                    for _, meta in ipairs(obj.parryMetadata) do
                        if meta.animation and meta.animation.AnimationId then
                            local id = string.gsub(meta.animation.AnimationId, "rbxassetid://", "");
                            if not blacklisted_IDS[id] then
                                parries[id] = "Parry";
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end));

    local blacklist = {"rbxassetid://106649093705106", "rbxassetid://6423003415", "rbxassetid://101463478179793", };
    local HumanoidToParry = {};

    if PlayerCharacters then
        for i, v in pairs(PlayerCharacters:GetChildren()) do
            if v ~= localplayer.Character and v:FindFirstChildOfClass("Humanoid") then
                local Player = players:GetPlayerFromCharacter(v);
                if not Player then continue; end;
                local humanoid = v:FindFirstChildOfClass("Humanoid");
                table.insert(HumanoidToParry, humanoid);
            end;
        end;

        PlayerCharacters.ChildAdded:Connect(function(char)
            if char ~= localplayer.Character and char:FindFirstChildOfClass("Humanoid") then
                local Player = players:GetPlayerFromCharacter(char);
                if not Player then return; end;
                local humanoid = char:FindFirstChildOfClass("Humanoid");
                table.insert(HumanoidToParry, humanoid);
            end;
        end);
    end;

    local play_sound_old;
    local hittable_character_old;
    
    do
        parrysection2:AddToggle("AutoParry", {
            Text = "auto parry";
            Default = false;
            Callback = function(value)
                Classes.AutoParry.Value = value;
            end;
        });

        parrysection2:AddToggle("RandomChance", {
            Text = "random chance";
            Default = false;
            Callback = function(value)
                Classes.RandomChance.Value = value;
            end;
        });

        parrysection2:AddToggle("SmartCheck", {
            Text = "smartcheck";
            Default = false;
            Tooltip = "predicts hitbox time creation";
            Callback = function(value)
                Classes.SmartCheck.Value = value;
            end;
        });

        parrysection2:AddToggle("LookCheck", {
            Text = "check if looking";
            Default = false;
            Callback = function(value)
                Classes.LookCheck.Value = value;
            end;
        });

        parrysection2:AddDropdown("APCheck", {
            Text = "check method";
            Default = "sounds";
            Values = {"sounds"};
            Callback = function(value)
                Classes.APCheck.Value = value;
            end;
        });

        parrysection2:AddDropdown("APType", {
            Text = "ap type";
            Default = "remote";
            Values = {"remote", "keypress", "both"};
            Callback = function(value)
                Classes.APType.Value = value;
            end;
        });

        parrysection2:AddSlider("APDelay", {
            Text = "delay";
            Default = 0;
            Min = 0;
            Max = 1;
            Rounding = 1;
            Compact = true;
            Suffix = " seconds";
            Callback = function(value)
                Classes.APDelay.Value = value;
            end;
        });

        parrysection2:AddSlider("APRange", {
            Text = "range";
            Default = 15;
            Min = 1;
            Max = 20;
            Rounding = 0;
            Compact = true;
            Suffix = " studs";
            Callback = function(value)
                Classes.APRange.Value = value;
            end;
        });
        
        parrysection2:AddSlider("APChance", {
            Text = "auto parry chance";
            Default = 100;
            Min = 1;
            Max = 100;
            Rounding = 0;
            Compact = true;
            Suffix = "%";
            Callback = function(value)
                Classes.APChance.Value = value;
            end;
        });

        parrysection2:AddSlider("APAngle", {
            Text = "look angle";
            Default = 45;
            Min = 1;
            Max = 180;
            Rounding = 0;
            Compact = true;
            Suffix = " degrees";
            Callback = function(value)
                Classes.APAngle.Value = value;
            end;
        });

        parrysection2:AddSlider("Threshold", {
            Text = "marker threshold";
            Default = 0.3;
            Min = 0;
            Max = 1;
            Rounding = 1;
            Compact = true;
            Suffix = " seconds";
            Callback = function(value)
                Classes.Threshold.Value = value;
            end;
        });

        parrysection:AddToggle("AntiParry", {
            Text = "anti parry";
            Default = false;
            Callback = function(value)
                AntiParry = value;
                Classes.AntiParry.Value = value;
            end;
        });

        local antiparry_box = parrysection:AddDependencyBox();

        antiparry_box:SetupDependencies({
            {Toggles.AntiParry, true; };
        });

        antiparry_box:AddDropdown("AntiParryModes", {
            Text = "modes";
            Default = "silent";
            Values = {"unequip", "void", "silent"};
            Multi = true;
        });
    end;

    parrysection:AddToggle("fakeswing", {
        Text = "fake swing";
        Default = false;
        Callback = function(v)
            settings.fakeswing = v;
        end;
    });

    parrysection:AddToggle("swingsound", {
        Text = "play swing sound";
        Default = false;
        Tooltip = "use keybind";
        Callback = function(v)
            settings.swingsound = v;
        end;
    }):AddKeyPicker("swingsoundkey", {
        Text = "swing sound";
        Default = "MB2";
        NoUI = true;
    });

    userinputservice.InputBegan:Connect(function(i, gp)
        if gp then return; end;
        if settings.swingsound and (i.KeyCode == Options.swingsoundkey.Value or i.UserInputType == Options.swingsoundkey.Value) then
            local weapon = framework:get_weapon();
            if weapon then fire_server("MeleeSwing", weapon, math_random(1, 3)); end;
        end;
    end);

    parrysection:AddToggle("AutoEquip", {
        Text = "auto equip";
        Default = false;
        Callback = function(v)
            settings.autoequip = v;
        end;
    });

    parrysection:AddToggle("VoidOnParry", {
        Text = "void on parry stun";
        Default = false;
        Callback = function(v)
            settings.voidonparry = v;
        end;
    });

    local hitbox_container = workspace:WaitForChild("EffectsJunk"):WaitForChild("Hitboxes");

    local function auto_parry_sd()
        local isdesynced = currently_spoofing;
        if isdesynced and lastservercframe then
            return lastservercframe.Position;
        end;
        local char = localplayer.Character;
        local hrp = char and char:FindFirstChild("HumanoidRootPart");
        return hrp and hrp.Position or Vector3.zero;
    end;

    local function on_hitbox_created(hitbox, caster_character)
        if not hitbox:IsA("BasePart") or hitbox.Name ~= "Hitbox" then return; end;
        if not Classes.AutoParry.Value then return; end;
        if Classes.APCheck.Value ~= "hitbox" then return; end;
        local is_rage = Classes.RageAutoParry and Classes.RageAutoParry.Value;
        local range = is_rage and 25 or Classes.APRange.Value;
        local chance = is_rage and true or framework:Chance(Classes.RandomChance.Value and math_random(1, 100) or Classes.APChance.Value);
        local caster = caster_character;
        if not caster then
            local ancestor = hitbox:FindFirstAncestorOfClass("Model");
            if ancestor and ancestor:FindFirstChild("HumanoidRootPart") then
                caster = ancestor;
            end;
        end;
        if not caster or caster == localplayer.Character then return; end;
        if not caster:FindFirstChild("HumanoidRootPart") then return; end;
        if not caster:FindFirstChild("Humanoid") then return; end;
        local caster_root = caster.HumanoidRootPart;
        if (caster_root.Position - auto_parry_sd()).Magnitude > range then return; end;
        if not chance then return; end;
        if not is_rage and Classes.LookCheck.Value then
            local head = localplayer.Character and localplayer.Character:FindFirstChild("Head");
            if head then
                local dir = (caster_root.Position - head.Position).Unit;
                if math.deg(math.acos(dir:Dot(head.CFrame.LookVector))) > Classes.APAngle.Value then return; end;
            end;
        end;

        local function do_parry()
            if not hitbox:IsDescendantOf(game) then return; end;
            local weapon, metadata = framework:get_weapon();
            if not weapon or not metadata then return; end;
            local parry_count = is_rage and 3 or 1;
            for _ = 1, parry_count do
                task_spawn(Parry, metadata);
            end;
        end;

        if Classes.APDelay.Value > 0 then
            task.delay(Classes.APDelay.Value, do_parry);
        else
            do_parry();
        end;
    end;

    local function watch_character(character)
        character.DescendantAdded:Connect(function(desc)
            on_hitbox_created(desc, character);
        end);
    end;

    hitbox_container.ChildAdded:Connect(function(child)
        on_hitbox_created(child, nil);
    end);

    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player ~= localplayer and player.Character then
            watch_character(player.Character);
        end;
        player.CharacterAdded:Connect(function(char)
            if player ~= localplayer then
                watch_character(char);
            end;
        end);
    end;

    game:GetService("Players").PlayerAdded:Connect(function(player)
        if player == localplayer then return; end;
        player.CharacterAdded:Connect(function(char)
            watch_character(char);
        end);
    end);

    if modules.Name["SoundHandler"] and modules.Name["SoundHandler"].playSound then
        play_sound_old = modules.Name["SoundHandler"].playSound;
        modules.Name["SoundHandler"].playSound = function(...)
            local args = {...};
            local sound = args[1];
            if not sound or not play_sound_old then
                return play_sound_old and play_sound_old(...) or nil;
            end;
            if typeof(sound) == "table" then
                pcall(function()
                    local is_rage = Classes.RageAutoParry and Classes.RageAutoParry.Value;
                    if (Classes.AutoParry.Value or is_rage) and Classes.APCheck.Value == "sounds" then
                        local s_obj = sound.soundObject;
                        local s_name = s_obj and s_obj.Name or "";
                        local s_parent = sound.parent;
                        if s_parent and typeof(s_parent) == "Instance" then
                            local is_attack = false;
                            if s_parent.Name:match("Hitbox") then
                                is_attack = true;
                            elseif s_name:match("Slash") or s_name:match("Swing") or s_name:match("Attack") or s_name:match("Blade") then
                                is_attack = true;
                            end;
                            if is_attack then
                                local other = s_parent:FindFirstAncestorOfClass("Model");
                                if other and other:IsA("Tool") then other = other.Parent; end;
                                if other and other:FindFirstChild("HumanoidRootPart") and other:FindFirstChild("Humanoid") then
                                    local other_root = other.HumanoidRootPart;
                                    local range = is_rage and 25 or Classes.APRange.Value;
                                    local chance = is_rage and true or framework:Chance(Classes.RandomChance.Value and math_random(1, 100) or Classes.APChance.Value);
                                    if other ~= localplayer.Character and (other_root.Position - auto_parry_sd()).Magnitude <= range and chance then
                                        local can_parry = false;
                                        if not is_rage and Classes.LookCheck.Value then
                                            local bad_plr_pos = other:GetPivot().Position;
                                            local head = localplayer.Character and localplayer.Character:FindFirstChild("Head");
                                            if head then
                                                local bad_plr_direction = (bad_plr_pos - head.Position).Unit;
                                                local to_check = head.CFrame.LookVector;
                                                if math.deg(math.acos(bad_plr_direction:Dot(to_check))) <= Classes.APAngle.Value then can_parry = true; end;
                                            end;
                                        else
                                            can_parry = true;
                                        end;
                                        if can_parry then
                                            local character = localplayer.Character;
                                            if character then
                                                local local_root = character:FindFirstChild("HumanoidRootPart");
                                                if local_root then
                                                    local distance = (other_root.Position - auto_parry_sd()).Magnitude;
                                                    if distance <= range then
                                                        local weapon, metadata = framework:get_weapon();
                                                        if weapon and metadata then
                                                            local parry_count = is_rage and 3 or 1;
                                                            for _ = 1, parry_count do task_spawn(Parry, metadata); end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if sound.soundObject and sound.soundObject.Name == "Parry" and typeof(sound.parent) == "Instance" then
                        local parry_shield = sound.parent:FindFirstAncestorOfClass("Model");
                        local character = parry_shield and parry_shield.Parent;
                        if parry_shield and parry_shield:GetAttribute("ParryShieldId") and character then
                            table.insert(ParryingCharacters, character);
                            if modules.Name["ParryConstants"] and modules.Name["ParryConstants"].PARRY_DURATION_IN_SECONDS then
                                task.delay(modules.Name["ParryConstants"].PARRY_DURATION_IN_SECONDS, function()
									local idx = table.find(ParryingCharacters, character);
									if idx then
                                        table.remove(ParryingCharacters, idx);
                                    end;
								end);
                            end;
                        end;
                    end;
                end);
            end;
            return play_sound_old(...);
        end;
    end;
    framework:BindToRenderStep(LPH_JIT(function()
        if not Classes.AutoParry.Value then return; end;
        if Classes.APCheck.Value ~= "animations" then return; end;
        local character = localplayer.Character;
        if not character then return; end;
        local humanoid_root_part = character:FindFirstChild("HumanoidRootPart");
        if not humanoid_root_part then return; end;
        local tool, metadata = framework:get_weapon();
        if not tool or not metadata then return; end;
        for _, humanoid in pairs(HumanoidToParry) do
            local root_part = humanoid.RootPart;
            if not root_part then continue; end;
            local distance = (humanoid_root_part.Position - root_part.Position).Magnitude;
            if distance > Classes.APRange.Value then continue; end;
            local animator = humanoid:FindFirstChildOfClass("Animator");
            if not animator then continue; end;
            local animations = animator:GetPlayingAnimationTracks();
            for _, anim in pairs(animations) do
                local anim_obj = anim.Animation;
                if not anim_obj or not anim_obj.AnimationId then continue; end;
                local anim_id = string.gsub(anim_obj.AnimationId, "rbxassetid://", "");
                if not slashes[anim_id] then continue; end;
                if anim_obj.Name:find("^Finish%w*") then continue; end;
                local markers = getevent(anim_obj.AnimationId);
                if not markers then continue; end;
                local hit_marker = markers.startHitDetection;
                if not hit_marker then continue; end;
                if anim.TimePosition >= math.clamp(hit_marker - Classes.Threshold.Value, 0, math.huge) and anim.TimePosition <= hit_marker and framework:Chance(Classes.RandomChance.Value and math_random(1, 100) or Classes.APChance.Value) then
                    local can_parry = false;
                    if Classes.LookCheck.Value then
                        local bad_plr_pos = root_part:GetPivot().Position;
                        local head = character:FindFirstChild("Head");
                        if head then
                            local bad_plr_direction = (bad_plr_pos - head.Position).Unit;
                            local to_check = head.CFrame.LookVector;
                            if math.deg(math.acos(bad_plr_direction:Dot(to_check))) <= Classes.APAngle.Value then
                                can_parry = true;
                            end;
                        end;
                    else
                        can_parry = true;
                    end;
                    if can_parry then
                        task_spawn(Parry, metadata);
                    end;
                end;
            end;
        end;
    end));
    if modules.Name["CharacterUtil"] and modules.Name["CharacterUtil"].getIsHittableCharacterPart then
        local old = modules.Name["CharacterUtil"].getIsHittableCharacterPart;
        local function is_parrying(character)
            local humanoid = character and character:FindFirstChildOfClass("Humanoid");
            if not humanoid then return false; end;
            local animator = humanoid:FindFirstChildOfClass("Animator");
            if not animator then return false; end;
            local tracks = animator:GetPlayingAnimationTracks();
            for i = 1, #tracks do
				local track = tracks[i];
                local anim = track and track.Animation;
                if anim and anim.AnimationId then
                    local id = anim.AnimationId:gsub("rbxassetid://", "");
                    if parries[id] then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
        modules.Name["CharacterUtil"].getIsHittableCharacterPart = LPH_JIT_MAX(function(part, unused)
            if Classes.AntiParry.Value and part and part.Parent then
                local character = part.Parent;
                local player = players:GetPlayerFromCharacter(character);
                if player then
                    local session = framework:GetSessionData(player);
                    if session then
                        local state = session:getState();
                        if state and state.parry and state.parry.isParrying then
                            return false;
                        end;
                    end;
                end;
                if is_parrying(character) then
                    return false;
                end;
                if not framework:check(character) then
                    local modes = Classes.AntiParryModes and Classes.AntiParryModes.Value or {silent = true; };
                    if modes.unequip and not ap_unequipped then
                        local weapon = framework:get_weapon();
                        local hum = localplayer.Character and localplayer.Character:FindFirstChildOfClass("Humanoid");
                        if weapon and hum then
                            ap_unequipped = true;
                            hum:UnequipTools();
                            task.delay(0.05, function()
                                if weapon and weapon.Parent == localplayer.Backpack then
                                    hum:EquipTool(weapon);
                                end;
                                ap_unequipped = false;
                            end);
                        end;
                    end;
                    if modes.void and not anti_parry_void then
                        anti_parry_void = true;
                        setrunning("voidhidelogic", true);
                        task.delay(0.2, function()
                            setrunning("voidhidelogic", false);
                            anti_parry_void = false;
                        end);
                    end;
                    if modes.silent then
                        return false;
                    end;
                end;
            end;
            return old(part, unused);
        end);
    end;
end;

charactertab:AddToggle("fly", {
    Text = "fly";
    Default = false;
    Callback = function()
        updatefeature("fly", "flybind", function(state)
            settings.flyenabled = state;
        end);
    end;
}):AddKeyPicker("flybind", {
    Text = "fly";
    Default = "X";
    Mode = "Toggle";
    Callback = function()
        updatefeature("fly", "flybind", function(state)
            settings.flyenabled = state;
        end);
    end;
});

charactertab:AddToggle("velocity", {
    Text = "velocity";
    Default = false;
    Callback = function()
        updatefeature("velocity", "velocitybind", function(state)
            settings.velocityenabled = state;
        end);
    end;
}):AddKeyPicker("velocitybind", {
    Text = "velocity";
    Default = "C";
    Mode = "Toggle";
    Callback = function()
        updatefeature("velocity", "velocitybind", function(state)
            settings.velocityenabled = state;
        end);
    end;
});

do
	local applied = false;
	charactertab:AddToggle("walkspeed", {
        Text = "walkspeed";
	    Default = false;
	    Callback = function(enabled)
	        settings.walkspeedenabled = enabled;
	        local wshandler = modules.Name["WalkSpeedHandlerClient"].getValueContainer();
	        if not wshandler then return; end;
	        local delta = (settings.walkspeed or 16) - 16;
	        if enabled and not applied then
	            applied = true;
	            wshandler:addBaseValueAdditive(delta);
	        elseif not enabled and applied then
	            applied = false;
	            wshandler:removeBaseValueAdditive(delta);
	        end;
	    end;
    });

    local jpconn;
    local pending = false;

    local function bind_jumppower(hum)
        if jpconn then
            jpconn:Disconnect();
            jpconn = nil;
        end;

        if not hum then return; end;

        jpconn = hum:GetPropertyChangedSignal("JumpPower"):Connect(function()
            if pending then return end;
            pending = true;

            task.delay(0.1, function()
                pending = false;

                local target = (jumppowerenabled and settings.jumppower) or 50;
                if hum and hum.Parent and hum.JumpPower ~= target then
                    hum.JumpPower = target;
                end
            end)
        end);

        hum.JumpPower = (jumppowerenabled and settings.jumppower) or 50;
    end;

	charactertab:AddToggle("jumppower", {
		Text = "jump power";
		Default = false;
		Callback = function(enabled)
			jumppowerenabled = enabled;
			if humanoid then
				humanoid.JumpPower = enabled and settings.jumppower or 50;
			end;
		end;
	});

	localplayer.CharacterAdded:Connect(function(char)
		humanoid = char:WaitForChild("Humanoid");
		bind_jumppower(humanoid);
	end);

	if humanoid then
		bind_jumppower(humanoid);
	end;

    local noanim_connection = nil;
    local charanim_connection = nil;
    local function apply_no_anims(char)
        if noanim_connection then
			noanim_connection:Disconnect();
		end;
        local hum = char:WaitForChild("Humanoid");
        local animator = hum:FindFirstChildOfClass("Animator");
        if not animator then return; end;
        for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
            if track.Animation ~= spin_animation then
                track:Stop();
            end;
        end;
        noanim_connection = animator.AnimationPlayed:Connect(function(track)
            if track.Animation ~= spin_animation then
                track:Stop();
            end;
        end);
    end;

    charactertab:AddToggle("NoAnimations", {
        Text = "no animations";
        Default = false;
        Tooltip = "stops all character animations";
        Callback = function(Value)
            if Value then
                if character then
                    apply_no_anims(character);
                end;
                charanim_connection = localplayer.CharacterAdded:Connect(apply_no_anims);
            else
                if noanim_connection then
					noanim_connection:Disconnect();
                    noanim_connection = nil;
                end;
                if charanim_connection then
                    charanim_connection:Disconnect();
                    charanim_connection = nil;
                end;
            end;
        end;
    });

    charactertab:AddToggle("spin", {
        Text = "spin";
        Default = false;
        Callback = function(Value)
            spineabled = Value;
        end;
    });

	charactertab:AddToggle("infjump", {
        Text = "infinite jump";
	    Default = false;
	    Callback = function(Value)
	        if Value then
	            Con = userinputservice.InputBegan:Connect(function(i, gp)
	                if gp then return; end;
	                if i.KeyCode == Enum.KeyCode.Space and humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                    end;
	            end);
	        else
	            if Con then
	                Con:Disconnect();
	                Con = nil;
	            end;
	        end;
	    end;
    });

    max_speed = safe_mode and 50 or 5000;
    max_speed1 = safe_mode and 30 or 100;
    max_speed2 = safe_mode and 65 or 1000;

	charactertab:AddSlider("flyspeed", {
        Text = "fly speed",
        Default = 16,
        Min = 16,
        Max = max_speed,
        Rounding = 0,
        Compact = true;
        Callback = function(Value)
			settings.flyspeed = Value;
		end;
    });

	charactertab:AddSlider("walkspeed2", {
        Text = "walk speed";
    	Default = 16;
    	Min = 16;
    	Max = max_speed1;
    	Rounding = 0;
    	Compact = true;
    	Callback = function(value)
    	    local old = settings.walkspeed;
    	    settings.walkspeed = value;
    	    if settings.walkspeedenabled then
    	        local wshandler = modules.Name["WalkSpeedHandlerClient"].getValueContainer();
    	        if wshandler then
    	            wshandler:removeBaseValueAdditive(old - 16);
    	            wshandler:addBaseValueAdditive(value - 16);
    	        end;
    	    end;
    	end;
    });

	charactertab:AddSlider("jumppower2", {
        Text = "jump power";
        Default = 50;
        Min = 50;
        Max = 200;
        Rounding = 0;
        Compact = true;
        Callback = function(value)
			settings.jumppower = value;
			if jumppowerenabled and humanoid then
				humanoid.JumpPower = value;
			end;
		end;
    });

	charactertab:AddSlider("speed", {
        Text = "velocity speed";
        Default = 16;
        Min = 16;
        Max = max_speed2;
        Rounding = 0;
        Compact = true;
        Callback = function(Value)
			settings.velocityspeed = Value;
		end;
    });

	charactertab:AddSlider("spinspeed", {
        Text = "spin speed";
        Default = 10;
        Min = 10;
        Max = 100;
        Rounding = 0;
        Compact = true;
        Callback = function(Value)
	        spinspeed = Value;
	        spinrad = math.rad(Value);
	    end;
    });
end;

do  
    local protection = tabs.charactertab:AddLeftGroupbox("protection");

    protection:AddToggle("voidenabled", {
        Text = "void";
        Default = false;
        Callback = function()
            updatefeature("voidenabled", "voidenabledkey", function(state)
                settings.voidenabled = state;
                if not settings.void_spam then
                    setrunning("voidhidelogic", state);
                else
                    if not state then
                        setrunning("voidhidelogic", false);
                    end;
                end;
            end);
        end;
    }):AddKeyPicker("voidenabledkey", {
        Text = "void";
        Default = "Y";
        Mode = "Toggle";
        Callback = function()
            updatefeature("voidenabled", "voidenabledkey", function(state)
                settings.voidenabled = state;
                if not settings.void_spam then
                    setrunning("voidhidelogic", state);
                else
                    if not state then
                        setrunning("voidhidelogic", false);
                    end;
                end;
            end);
        end;
    });

    local void_dep = protection:AddDependencyBox();

    void_dep:SetupDependencies({
        { Toggles.voidenabled, true; };
    });

    void_dep:AddToggle("follow_strafe_target", {
        Text = "follow strafe target";
        Default = false;
        Tooltip = "voids under strafe target";
        Callback = function(Value)
            settings.follow_strafe_target = Value
        end;
    });

    void_dep:AddToggle("void_spam", {
        Text = "spam";
        Default = false;
        Callback = function(Value)
            settings.void_spam = Value;
            if not Value then
                if settings.voidenabled then
                    setrunning("voidhidelogic", true);
                else
                    setrunning("voidhidelogic", false);
                end;
            end;
        end;
    });

    local void_spam_dep = void_dep:AddDependencyBox();

    void_spam_dep:SetupDependencies({
        { Toggles.voidenabled, true };
        { Toggles.void_spam, true };
    });

    void_spam_dep:AddSlider("void_in", {
        Text = "void in";
        Default = 0;
        Min = 0;
        Max = 1;
        Rounding = 1;
        Compact = true;
        Callback = function(Value)
            settings.void_in = Value;
        end;
    });

    void_spam_dep:AddSlider("void_out", {
        Text = "void out";
        Default = 0;
        Min = 0;
        Max = 1;
        Rounding = 1;
        Compact = true;
        Callback = function(Value)
            settings.void_out = Value
        end;
    });

    task_spawn(LPH_JIT(function()
        while true do
            task.wait()
            if settings.void_spam and settings.voidenabled then
                local vin = settings.void_in or 0;
                local vout = settings.void_out or 0;
                setrunning("voidhidelogic", true);
                if vin > 0 then
                    task.wait(vin);
                else 
                    task.wait();
                end;
                if not (settings.void_spam and settings.voidenabled) then
                    if not settings.voidenabled then
                        setrunning("voidhidelogic", false);
                    end;
                    continue;
                end;
                setrunning("voidhidelogic", false);
                if vout > 0 then
                    task.wait(vout);
                else
                    task.wait();
                end;
            end;
        end;
    end));
end;

exploit:AddToggle("stamina", {
    Text = "stamina",
    Default = false;
    Callback = function(Value)
        stamenabled = Value;
        stamina_sett_changed();
    end;
});

local stamina_depbox = exploit:AddDependencyBox();

stamina_depbox:AddToggle("infstamina", {
    Text = "infinite stamina";
    Default = false;
    Callback = function(Value)
        settings.infstamina = Value;
        stamina_sett_changed();
    end;
});

stamina_depbox:AddToggle("staminaregenstate", {
    Text = "stamina regen rate";
    Default = false;
    Callback = function(Value)
        stamregentoggle = Value
        stamina_sett_changed();
    end;
});

stamina_depbox:AddToggle("staminadelaystate", {
    Text = "stamina gain delay",
    Default = false;
    Callback = function(Value)
        stamdelaystate = Value
        stamina_sett_changed();
    end;
});

local stamina_regen = stamina_depbox:AddDependencyBox();
local stamina_delay = stamina_depbox:AddDependencyBox();

stamina_delay:AddSlider("staminadelayslider", {
    Text = "stamina delay";
    Default = 0.25;
    Min = 0;
    Max = 1;
    Rounding = 2;
    Compact = true;
    Callback = function(Value)
        stamindelayamount = Value
        stamina_sett_changed();
    end;
});

stamina_regen:AddSlider("staminaregenslider", {
    Text = "stamina rate";
    Default = 35;
    Min = 0;
    Max = 500;
    Rounding = 1;
    Compact = true;
    Callback = function(Value)
        stamregenrate = Value;
        stamina_sett_changed();
    end;
});

stamina_depbox:SetupDependencies({
    {Toggles.stamina, true; };
});

stamina_regen:SetupDependencies({
    {Toggles.staminaregenstate, true; };
});

stamina_delay:SetupDependencies({
    {Toggles.staminadelaystate, true; };
});

exploit:AddToggle("infair", {
    Text = "infinite air";
    Default = false;
    Callback = function(Value)
        if Toggles.infair.Value then
            modules.Name["AirConstants"].AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = 0;
        else
            modules.Name["AirConstants"].AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = -15;
        end;
    end;
});

exploit:AddToggle("canalwaysjump", {
    Text = "can always jump";
    Default = false;
    Callback = function(Value)
        settings.canalwaysjump = Value;
    end;
});

exploit:AddToggle("nojumpcd", {
    Text = "no jump cooldown";
    Default = false;
    Callback = function(Value)
        if Value then
            modules.Name["JumpConstants"].JUMP_DELAY_ADD = 0;
        else
            modules.Name["JumpConstants"].JUMP_DELAY_ADD = 1;
        end;
    end;
});

dash_cooldown = nil;
exploit:AddToggle("nodashcd", {
    Text = "no dash cooldown";
    Default = false;
    Callback = function(Value)
		settings.ndcd = Value;
        local dashConstants = modules.Name["DashConstants"];
        if dashConstants then
            if Value then
                if not dash_cooldown then
                    dash_cooldown = dashConstants.DASH_COOLDOWN or 3;
                end;
                dashConstants.DASH_COOLDOWN = 0;
            elseif dash_cooldown then
                dashConstants.DASH_COOLDOWN = dash_cooldown;
            end
        end;
    end;
});

framework:BindToRenderStep(LPH_JIT(function()
	framework:spinning();
    if not settings.ndcd then return; end;
    local sessionsdata = framework:GetSessionData();
    local state = sessionsdata and sessionsdata:getState();
    local dashstate = state and (state.dashClient or state.dodgeClient);
    if not dashstate then return; end;
    if dashstate.isDashing then
        dashstate.isDashing = false;
    end;
    if dashstate.canDash == false then
        dashstate.canDash = true;
    end;
    if dashstate.dashCooldown and dashstate.dashCooldown ~= 0 then
        dashstate.dashCooldown = 0;
    end;
    if dashstate.lastDashTick and dashstate.lastDashTick ~= 0 then
        dashstate.lastDashTick = 0;
    end;
    if dashstate.lastDashTime and dashstate.lastDashTime ~= 0 then
        dashstate.lastDashTime = 0;
    end;
end));

exploit:AddToggle("nnt", {
    Text = "no name tag";
    Default = false;
    Callback = function(Value)
        settings.nnt = Value;
    end;
});

exploit:AddToggle("nut", {
    Text = "no utility trigger";
    Default = false;
    Callback = function(Value)
        settings.nut = Value;
    end;
});

exploit:AddToggle("itu", {
    Text = "instant utility use";
    Default = false;
    Callback = function(Value)
        if Value then
            for i, v in modules.Name["UtilityMetadata"] do
                if v.displayName ~= "Medkit" then
                    v.cacheDur = v.preThrowDuration or 0.001;
                    v.cacheTime = v.useTime or 0;
                    v.preThrowDuration = 0.001;
                    v.useTime = 0;
                end;
            end;
        else
            for i, v in modules.Name["UtilityMetadata"] do
                if v.displayName ~= "Medkit" then
                    v.preThrowDuration = v.cacheDur or v.preThrowDuration;
                    v.useTime = v.cacheTime or v.useTime;
                end;
            end;
        end;
    end;
});

exploit:AddToggle("nkb", {
    Text = "no knockback";
    Default = false;
    Callback = function(Value)
        settings.nkb = Toggles.nkb.Value;
    end;
});

do
    local antifling_connections = {};
    local collision_cache = {};
    local function watch_hrp(player, hrp)
        if antifling_connections[hrp] then return; end;
        collision_cache[hrp] = hrp.CanCollide;
        hrp.CanCollide = false;
        antifling_connections[hrp] = hrp:GetPropertyChangedSignal("CanCollide"):Connect(function()
            if settings.antifling and not hrp:FindFirstChildWhichIsA("WeldConstraint", true) then
                hrp.CanCollide = false;
            end;
        end);
    end;
    local function watch_player(player)
        if player == localplayer then return; end;
        local function on_char(char)
            local hrp = char:WaitForChild("HumanoidRootPart");
            if not hrp:FindFirstChildWhichIsA("WeldConstraint", true) then
                watch_hrp(player, hrp);
            end;
        end;
        if player.Character then on_char(player.Character) end
        antifling_connections[player] = player.CharacterAdded:Connect(on_char);
    end;
    local function stop_antifling()
        for key, conn in antifling_connections do
            conn:Disconnect();
        end;
        table.clear(antifling_connections);
        for hrp, original in collision_cache do
            if hrp and hrp.Parent then
                hrp.CanCollide = original;
            end;
        end;
        table.clear(collision_cache);
    end;
    exploit:AddToggle("antifling", {
        Text = "anti fling";
        Default = false;
        Callback = function(Value)
            settings.antifling = Value;
            stop_antifling();
            if Value then
                for player in pairs(cachedplayers) do
                    watch_player(player);
                end;
            end;
        end;
    });
end;

exploit:AddToggle("antiswim", {
    Text = "anti swim";
    Default = false;
    Callback = function(v)
        settings.antiswim = v;
    end;
});

exploit:AddToggle("nfd", {
    Text = "no fall damage";
    Default = false;
    Callback = function(v)
		settings.nfd = v;
    end;
});

exploit:AddToggle("nps", {
    Text = "no parry stun";
    Default = false;
    Callback = function(Value)
        settings.nps = Value;
    end;
});

exploit:AddToggle("nps2", {
    Text = "no parry slowdown";
    Default = false;
    Callback = function(Value)
        settings.nps2 = Value;
    end;
});

exploit:AddToggle("nr", {
    Text = "no ragdoll";
    Default = false;
    Callback = function(Value)
        if Value then
            local ragdoll = modules.Name["RagdollableClient"].attemptToggleActualRagdollClient; modules.Name["RagdollableClient"].attemptToggleActualRagdollClient = LPH_JIT(function(...)
                if Toggles.nr.Value then
                    return;
                end;
                return ragdoll(...);
            end);
        end;
    end;
});

exploit:AddToggle("noflash", {
    Text = "no flash effects";
    Default = false;
    Callback = function(Value)
        settings.noflash = Value;
    end;
});

exploit:AddToggle("nhe", {
    Text = "no health effects";
    Default = false;
    Callback = function(Value)
        settings.nhe = Value;
    end;
});

exploit:AddToggle("ngpe", {
    Text = "no ghost potion effects";
    Default = false;
    Callback = function(Value)
        settings.ngpe = Value;
    end;
});

exploit:AddToggle("walkonwater", {
    Text = "walk on water";
    Default = false;
});

exploit:AddToggle("ragdoll",{
    Text = "ragdoll";
    Default = false;
});

do
    local anim_connections = {};
    local charcon = nil;
    local function cleanup_anim()
        for _, c in anim_connections do 
            c:Disconnect();
        end;
        table.clear(anim_connections);
    end;
    local function reset_speeds()
        if humanoid then
            for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                track:AdjustSpeed(1);
            end;
        end;
    end;
    local function apply(char)
        cleanup_anim();
        local hum = char:WaitForChild("Humanoid");
        local animator = hum:FindFirstChildOfClass("Animator") or Instance.new("Animator", hum);
        local function on_track_played(track)
            local speed = Options.AnimSpeed and Options.AnimSpeed.Value or 5;
            track:AdjustSpeed(speed);
        end;
        for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
            on_track_played(track);
        end;
        table.insert(anim_connections, animator.AnimationPlayed:Connect(on_track_played));
    end;
    exploit:AddToggle("speedyboi", {
        Text = "fast animation";
        Default = false;
        Tooltip = "use for instant finish";
        Callback = function(Value)
            cleanup_anim();
            if charcon then charcon:Disconnect();
                charcon = nil;
            end;
            if Value then
                if character then
                    apply(character);
                end;
                charcon = localplayer.CharacterAdded:Connect(apply);
            else
                reset_speeds();
            end;
        end;
    });
end;

exploit:AddSlider('AnimSpeed', {
    Text = 'animation speed';
    Default = 5;
    Min = 1;
    Max = 50;
    Rounding = 1;
    Compact = true;
    Suffix = 'x';
});

local desync_gb = tabs.charactertab:AddRightGroupbox("desync");

desync_gb:AddToggle("desync", {
	Text = "desync";
    Default = false;
    Callback = function()
		updatefeature("desync", "desyncbind", function(state)
			setrunning("body_direction", state);
		end);
	end; 
}):AddKeyPicker("desyncbind", {
    Text = "desync";
    Default = "F1";
    Mode = "Toggle";
	Callback = function()
		updatefeature("desync", "desyncbind", function(state)
			setrunning("body_direction", state);
		end);
    end;
});

local desync_dep = desync_gb:AddDependencyBox();

desync_dep:SetupDependencies({
    {Toggles.desync, true }
});

desync_dep:AddToggle("desync_avoid_walls", {
    Text = "avoid walls";
    Default = false;
});

desync_dep:AddToggle("desync_look", {
    Text = "look";
    Default = false;
});

desync_dep:AddSlider("desync_x", {
    Text = "desync x";
    Default = 0;
    Min = -180;
    Max = 180;
    Rounding = 0;
    Compact = true;
    Suffix = "°";
});

desync_dep:AddSlider("desync_y", {
    Text = "desync y";
    Default = -180;
    Min = -180;
    Max = 180;
    Rounding = 0;
    Compact = true;
    Suffix = "°";
});

desync_dep:AddSlider("desync_z", {
    Text = "desync z";
    Default = 0;
    Min = -180;
    Max = 180;
    Rounding = 0;
    Compact = true;
    Suffix = "°";
});

desync_dep:AddToggle("desync_random_rotation", {
    Text = "random rotation";
    Default = false;
});

local desync_random_dep = desync_dep:AddDependencyBox();

desync_random_dep:SetupDependencies({
    {Toggles.desync; true};
    {Toggles.desync_random_rotation; true};
});

desync_random_dep:AddSlider("desync_random_speed", {
    Text = "speed";
    Default = 5;
    Min = 1;
    Max = 30;
    Rounding = 1;
    Compact = true;
    Suffix = "x";
});

desync_dep:AddSlider("desync_off_x", {
    Text = "angle";
    Default = 0;
    Min = -15;
    Max = 15;
    Rounding = 0;
    Compact = true;
});

desync_dep:AddSlider("desync_off_y", {
    Text = "yaw";
    Default = 0;
    Min = -5;
    Max = 5;
    Rounding = 0;
    Compact = true;
});

desync_dep:AddSlider("desync_off_z", {
    Text = "pitch";
    Default = 0;
    Min = -15;
    Max = 15;
    Rounding = 0;
    Compact = true;
});

exploit1:AddToggle("noclip", {
    Text = "noclip";
    Default = false;
    Callback = function()
        updatefeature("noclip", "noclipbind", function(state)
            settings.noclipenabled = state;
        end);
    end;
}):AddKeyPicker("noclipbind", {
    Text = "noclip";
    Default = "Z";
    Mode = "Toggle";
    Callback = function()
        updatefeature("noclip", "noclipbind", function(state)
            settings.noclipenabled = state;
        end);
    end;
});

exploit1:AddToggle("fakeposition", {
    Text = "fake position";
    Default = false;
    Callback = function()
        updatefeature("fakeposition", "fakeposkey", function(state)
            setfflag("NextGenReplicatorEnabledWrite4", tostring(state));
        end);
    end;
}):AddKeyPicker("fakeposkey", {
    Text = "fake position";
    Default = "M";
    Mode = "Toggle";
    Callback = function()
        updatefeature("fakeposition", "fakeposkey", function(state)
            setfflag("NextGenReplicatorEnabledWrite4", tostring(state));
        end);
    end;
});

exploit1:AddToggle("hideweapononback", {
    Text = "hide weapon on back";
    Default = false;
    Callback = function(Value)
        if Toggles.hideweapononback.Value then
            humanoid:EquipTool(localplayer.Backpack:GetChildren()[1]);
            task.wait();
            humanoid:UnequipTools();
            settings.hideweapon = Value;
        end;
    end;
});

othertabs:AddToggle("HitboxExpand", {
    Text = "hitbox expander";
    Default = Config.HitboxExpand;
    Callback = function(value)
        Config.HitboxExpand = value;
		apply_all_hitboxes();
    end;
});

othertabs:AddToggle("ShowHitbox", {
    Text = "show expanded hitbox",
    Default = Config.ShowHitbox;
    Callback = function(value)
        Config.ShowHitbox = value;
        apply_all_hitboxes();
    end;
});

othertabs:AddDropdown("HBEPart", {
    Text = "hit part";
    Default = Config.HBEPart;
    Values = R6BodyParts;
    Callback = function(value)
        Config.HBEPart = value;
        apply_all_hitboxes();
    end;
});

othertabs:AddSlider("HitboxSize", {
    Text = "hitbox size";
    Default = Config.HitboxSize;
    Min = 1;
    Max = 20;
    Rounding = 0;
    Compact = true;
    Suffix = " studs";
    Callback = function(value)
        Config.HitboxSize = value;
        apply_all_hitboxes();
    end;
});

mmisc:AddToggle("svs", {
    Text = "spoof vc status";
    Default = false;
    Tooltip = "join vc servers without vc";
    Callback = function(Value)
        settings.vcenabled = Value;
        fire_server("UpdateHasVc", true);
    end;
});

mmisc:AddToggle("ShowLine", {
    Text = "show line";
	Default = false;
}):AddColorPicker("linecolor", {
    Default = Color3.new(1, 1, 1);
	Title = "line color";
	Transparency = 0;
});

do
    local group_id = 5192826;
    local non_mods = {
        ["Combat Warrior"] = true;
        ["Contributor"] = true;
        ["Content Creator"] = true;
        ["Community Team Member"] = true;
    };
    local groupservice = game:GetService("GroupService");
    local function is_group_mod(player, callback)
        task_spawn(LPH_JIT(function()
            local success, result = pcall(function()
                return groupservice:GetGroupsAsync(player.UserId);
            end);
            if (not success) then
                if tostring(result):find("HTTP") then
                    localplayer:Kick("anti mod: " .. tostring(result));
                end;
                callback(false, nil);
                return;
            end;
            for _, group in ipairs(result) do
                if (group.Id == group_id) then
                    local is_mod = not non_mods[group.Role] and group.Rank > 1;
                    callback(is_mod, group.Role);
                    return;
                end;
            end;
            callback(false, nil);
        end));
    end;
    local function is_player_mod(player)
        if (player == localplayer) then return; end;
        local modhandler = modules.Name["ModHandler"];
        local adminhandler = modules.Name["AdminHandler"];
        if (modhandler.getIsMod(player) and settings.anti_mod) then
            localplayer:Kick("anti mod message:\n kicked " .. player.DisplayName .. " (@" .. player.Name .. ")");
            return;
        elseif (adminhandler.getIsAdmin(player) and settings.anti_mod) then
            localplayer:Kick("anti mod message:\n kicked " .. player.DisplayName .. " (@" .. player.Name .. ")");
            return;
        end;
        is_group_mod(player, function(is_mod, role)
            if (is_mod and settings.anti_mod) then
                localplayer:Kick("anti mod message:\n kicked " .. player.DisplayName .. " (@" .. player.Name .. ")\nrole: " .. tostring(role));
            end;
        end);
    end;
    for _, player in ipairs(players:GetPlayers()) do
        is_player_mod(player);
    end;
    players.ChildAdded:Connect(function(player)
        is_player_mod(player);
    end);
    mmisc:AddToggle("anti_mod", {
    Text = "anti mod";
    Default = false;
        Callback = function(v)
            settings.anti_mod = v;
            if v then
                for _, player in ipairs(players:GetPlayers()) do
                    is_player_mod(player);
                end;
            end;
        end;
    });
end;

misc:AddButton("get cat", function()
    fire_server("ExecuteCommand", "getCat", {});
end);

misc:AddButton("unlock emotes", function()
	local rodux = framework:GetState()
	for i, v in modules.Name["EmotesInOrder"] do
        if typeof(v) == "table" then 
            rodux.OwnedEmotes[v.id] = 1
        end;
    end;
end);

misc:AddToggle("fno", {
    Text = "force network ownership";
    Default = false;
    Tooltip = "prevents rectify from affecting you";
    Callback = function(Value)
        settings.fno = Value;
    end;
});

misc:AddToggle("include_position", {
    Text = "include position";
	Default = false;
	Callback = function(v)
		local maxhistory = 10
		local function connect(Character)
			ignorerespawn = true;
			poshistory = {};
			notowner = true;
			hasteleported = false;
			toolonloss = nil;
			if humanoid then
				if deathconn then
                    deathconn:Disconnect();
                end;
				deathconn = humanoid.Died:Connect(function()
                    ignorerespawn = true; 
                end);
			end;
			task.delay(0.25, function()
                ignorerespawn = false;
            end);
		end;
		if v and settings.fno then
			if deathconnection then return; end;
			deathconnection = localplayer.CharacterAdded:Connect(connect);
			if character then
                connect(character);
            end;
			if positionconnection then positionconnection:Disconnect(); end;
			positionconnection = runservice.Heartbeat:Connect(LPH_JIT(function()
				if ignorerespawn then return; end;
				if not character then return; end;
				if not humanoidrootpart or not humanoidrootpart:IsDescendantOf(workspace) then return; end;
				local success, isowner = pcall(function()
                    return isnetworkowner(humanoidrootpart);
                end);
				if not success then return; end;
				if isowner then
					local currentposition = humanoidrootpart.Position;
					if #poshistory == 0 or (currentposition - poshistory[#poshistory]).Magnitude > 0.001 then
						table.insert(poshistory, currentposition);
						if #poshistory > maxhistory then
                            table.remove(poshistory, 1);
                        end;
					end;
					if not notowner and not hasteleported then
						local teleportposition;
						if #poshistory >= 3 then
							teleportposition = poshistory[#poshistory - 2];
						elseif #poshistory > 0 then
							teleportposition = poshistory[1];
						else
							teleportposition = humanoidrootpart.Position;
						end;
						teleport(cframe_new(teleportposition));
						hasteleported = true;
						task.delay(0.1, function()
                            if toolonloss and toolonloss:IsDescendantOf(character) and humanoid then
                                humanoid:EquipTool(toolonloss);
                            end;
                        end);
					end;
					notowner = true;
				else
					notowner = false;
					hasteleported = false;
					toolonloss = nil;
					for _, item in ipairs(character:GetChildren()) do
						if item:IsA("Tool") then
							toolonloss = item;
							break;
						end;
					end;
				end;
			end));
		else
			if positionconnection then
				positionconnection:Disconnect();
				positionconnection = nil;
			end
			if deathConn then
				deathConn:Disconnect();
				deathConn = nil;
			end
			if deathconnection then
				deathconnection:Disconnect();
				deathconnection = nil;
			end;
		end;
	end;
});

local casemt = modules.Name["CaseMetadata"];
local cratenames = {};
local displayid = {}

for caseid, casedata in pairs(casemt) do
    local displayname = casedata.displayName or caseid;
    table.insert(cratenames, displayname);
    displayid[displayname] = caseid;
end;
table.sort(cratenames);

local SelectedCrateName = cratenames[1] or "";
local selectedamount = 1;

crates:AddDropdown("crates", {
    Text = "crates";
    Values = cratenames;
    Default = SelectedCrateName;
    Multi = false;
    Callback = function(v)
        SelectedCrateName = v;
    end;
});

crates:AddSlider("amount", {
    Text = "amount";
    Default = 1;
    Min = 1;
    Max = 10;
    Rounding = 0;
    Compact = true;
    Callback = function(value)
        selectedamount = math_floor(value)
    end;
});

crates:AddButton({
    Text = "open case";
	Func = function()
		local caseid = displayid[SelectedCrateName];
		if caseid then
			local success, response = invoke_server("PurchaseCase", caseid, selectedamount);
			if success then
				setthreadidentity(2);
				modules.Name["ToastNotificationActionsClient"].add( "success", `Opened {tostring(selectedamount)} case(s) of {SelectedCrateName}`, 2 )(modules.Name["RoduxStore"].store);
				modules.Name["SoundHandler"].playSound({soundObject = repstorage.Shared.Assets.Sounds.Success, parent = Workspace.Sounds, });
				setthreadidentity(7);
			else
				setthreadidentity(2);
				modules.Name["ToastNotificationActionsClient"].add( "error", response, 2, true )(modules.Name["RoduxStore"].store);
				setthreadidentity(7);
			end
		else
			setthreadidentity(2);
			modules.Name["ToastNotificationActionsClient"].add( "error", "Please select a valid case from the dropdown.", 2, true )(modules.Name["RoduxStore"].store);
			setthreadidentity(7);
		end;
	end;
});

crates:AddDropdown("spoofervalues", {
    Text = "device spoofer";
	Values = {"pc", "phone", "tablet", "xbox"};
	Default = settings.selecteddevice;
	Multi = false;
	Callback = function(v)
		settings.selecteddevice = v;
	end;
});

crates:AddToggle("devicespoofer", {
    Text = "device spoofer";
	Default = settings.devicespoofer;
	Callback = function(v)
		settings.devicespoofer = v;
	end;
});

miscauto:AddToggle("fastrespawn", {
    Text = "fast respawn";
    Default = false;
    Callback = function(Value)
        settings.fastrespawn = Value;
    end;
});

miscauto:AddToggle("ar", {
    Text = "auto revive";
    Default = false;
    Callback = function(Value)
        settings.ar = Value;
        if Value then
			bind_autorevive();
		end;
    end;
});

miscauto:AddToggle("loopspawn", {
    Text = "loop spawn";
    Default = false;
    Callback = function(Value)
        settings.loopspawn = Value;
        if Value then
            do_loopspawn();
        end;
    end;
});

miscauto:AddToggle("autoqueue", {
    Text = "auto queue";
    Default = false;
    Tooltip = "auto loads script";
    Callback = function(Value)
        settings.autoqueue = Value;
        if Value then
            local script_key = script_key or "";
            local payload = string.format([[
                script_key="%s";
                loadstring(game:HttpGet("https://raw.githubusercontent.com/nilsolutions/nilsolutions/refs/heads/main/loader.lua"))();
                ]], script_key)
            if queue_on_teleport then
                queue_on_teleport(payload);
            end;
        else
            if clear_teleport_queue then
                clear_teleport_queue();
            end;
        end;
    end;
});

function bestmatch(Input)
    if not Input or Input == "" then return nil; end;
    Input = Input:lower();
    for plr, _ in pairs(cachedplayers) do
        if plr ~= localplayer then
            local namematch = plr.Name:lower():find(Input);
            local displaymatch = plr.DisplayName:lower():find(Input);
            if namematch or displaymatch then
                return plr;
            end;
        end;
    end;
    return nil;
end;

local misc1 = misc_tab:AddTab("players");
local currenttarget = misc1:AddLabel("current target: none");
local SelectedPlayer = nil;
misc1:AddInput("playersearch", {
    Placeholder = "enter name or display";
    Default = "";
    Finished = false;
    Callback = function(Text)
    Text = Text:lower()
        local target = bestmatch(Text);
        if target then
            SelectedPlayer = target;
            currenttarget:SetText("current target: " .. target.DisplayName .. " (@" .. target.Name .. ")");
        else
            SelectedPlayer = nil
            currenttarget:SetText("current target: none");
        end;
    end;
});

local player_names = {};
local function players_dropdown()
    table.clear(player_names);
    for plr, _ in pairs(cachedplayers) do
        if plr ~= localplayer then
            table.insert(player_names, plr.Name);
        end;
    end;
    if Options.PlayerDropdown then
        Options.PlayerDropdown:SetValues(player_names);
    end;
end;

misc1:AddDropdown("PlayerDropdown", {
    Values = player_names;
    Default = nil;
    Multi = false;
    AllowNull = true;
    Text = "select player";
    Callback = function(Value)
        if Value and Value ~= "" then
            SelectedPlayer = game.Players:FindFirstChild(Value);
            if SelectedPlayer then
                currenttarget:SetText("current target: " .. SelectedPlayer.DisplayName .. " (@" .. SelectedPlayer.Name .. ")");
                if Options.playersearch then
                    Options.playersearch:SetValue(SelectedPlayer.Name);
                end;
            end;
        else
            SelectedPlayer = nil;
            currenttarget:SetText("current target: none");
            if Options.playersearch then
                Options.playersearch:SetValue("");
            end;
        end;
    end;
});

players_dropdown();

game.Players.PlayerAdded:Connect(function()
    task.wait(0.1);
    players_dropdown();
end);

game.Players.PlayerRemoving:Connect(function(plr)
    players_dropdown();
    if SelectedPlayer and SelectedPlayer == plr then
        SelectedPlayer = nil;
        currenttarget:SetText("current target: none");
        if Options.PlayerSearch then
            Options.PlayerSearch:SetValue("");
        end;
    end;
end);

local view_died = nil;
local view_changed = nil;

misc1:AddButton("teleport", function()
    local s, e = pcall(function()
        framework:teleport(SelectedPlayer.Character.HumanoidRootPart.CFrame);
    end);
    if e then 
        library:Notify("select a target", 3);
    end;
end);

serverposition("heartbeat", "AvoidProjectiles", LPH_JIT(function(cf)
    return cf * cframe_new(0, 60, 0);
end), 2);

misc1:AddButton("whitelist", function()
    local s, e = pcall(function()
        local playername = SelectedPlayer.Name;
        if not table.find(whitelist, playername) then
            table.insert(whitelist, playername);
            library:Notify(playername .. " whitelisted", 4);
        else
            library:Notify(playername .. " is already whitelisted", 4);
        end;
    end);
    if e then
        library:Notify("select a target", 3);
    end;
end);

misc1:AddButton("remove from whitelist", function()
    local s, e = pcall(function()
        local playername = SelectedPlayer.Name;
        local index = table.find(whitelist, playername);
        if index then
            table.remove(whitelist, index);
            library:Notify(playername .. " unwhitelisted", 4);
        else
            library:Notify(playername .. " is not whitelisted", 4);
        end;
    end);
    if e then
        library:Notify("select a target", 3);
    end;
end);

misc1:AddToggle("spectateto", {
    Text = "spectate";
	Default = false;
	Callback = function(v)
		if not v then
			viewing = nil;
			if view_died then
                view_died:Disconnect();
                view_died = nil;
            end;
			if view_changed then
                view_changed:Disconnect();
                view_changed = nil;
            end;
			local my_character = localplayer.Character;
			if my_character then
				local hum = my_character:FindFirstChildOfClass("Humanoid");
				if hum then
                    workspace.CurrentCamera.CameraSubject = hum;
                end;
			end
		else
			local target = SelectedPlayer;
			if not target then return; end;
			viewing = target;
			local function update_view()
				if not viewing or not viewing.Character then return; end;
				local hum = viewing.Character:FindFirstChildOfClass("Humanoid");
				if hum then
                    workspace.CurrentCamera.CameraSubject = hum;
                end;
			end
			update_view();
			view_died = viewing.CharacterAdded:Connect(function(char)
				repeat task.wait(); until char:FindFirstChildOfClass("Humanoid");
				update_view();
			end);
			view_changed = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
				if viewing and viewing.Character then
					local hum = viewing.Character:FindFirstChildOfClass("Humanoid");
					if hum and workspace.CurrentCamera.CameraSubject ~= hum then
                        workspace.CurrentCamera.CameraSubject = hum;
                    end;
				end;
			end);
		end;
	end;
});

do
    local cas = game:GetService("ContextActionService");
    local function on_space(action_name, input_state)
        if input_state == Enum.UserInputState.Begin then
            invoke_server("SpawnCharacter");
        end;
        return Enum.ContextActionResult.Sink;
    end;
    local function has_parry_shield(character)
        for _, v in character:GetChildren() do
            if v:GetAttribute("ParryShieldId") then 
                return true;
            end;
        end;
        return false;
    end;
	local function update_bind(character)
		if not character then
			cas:UnbindAction("MenuSpaceOverride");
			return;
		end;
		local humanoid = character:FindFirstChildOfClass("Humanoid");
		local alive = humanoid and humanoid.Health > 0;
		if has_parry_shield(character) or not alive then
			cas:UnbindAction("MenuSpaceOverride");
		else
			cas:BindAction("MenuSpaceOverride", on_space, false, Enum.KeyCode.Space);
		end;
	end;
    local child_connections = {};
    local function watch_character(character)
        for _, c in child_connections do 
            c:Disconnect();
        end;
        table.clear(child_connections);
        update_bind(character);
        table.insert(child_connections, character.ChildAdded:Connect(function(child)
            task.defer(function()
                update_bind(character);
            end);
        end));
        table.insert(child_connections, character.ChildRemoved:Connect(function()
            update_bind(character);
        end));
    end;
    localplayer.CharacterAdded:Connect(function(character)
        watch_character(character);
    end);
    localplayer.CharacterRemoving:Connect(function()
        for _, c in child_connections do 
            c:Disconnect();
        end;
        table.clear(child_connections);
        cas:UnbindAction("MenuSpaceOverride");
    end);
    if localplayer.Character then
        watch_character(localplayer.Character);
    end;
end;

network:BindEvents({
    KilledPlayer = function(statData)
		local KillSayStuff = Data.KillSayStuff;
		local MockHandler = modules.Name["MockPlayerHandler"];
		local KillStreak = modules.Name["KillStreakConfigs"];
		local diedPlayer = MockHandler.getPlayerOrMockFromPlayerOrMockUserId(statData.playerOrMockUserIdThatDied);
		local kill_type = statData.singleKillType;
		local killStreak = statData.killStreak;
		local headShot = statData.isHeadshot;
		local collat = statData.isCollat;
		local multiplier = statData.xpMult;
		local base_experience = statData.baseXpToGive;
		local baseCredits = statData.baseCreditsToGive;
		if diedPlayer and settings.killsay then
			local PickFrom = KillSayStuff.Normal;
			local GotXp = base_experience;
			local got_credits = baseCredits;
			if kill_type == "2" then
				PickFrom = KillSayStuff.Assist;
			elseif kill_type == "3" then
				PickFrom = KillSayStuff.Finish;
				GotXp = statData.finishXpToGive;
				got_credits = statData.finishCreditsToGive;
			elseif kill_type == "4" then
				PickFrom = KillSayStuff.Glory;
				GotXp = statData.gkXpToGive;
				got_credits = statData.gkCreditsToGive;
			end;
			if headShot then
				PickFrom = PickFrom.Headshot or PickFrom;
				GotXp = statData.headshotXpToGive;
				got_credits = statData.headshotCreditsToGive;
			end;
			if collat then
				PickFrom = PickFrom.Collat or PickFrom;
				GotXp = statData.collatXpToGive;
				got_credits = statData.collatCreditsToGive;
			end;
			local killstreak_data = killStreak > 1 and (KillStreak[killStreak - 1] or KillStreak[#KillStreak]);
			if killstreak_data then
				GotXp = statData.killStreakXpToGive;
				got_credits = statData.killStreakCreditsToGive;
			end;
			local Message;
			repeat
				Message = PickFrom[math_random(1, #PickFrom)];
				task.wait();
			until typeof(Message) == "string";
			Message = Message:gsub("%%Died%%", diedPlayer.DisplayName);
			Message = Message:gsub("%%XP%%", GotXp * multiplier);
			Message = Message:gsub("%%Credits%%", got_credits);
			if killstreak_data then
				Message = Message:gsub("%%KillstreakDisplayName%%", killstreak_data.displayName);
			else
				Message = Message:gsub("%%KillstreakDisplayName%%", "Double Kill");
			end;
			local Weapon = framework:get_weapon() or framework:get_ranged()
			if Weapon then
                Message = Message:gsub("%%Weapon%%", Weapon.Name);
            end;
			if CanSend then
                TextChatService.TextChannels.RBXGeneral:SendAsync(Message);
            end;
		end;
	end;
});
setthreadidentity(8);
local CachedPlayers = {};
local function UpdateCachedPlayers()
    CachedPlayers = {};
    local all = players:GetPlayers();
    for i = 1, #all do local v = all[i];
        if v ~= localplayer then
            CachedPlayers[#CachedPlayers + 1] = v;
        end;
    end;
end;
UpdateCachedPlayers();
players.PlayerAdded:Connect(function()
    UpdateCachedPlayers();
end);
players.PlayerRemoving:Connect(function()
    UpdateCachedPlayers();
end);

auto:AddToggle("check_whitelist_global", {
    Text = "check whitelist";
    Default = false;
});

local global_wl_dep = auto:AddDependencyBox();

global_wl_dep:SetupDependencies({
    {Toggles.check_whitelist_global, true};
});

global_wl_dep:AddDropdown("global_whitelist_type", {
    Values = {"kill aura", "strafe", "silent aim", "ragebot"};
    Default = {"kill aura"};
    Multi = true;
    Text = "type";
});

global_wl_dep:AddDropdown("global_whitelist_mode", {
    Values = {"team", "whitelist", "clan", "friend"};
    Default = {"team"};
    Multi = true;
    Text = "mode";
});

auto:AddToggle("autostomp", {
    Text = "auto stomp";
    Default = false;
    Callback = function(Value)
        settings.autostompshove = Value;
    end;
});

auto:AddToggle("autoglory", {
    Text = "auto glory";
    Default = false;
    Callback = function(Value)
        settings.autoglory = Value;
    end;
});

auto:AddToggle("BeartrapEnemy", {
    Text = "beartrap enemy";
	Default = false;
	Callback = function(v)
		settings.BeartrapEnemy = v;
	end;
});

auto:AddToggle("AutoAttachC4", {
    Text = "auto attach c4";
	Default = false;
	Callback = function(v)
		settings.AutoAttachC4 = v;
	end;
});

auto:AddToggle("AutoDetonateC4", {
    Text = "auto detonate c4";
	Default = false;
	Callback = function(v)
		settings.AutoDetonateC4 = v;
	end;
});

auto:AddToggle('spam_bio_repair', {
    Text = 'spam bio-repair pen sound';
    Default = false;
	Tooltip = 'spams bio-repair pen sound (use with tool)';
    Callback = function()
        if Toggles.spam_bio_repair.Value then
            workspace.ChildAdded:Connect(function(child)
                if child:IsA("Sound") and child.Name == "jab" then
                    child:Destroy();
                end;
            end);
            task_spawn(LPH_JIT(function()
                local stomp = {Torso = workspace; };
                while Toggles.spam_bio_repair.Value do
                    modules.Name["VFXClient"].runAndReplicateEffect("HealthPen", {stomp, }, "jab");
                    task.wait(0.01);
                end;
            end));
        end;
    end;
});

auto:AddSlider("stomprange", {
    Text = "stomp range";
    Default = 10;
    Min = 1;
    Max = 10;
    Rounding = 0;
    Compact = true;
	Callback = function(Value)
		settings.stompshoverange = Value;
	end;
});

auto:AddSlider("glorydelay", {
    Text = "glory delay";
    Default = 0.5;
    Min = 0.1;
    Max = 1;
    Rounding = 1;
    Compact = true;
	Callback = function(Value)
		settings.glorydelay = Value;
	end;
});

auto:AddSlider("gloryrange", {
    Text = "glory range";
    Default = 10;
    Min = 1;
    Max = 10;
    Rounding = 1;
    Compact = true;
	Callback = function(Value)
		settings.gloryrange = Value;
	end;
});

local server_gb = tabs.misc:AddRightGroupbox("server");

server_gb:AddButton({
    Text = "serverhop to highest";
    Func = function()
        local ok, res = pcall(function()
            return httpservice:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"));
        end);
        if ok and res and res.data then
            for i, v in pairs(res.data) do
                if v.playing < v.maxPlayers and v.id ~= game.JobId then
                    if typeof(queue_on_teleport) == "function" then
                        queue_on_teleport(string.format([[
							script_key="%s";
							loadstring(game:HttpGet("https://raw.githubusercontent.com/nilsolutions/nilsolutions/refs/heads/main/loader.lua"))();
							]], script_key or ""));
                    end;
                    teleportservice:TeleportToPlaceInstance(game.PlaceId, v.id, localplayer, "", "=");
                    break;
                end;
            end;
        end;
    end;
}):AddButton({
    Text = "serverhop to lowest";
    Func = function()
        local ok, res = pcall(function()
            return httpservice:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"));
        end);
        if ok and res and res.data then
            for i, v in pairs(res.data) do
               if v.playing < v.maxPlayers and v.id ~= game.JobId then
                   if typeof(queue_on_teleport) == "function" then
                       queue_on_teleport(string.format([[
						script_key="%s";
						loadstring(game:HttpGet("https://raw.githubusercontent.com/nilsolutions/nilsolutions/refs/heads/main/loader.lua"))();
                       ]], script_key or ""));
                   end;
                   teleportservice:TeleportToPlaceInstance(game.PlaceId, v.id, localplayer, "", "=");
                   break;
               end;
           end;
       end;
    end;
});

server_gb:AddButton({
    Text = "serverhop";
    Func = function()
        local ok, res = pcall(function()
            return httpservice:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"));
        end);
        if ok and res and res.data then
            local target = res.data[math_random(1, #res.data)];
            if target and target.id ~= game.JobId then
                if typeof(queue_on_teleport) == "function" then
                    queue_on_teleport(string.format([[
						script_key="%s";
						loadstring(game:HttpGet("https://raw.githubusercontent.com/nilsolutions/nilsolutions/refs/heads/main/loader.lua"))();
                    ]], script_key or ""));
                end;
                teleportservice:TeleportToPlaceInstance(game.PlaceId, target.id, localplayer, "", "=");
            end;
        end;
    end;
}):AddButton({
    Text = "rejoin";
    Func = function()
        if typeof(queue_on_teleport) == "function" then
            queue_on_teleport(string.format([[
				script_key="%s";
				loadstring(game:HttpGet("https://raw.githubusercontent.com/nilsolutions/nilsolutions/refs/heads/main/loader.lua"))();
            ]], script_key or ""));
        end;
        teleportservice:TeleportToPlaceInstance(game.PlaceId, game.JobId, localplayer, "", "=");
    end;
});

local visuals = tabs.visuals;
local crosshairsection = visuals:AddRightGroupbox("crosshair");

crosshairsection:AddToggle("CrosshairEnabled", {
    Text = "crosshair enabled";
    Default = false;
}):AddColorPicker("CrosshairColor", {
    Default = Color3.new(1, 1, 1);
    Title = "crosshair color";
});

crosshairsection:AddToggle("CrosshairOutline", {
    Text = "outline";
    Default = false;
});

crosshairsection:AddSlider("CrosshairSize", {
    Text = "size";
    Default = 10;
    Min = 1;
    Max = 50;
    Rounding = 0;
    Compact = true;
});

crosshairsection:AddSlider("CrosshairGap", {
    Text = "gap";
    Default = 5;
    Min = 0;
    Max = 20;
    Rounding = 0;
    Compact = true;
});

crosshairsection:AddSlider("CrosshairThickness", {
    Text = "thickness";
    Default = 1;
    Min = 1;
    Max = 5;
    Rounding = 0;
    Compact = true;
});

crosshairsection:AddSlider("CrosshairSmoothing", {
    Text = "smoothing";
    Default = 1;
    Min = 1;
    Max = 20;
    Rounding = 0;
    Compact = true;
});

crosshairsection:AddToggle("CrosshairSpin", {
    Text = "spin crosshair";
    Default = false;
});

crosshairsection:AddSlider("CrosshairSpinSpeed", {
    Text = "spin speed";
    Default = 1;
    Min = 1;
    Max = 20;
    Rounding = 0;
    Compact = true;
});
local on_tool_equipped;
local clean_weapon_chams;
local apply_weapon_chams;
local weaponchamssection = visuals:AddRightGroupbox("weapon chams");

weaponchamssection:AddToggle("WeaponChamsEnabled", {
    Text = "weapon chams enabled";
    Default = false;
    Callback = function(value)
        if not value then
            weapon_chams_active = false;
            last_chams_tool = nil;
            clean_weapon_chams();
        else
            local existing = character and character:FindFirstChildOfClass("Tool");
            if existing then on_tool_equipped(existing); end;
        end;
    end;
}):AddColorPicker("WeaponChamsColor", {
    Default = Color3.new(1, 0, 0);
    Title = "chams color";
    Callback = function()
        if not (Classes.WeaponChamsEnabled and Classes.WeaponChamsEnabled.Value) then return; end;
        local tool = character and character:FindFirstChildOfClass("Tool");
        if tool then
            clean_weapon_chams();
            apply_weapon_chams(tool);
        end;
    end;
});

weaponchamssection:AddToggle("WeaponChamsHighlight", {
    Text = "enable highlight";
    Default = false;
    Callback = function(value)
        if not (Classes.WeaponChamsEnabled and Classes.WeaponChamsEnabled.Value) then return; end;
        local tool = character and character:FindFirstChildOfClass("Tool");
        if tool then
            clean_weapon_chams();
            apply_weapon_chams(tool);
        end;
    end;
}):AddColorPicker("WeaponChamsHighlightColor", {
    Default = Color3.new(1, 0, 0);
    Title = "highlight color";
    Callback = function()
        if not (Classes.WeaponChamsEnabled and Classes.WeaponChamsEnabled.Value) then return; end;
        local tool = character and character:FindFirstChildOfClass("Tool");
        if tool then
            clean_weapon_chams();
            apply_weapon_chams(tool);
        end;
    end;
});

weaponchamssection:AddDropdown("WeaponChamsMaterial", {
    Text = "material";
    Default = "Plastic";
    Values = {"ForceField", "Neon", "Glass", "Plastic"};
    Callback = function()
        if not (Classes.WeaponChamsEnabled and Classes.WeaponChamsEnabled.Value) then return; end;
        local tool = character and character:FindFirstChildOfClass("Tool");
        if tool then
            clean_weapon_chams();
            apply_weapon_chams(tool);
        end;
    end;
});

local lightingsection = visuals:AddRightGroupbox("lightning");
local lightingsection1 = visuals:AddRightGroupbox("fog")
local Lighting = game:GetService("Lighting");
local Map = workspace:FindFirstChild("Map");

local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
if not atmosphere then
    atmosphere = Instance.new("Atmosphere", Lighting)
end
atmosphere.Name = "atmosphere"

local original_atmosphere = {
    Density = Lighting.atmosphere.Density;
    Decay = Lighting.atmosphere.Decay;
    Color = Lighting.atmosphere.Color;
    Offset = Lighting.atmosphere.Offset;
    Glare = Lighting.atmosphere.Glare;
    Haze = Lighting.atmosphere.Haze;
};

local Skyboxes = {
    None = {};
    Nebula = {
        SkyboxBk = "rbxassetid://159454299";
        SkyboxDn = "rbxassetid://159454296";
        SkyboxFt = "rbxassetid://159454293";
        SkyboxLf = "rbxassetid://159454286";
        SkyboxRt = "rbxassetid://159454300";
        SkyboxUp = "rbxassetid://159454288";
    };
    Vaporwave = {
        SkyboxBk = "rbxassetid://1417494030",
        SkyboxDn = "rbxassetid://1417494146",
        SkyboxFt = "rbxassetid://1417494253";
        SkyboxLf = "rbxassetid://1417494402";
        SkyboxRt = "rbxassetid://1417494499";
        SkyboxUp = "rbxassetid://1417494643";
    };
    Clouds = {
        SkyboxBk = "rbxassetid://570557514";
        SkyboxDn = "rbxassetid://570557775";
        SkyboxFt = "rbxassetid://570558157";
        SkyboxLf = "rbxassetid://570551248";
        SkyboxRt = "rbxassetid://570557727";
        SkyboxUp = "rbxassetid://570558036";
    };
    Twilight = {
        SkyboxBk = "rbxassetid://2649648296";
        SkyboxDn = "rbxassetid://2649648296";
        SkyboxFt = "rbxassetid://2649648296";
        SkyboxLf = "rbxassetid://2649648296";
        SkyboxRt = "rbxassetid://2649648296";
        SkyboxUp = "rbxassetid://2649648296";
    };
};

lightingsection:AddToggle("Ambience", {
    Text = "world ambience";
	Default = false;
	Tooltip = "Changes ambience";
}):AddColorPicker("AmbienceColor", {
    Default = Color3.new(1, 1, 1);
	Title = "Ambience Color";
	Transparency = 0;
});

lightingsection:AddToggle("ColorCorrection", {
    Text = "color correction";
	Default = false;
	Tooltip = "Changes Color Correction";
}):AddColorPicker("ColorCorrectionColor", {
    Default = Color3.new(1, 1, 1);
	Title = "Color Correction Color";
	Transparency = 0;
});

local hitdetectionsection = visuals:AddRightGroupbox("hit detection");

hitdetectionsection:AddToggle("HitDetectionEnabled", {
    Text = "enabled";
    Default = false;
}):AddColorPicker("HitEffectColor", {
    Default = Color3.new(1, 1, 1);
    Title = "effect color";
});

hitdetectionsection:AddDropdown("HitDetectionType", {
    Text = "detection type";
	Default = "Ranged";
	Values = {"Both", "Melee", "Ranged"};
	Tooltip = "melee works only for killaura";
});

hitdetectionsection:AddDropdown("HitSound", {
    Text = "hit sound";
    Default = "None";
    Values = {"None", "OSU", "Neverlose", "Bameware", "skeet", "Rust", "Lazer Beam", "Bow Hit", "TF2 Hitsound", "TF2 Critical"};
});

hitdetectionsection:AddDropdown("HitEffects", {
    Multi = true;
    Text = "hit effects";
    Default = {};
	Values = {"Clone (Forcefield)", "Clone (Neon)", "Impact", "Pulse", "Fortnite"};
});

hitdetectionsection:AddToggle("HitLogs", {
    Text = "hitlogs";
    Default = false;
}):AddColorPicker("HvhColor", {
    Default = Color3.fromRGB(150, 0, 255);
    Title = ".hvh color";
});

hitdetectionsection:AddSlider("HitSoundVolume", {
    Text = "hit sound volume";
	Default = 1;
	Min = 0.1;
	Max = 10;
	Rounding = 1;
	Compact = true;
});

lightingsection:AddDropdown("Skybox", {
    Text = "skybox";
	Default = "None";
	Values = {"None", "Nebula", "Vaporwave", "Clouds", "Twilight"};
	Tooltip = "Changes Skybox";
});

lightingsection:AddToggle("ClockTime", {
    Text = "clock time";
	Default = false;
	Tooltip = "Changes Clock Time";
});

lightingsection:AddToggle("MaxZoom", {
    Text = "max zoom";
	Default = false;
	Tooltip = "Changes Max Zoom";
});

lightingsection:AddToggle("FieldOfView", {
    Text = "field of view";
	Default = false;
	Tooltip = "Changes FOV";
});

lightingsection:AddToggle("clip_camera", {
    Text = "noclip cam";
	Default = false;
	Callback = function(Value)
		local sc = (debug and debug.setconstant) or setconstant;
		local gc = (debug and debug.getconstants) or getconstants;
		local getgc = (debug and debug.getgc) or getgc;
		local player_scripts = localplayer.PlayerScripts;
		local popper = player_scripts.PlayerModule and player_scripts.PlayerModule.CameraModule and player_scripts.PlayerModule.CameraModule.ZoomController and player_scripts.PlayerModule.CameraModule.ZoomController.Popper;
		local target_value_noclip = 0;
		local target_val_camoff = 0.25;
		local value_to_set = Value and target_value_noclip or target_val_camoff;
		local modified = false;
		for _, v in pairs(getgc()) do
			if type(v) == "function" and getfenv(v).script == popper then
				for i, v1 in pairs(gc(v)) do
					if tonumber(v1) == target_value_noclip or tonumber(v1) == target_val_camoff then
						if tonumber(v1) ~= value_to_set then
							sc(v, i, value_to_set);
							modified = true;
							break;
						end;
					end;
				end;
			end;
			if modified then break; end;
		end;
	end;
});

lightingsection:AddToggle("Brightness", {
    Text = "brightness";
	Default = false;
});

lightingsection:AddToggle("Environmental", {
    Text = "environmental";
	Default = false;
});

lightingsection:AddToggle("Exposure", {
    Text = "exposure compensation";
	Default = false;
});

lightingsection:AddSlider("Time", {
    Text = "time";
	Default = 12;
	Min = 1;
	Max = 24;
	Rounding = 0;
	Compact = true;
	Tooltip = "The time for Clock Time";
});

lightingsection:AddSlider("FOVLighting", {
    Text = "fov value";
	Default = 70;
	Min = 1;
	Max = 120;
	Rounding = 0;
	Compact = true;
});

lightingsection:AddSlider("BrightnessValue", {
    Text = "brightness";
	Default = 2;
	Min = 1;
	Max = 10;
	Rounding = 0;
	Compact = true;
});

lightingsection:AddSlider("ExposureValue", {
    Text = "exposure";
	Default = 0;
	Min = 0;
	Max = 10;
	Rounding = 1;
	Compact = true;
});

lightingsection:AddSlider("EnvironmentValue", {
    Text = "diffuse % specular";
	Default = 1;
	Min = 0;
	Max = 1;
	Rounding = 1;
	Compact = true;
});

lightingsection:AddSlider("MaxZoomVal", {
    Text = "max zoom value";
	Default = 24;
	Min = 1;
	Max = 1000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
});

lightingsection1:AddToggle("Fog", {
    Text = "fog";
	Default = false;
}):AddColorPicker("FogColor", {
    Default = Color3.new(1, 1, 1);
	Title = "fog Color";
	Transparency = 0;
});

lightingsection1:AddSlider("Density", {
    Text = "density";
	Default = 1;
	Min = 0;
	Max = 1;
	Rounding = 2;
	Compact = true;
	Tooltip = "Fog Density";
});

lightingsection1:AddSlider("Glare", {
    Text = "glare";
	Default = 0;
	Min = 0;
	Max = 10;
	Rounding = 0;
	Compact = true;
	Tooltip = "Fog Glare";
});

lightingsection1:AddSlider("Haze", {
    Text = "haze";
	Default = 0;
	Min = 0;
	Max = 10;
	Rounding = 0;
	Compact = true;
	Tooltip = "Fog Haze";
});

local FOVConnection; FOVConnection = camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
	if not Active then
		FOVConnection:Disconnect();
		return;
	end;
	if Classes.FieldOfView.Value then
        camera.FieldOfView = Classes.FOVLighting.Value;
    end;
end);

local ColorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect");
ColorCorrection.Parent = Lighting;
local OldCorrection = ColorCorrection.TintColor;
local OldAmbience = Lighting.OutdoorAmbient;
local OldAmbience2 = Lighting.Ambient;
local OldDiffuse = Lighting.EnvironmentDiffuseScale;
local OldDiffuse2 = Lighting.EnvironmentSpecularScale;
local OldBrightness = Lighting.Brightness;
local OldExposure = Lighting.ExposureCompensation;
local OldClock = Lighting.ClockTime;
local OldZoom = localplayer.CameraMaxZoomDistance;

if Map then
	Map.ChildAdded:Connect(function(map)
		task.wait(3);
		if map:GetAttribute("MapId") then
			ColorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect");
			ColorCorrection.Parent = Lighting;
			OldCorrection = ColorCorrection.TintColor;
			OldAmbience = Lighting.OutdoorAmbient;
			OldAmbience2 = Lighting.Ambient;
			OldDiffuse = Lighting.EnvironmentDiffuseScale;
			OldDiffuse2 = Lighting.EnvironmentSpecularScale;
			OldBrightness = Lighting.Brightness;
			OldExposure = Lighting.ExposureCompensation;
			OldClock = Lighting.ClockTime;
			OldZoom = localplayer.CameraMaxZoomDistance;
		end;
	end);
end;

OldCorrection = ColorCorrection.TintColor;

local water_parts = nil;
local part_watchers = {};

local function get_water_parts()
    if water_parts then 
        return water_parts;
    end;
    water_parts = {};
    local map_object = workspace:FindFirstChild("Map")
    if not map_object then
        return water_parts;
    end;
    for _, v in ipairs(map_object:GetDescendants()) do
        if v:IsA("BasePart") and v.Name == "WaterArea" then
            table.insert(water_parts, v);
        end;
    end;
    map_object.DescendantAdded:Connect(LPH_JIT(function(v)
        if v:IsA("BasePart") and v.Name == "WaterArea" then
            table.insert(water_parts, v);
            if Toggles.walkonwater.Value then
                v.CanCollide = true;
            end;
        end;
    end));
    return water_parts;
end;

local function set_water_collision(state)
    local wp = get_water_parts();
    for i = 1, #wp do
        local v = wp[i];
        if v and v.Parent then
            v.CanCollide = state;
        end;
    end;
end;

local function stop_water()
    for _, c in part_watchers do 
        c:Disconnect();
    end;
    table.clear(part_watchers);
    set_water_collision(false);
end;

local function start_water()
    stop_water();
    set_water_collision(true);
    local wp = get_water_parts()
    for i = 1, #wp do
        local v = wp[i]
        if v and v.Parent then
            table.insert(part_watchers, v:GetPropertyChangedSignal("CanCollide"):Connect(function()
                if Toggles.walkonwater.Value and not v.CanCollide then
                    v.CanCollide = true;
                end;
            end));
        end;
    end;
end;

Toggles.walkonwater:OnChanged(function()
    if Toggles.walkonwater.Value then
        start_water();
    else
        stop_water();
    end;
end);

if Toggles.walkonwater.Value then 
    start_water();
end;

local ragdolling = false;
framework:BindToRenderStep(LPH_JIT_MAX(function()
    local canragdoll = Toggles.ragdoll.Value;
    if not localplayer.Character then return; end;
    local humanoid = localplayer.Character:FindFirstChild("Humanoid");
    local remote = humanoid and humanoid:FindFirstChild("RagdollRemoteEvent");
    if not remote then return; end;
    local ragdolled = humanoid:GetAttribute("IsRagdolledServer");
    if canragdoll then
        if not ragdolling then
            ragdolling = true;
        end;
        if not ragdolled then
            setfenv(1, getrenv());
            remote:FireServer(true);
            setfenv(1, getfenv());
        end;
    else
        if ragdolling then
            setfenv(1, getrenv());
            remote:FireServer(false);
            setfenv(1, getfenv());
            ragdolling = false;
        end;
    end;
    framework:GetSessionData():getState().fallDamageClient.isDisabled = settings.nfd or settings.loopkillall;
end), nil, Enum.RenderPriority.Last);
local function ensure_atmosphere()
    if not Lighting:FindFirstChild("atmosphere") then
        local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere") or Instance.new("Atmosphere", Lighting);
        atmosphere.Name = "atmosphere";
    end;
end;
local function apply_fog()
    ensure_atmosphere();
    if Classes.Fog.Value then
        Lighting.atmosphere.Density = Classes.Density.Value;
        Lighting.atmosphere.Decay = Classes.FogColor.Value or Color3.new(1, 1, 1);
        Lighting.atmosphere.Color = Classes.FogColor.Value or Color3.new(1, 1, 1);
        Lighting.atmosphere.Offset = 0;
        Lighting.atmosphere.Glare = Classes.Glare.Value;
        Lighting.atmosphere.Haze = Classes.Haze.Value;
    else
        for i, v in pairs(original_atmosphere) do
			Lighting.atmosphere[i] = v;
		end;
    end;
end;
local function apply_skybox()
    local Sky = Lighting:FindFirstChildOfClass("Sky");
    if not Sky then return; end;
    local skyboxval = Classes.Skybox.Value;
    local Skybox = Skyboxes[skyboxval];
    if Skybox then
		for i, v in next, Skybox do
			Sky[i] = v;
		end;
	end;
    _lastskybox = skyboxval;
end;
local fov_conn;
local function bind_fov()
    if fov_conn then fov_conn:Disconnect();
		fov_conn = nil;
	end;
    if not Classes.FieldOfView.Value then
        camera.FieldOfView = 70;
        return;
    end;
    camera.FieldOfView = Classes.FOVLighting.Value;
    fov_conn = camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
        if Classes.FieldOfView.Value and camera.FieldOfView ~= Classes.FOVLighting.Value then
            camera.FieldOfView = Classes.FOVLighting.Value;
        end;
    end);
end;

Classes.FieldOfView:OnChanged(bind_fov);
Classes.FOVLighting:OnChanged(function()
    if Classes.FieldOfView.Value then
        camera.FieldOfView = Classes.FOVLighting.Value;
    end;
end);
Classes.Fog:OnChanged(apply_fog);
Classes.Density:OnChanged(apply_fog);
Classes.FogColor:OnChanged(apply_fog);
Classes.Glare:OnChanged(apply_fog);
Classes.Haze:OnChanged(apply_fog);
Classes.Skybox:OnChanged(apply_skybox);
local function apply_ambience()
    if Classes.Ambience.Value then
        Lighting.OutdoorAmbient = Classes.AmbienceColor.Value or Color3.new(1, 1, 1);
        Lighting.Ambient = Classes.AmbienceColor.Value or Color3.new(1, 1, 1);
    else
        Lighting.OutdoorAmbient = OldAmbience;
        Lighting.Ambient = OldAmbience2;
    end;
end;
Classes.Ambience:OnChanged(apply_ambience);
Classes.AmbienceColor:OnChanged(apply_ambience);
local function apply_zoom()
    localplayer.CameraMaxZoomDistance = Classes.MaxZoom.Value and Classes.MaxZoomVal.Value or OldZoom;
end;
Classes.MaxZoom:OnChanged(apply_zoom);
Classes.MaxZoomVal:OnChanged(apply_zoom);
local function apply_clock()
    Lighting.ClockTime = Classes.ClockTime.Value and Classes.Time.Value or OldClock;
end;
Classes.ClockTime:OnChanged(apply_clock);
Classes.Time:OnChanged(apply_clock);
local function apply_colorcorrection()
    if Classes.ColorCorrection.Value then
        ColorCorrection.Enabled = true;
        ColorCorrection.TintColor = Classes.ColorCorrectionColor.Value or Color3.new(1, 1, 1);
    else
        ColorCorrection.Enabled = false;
        ColorCorrection.TintColor = OldCorrection;
    end;
end;
Classes.ColorCorrection:OnChanged(apply_colorcorrection);
Classes.ColorCorrectionColor:OnChanged(apply_colorcorrection);
local function apply_brightness()
    Lighting.Brightness = Classes.Brightness.Value and Classes.BrightnessValue.Value or OldBrightness;
end;
Classes.Brightness:OnChanged(apply_brightness);
Classes.BrightnessValue:OnChanged(apply_brightness);
local function apply_environmental()
    if Classes.Environmental.Value then
        Lighting.EnvironmentDiffuseScale = Classes.EnvironmentValue.Value;
        Lighting.EnvironmentSpecularScale = Classes.EnvironmentValue.Value;
    else
        Lighting.EnvironmentDiffuseScale = OldDiffuse;
        Lighting.EnvironmentSpecularScale = OldDiffuse2;
    end;
end;
Classes.Environmental:OnChanged(apply_environmental);
Classes.EnvironmentValue:OnChanged(apply_environmental);
local function apply_exposure()
    Lighting.ExposureCompensation = Classes.Exposure.Value and Classes.ExposureValue.Value or OldExposure;
end;
Classes.Exposure:OnChanged(apply_exposure);
Classes.ExposureValue:OnChanged(apply_exposure);
local function esp1()
    local GetService = game.GetService
    local Service = function(Name) 
        return cloneref(GetService(game, Name));
    end;
    local Players = Service("Players")
    local Instance_new = Instance.new
    local Color3_fromRGB = Color3.fromRGB
    local Color3_new = Color3.new
    local Color3_fromHSV = Color3.fromHSV
    local Color3_fromHex = Color3.fromHex
    local table_clear = table.clear
    local table_insert = table.insert
    local table_remove = table.remove
    local table_unpack = table.unpack
    local table_find = table.find
    local table_sort = table.sort
    local table_concat = table.concat
    local string_find = string.find
    local string_match = string.match
    local string_format = string.format
    local string_gsub = string.gsub
    local string_lower = string.lower
    local string_upper = string.upper
    local string_sub = string.sub
    local task_wait = task.wait
    local task_spawn = task_spawn
    local task_delay = task.delay
    local task_defer = task.defer
    local coroutine_wrap = coroutine.wrap
    local coroutine_close = coroutine.close
    local coroutine_create = coroutine.create
    local coroutine_resume = coroutine.resume
    local os_clock = os.clock
    local os_date = os_date
    local Vector2_new = vector2_new
    local Vector3_new = vector3_new
    local Vector3_one = Vector3.one
    local Vector3_zero = Vector3.zero
    local UDim2_new = UDim2.new
    local UDim2_fromScale = UDim2.fromScale
    local UDim2_fromOffset = UDim2.fromOffset
    local UDim_new = UDim.new
    local CFrame_Angles = cframe_angles
    local CFrame_new = cframe_new
    local math_clamp = math.clamp
    local math_round = math.round
    local math_floor = math_floor
    local math_huge = math.huge
    local math_sin = math_sin
    local math_min = math.min
    local math_max = math.max
    local math_random = math_random
    local Drawing_new = drawing_new
    local Rect_new = Rect.new
    local Font_new = Font.new
    local ColorSequence_new = ColorSequence.new
    local ColorSequenceKeypoint_new = ColorSequenceKeypoint.new
    local TweenInfo_new = TweenInfo.new
    local NumberSequence_new = NumberSequence.new
    local NumberSequenceKeypoint_new = NumberSequenceKeypoint.new
    local FindFirstChild = game.FindFirstChild
    local GetChildren = game.GetChildren
    local GetDescendants = game.GetDescendants
    local WaitForChild = game.WaitForChild
    local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
    local IsA = game.IsA
    ESP = {
        Settings = {
        Enabled = false, LocalPlayer = false, Font = "Tahoma", FontSize = 12, FontType = "lowercase", MaxDistance = 1000, BoundingBox = {
        Enabled = false, DynamicBox = false, IncludeAccessories = false, Rotation = 90, Color = {Color3_fromRGB(105, 187, 245), Color3_fromRGB(105, 187, 245)}, Transparency = {0, 0}, Glow = {
        Enabled = false, Rotation = 90, Color = {Color3_fromRGB(105, 187, 245), Color3_fromRGB(105, 187, 245)}, Transparency = {0.75, 0.75}, }, Fill = {
        Enabled = false, Rotation = 90, Color = {Color3_fromRGB(105, 187, 245), Color3_fromRGB(105, 187, 245)}, Transparency = {1, 0.5}, }, }, Bars = {
        HealthBar = {
        Enabled = false, Position = "Left", Color = {Color3_fromRGB(131, 245, 78), Color3_fromRGB(255, 255, 0), Color3_fromRGB(252, 71, 77)}, Type = function(Player, TargetInfo)
                            return TargetInfo.HealthBarValue or 1
                        end, Text = {
                            Enabled = false, FollowBar = true, Ending = "", Position = "Left", Color = Color3_fromRGB(255, 255, 255), Transparency = 0, Type = function(Player, TargetInfo)
                                local health = TargetInfo.LastHealth or 100
                                local maxHealth = TargetInfo.LastMaxHealth or 100
                                return health, health ~= maxHealth
                            end, }, }, ArmorBar = {
                                Enabled = false, Position = "Bottom", Color = {Color3_fromRGB(52, 131, 235), Color3_fromRGB(52, 131, 235), Color3_fromRGB(52, 131, 235)}, Type = function(Player, TargetInfo)
                            return TargetInfo.HealthBarValue or 1
                        end, Text = {
                            Enabled = false, FollowBar = true, Ending = "%", Position = "Left", Color = Color3_fromRGB(255, 255, 255), Transparency = 0, Type = function(Player, TargetInfo)
                                local health = TargetInfo.LastHealth or 100
                                local maxHealth = TargetInfo.LastMaxHealth or 100
                                return health, health ~= maxHealth
                            end, }, }, }, Name = {
                                Enabled = false, UseDisplay = false, Position = "Top", Color = Color3_fromRGB(255, 255, 255), Transparency = 0, }, Distance = {
                                Enabled = false, Ending = "st", Position = "Bottom", Color = Color3_fromRGB(255, 255, 255), Transparency = 0, }, Weapon = {
                                Enabled = false, Position = "Bottom", Color = Color3_fromRGB(255, 255, 255), Transparency = 0, }, Flags = {
                                Enabled = false, Position = "Right", Color = Color3_fromRGB(255, 255, 255), Transparency = 0, Type = function(Player, TargetInfo)
                        local currentTick = os_clock()
                        if currentTick - TargetInfo.FlagsDelay < 0.25 then return TargetInfo.CachedFlagsString or "" end
                        TargetInfo.FlagsDelay = currentTick
                        local Flags = {}
                        if not IsA(Player, "Player") then
                            TargetInfo.CachedFlagsString = ""
                            return ""
                        end
                        local Character = Player.Character
                        local Humanoid = Character and Character:FindFirstChild("Humanoid")
                        if not Humanoid then
                            TargetInfo.CachedFlagsString = ""
                            return ""
                        end
                        if Humanoid.MoveDirection.Magnitude > 0 then table_insert(Flags, "moving") end
                        if Humanoid.Jump then table_insert(Flags, "jumping") end
                        TargetInfo.CachedFlagsString = table_concat(Flags, "\n")
                        return TargetInfo.CachedFlagsString
                    end }, }, Connections = {}, Errors = {}, Objects = {}, Targets = {}, Utilities = {}, Folder = "ESP", Font = nil, Holder = nil, }
    local Client = Players.LocalPlayer
    local Camera = FindFirstChildWhichIsA(Workspace, "Camera")
    local Viewport = Camera.ViewportSize
    local ConnectionsTable = ESP.Connections
    local ObjectsTable = ESP.Objects
    local FolderLocation = ESP.Folder
    local ESPErrors = ESP.Errors
    local esp_settings = ESP.Settings
    local WorldToViewportPoint = Camera.WorldToViewportPoint
    local math_abs = math.abs
    local math_floor = math_floor
    local Utility = {}
    local FontsToDownload = {
        ["Tahoma"] = {Link = "https://github.com/LuckyHub1/LuckyHub/raw/main/zekton_rg.ttf"}, ["Minecraftia"] = {Link = "https://github.com/LuckyHub1/LuckyHub/raw/refs/heads/main/Minecraftia.ttf"}, ["Silkscreen"] = {Link = "https://github.com/LuckyHub1/LuckyHub/raw/refs/heads/main/Silkscreen.ttf"}, }
    do
        if not isfolder(FolderLocation) then
            makefolder(FolderLocation);
        end;
        if not isfolder(FolderLocation .. "\\Fonts") then
            makefolder(FolderLocation .. "\\Fonts");
        end;
    end;
    do
        if not Fonts then
            Fonts = {
                Loaded = {};
            };
        end;
        local function loadfonts()
            for name, table in FontsToDownload do
                if not isfile(FolderLocation .. "\\Fonts\\" .. name .. ".ttf") then
                    local ok, data = pcall(game.HttpGet, game, table.Link);
                    if ok and data then writefile(FolderLocation .. "\\Fonts\\" .. name .. ".ttf", data); end;
                end;
                if not isfile(FolderLocation .. "\\Fonts\\" .. name .. ".font") then
                    local cfg = {
                        name = name, faces = {{
                        name = "Regular", weight = 9e9, style = "normal", assetId = getcustomasset(FolderLocation .. "\\Fonts\\" .. name .. ".ttf") }} };
                    writefile(FolderLocation .. "\\Fonts\\" .. name .. ".font", HttpService:JSONEncode(cfg));
                end;
            end;
            for _, fontpath in listfiles(FolderLocation .. "\\Fonts") do
                local name = string_match(fontpath, FolderLocation .. "\\Fonts\\(.+)%.font");
                if name and not Fonts.Loaded[name] then Fonts.Loaded[name] = Font_new(getcustomasset(fontpath), Enum.FontWeight.Regular); end;
            end;
        end;
        task_spawn(loadfonts);
    end
    do
        function Utility.AddConnection(Signal, Function)
            local Connection = Signal:Connect(function(...)
                local Args = {...}
                local Success, Message = pcall(function() coroutine_wrap(Function)(table_unpack(Args)) end)
                if not Success and not ESPErrors[Message] then
                    local ErrorMessage = string_format("[ERROR] | An error has occured:\n%s", Message)
                    warn(ErrorMessage)
                    ESPErrors[Message] = Message
                    if ConnectionsTable[Connection] then ConnectionsTable[Connection] = nil end
                    return Connection and Connection:Disconnect()
                end
            end)
            if Connection and ConnectionsTable then table_insert(ConnectionsTable, Connection) end
            return Connection
        end
        function Utility.CreateObject(Type, Properties, Hidden)
            local isHidden = Hidden or false
            local Object = Instance_new(Type)
            for Index, Value in Properties do Object[Index] = Value end
            table_insert(ObjectsTable, Object)
            return Object
        end
        function Utility.CalculateBox(Target, RootPart, Parts)
            local MinX, MinY, MaxX, MaxY = 9000, 9000, -9000, -9000
            local BoxWidth, BoxHeight = 0, 0
            local Position, OnScreen = WorldToViewportPoint(Camera, RootPart.Position)
            if esp_settings.BoundingBox.DynamicBox then
                for _, Part in Parts do
                    if Part.ClassName ~= "HumanoidRootPart" and (Part:IsA("BasePart")) then
                        local Size = Part.Size / 2
                        local CFrame = Part.CFrame
                        local Top, TopOnScreen = WorldToViewportPoint(Camera, (CFrame * cframe_new(0, Size.Y, 0)).Position)
                        local Bottom, BottomOnScreen = WorldToViewportPoint(Camera, (CFrame * cframe_new(0, -Size.Y, 0)).Position)
                        if TopOnScreen or BottomOnScreen then
                            local Height = math_abs(Top.Y - Bottom.Y)
                            local Width = Height * (Size.X / Size.Y)
                            local Center = (Top + Bottom) / 2
                            MinX = math_min(MinX, Center.X - Width)
                            MinY = math_min(MinY, Center.Y - Height)
                            MaxX = math_max(MaxX, Center.X + Width)
                            MaxY = math_max(MaxY, Center.Y + Height)
                        end
                    end
                end
                BoxWidth, BoxHeight = MaxX - MinX, MaxY - MinY
            else
                local BaseFOV = 70
                local FOVScale = math.tan(math.rad(BaseFOV / 2)) / math.tan(math.rad(Camera.FieldOfView / 2))
                local Scale = (RootPart.Size.Y * Camera.ViewportSize.Y) / (Position.Z * 2) * FOVScale
                BoxWidth, BoxHeight = 3 * Scale, 4.5 * Scale
                MinX, MinY = Position.X - (BoxWidth / 2), Position.Y - (BoxHeight / 2)
            end
            return BoxWidth, BoxHeight, MinX, MinY, OnScreen
        end
        function Utility.GetFontType(Text)
            local FontType = string_lower(esp_settings.FontType)
            if FontType == "uppercase" then
                return string_upper(Text)
            elseif FontType == "lowercase" then
                return string_lower(Text)
            else
                return Text
            end
        end
    end
    Utility.AddConnection(Camera:GetPropertyChangedSignal("ViewportSize"), function() Viewport = Camera.ViewportSize end)
    do
        ESP.Font = Fonts.Loaded[esp_settings.Font]
        ESP.Holder = Utility.CreateObject("ScreenGui", {
            Name = "\n", ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets, ZIndexBehavior = Enum.ZIndexBehavior.Global, ResetOnSpawn = false, DisplayOrder = 1, IgnoreGuiInset = true, Parent = gethui() })
        function ESP.AddTarget(Target)
            if ESP.Targets[Target] then return end
            local TargetInfo = {
                Objects = {}, CharacterObjects = {}, CharacterConnection = nil, HealthConnection = nil, ToolConnection = {Added = nil, Removed = nil}, CurrentTool = Utility.GetFontType("none"), TargetName = Utility.GetFontType(esp_settings.Name.UseDisplay and (IsA(Target, "Player") and Target.DisplayName or Target.Name) or Target.Name), DistanceEnding = Utility.GetFontType(esp_settings.Distance.Ending), HealthBarValue = 1, LastHealth = 100, LastMaxHealth = 100, FlagsDelay = 0, CachedFlagsString = "", LastTick = os_clock(), LastLazyUpdate = 0, LastDistanceText = "", LastDistanceValue = -1, }
            local Objects = TargetInfo.Objects
            local LastTick = TargetInfo.LastTick
            local ToolConnection = TargetInfo.ToolConnection
            local CharacterObjects = TargetInfo.CharacterObjects
            local ESPFont = ESP.Font
            local ESPFontSize = esp_settings.FontSize
            local ESPHolder = ESP.Holder
            local TextAlignments = {
                ["Left"] = "Right", ["Right"] = "Left", ["Top"] = "Center", ["Bottom"] = "Center", }
            CharacterObjects.Character = IsA(Target, "Player") and Target.Character or Target
            CharacterObjects.Children = CharacterObjects.Character and CharacterObjects.Character:GetChildren() or {}
            CharacterObjects.Descendants = CharacterObjects.Character and CharacterObjects.Character:GetDescendants() or {}
            if IsA(Target, "Player") then
                CharacterObjects.HumanoidRootPart = CharacterObjects.Character and CharacterObjects.Character:FindFirstChild("HumanoidRootPart") or nil
                CharacterObjects.Humanoid = CharacterObjects.Character and CharacterObjects.Character:FindFirstChildWhichIsA("Humanoid") or nil
            end
            do
                function TargetInfo.Init()
                    if #Objects > 0 then return end
                    if IsA(Target, "Player") then
                        TargetInfo.CharacterConnection = Utility.AddConnection(Target.CharacterAdded, function(Character)
                            CharacterObjects.Character = Character
                            CharacterObjects.HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 10)
                            local Humanoid = Character:WaitForChild("Humanoid", 10)
                            CharacterObjects.Humanoid = Humanoid
                            CharacterObjects.Children = Character:GetChildren()
                            CharacterObjects.Descendants = Character:GetDescendants()
                            if TargetInfo.HealthConnection then TargetInfo.HealthConnection:Disconnect() end
                            if Humanoid then
                                TargetInfo.LastHealth = Humanoid.Health
                                TargetInfo.LastMaxHealth = Humanoid.MaxHealth
                                TargetInfo.HealthBarValue = TargetInfo.LastHealth / TargetInfo.LastMaxHealth
                                TargetInfo.HealthConnection = Utility.AddConnection(Humanoid.HealthChanged, function(Health)
                                    TargetInfo.LastHealth = Health
                                    TargetInfo.LastMaxHealth = Humanoid.MaxHealth
                                    TargetInfo.HealthBarValue = TargetInfo.LastHealth / TargetInfo.LastMaxHealth
                                end)
                            end
                            if ToolConnection.Added then ToolConnection.Added:Disconnect() end
                            if ToolConnection.Removed then ToolConnection.Removed:Disconnect() end
                            TargetInfo.CurrentTool = Utility.GetFontType("none")
                            local existingTool = Character:FindFirstChildWhichIsA("Tool")
                            if existingTool then TargetInfo.CurrentTool = Utility.GetFontType(existingTool.Name) end
                            ToolConnection.Added = Utility.AddConnection(Character.ChildAdded, function(Child) if IsA(Child, "Tool") then TargetInfo.CurrentTool = Utility.GetFontType(Child.Name) end end)
                            ToolConnection.Removed = Utility.AddConnection(Character.ChildRemoved, function(Child) if IsA(Child, "Tool") then TargetInfo.CurrentTool = Utility.GetFontType("none") end end)
                        end)
                        if CharacterObjects.Character then
                            local Humanoid = CharacterObjects.Character:FindFirstChildWhichIsA("Humanoid")
                            if Humanoid then
                                TargetInfo.LastHealth = Humanoid.Health
                                TargetInfo.LastMaxHealth = Humanoid.MaxHealth
                                TargetInfo.HealthBarValue = TargetInfo.LastHealth / TargetInfo.LastMaxHealth
                                if TargetInfo.HealthConnection then TargetInfo.HealthConnection:Disconnect() end
                                TargetInfo.HealthConnection = Utility.AddConnection(Humanoid.HealthChanged, function(Health)
                                    TargetInfo.LastHealth = Health
                                    TargetInfo.LastMaxHealth = Humanoid.MaxHealth
                                    TargetInfo.HealthBarValue = TargetInfo.LastHealth / TargetInfo.LastMaxHealth
                                end)
                            end
                            TargetInfo.CurrentTool = Utility.GetFontType("none")
                            local existingTool = CharacterObjects.Character:FindFirstChildWhichIsA("Tool")
                            if existingTool then TargetInfo.CurrentTool = Utility.GetFontType(existingTool.Name) end
                            ToolConnection.Added = Utility.AddConnection(CharacterObjects.Character.ChildAdded, function(Child) if IsA(Child, "Tool") then TargetInfo.CurrentTool = Utility.GetFontType(Child.Name) end end)
                            ToolConnection.Removed = Utility.AddConnection(CharacterObjects.Character.ChildRemoved, function(Child) if IsA(Child, "Tool") then TargetInfo.CurrentTool = Utility.GetFontType("none") end end) end end
                    Objects["TargetHolder"] = Utility.CreateObject("Frame", {Parent = ESPHolder, Visible = true, BackgroundTransparency = 1, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(0, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                    Objects["TopHolder"] = Utility.CreateObject("Frame", {Parent = Objects["TargetHolder"], AutomaticSize = Enum.AutomaticSize.Y, Visible = true, BackgroundTransparency = 1, AnchorPoint = Vector2_new(0, 1), Position = UDim2_new(0, -2, 0, -5), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(1, 4, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                    Objects["BottomHolder"] = Utility.CreateObject("Frame", {Parent = Objects["TargetHolder"], AutomaticSize = Enum.AutomaticSize.Y, Visible = true, BackgroundTransparency = 1, Position = UDim2_new(0, -2, 1, 3), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(1, 4, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                    Objects["LeftHolder"] = Utility.CreateObject("Frame", {Parent = Objects["TargetHolder"], AutomaticSize = Enum.AutomaticSize.X, Visible = true, BackgroundTransparency = 1, AnchorPoint = Vector2_new(1, 0), Position = UDim2_new(0, -4, 0, -2), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(0, 0, 1, 4), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                    Objects["RightHolder"] = Utility.CreateObject("Frame", {Parent = Objects["TargetHolder"], AutomaticSize = Enum.AutomaticSize.X, Visible = true, BackgroundTransparency = 1, Position = UDim2_new(1, 8, 0, -2), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(0, 0, 1, 4), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                    do
                        Objects["TopTextHolder"] = Utility.CreateObject("Frame", {Parent = Objects["TopHolder"], AutomaticSize = Enum.AutomaticSize.Y, Visible = true, BackgroundTransparency = 1, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(1, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["TopTextHolder"], VerticalAlignment = Enum.VerticalAlignment.Bottom, HorizontalAlignment = Enum.HorizontalAlignment.Center, Padding = UDim_new(0, 0), SortOrder = Enum.SortOrder.LayoutOrder})
                        Utility.CreateObject("UIPadding", {Parent = Objects["TopTextHolder"], PaddingBottom = UDim_new(0, 2)})
                        Objects["BottomTextHolder"] = Utility.CreateObject("Frame", {Parent = Objects["BottomHolder"], LayoutOrder = 2, AutomaticSize = Enum.AutomaticSize.Y, Visible = true, BackgroundTransparency = 1, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(1, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["BottomTextHolder"], HorizontalAlignment = Enum.HorizontalAlignment.Center, Padding = UDim_new(0, 0), SortOrder = Enum.SortOrder.LayoutOrder})
                        Utility.CreateObject("UIPadding", {Parent = Objects["BottomTextHolder"], PaddingTop = UDim_new(0, 2)})
                        Objects["LeftTextHolder"] = Utility.CreateObject("Frame", {Parent = Objects["LeftHolder"], AutomaticSize = Enum.AutomaticSize.XY, Visible = true, BackgroundTransparency = 1, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(1, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["LeftTextHolder"], HorizontalAlignment = Enum.HorizontalAlignment.Right, Padding = UDim_new(0, 0), SortOrder = Enum.SortOrder.LayoutOrder})
                        Utility.CreateObject("UIPadding", {Parent = Objects["LeftTextHolder"], PaddingTop = UDim_new(0, -3)})
                        Objects["RightTextHolder"] = Utility.CreateObject("Frame", {Parent = Objects["RightHolder"], LayoutOrder = 2, AutomaticSize = Enum.AutomaticSize.XY, Visible = true, BackgroundTransparency = 1, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(0, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["RightTextHolder"], HorizontalAlignment = Enum.HorizontalAlignment.Left, Padding = UDim_new(0, 0), SortOrder = Enum.SortOrder.LayoutOrder})
                        Utility.CreateObject("UIPadding", {Parent = Objects["RightTextHolder"], PaddingTop = UDim_new(0, -3)})
                    end
                    do
                        Objects["TopBarHolder"] = Utility.CreateObject("Frame", {Visible = false, Parent = Objects["TopHolder"], AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(1, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["TopBarHolder"], HorizontalAlignment = Enum.HorizontalAlignment.Center, Padding = UDim_new(0, 1), VerticalAlignment = Enum.VerticalAlignment.Bottom, SortOrder = Enum.SortOrder.LayoutOrder})
                        Objects["BottomBarHolder"] = Utility.CreateObject("Frame", {Visible = false, Parent = Objects["BottomHolder"], AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(1, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["BottomBarHolder"], HorizontalAlignment = Enum.HorizontalAlignment.Center, Padding = UDim_new(0, 1), VerticalAlignment = Enum.VerticalAlignment.Bottom, SortOrder = Enum.SortOrder.LayoutOrder})
                        Utility.CreateObject("UIPadding", {Parent = Objects["BottomBarHolder"], PaddingTop = UDim_new(0, 2)})
                        Objects["LeftBarHolder"] = Utility.CreateObject("Frame", {Visible = false, Parent = Objects["LeftHolder"], AutomaticSize = Enum.AutomaticSize.X, BackgroundTransparency = 1, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(0, 0, 1, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["LeftBarHolder"], FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Right, Padding = UDim_new(0, 1), SortOrder = Enum.SortOrder.LayoutOrder})
                        Utility.CreateObject("UIPadding", {Parent = Objects["LeftBarHolder"], PaddingRight = UDim_new(0, 1)})
                        Objects["RightBarHolder"] = Utility.CreateObject("Frame", {Visible = false, Parent = Objects["RightHolder"], AutomaticSize = Enum.AutomaticSize.X, BackgroundTransparency = 1, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(0, 0, 1, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["RightBarHolder"], FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Left, Padding = UDim_new(0, 1), SortOrder = Enum.SortOrder.LayoutOrder})
                        Utility.CreateObject("UIPadding", {Parent = Objects["RightBarHolder"], PaddingLeft = UDim_new(0, -3)})
                    end
                    do
                        Utility.CreateObject("UIListLayout", {Parent = Objects["TopHolder"], VerticalAlignment = Enum.VerticalAlignment.Bottom, Padding = UDim_new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["BottomHolder"], Padding = UDim_new(0, 1), SortOrder = Enum.SortOrder.LayoutOrder})
                        Utility.CreateObject("UIPadding", {Parent = Objects["LeftHolder"], PaddingRight = UDim_new(0, 1)})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["LeftHolder"], FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Left, Padding = UDim_new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder})
                        Utility.CreateObject("UIListLayout", {Parent = Objects["RightHolder"], FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Left, Padding = UDim_new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder})
                    end
                    do
                        Objects["BoxGlow"] = Utility.CreateObject("ImageLabel", {Parent = Objects["TargetHolder"], Image = "rbxassetid://110204605000367", ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect_new(Vector2_new(21, 21), Vector2_new(79, 79)), AutomaticSize = Enum.AutomaticSize.XY, ImageTransparency = 0.65, ResampleMode = Enum.ResamplerMode.Pixelated, Visible = true, BackgroundTransparency = 1, Position = UDim2_new(0, -21, 0, -21), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(0, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Objects["BoxGlowGradient"] = Utility.CreateObject("UIGradient", {Parent = Objects["BoxGlow"], Rotation = 90, Color = ColorSequence_new{ColorSequenceKeypoint_new(0, Color3_fromRGB(0, 0, 0)), ColorSequenceKeypoint_new(1, Color3_fromRGB(0, 0, 0))}, Transparency = NumberSequence_new{NumberSequenceKeypoint_new(0, 0), NumberSequenceKeypoint_new(1, 0)}})
                        Utility.CreateObject("UIPadding", {Parent = Objects["BoxGlow"], PaddingTop = UDim_new(0, 21), PaddingBottom = UDim_new(0, 20), PaddingLeft = UDim_new(0, 21), PaddingRight = UDim_new(0, 20)})
                        Objects["BoxOutlineHolder"] = Utility.CreateObject("Frame", {Parent = Objects["BoxGlow"], Visible = false, BackgroundTransparency = 1, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(0, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Objects["BoxOutline"] = Utility.CreateObject("UIStroke", {Parent = Objects["BoxOutlineHolder"], Thickness = 3, LineJoinMode = Enum.LineJoinMode.Miter})
                        Objects["BoxOutlineGradient"] = Utility.CreateObject("UIGradient", {Parent = Objects["BoxOutline"], Rotation = 90, Color = ColorSequence_new{ColorSequenceKeypoint_new(0, Color3_fromRGB(0, 0, 0)), ColorSequenceKeypoint_new(1, Color3_fromRGB(0, 0, 0))}, Transparency = NumberSequence_new{NumberSequenceKeypoint_new(0, 0), NumberSequenceKeypoint_new(1, 0)}})
                        Objects["BoxInlineHolder"] = Utility.CreateObject("Frame", {Parent = Objects["BoxGlow"], Visible = false, BackgroundTransparency = 1, Position = UDim2_new(0, -1, 0, -1), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(0, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Objects["BoxInline"] = Utility.CreateObject("UIStroke", {Parent = Objects["BoxInlineHolder"], Color = Color3_fromRGB(255, 255, 255), LineJoinMode = Enum.LineJoinMode.Miter})
                        Objects["BoxInlineGradient"] = Utility.CreateObject("UIGradient", {Parent = Objects["BoxInline"], Rotation = 90, Color = ColorSequence_new{ColorSequenceKeypoint_new(0, Color3_fromRGB(0, 0, 0)), ColorSequenceKeypoint_new(1, Color3_fromRGB(255, 255, 255))}, Transparency = NumberSequence_new{NumberSequenceKeypoint_new(0, 0), NumberSequenceKeypoint_new(1, 0)}})
                        Objects["BoxFill"] = Utility.CreateObject("Frame", {Parent = Objects["BoxGlow"], Visible = false, BackgroundTransparency = 0, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(0, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                        Objects["BoxFillGradient"] = Utility.CreateObject("UIGradient", {Parent = Objects["BoxFill"], Rotation = 90, Color = ColorSequence_new{ColorSequenceKeypoint_new(0, Color3_fromRGB(0, 0, 0)), ColorSequenceKeypoint_new(1, Color3_fromRGB(255, 255, 255))}, Transparency = NumberSequence_new{NumberSequenceKeypoint_new(0, 1), NumberSequenceKeypoint_new(1, 1)}})
                    end
                    do
                        for BarName, Bar in esp_settings.Bars do
                            Objects[BarName .. "Outline"] = Utility.CreateObject("Frame", {Parent = Objects[Bar.Position .. "BarHolder"], ZIndex = 5, LayoutOrder = 0, Visible = true, BackgroundTransparency = 0, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(1, 0, 0, 1), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(0, 0, 0)})
                            Utility.CreateObject("UIStroke", {Parent = Objects[BarName .. "Outline"], Thickness = 1, LineJoinMode = Enum.LineJoinMode.Miter})
                            Objects[BarName] = Utility.CreateObject("Frame", {Parent = Objects[BarName .. "Outline"], ZIndex = 6, LayoutOrder = 0, Visible = true, BackgroundTransparency = 0, Position = UDim2_new(0, 0, 0, 0), BorderColor3 = Color3_fromRGB(0, 0, 0), Size = UDim2_new(1, 0, 0, 1), BorderSizePixel = 0, BackgroundColor3 = Color3_fromRGB(255, 255, 255)})
                            Objects[BarName .. "Gradient"] = Utility.CreateObject("UIGradient", {Parent = Objects[BarName], Rotation = 90, Color = ColorSequence_new{ColorSequenceKeypoint_new(0, Color3_fromRGB(0, 0, 0)), ColorSequenceKeypoint_new(0, Color3_fromRGB(0, 0, 0)), ColorSequenceKeypoint_new(1, Color3_fromRGB(255, 255, 255))}, Transparency = NumberSequence_new{NumberSequenceKeypoint_new(0, 0), NumberSequenceKeypoint_new(1, 0)}})
                            Objects[BarName .. "Text"] = Utility.CreateObject("TextLabel", {
                                Parent = Objects[Bar.Position .. "TextHolder"], FontFace = ESPFont, TextSize = ESPFontSize, LayoutOrder = 2, TextColor3 = Color3_fromRGB(255, 255, 255), Text = "", AnchorPoint = Vector2_new(0, 1), BorderSizePixel = 0, Visible = true, BackgroundTransparency = 1, ZIndex = 5, AutomaticSize = Enum.AutomaticSize.Y, Size = UDim2_new(1, 0, 0, 0) }); Utility.CreateObject("UIStroke", {Parent = Objects[BarName .. "Text"], Color = Color3_fromRGB(0, 0, 0), LineJoinMode = Enum.LineJoinMode.Miter})
                        end
                    end
                    do
                        Objects["TargetName"] = Utility.CreateObject("TextLabel", {
                            Parent = Objects["TopTextHolder"], FontFace = ESPFont, TextSize = ESPFontSize, LayoutOrder = 2, TextColor3 = Color3_fromRGB(255, 255, 255), Text = "", AnchorPoint = Vector2_new(0, 1), BorderSizePixel = 0, Visible = true, BackgroundTransparency = 1, ZIndex = 5, AutomaticSize = Enum.AutomaticSize.Y, Size = UDim2_new(1, 0, 0, 0) }); Utility.CreateObject("UIStroke", {Parent = Objects["TargetName"], Color = Color3_fromRGB(0, 0, 0), LineJoinMode = Enum.LineJoinMode.Miter})
                        Objects["Distance"] = Utility.CreateObject("TextLabel", {
                            Parent = Objects["BottomTextHolder"], FontFace = ESPFont, TextSize = ESPFontSize, LayoutOrder = 2, TextColor3 = Color3_fromRGB(255, 255, 255), Text = "", AnchorPoint = Vector2_new(0, 1), BorderSizePixel = 0, Visible = true, BackgroundTransparency = 1, ZIndex = 5, AutomaticSize = Enum.AutomaticSize.Y, Size = UDim2_new(1, 0, 0, 0) }); Utility.CreateObject("UIStroke", {Parent = Objects["Distance"], Color = Color3_fromRGB(0, 0, 0), LineJoinMode = Enum.LineJoinMode.Miter})
                        Objects["Flags"] = Utility.CreateObject("TextLabel", {
                            Parent = Objects["RightTextHolder"], FontFace = ESPFont, TextSize = ESPFontSize, LayoutOrder = 2, TextColor3 = Color3_fromRGB(255, 255, 255), Text = "", AnchorPoint = Vector2_new(0, 1), BorderSizePixel = 0, Visible = true, BackgroundTransparency = 1, ZIndex = 5, AutomaticSize = Enum.AutomaticSize.Y, Size = UDim2_new(1, 0, 0, 0) }); Utility.CreateObject("UIStroke", {Parent = Objects["Flags"], Color = Color3_fromRGB(0, 0, 0), LineJoinMode = Enum.LineJoinMode.Miter})
                        Objects["Weapon"] = Utility.CreateObject("TextLabel", {
                            Parent = Objects["BottomTextHolder"], FontFace = ESPFont, TextSize = ESPFontSize, LayoutOrder = 2, TextColor3 = Color3_fromRGB(255, 255, 255), Text = "none", AnchorPoint = Vector2_new(0, 1), BorderSizePixel = 0, Visible = true, BackgroundTransparency = 1, ZIndex = 5, AutomaticSize = Enum.AutomaticSize.Y, Size = UDim2_new(1, 0, 0, 0) }); Utility.CreateObject("UIStroke", {Parent = Objects["Weapon"], Color = Color3_fromRGB(0, 0, 0), LineJoinMode = Enum.LineJoinMode.Miter})
                    end
                    ESP.Targets[Target] = TargetInfo
                end
                local lastonscreen = false;
                local lastboxwidth = 0;
                local lastboxheight = 0;
                local lastboxposx = 0;
                local lastboxposy = 0;
                local lastupdatetick = 0;
                function TargetInfo.Update()
                    if (not esp_settings.LocalPlayer) and Target == Client then
                        if Objects["TargetHolder"].Visible then Objects["TargetHolder"].Visible = false; end;
                        return;
                    end;
                    if not CharacterObjects.Character then
                        if Objects["TargetHolder"].Visible then Objects["TargetHolder"].Visible = false; end;
                        return;
                    end;
                    if IsA(Target, "Player") then
                        if not CharacterObjects.HumanoidRootPart then
                            CharacterObjects.HumanoidRootPart = FindFirstChild(CharacterObjects.Character, "HumanoidRootPart");
                            if Objects["TargetHolder"].Visible then Objects["TargetHolder"].Visible = false; end;
                            return;
                        end;
                        if not CharacterObjects.Humanoid then
                            CharacterObjects.Humanoid = FindFirstChildWhichIsA(CharacterObjects.Character, "Humanoid");
                            if Objects["TargetHolder"].Visible then Objects["TargetHolder"].Visible = false; end;
                            return;
                        end;
                    else
                        if not CharacterObjects.HumanoidRootPart then
                            CharacterObjects.HumanoidRootPart = IsA(Target, "BasePart") and Target or CharacterObjects.Character.PrimaryPart;
                            if not CharacterObjects.HumanoidRootPart then
                                if Objects["TargetHolder"].Visible then Objects["TargetHolder"].Visible = false; end;
                                return;
                            end;
                        end;
                    end;
                    local rootpos = CharacterObjects.HumanoidRootPart.Position;
                    local distance = (Camera.CFrame.Position - rootpos).Magnitude;
                    if distance > esp_settings.MaxDistance then
                        if Objects["TargetHolder"].Visible then Objects["TargetHolder"].Visible = false; end;
                        lastonscreen = false;
                        return;
                    end;
                    local bodyparts = nil;
                    if esp_settings.BoundingBox.DynamicBox then
                        bodyparts = esp_settings.BoundingBox.IncludeAccessories and CharacterObjects.Descendants or CharacterObjects.Children;
                        if IsA(Target, "BasePart") then bodyparts = {Target}; end;
                    end;
                    local boxwidth, boxheight, boxposx, boxposy, onscreen = Utility.CalculateBox(Target, CharacterObjects.HumanoidRootPart, bodyparts);
                    if not onscreen then
                        if Objects["TargetHolder"].Visible then Objects["TargetHolder"].Visible = false; end;
                        lastonscreen = false;
                        return;
                    end;
                    local bw = math_floor(boxwidth);
                    local bh = math_floor(boxheight);
                    local bx = math_floor(boxposx);
                    local by = math_floor(boxposy);
                    local TargetHolder = Objects["TargetHolder"];
                    if not TargetHolder.Visible then TargetHolder.Visible = true; end;
                    if bx ~= lastboxposx or by ~= lastboxposy or bw ~= lastboxwidth or bh ~= lastboxheight then
                        local BoxSize = UDim2_fromOffset(bw, bh);
                        local BoxPosition = UDim2_fromOffset(bx, by);
                        if TargetHolder.Position ~= BoxPosition then TargetHolder.Position = BoxPosition; end;
                        if TargetHolder.Size ~= BoxSize then TargetHolder.Size = BoxSize; end;
                        lastboxwidth = bw; lastboxheight = bh; lastboxposx = bx; lastboxposy = by;
                    end;
                    local BoxWidth, BoxHeight, BoxPositionX, BoxPositionY = boxwidth, boxheight, boxposx, boxposy;
                    local BoxSize = UDim2_fromOffset(bw, bh);
                    local BoxOutline, BoxInline, BoxFill, BoxGlow = Objects["BoxOutline"], Objects["BoxInline"], Objects["BoxFill"], Objects["BoxGlow"]; do
                        local BoxEnabled, BoxColor, BoxTransparency, BoxRotation = esp_settings.BoundingBox.Enabled, esp_settings.BoundingBox.Color, esp_settings.BoundingBox.Transparency, esp_settings.BoundingBox.Rotation;
                        if BoxEnabled then
                            if not BoxOutline.Parent.Visible then BoxOutline.Parent.Visible = true end
                            local CachedBoxSize = UDim2_fromOffset(BoxWidth, BoxHeight)
                            if BoxOutline.Parent.Size ~= CachedBoxSize then BoxOutline.Parent.Size = CachedBoxSize end
                            if not BoxInline.Parent.Visible then BoxInline.Parent.Visible = true end
                            local InlineSize = UDim2_fromOffset(BoxWidth + 2, BoxHeight + 2)
                            if BoxInline.Parent.Size ~= InlineSize then BoxInline.Parent.Size = InlineSize end
                            local BoxInlineGradient, BoxOutlineGradient = Objects["BoxInlineGradient"], Objects["BoxOutlineGradient"]; do
                                if TargetInfo.LastBoxColor1 ~= BoxColor[1] or TargetInfo.LastBoxColor2 ~= BoxColor[2] then
                                    TargetInfo.LastBoxColor1 = BoxColor[1]
                                    TargetInfo.LastBoxColor2 = BoxColor[2]
                                    BoxInlineGradient.Color = ColorSequence_new{ColorSequenceKeypoint_new(0, BoxColor[1]), ColorSequenceKeypoint_new(1, BoxColor[2])}
                                end
                                if TargetInfo.LastBoxTrans1 ~= BoxTransparency[1] or TargetInfo.LastBoxTrans2 ~= BoxTransparency[2] then
                                    TargetInfo.LastBoxTrans1 = BoxTransparency[1]
                                    TargetInfo.LastBoxTrans2 = BoxTransparency[2]
                                    local transSeq = NumberSequence_new{NumberSequenceKeypoint_new(0, BoxTransparency[1]), NumberSequenceKeypoint_new(1, BoxTransparency[2])}
                                    BoxInlineGradient.Transparency = transSeq
                                    BoxOutlineGradient.Transparency = transSeq
                                end
                                if BoxInlineGradient.Rotation ~= BoxRotation then BoxInlineGradient.Rotation = BoxRotation end
                                if BoxOutlineGradient.Rotation ~= BoxRotation then BoxOutlineGradient.Rotation = BoxRotation end
                            end
                            local BoxGlowGradient = Objects["BoxGlowGradient"]; do
                                local BoxGlowEnabled, BoxGlowColor, BoxGlowTransparency, BoxGlowRotation = esp_settings.BoundingBox.Glow.Enabled, esp_settings.BoundingBox.Glow.Color, esp_settings.BoundingBox.Glow.Transparency, esp_settings.BoundingBox.Glow.Rotation
                                if BoxGlowEnabled then
                                    if BoxGlow.ImageTransparency ~= 0 then BoxGlow.ImageTransparency = 0 end
                                    if BoxGlowGradient.Rotation ~= BoxGlowRotation then BoxGlowGradient.Rotation = BoxGlowRotation end
                                    if TargetInfo.LastGlowColor1 ~= BoxGlowColor[1] or TargetInfo.LastGlowColor2 ~= BoxGlowColor[2] then
                                        TargetInfo.LastGlowColor1 = BoxGlowColor[1]
                                        TargetInfo.LastGlowColor2 = BoxGlowColor[2]
                                        BoxGlowGradient.Color = ColorSequence_new{ColorSequenceKeypoint_new(0, BoxGlowColor[1]), ColorSequenceKeypoint_new(1, BoxGlowColor[2])}
                                    end
                                    if TargetInfo.LastGlowTrans1 ~= BoxGlowTransparency[1] or TargetInfo.LastGlowTrans2 ~= BoxGlowTransparency[2] then
                                        TargetInfo.LastGlowTrans1 = BoxGlowTransparency[1]
                                        TargetInfo.LastGlowTrans2 = BoxGlowTransparency[2]
                                        BoxGlowGradient.Transparency = NumberSequence_new{NumberSequenceKeypoint_new(0, BoxGlowTransparency[1]), NumberSequenceKeypoint_new(1, BoxGlowTransparency[2])}
                                    end
                                else
                                    if BoxGlow.ImageTransparency ~= 1 then BoxGlow.ImageTransparency = 1 end
                                end
                            end
                            local BoxFillGradient = Objects["BoxFillGradient"]; do
                                local BoxFillColor, BoxFillTransparency, BoxFillRotation = esp_settings.BoundingBox.Fill.Color, esp_settings.BoundingBox.Fill.Transparency, esp_settings.BoundingBox.Fill.Rotation
                                if BoxFill.Visible ~= esp_settings.BoundingBox.Fill.Enabled then BoxFill.Visible = esp_settings.BoundingBox.Fill.Enabled end
                                if BoxFill.Size ~= CachedBoxSize then BoxFill.Size = CachedBoxSize end
                                if BoxFillGradient.Rotation ~= BoxFillRotation then BoxFillGradient.Rotation = BoxFillRotation end
                                if TargetInfo.LastFillColor1 ~= BoxFillColor[1] or TargetInfo.LastFillColor2 ~= BoxFillColor[2] then
                                    TargetInfo.LastFillColor1 = BoxFillColor[1]
                                    TargetInfo.LastFillColor2 = BoxFillColor[2]
                                    BoxFillGradient.Color = ColorSequence_new{ColorSequenceKeypoint_new(0, BoxFillColor[1]), ColorSequenceKeypoint_new(1, BoxFillColor[2])}
                                end
                                if TargetInfo.LastFillTrans1 ~= BoxFillTransparency[1] or TargetInfo.LastFillTrans2 ~= BoxFillTransparency[2] then
                                    TargetInfo.LastFillTrans1 = BoxFillTransparency[1]
                                    TargetInfo.LastFillTrans2 = BoxFillTransparency[2]
                                    BoxFillGradient.Transparency = NumberSequence_new{NumberSequenceKeypoint_new(0, BoxFillTransparency[1]), NumberSequenceKeypoint_new(1, BoxFillTransparency[2])}
                                end
                            end
                        else
                            if BoxGlow.ImageTransparency ~= 1 then BoxGlow.ImageTransparency = 1 end
                            if BoxOutline.Parent.Visible then BoxOutline.Parent.Visible = false end
                            if BoxInline.Parent.Visible then BoxInline.Parent.Visible = false end
                            if BoxFill.Visible then BoxFill.Visible = false end
                        end
                    end
                    for BarName, BarInfo in esp_settings.Bars do
                        local Bar, BarOutline, BarGradient = Objects[BarName], Objects[BarName .. "Outline"], Objects[BarName .. "Gradient"]; do
                            local BarEnabled, BarColor, BarTransparency = BarInfo.Enabled, BarInfo.Color, BarInfo.Transparency
                            local Position = BarInfo.Position
                            local NewParent = Objects[Position .. "BarHolder"]
                            if BarEnabled and IsA(Target, "Player") then
                                local BarValue = BarInfo.Type(Target, TargetInfo)
                                if not NewParent.Visible then NewParent.Visible = true end
                                local isVertical = (Position == "Left" or Position == "Right")
                                local barSize = isVertical and UDim2_new(0, 1, BarValue, 0) or UDim2_new(BarValue, 0, 0, 1)
                                local outlineSize = isVertical and UDim2_new(0, 1, 1, 0) or UDim2_new(1, 0, 0, 1)
                                local gradRot = isVertical and 90 or -180
                                local gradOff = isVertical and Vector2_new(0, BarValue - 1) or Vector2_new(1 - BarValue, 0)
                                local barAnchor = isVertical and Vector2_new(0, 1) or Vector2_new(0, 0)
                                local barPos = isVertical and UDim2_new(0, 0, 1, 0) or UDim2_new(0, 0, 0, 0)
                                if Bar.AnchorPoint ~= barAnchor then Bar.AnchorPoint = barAnchor end
                                if Bar.Position ~= barPos then Bar.Position = barPos end
                                if Bar.Size ~= barSize then Bar.Size = barSize end
                                if BarOutline.Parent ~= NewParent then BarOutline.Parent = NewParent end
                                if BarOutline.Size ~= outlineSize then BarOutline.Size = outlineSize end
                                if BarGradient.Rotation ~= gradRot then BarGradient.Rotation = gradRot end
                                if BarGradient.Offset ~= gradOff then BarGradient.Offset = gradOff end
                                if TargetInfo[BarName.."LastColor1"] ~= BarColor[1] or TargetInfo[BarName.."LastColor2"] ~= BarColor[2] or TargetInfo[BarName.."LastColor3"] ~= BarColor[3] then
                                    TargetInfo[BarName.."LastColor1"] = BarColor[1]
                                    TargetInfo[BarName.."LastColor2"] = BarColor[2]
                                    TargetInfo[BarName.."LastColor3"] = BarColor[3]
                                    BarGradient.Color = ColorSequence_new{
                                        ColorSequenceKeypoint_new(0, BarColor[1]), ColorSequenceKeypoint_new(0, BarColor[2]), ColorSequenceKeypoint_new(1, BarColor[3]) }
                                end
                            else
                                if NewParent.Visible then NewParent.Visible = false end
                            end
                        end
                        local BarText = Objects[BarName .. "Text"]; do
                            local BarTextEnabled, BarTextColor, BarTextTransparency = BarInfo.Text.Enabled, BarInfo.Text.Color, BarInfo.Text.Transparency
                            local TextPosition = BarInfo.Text.Position
                            if BarTextEnabled and IsA(Target, "Player") then
                                local TextValue, TextVisible = BarInfo.Text.Type(Target, TargetInfo)
                                local newText = tostring(math_floor(TextValue)) .. BarInfo.Text.Ending
                                if BarText.Text ~= newText then BarText.Text = newText end
                                if BarText.TextColor3 ~= BarTextColor then BarText.TextColor3 = BarTextColor end
                                if BarText.TextTransparency ~= BarTextTransparency then BarText.TextTransparency = BarTextTransparency end
                                if BarText.UIStroke.Transparency ~= BarTextTransparency then BarText.UIStroke.Transparency = BarTextTransparency end
                                if BarInfo.Text.FollowBar then
                                    if BarText.Visible ~= TextVisible then BarText.Visible = TextVisible end
                                    if BarText.Parent ~= Bar then BarText.Parent = Bar end
                                    if BarText.ZIndex ~= 10 then BarText.ZIndex = 10 end
                                    local align = (BarInfo.Position == "Left" or BarInfo.Position == "Right") and Enum.TextXAlignment.Center or Enum.TextXAlignment.Right
                                    local anchor = (BarInfo.Position == "Left" or BarInfo.Position == "Right") and Vector2_new(0.5, 0) or Vector2_new(0, 0.5)
                                    if BarText.TextXAlignment ~= align then BarText.TextXAlignment = align end
                                    if BarText.AnchorPoint ~= anchor then BarText.AnchorPoint = anchor end
                                end
                                if not BarInfo.Text.FollowBar then
                                    if not BarText.Visible then BarText.Visible = true end
                                    local newParent = Objects[TextPosition .. "TextHolder"]
                                    if BarText.Parent ~= newParent then BarText.Parent = newParent end
                                    local align = TextAlignments[TextPosition]
                                    if BarText.TextXAlignment ~= align then BarText.TextXAlignment = align end
                                    if BarText.AnchorPoint ~= Vector2_new(0, 0) then BarText.AnchorPoint = Vector2_new(0, 0) end
                                end
                            else
                                if BarText.Visible then BarText.Visible = false end
                            end
                        end
                    end
                    local NameText = Objects["TargetName"]; do
                        local NameEnabled, NameColor, NameTransparency = esp_settings.Name.Enabled, esp_settings.Name.Color, esp_settings.Name.Transparency
                        if NameEnabled then
                            TargetInfo.TargetName = Utility.GetFontType(esp_settings.Name.UseDisplay and (IsA(Target, "Player") and Target.DisplayName or Target.Name) or Target.Name)
                            local newText = TargetInfo.TargetName
                            local newParent = Objects[esp_settings.Name.Position .. "TextHolder"]
                            if not NameText.Visible then NameText.Visible = true end
                            if NameText.Text ~= newText then NameText.Text = newText end
                            if NameText.TextXAlignment ~= TextAlignments[esp_settings.Name.Position] then NameText.TextXAlignment = TextAlignments[esp_settings.Name.Position] end
                            if NameText.Parent ~= newParent then NameText.Parent = newParent end
                            if NameText.TextColor3 ~= NameColor then NameText.TextColor3 = NameColor end
                            if NameText.TextTransparency ~= NameTransparency then NameText.TextTransparency = NameTransparency end
                            if NameText.UIStroke.Transparency ~= NameTransparency then NameText.UIStroke.Transparency = NameTransparency end
                        else
                            if NameText.Visible then NameText.Visible = false end
                        end
                    end
                    local DistanceText = Objects["Distance"]; do
                        local DistanceEnabled, DistanceColor, DistanceTransparency = esp_settings.Distance.Enabled, esp_settings.Distance.Color, esp_settings.Distance.Transparency;
                        if DistanceEnabled then
                            local roundeddistance = math_floor(distance);
                            if TargetInfo.LastDistanceValue ~= roundeddistance then
                                TargetInfo.LastDistanceValue = roundeddistance;
                                TargetInfo.LastDistanceText = tostring(roundeddistance) .. TargetInfo.DistanceEnding;
                            end
                            local newText = TargetInfo.LastDistanceText
                            local newParent = Objects[esp_settings.Distance.Position .. "TextHolder"]
                            if not DistanceText.Visible then DistanceText.Visible = true end
                            if DistanceText.TextXAlignment ~= TextAlignments[esp_settings.Distance.Position] then DistanceText.TextXAlignment = TextAlignments[esp_settings.Distance.Position] end
                            if DistanceText.Parent ~= newParent then DistanceText.Parent = newParent end
                            if DistanceText.TextColor3 ~= DistanceColor then DistanceText.TextColor3 = DistanceColor end
                            if DistanceText.TextTransparency ~= DistanceTransparency then DistanceText.TextTransparency = DistanceTransparency end
                            if DistanceText.UIStroke.Transparency ~= DistanceTransparency then DistanceText.UIStroke.Transparency = DistanceTransparency end
                            if DistanceText.Text ~= newText then DistanceText.Text = newText end
                        else
                            if DistanceText.Visible then DistanceText.Visible = false end
                        end
                    end
                    local WeaponText = Objects["Weapon"]; do
                        local WeaponEnabled, WeaponColor, WeaponTransparency = esp_settings.Weapon.Enabled, esp_settings.Weapon.Color, esp_settings.Weapon.Transparency
                        if IsA(Target, "Player") and WeaponEnabled then
                            local newText = TargetInfo.CurrentTool
                            local newParent = Objects[esp_settings.Weapon.Position .. "TextHolder"]
                            if not WeaponText.Visible then WeaponText.Visible = true end
                            if WeaponText.TextXAlignment ~= TextAlignments[esp_settings.Weapon.Position] then WeaponText.TextXAlignment = TextAlignments[esp_settings.Weapon.Position] end
                            if WeaponText.Parent ~= newParent then WeaponText.Parent = newParent end
                            if WeaponText.TextColor3 ~= WeaponColor then WeaponText.TextColor3 = WeaponColor end
                            if WeaponText.TextTransparency ~= WeaponTransparency then WeaponText.TextTransparency = WeaponTransparency end
                            if WeaponText.UIStroke.Transparency ~= WeaponTransparency then WeaponText.UIStroke.Transparency = WeaponTransparency end
                            if WeaponText.Text ~= newText then WeaponText.Text = newText end
                        else
                            if WeaponText.Visible then WeaponText.Visible = false end
                        end
                    end
                    local FlagsText = Objects["Flags"]; do
                        local FlagsEnabled, FlagsColor, FlagsTransparency = esp_settings.Flags.Enabled, esp_settings.Flags.Color, esp_settings.Flags.Transparency
                        if FlagsEnabled then
                            local newText = esp_settings.Flags.Type(Target, TargetInfo)
                            local newParent = Objects[esp_settings.Flags.Position .. "TextHolder"]
                            if not FlagsText.Visible then FlagsText.Visible = true end
                            if FlagsText.TextXAlignment ~= TextAlignments[esp_settings.Flags.Position] then FlagsText.TextXAlignment = TextAlignments[esp_settings.Flags.Position] end
                            if FlagsText.Parent ~= newParent then FlagsText.Parent = newParent end
                            if FlagsText.TextColor3 ~= FlagsColor then FlagsText.TextColor3 = FlagsColor end
                            if FlagsText.TextTransparency ~= FlagsTransparency then FlagsText.TextTransparency = FlagsTransparency end
                            if FlagsText.UIStroke.Transparency ~= FlagsTransparency then FlagsText.UIStroke.Transparency = FlagsTransparency end
                            if FlagsText.Text ~= newText then FlagsText.Text = newText end
                        else
                            if FlagsText.Visible then FlagsText.Visible = false end
                        end
                    end
                end
                function TargetInfo.Remove()
                    for _, Object in Objects do Object:Destroy() end
                    if TargetInfo.CharacterConnection then
                        TargetInfo.CharacterConnection:Disconnect()
                        TargetInfo.CharacterConnection = nil
                    end
                    if ToolConnection.Added then
                        ToolConnection.Added:Disconnect()
                        ToolConnection.Added = nil
                    end
                    if ToolConnection.Removed then
                        ToolConnection.Removed:Disconnect()
                        ToolConnection.Removed = nil
                    end
                    ESP.Targets[Target] = nil
                end
            end
            TargetInfo.Init()
        end
        function ESP.RemoveTarget(NewTarget) for Target, TargetInfo in ESP.Targets do if Target == NewTarget then TargetInfo.Remove() end end end
        function ESP.AddUtility(Target, UtilityName, OptionName)
            if ESP.Utilities[Target] then return end
            local Info = {
                Objects = {}, Option = OptionName; Name = UtilityName; }
            local Objects = Info.Objects
            local ESPFont = ESP.Font
            local ESPFontSize = esp_settings.FontSize
            local ESPHolder = ESP.Holder
            function Info.Init()
                Objects["TargetHolder"] = Utility.CreateObject("Frame", {Parent = ESPHolder, Visible = false, BackgroundTransparency = 1, Size = UDim2_new(0, 0, 0, 0)})
                Objects["BoxOutline"] = Utility.CreateObject("UIStroke", {Parent = Objects["TargetHolder"], Thickness = 2, LineJoinMode = Enum.LineJoinMode.Miter})
                Objects["TargetName"] = Utility.CreateObject("TextLabel", {
                    Parent = Objects["TargetHolder"], FontFace = ESPFont, TextSize = ESPFontSize, TextColor3 = Color3.new(1,1,1), Text = UtilityName, AnchorPoint = Vector2_new(0.5, 1), Position = UDim2_fromScale(0.5, 0), Visible = true, BackgroundTransparency = 1, ZIndex = 5, AutomaticSize = Enum.AutomaticSize.XY }); 
                Utility.CreateObject("UIStroke", {Parent = Objects["TargetName"], Color = Color3_fromRGB(0, 0, 0)})
                Objects["Distance"] = Utility.CreateObject("TextLabel", {
                    Parent = Objects["TargetHolder"], FontFace = ESPFont, TextSize = ESPFontSize, TextColor3 = Color3.new(1,1,1), Text = "", AnchorPoint = Vector2_new(0.5, 0), Position = UDim2_fromScale(0.5, 1), Visible = true, BackgroundTransparency = 1, ZIndex = 5, AutomaticSize = Enum.AutomaticSize.XY }); 
                Utility.CreateObject("UIStroke", {Parent = Objects["Distance"], Color = Color3_fromRGB(0, 0, 0)})
                ESP.Utilities[Target] = Info
            end
            function Info.Update()
                local toggle = Classes[Info.Option];
                if not toggle or not toggle.Value then 
                    Objects["TargetHolder"].Visible = false;
                    return;
                end;
                local colorOption = Classes[Info.Option .. "Color"];
                local color = colorOption and colorOption.Value or Color3.new(1,1,1);
                local rootpos = Target:IsA("Model") and (Target.PrimaryPart and Target.PrimaryPart.Position or Target:GetPivot().Position) or (Target:IsA("BasePart") and Target.Position or nil)
                if not rootpos or not Target.Parent then
                    Info.Remove();
                    return;
                end;
                local distance = (Camera.CFrame.Position - rootpos).Magnitude;
                if distance > esp_settings.MaxDistance then Objects["TargetHolder"].Visible = false; return; end;
                local pos, onscreen = WorldToViewportPoint(Camera, rootpos);
                if onscreen then
                    local size = (WorldToViewportPoint(Camera, rootpos - vector3_new(0, 2, 0)).Y - WorldToViewportPoint(Camera, rootpos + vector3_new(0, 2, 0)).Y) / 2
                    size = math_abs(size);
                    if size < 5 then size = 5 end;
                    Objects["TargetHolder"].Visible = true;
                    Objects["TargetHolder"].Position = UDim2_fromOffset(pos.X - size/2, pos.Y - size/2);
                    Objects["TargetHolder"].Size = UDim2_fromOffset(size, size);
                    Objects["BoxOutline"].Color = color;
                    Objects["TargetName"].TextColor3 = color;
                    Objects["Distance"].TextColor3 = color;
                    Objects["Distance"].Text = math_floor(distance) .. "st";
                else
                    Objects["TargetHolder"].Visible = false;
                end;
            end
            function Info.Remove()
                for _, obj in pairs(Objects) do pcall(function() obj:Destroy() end) end
                ESP.Utilities[Target] = nil
            end
            Info.Init()
        end
        function ESP.RemoveUtility(Target) if ESP.Utilities[Target] then ESP.Utilities[Target].Remove() end end
        function ESP.Unload()
            for _, Connection in ESP.Connections do Connection:Disconnect() end
            for _, Object in ESP.Objects do Object:Destroy() end
            Fonts = nil
        end
    end
    do
        for _, Player in Players:GetPlayers() do ESP.AddTarget(Player) end
        Utility.AddConnection(Players.PlayerAdded, LPH_JIT(function(Player) ESP.AddTarget(Player) end))
        Utility.AddConnection(Players.PlayerRemoving, LPH_JIT(function(Player) ESP.RemoveTarget(Player) end))
        
        local function check_util(util)
            if util.Name == "PlacedClaymore" then ESP.AddUtility(util, "Claymore", "Claymore")
            elseif util.Name == "utility7Proxy" then ESP.AddUtility(util, "C4", "C4")
            elseif util.Name == "utility5Proxy" then ESP.AddUtility(util, "Grenade", "Grenade")
            elseif util.Name == "OpenBearTrap" then ESP.AddUtility(util, "Bear Trap", "Beartrap") end
        end
        local Map = workspace:FindFirstChild("Map")
        local EffectsJunk = workspace:FindFirstChild("EffectsJunk")
        if Map then
            for i, v in pairs(Map:GetChildren()) do check_util(v) end
            Utility.AddConnection(Map.ChildAdded, check_util)
            Utility.AddConnection(Map.ChildRemoved, function(v)
                ESP.RemoveUtility(v);
            end);
        end;
        if EffectsJunk then
            for i, v in pairs(EffectsJunk:GetChildren()) do
                check_util(v);
            end;
            
            Utility.AddConnection(EffectsJunk.ChildAdded, check_util)

            Utility.AddConnection(EffectsJunk.ChildRemoved, function(v)
                ESP.RemoveUtility(v);
            end);
        end;

        runservice.RenderStepped:Connect(LPH_JIT(function()
            for t, ti in ESP.Targets do
                if ti and ti.Update then
                    ti.Update();
                end;
            end;
            for t, ti in ESP.Utilities do
                if ti and ti.Update then
                    ti.Update();
                end;
            end;
        end));
    end;
end;

esp1();

espsection:AddToggle("esp_box", {
    Text = "bounding box";
    Default = ESP.Settings.BoundingBox.Enabled;
    Callback = function(v)
        ESP.Settings.BoundingBox.Enabled = v;
    end;
}):AddColorPicker("esp_box_color1", {
    Default = ESP.Settings.BoundingBox.Color[1];
    Title = "box color";
    Transparency = ESP.Settings.BoundingBox.Transparency[1];
    Callback = function(Value)
        ESP.Settings.BoundingBox.Color[1] = Value;
    end;
}):AddColorPicker("esp_box_color2", {
    Default = ESP.Settings.BoundingBox.Color[2];
    Title = "box color";
    Transparency = ESP.Settings.BoundingBox.Transparency[2];
    Callback = function(Value)
        ESP.Settings.BoundingBox.Color[2] = Value;
    end;
});

espsection:AddToggle("esp_box_glow", {
    Text = "box glow";
    Default = ESP.Settings.BoundingBox.Glow.Enabled;
    Callback = function(v)
        ESP.Settings.BoundingBox.Glow.Enabled = v;
    end;
}):AddColorPicker("esp_glow_color1", {
    Default = ESP.Settings.BoundingBox.Glow.Color[1];
    Title = "glow color";
    Transparency = ESP.Settings.BoundingBox.Glow.Transparency[1];
    Callback = function(Value)
        ESP.Settings.BoundingBox.Glow.Color[1] = Value;
    end;
}):AddColorPicker("esp_glow_color2", {
    Default = ESP.Settings.BoundingBox.Glow.Color[2];
    Title = "glow color";
    Transparency = ESP.Settings.BoundingBox.Glow.Transparency[2];
    Callback = function(Value)
        ESP.Settings.BoundingBox.Glow.Color[2] = Value;
    end;
});

espsection:AddToggle("esp_box_fill", {
    Text = "box fill";
    Default = ESP.Settings.BoundingBox.Fill.Enabled;
    Callback = function(v)
        ESP.Settings.BoundingBox.Fill.Enabled = v;
    end;
}):AddColorPicker("esp_fill_color1", {
    Default = ESP.Settings.BoundingBox.Fill.Color[1];
    Title = "fill color";
    Transparency = ESP.Settings.BoundingBox.Fill.Transparency[1];
    Callback = function(Value)
        ESP.Settings.BoundingBox.Fill.Color[1] = Value;
    end;
}):AddColorPicker("esp_fill_color2", {
    Default = ESP.Settings.BoundingBox.Fill.Color[2];
    Title = "fill color";
    Transparency = ESP.Settings.BoundingBox.Fill.Transparency[2];
    Callback = function(Value)
        ESP.Settings.BoundingBox.Fill.Color[2] = Value;
    end;
});

espsection:AddToggle("esp_healthbar", {
    Text = "health bar";
    Default = ESP.Settings.Bars.HealthBar.Enabled;
    Callback = function(v)
        ESP.Settings.Bars.HealthBar.Enabled = v;
    end;
}):AddColorPicker("esp_health_color1", {
    Default = ESP.Settings.Bars.HealthBar.Color[1];
    Title = "health high";
    Callback = function(Value)
        ESP.Settings.Bars.HealthBar.Color[1] = Value;
    end;
}):AddColorPicker("esp_health_color2", {
    Default = ESP.Settings.Bars.HealthBar.Color[2];
    Title = "health mid";
    Callback = function(Value)
        ESP.Settings.Bars.HealthBar.Color[2] = Value;
    end;
}):AddColorPicker("esp_health_color3", {
    Default = ESP.Settings.Bars.HealthBar.Color[3];
    Title = "health low";
    Callback = function(Value)
        ESP.Settings.Bars.HealthBar.Color[3] = Value;
    end;
});

espsection:AddToggle("esp_name", {
    Text = "name";
    Default = ESP.Settings.Name.Enabled;
    Callback = function(v)
        ESP.Settings.Name.Enabled = v;
    end;
}):AddColorPicker("esp_name_color", {
    Default = ESP.Settings.Name.Color;
    Title = "name color";
    Transparency = ESP.Settings.Name.Transparency;
    Callback = function(Value)
        ESP.Settings.Name.Color = Value;
    end;
});

espsection:AddToggle("esp_distance", {
    Text = "distance";
    Default = ESP.Settings.Distance.Enabled;
    Callback = function(v)
        ESP.Settings.Distance.Enabled = v;
    end;
}):AddColorPicker("esp_distance_color", {
    Default = ESP.Settings.Distance.Color;
    Title = "distance color";
    Transparency = ESP.Settings.Distance.Transparency;
    Callback = function(Value)
        ESP.Settings.Distance.Color = Value;
    end;
});

espsection:AddToggle("esp_weapon", {
    Text = "weapon";
    Default = ESP.Settings.Weapon.Enabled;
    Callback = function(v)
        ESP.Settings.Weapon.Enabled = v;
    end;
}):AddColorPicker("esp_weapon_color", {
    Default = ESP.Settings.Weapon.Color;
    Title = "weapon color";
    Transparency = ESP.Settings.Weapon.Transparency;
    Callback = function(Value)
        ESP.Settings.Weapon.Color = Value;
    end;
});

espsection:AddToggle("esp_flags", {
    Text = "flags";
    Default = ESP.Settings.Flags.Enabled;
    Callback = function(v)
        ESP.Settings.Flags.Enabled = v;
    end;
}):AddColorPicker("esp_flags_color", {
    Default = ESP.Settings.Flags.Color;
    Title = "flags color";
    Transparency = ESP.Settings.Flags.Transparency;
    Callback = function(Value)
        ESP.Settings.Flags.Color = Value;
    end;
});

espsection:AddDropdown("name_type", {
    Values = {"display name", "name"};
	Default = "display name";
	Multi = false;
	Text = "name type";
	Callback = function(v)
		if Options.name_type.Value == "display name" then
			ESP.Settings.Name.UseDisplay = true;
		else
			ESP.Settings.Name.UseDisplay = false;
		end;
	end;
});

espsection:AddSlider("max_distance", {
    Text = "max distance";
    Default = ESP.Settings.MaxDistance;
	Min = 100;
	Max = 100000;
	Compact = true;
	Rounding = 0;
    Callback = function(v)
        ESP.Settings.MaxDistance = v;
    end;
});

espsection:AddToggle("Tracer", {
    Text = "tracer";
	Default = false;
}):AddColorPicker("TracerColor", {
    Default = Color3.new(1, 1, 1);
	Title = "tracer Color";
	Transparency = 0;
});

espsection:AddSlider("TracerMaxDist", {
    Text = "tracer length";
	Default = 1000;
	Min = 100;
	Max = 5000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
});

espsection:AddDropdown("TracerOrigin", {
    Text = "tracer origin";
	Default = "Bottom";
	Values = {"Bottom", "Cursor"};
});

espsection:AddToggle("TracerAutoSelect", {
    Text = "tracer autoselect";
	Default = false;
});

espsection:AddSlider("TracerAutoSelectDistance", {
    Text = "autoselect distance";
	Default = 1000;
	Min = 100;
	Max = 5000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
});

espsection:AddToggle("OutOfFOV", {
    Text = "enabled";
	Default = false;
});

espsection:AddSlider("OutFOVSize", {
    Text = "size";
	Default = 15;
	Min = 10;
	Max = 15;
	Rounding = 0;
	Compact = true;
});

espsection:AddSlider("OutFOVOffset", {
    Text = "offset";
	Default = 400;
	Min = 100;
	Max = 700;
	Rounding = 0;
	Compact = true;
});

espsection:AddDropdown("OFFSettings", {
    Text = "settings";
	Default = "None";
	Values = {"None", "Outline", "Blinking", "Both"};
});

espsection:AddToggle("UtilityESP", {
    Text = "enabled";
	Default = false;
});
espsection:AddSlider("UtilityESPMaxDistance", {
    Text = "max distance";
	Default = 5000;
	Min = 250;
	Max = 5000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
});

espsection:AddToggle("C4", {
    Text = "c4";
	Default = false;
	Tooltip = "Show C4";
}):AddColorPicker("C4Color", {
    Default = Color3.new(1, 0, 0); 
    Title = "c4 color";
});

espsection:AddToggle("Grenade", {
    Text = "grenade";
	Default = false;
}):AddColorPicker("GrenadeColor", {
    Default = Color3.new(0, 1, 0);
    Title = "grenade color";
});

espsection:AddToggle("Claymore", {
    Text = "claymore";
	Default = false;
}):AddColorPicker("ClaymoreColor", {
    Default = Color3.new(1, 1, 0);
    Title = "claymore color";
});

espsection:AddToggle("Beartrap", {
    Text = "bear trap";
	Default = false;
	Tooltip = "Show Bear Trap";
}):AddColorPicker("BeartrapColor", {
    Default = Color3.new(1, 0.5, 0);
    Title = "bear trap color";
});

local charactersection = tabs.visuals:AddLeftGroupbox("character visuals");
charactersection:AddToggle("RainbowCharacter", {
    Text = "rainbow character";
    Default = false;
});

charactersection:AddToggle("OutlineGlow", {
    Text = "outline glow";
    Default = false;
}):AddColorPicker("OutlineGlowColor", {
    Default = Color3.new(1, 1, 1);
    Title = "glow color";
});

charactersection:AddDropdown("CharacterMaterial", {
    Text = "material";
    Default = "Plastic";
    Values = {"ForceField", "Plastic"};
});

charactersection:AddToggle("CustomMaterialColor", {
    Text = "material color";
    Default = false;
}):AddColorPicker("CharacterMaterialColor", {
    Default = Color3.new(1, 1, 1);
    Title = "material color";
});

charactersection:AddSlider("CharacterTransparency", {
    Text = "transparency";
    Default = 0;
    Min = 0;
    Max = 1;
    Rounding = 1;
    Compact = true;
});

charactersection:AddToggle("RemoveAccessories", {
    Text = "remove accessories";
    Default = false;
});

do
	currently_spoofing = false;
	lastservercframe = nil;
	retrieve_position(LPH_JIT(function(cf, is_spoofing)
		currently_spoofing = is_spoofing;
		lastservercframe = cf;
	end));
	local dv_clone, dvconnection, parts_map, tool_conn_added, tool_conn_removed, dv_char;
	local function get_material()
		local material_name = Options.desyncvisualisermaterial and Options.desyncvisualisermaterial.Value or "ForceField";
		return Enum.Material[material_name] or Enum.Material.ForceField;
	end;
	local function apply_clone_part_settings(part, color, material)
		part.CanCollide = false;
		part.CanTouch = false;
		part.CanQuery = false;
		part.Anchored = true;
		part.Massless = true;
		part.Material = material;
		part.Color = color;
		part.Reflectance = 0;
		part.CastShadow = false;
		if (part.Name == "HumanoidRootPart" or part.Transparency >= 1) then
			part.Transparency = 1;
		else
			part.Transparency = 0;
		end;
		if (part:IsA("MeshPart")) then
			part.TextureID = "";
		end;
	end;
	local function strip_clone_descendants(container)
		local to_destroy = {};
		for _, v in ipairs(container:GetDescendants()) do
			if (v:IsA("BasePart")) then
			elseif (v:IsA("SpecialMesh") or v:IsA("ForceField") or v:IsA("Humanoid") or v:IsA("JointInstance") or v:IsA("Script") or v:IsA("LocalScript") or v:IsA("ModuleScript") or v:IsA("TouchTransmitter") or v:IsA("Decal") or v:IsA("Texture") or v:IsA("SurfaceAppearance") or v:IsA("Clothing") or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("SurfaceLight") or v:IsA("BillboardGui") or v:IsA("SurfaceGui") or v:IsA("SelectionBox") or v:IsA("Accessory") or v:IsA("Highlight") or v:IsA("BodyMover") or v:IsA("Constraint")) then
				table.insert(to_destroy, v);
			end;
		end;
		for _, v in ipairs(to_destroy) do
			if (v.Parent) then
                v:Destroy();
            end;
		end;
	end;
	local function refresh_tool_parts()
		local char = localplayer.Character;
		if (not char or not dv_clone) then return; end;
		local color = (Options.desyncvisualisercolor and Options.desyncvisualisercolor.Value) or Color3.fromRGB(128, 0, 255);
		local selected_material = get_material();
        if parts_map then
		    for original, _ in pairs(parts_map) do
			    if (original.Parent and original.Parent:IsA("Tool")) then
				    parts_map[original] = nil;
			    end;
		    end;
        end
		for _, obj in ipairs(char:GetChildren()) do
			if (obj:IsA("Tool")) then
				local clone_tool = dv_clone:FindFirstChild(obj.Name);
				if (not clone_tool) then
					obj.Archivable = true;
					clone_tool = obj:Clone();
					obj.Archivable = false;
					strip_clone_descendants(clone_tool);
					for _, v in ipairs(clone_tool:GetDescendants()) do
						if (v:IsA("BasePart")) then
							apply_clone_part_settings(v, color, selected_material);
						end;
					end;
					clone_tool.Parent = dv_clone;
				end;
				for _, part in ipairs(obj:GetDescendants()) do
					if (part:IsA("BasePart")) then
						local path = {};
						local current = part;
						local valid = true;
						while current ~= obj do
							if (not current) then
                                valid = false;
                                break;
                            end;
							table.insert(path, 1, current.Name);
							current = current.Parent;
						end;
						if (valid) then
							local clone_part = clone_tool;
							for _, name in ipairs(path) do
								clone_part = clone_part:FindFirstChild(name);
								if (not clone_part) then break; end;
							end;
							if (clone_part and clone_part:IsA("BasePart")) then
								parts_map[part] = clone_part;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
	local function bind_tool_connections()
		if (tool_conn_added) then
            tool_conn_added:Disconnect();
        end;
		if (tool_conn_removed) then
            tool_conn_removed:Disconnect();
        end;
		local char = localplayer.Character;
		if (not char) then return; end;
		tool_conn_added = char.ChildAdded:Connect(function(child)
			if (child:IsA("Tool")) then
				task.wait();
				refresh_tool_parts();
			end;
		end);
		tool_conn_removed = char.ChildRemoved:Connect(function(child)
			if (child:IsA("Tool")) then
				if (dv_clone) then
					local stale_tool = dv_clone:FindFirstChild(child.Name);
					if (stale_tool) then
                        stale_tool:Destroy();
                    end;
				end;
				if parts_map then
					for original, _ in pairs(parts_map) do
						if (not original.Parent or not original.Parent.Parent) then
							parts_map[original] = nil;
						end;
					end;
				end;
			end;
		end);
	end;
	local function create_clone(color)
		if (dv_clone) then dv_clone:Destroy(); dv_clone = nil; end;
		parts_map = {};
		local char = localplayer.Character;
		if (not char or not char:FindFirstChild("HumanoidRootPart")) then
            dv_char = nil;
            return nil;
        end;
        dv_char = char;
        local parts_added = 0;
		local selected_material = get_material();
		char.Archivable = true;
		local clone = char:Clone();
		char.Archivable = false;
		clone.Name = tostring(localplayer.Name);
		strip_clone_descendants(clone);
		for _, v in ipairs(clone:GetDescendants()) do
			if (v:IsA("BasePart")) then
				local original = char:FindFirstChild(v.Name, true);
				if (original and original:IsA("BasePart") and not original.Parent:IsA("Tool")) then
					parts_map[original] = v;
                    parts_added = parts_added + 1;
				end;
				apply_clone_part_settings(v, color, selected_material);
			end;
		end;
		if (parts_added == 0) then
            dv_char = nil;
            clone:Destroy();
            return nil;
        end;
		clone.Parent = char.Parent;
		dv_clone = clone;
		refresh_tool_parts();
		return dv_clone;
	end;
	charactersection:AddToggle("desyncvisualiser", {
		Text = "desync visualizer";
		Default = false;
		Callback = function(enabled)
			if (not enabled) then
				if (dvconnection) then
					dvconnection:Disconnect();
					dvconnection = nil;
				end;
				if (tool_conn_added) then
					tool_conn_added:Disconnect();
					tool_conn_added = nil;
				end;
				if (tool_conn_removed) then
					tool_conn_removed:Disconnect();
					tool_conn_removed = nil;
				end;
				if (dv_clone) then
					dv_clone:Destroy();
					dv_clone = nil;
				end;
				parts_map = nil;
				return;
			end;
			bind_tool_connections();
			dvconnection = runservice.RenderStepped:Connect(LPH_JIT(function(dt)
				local char = localplayer.Character;
				local hrp = char and char:FindFirstChild("HumanoidRootPart");
				if (not hrp or not lastservercframe) then
					if (dv_clone) then
                        dv_clone.Parent = nil;
                    end;
					return;
				end;
				local isdesynced = currently_spoofing;
				if (isdesynced) then
					if (not dv_clone or not dv_clone.Parent or dv_char ~= char) then
						local color = (Options.desyncvisualisercolor and Options.desyncvisualisercolor.Value) or Color3.fromRGB(128, 0, 255);
						create_clone(color);
					end;
					if (dv_clone) then
						dv_clone.Parent = workspace.Terrain;
						local color = (Options.desyncvisualisercolor and Options.desyncvisualisercolor.Value) or Color3.fromRGB(128, 0, 255);
						local hrp_cframe = hrp.CFrame;
						local selected_material = get_material();
						for original, clone_part in pairs(parts_map) do
							if (original.Parent and clone_part.Parent) then
								if (clone_part.Material ~= selected_material) then
									clone_part.Material = selected_material;
								end;
								if (clone_part.Color ~= color) then
									clone_part.Color = color;
								end;
								local offset = hrp_cframe:ToObjectSpace(original.CFrame);
								clone_part.CFrame = lastservercframe * offset;
							else
								parts_map[original] = nil;
							end;
						end;
					end;
				else
					if (dv_clone) then
						dv_clone.Parent = nil;
					end;
				end;
			end));
		end;
	}):AddColorPicker("desyncvisualisercolor", {
		Default = Color3.fromRGB(128, 0, 255);
		Title = "visualiser color";
		Transparency = 0;
	});
	charactersection:AddDropdown("desyncvisualisermaterial", {
        Text = "visualiser material";
        Default = "ForceField";
        Values = {"ForceField", "Neon"};
    });
	localplayer.CharacterAdded:Connect(function(char)
		if (Toggles.desyncvisualiser and Toggles.desyncvisualiser.Value) then
			task.wait(0.5);
			bind_tool_connections();
            dv_char = nil;
		end;
	end);
end;

local nil_global_rainbow_color = Color3.new(1,1,1);
local current_ragebot_target = nil;

local function init_esp()
	local fov_circles = {
        Silent = drawing_new("Circle");
        Aimbot = drawing_new("Circle");
        Visuals = drawing_new("Circle");
        Outline = drawing_new("Circle");
        Fill = drawing_new("Circle");
    };

	local last_fov_circle_position = userinputservice:GetMouseLocation();
	local current_fov_circle_size = 50;
	local fov_cricle_silent = fov_circles.Silent;
	local fov_circle_aimbot = fov_circles.Aimbot;
	local fov_circle_visuals = fov_circles.Visuals;
	local fov_circle_visuals_outline = fov_circles.Outline;
	local fov_circle_visuals_fill = fov_circles.Fill;
	fov_circles.Silent.Visible = false;
	fov_circles.Aimbot.Visible = false;
	fov_circles.Visuals.Visible = false;
	fov_circles.Outline.Visible = false;
	fov_circles.Fill.Visible = false;
	fov_circles.Silent.Transparency = 1;
	fov_circles.Aimbot.Transparency = 1;
	fov_circles.Visuals.Transparency = 1;
	fov_circles.Outline.Transparency = 1;
	fov_circles.Fill.Transparency = 0.5;
	fov_circles.Silent.Color = Color3.new(1, 1, 1);
    local player_drawings = {};
	local player_connections = {};
	local tracer_points = {};

	local esp_settings = {
        Line = {
            Thickness = 1, Color = Color3.fromRGB(0, 255, 0);
        };
        Text = {
            Size = 13, Center = true, Outline = true, Font = Drawing.Fonts.Plex, Color = Color3.fromRGB(255, 255, 255);
        };
        Square = {
            Thickness = 1, Color = Color3.new(1, 1, 1), Filled = false;
        };
        Triangle = {
            Color = Color3.fromRGB(255, 255, 255), Filled = true, Visible = false, Thickness = 1;
        };
        Image = {
            Color = Color3.fromRGB(255, 255, 255), Visible = false;
        }; 
    };

	local aimbot_highlight = Instance.new("Highlight", workspace.Terrain);
	local ragebot_highlight = Instance.new("Highlight", workspace.Terrain);
	local silentaim_highlight = Instance.new("Highlight", workspace.Terrain);
	aimbot_highlight.FillColor = Color3.new(1, 1, 1);
	ragebot_highlight.FillColor = Color3.new(1, 1, 1);
	silentaim_highlight.FillColor = Color3.new(1, 1, 1);
	local aimbot_highlight = Instance.new("Highlight", workspace.Terrain);
	local ragebot_highlight = Instance.new("Highlight", workspace.Terrain);
	local silentaim_highlight = Instance.new("Highlight", workspace.Terrain);
	aimbot_highlight.FillColor = Color3.new(1, 1, 1);
	ragebot_highlight.FillColor = Color3.new(1, 1, 1);
	silentaim_highlight.FillColor = Color3.new(1, 1, 1);

	local utility_colors = {
        C4 = Color3.fromRGB(255, 0, 0);
        Grenade = Color3.fromRGB(0, 255, 0);
        Claymore = Color3.fromRGB(255, 255, 0);
        Beartrap = Color3.fromRGB(255, 128, 0);
    };

	local animations = {};

	do
		local blacklist = {"rbxassetid://106649093705106", "rbxassetid://6423003415", "rbxassetid://101463478179793";};
		local blacklistset = {};
		for i = 1, #blacklist do blacklistset[blacklist[i]] = true; end;
		task_spawn(LPH_JIT(function()
			task.wait(0.5);
			if modules.Name["WeaponMetadata"] then
				for i, v in pairs(modules.Name["WeaponMetadata"]) do
					if v.slashMetadata then
						for _, data in pairs(v.slashMetadata) do
							if data.animation and data.animation.AnimationId and not blacklistset[data.animation.AnimationId] then
								animations[#animations + 1] = data.animation.AnimationId;
							end;
						end;
					end;
				end;
			end;
		end));
	end;

    local swing_image = "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"
	local parry_image = "iVBORw0KGgoAAAANSUhEUgAAAaQAAAGkCAYAAAB+TFE1AAAgAElEQVR4Ae2dB7gsRdW1QXLOGUmSM0iWnAUEQYIEAZEokkSyEgxIEBMGUD8BlaAiiCAiSI4iQZGgSJQcJKgYv/9fXy3OnjtzzpmZ012dqqpXP8997pyZDtVvVVd11d577ckm0yYCIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACItBWAgDmBrAagFUBrAxgRQArAFgOwDIAlgKwJIDFASwGYFEACwNYCMCCAOYHMC+AeQDMBWBOALMDmBXALABmAjAjgOkBTAtgGgBTAZgCwDvayl33LQIiIAIiMIYAgM0AXAfg1wDucH/fDuBWALcAuAnADQB+Zfv8EsA1AK52g9hVAK4EcAWAy91AdhmAS91A9mM3kP3QDWQXu4HsIgAXAvi+G8guAHC+G8i+6way7wD4NoBzAZxgg98UY4qmP0VABERABNpEAMD2AF5Ac9vfAdwJ4KOcNbWJve5VBERABESghwCAHQC82Nx49PaV/z+Af9vMaysAM2s5r6eS9FEEREAE2kAAwAcAvNTwgNR7+VecPeqbbrlwQwAztKEOdI8iIAIiIAKTTTYZgB3dctnLvSNCAJ//nxsofw/gk3SqUEWJgAiIgAi0gACAnQBwVhLi9jdzptiT3nstqA7dogiIgAi0lwCAnQG8GuJoZGXibOk18+LbAMDU7a0t3bkIiIAIJEwAwAcB/CXgAam3aG+5GKevWnzU9AlXi25NBERABNpHAMCuAF7v7fUD//y/AO4FcCSApQFM2b5a0x2LgAiIQIIEAOwG4I3AB6F+xeMgej2AD1MRIsGq0S2JgAiIQLsIANgdwJv9evxIvmNQ7/dcDNMa7ao53a0IiIAIJEYAwB4A/hrJ4DOomFzGe9rFLZ1p2nvTJFZNuh0REAERSJ8AALpU0706le0BtwR5uAnAyr6UfhPWHYqACKRCAMBeAKgnl9L2LxN6pUv77KnUle5DBERABJImAGBvAHSnTm3rLONRUXyDpCtRNycCIiAC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zNX7pogHJM6GngfwK3PKYM6h2VXBIiACIiACkREw6Zu/Rjog3eiysJ5m97CEkt9F1vhUXBEQARHoELCMsBeavSWWMek5AN8CsCOAdzFvU+d+9L8IiIAIiECEBCwQdmsATwQ8EnE57u8WL0R9PQqZUjVhWtmGImx0KrIIiIAI9CNgs6OzAw2EpYfcgwCuAnAEgGW0HNevFvWdCIiACCRAwDTafhfY7IiirpwJMXX6Ohw0E0CtWxABERABERhEgHYXAJ+y5HIhjEm3OUHX4wEwy+oibkBSrNCgytP3IiACIpASAQCLArijoZGIdiGm+uZsiAnu6Ka9ILOspsRY9yICIiACIjABAXNmOLbmwYiD0BsA/gjgMhuEZpigqPpZBERABEQgZQImE3R3jQPSAwAutgR3S8k5IeXWpXsTAREQgRwEAOxUQ9wRcwv9EMBxTkFhXQAz5yiidhUBERABEUidgMv7M4tTur60wtnRvaaLRw+5BeSckHqL0v2JgAiIgCcBANua7lsZYxLzCtEu9CiAsyyf0mwApvIsng4TAREQARFoAwFLvfBtt4xGRWzfjc4JrwO4x5bktpR3XBtaj+5RBERABEokAGAjAA/7jkROtofOCecC+BiAJeWcUGLl6FQiIAIi0BYCZjv6vEcg7F8AUHz1QFN2kJBpWxqN7lMEREAEqiBgKbvzZIR9xNma9gewnAtenUuzoSpqRecUAREQgZYRoI0HwIlOKohOCP02fv+i2YVOB7AYlbQZQNsyVLpdERABERCBKgmYNly/2RE95G5xv58P4P0ApqmyHDq3CIiACIhAywkA2AfAP3umRlyOo5v2vuacICHTlrcR3b4IiIAIVE4AwAwArnE5hd4EcAmA3V2OodWUZbVy9LqACIiACIhALwEAm7jA1d1cyu/5zdNuit7f9VkEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAERKA2Av8HNUDh8/6XipQAAAAASUVORK5CYII="
	
    swing_image = base64.decode(swing_image);
	parry_image = base64.decode(parry_image);

	function New(Type, Outline, Name)
		local drawing = drawing_new(Type)
		for i, v in pairs(esp_settings[Type]) do
            drawing[i] = v;
        end;
		if Outline then
			drawing.Color = Color3.new(0, 0, 0);
			drawing.Thickness = 3;
		end;
		return drawing;
	end;

	local player_connections = {};

	local function Add(Player)
		if not player_drawings[Player] then
            local Character = Player.Character;
			if not player_connections[Player] then
                player_connections[Player] = {};
            end;

			local function check(char)
				if not char or char:GetAttribute("AlreadyFoundParry") then
                    return;
                end;
                
				for i, v in pairs(char:GetChildren()) do
					if v:GetAttribute("ParryShieldId") then
						local thing = v:GetChildren()[1]
						if thing then
							char:SetAttribute("AlreadyFoundParry", true)
							table.insert(player_connections[Player], thing:GetPropertyChangedSignal("Transparency"):Connect(function()
                                if thing.Transparency ~= 1 then
                                    Player:SetAttribute("LastParry", tick());
                                end;
                            end));
						end;
					end;
				end;
			end;

			local function on_new_tool(Tool)
				check(Player.Character)
				if not Tool:IsA("Tool") then return; end;
				local Configuration = modules.Name["WeaponMetadata"] and modules.Name["WeaponMetadata"][Tool:GetAttribute("ItemId")];
				if Configuration then
                    Player:SetAttribute("SwingCooldown", Configuration.cooldown or 1);
                end;
			end;

			table.insert(player_connections[Player], Player.CharacterAdded:Connect(function(Character)
                local PlayerDrawing = player_drawings[Player];
				local Root = Character:WaitForChild("HumanoidRootPart");
				local Hum = Character:WaitForChild("Humanoid");
				if PlayerDrawing then
					PlayerDrawing.RootPart = Root;
					PlayerDrawing.Humanoid = Hum;
                    if not PlayerDrawing.Highlight or not PlayerDrawing.Highlight.Parent then
                        if PlayerDrawing.Highlight then
                            pcall(function()
                                PlayerDrawing.Highlight:Destroy();
                            end);
                        end;
                        PlayerDrawing.Highlight = Instance.new("Highlight");
                        PlayerDrawing.Highlight.Name = "ESP_Highlight";
                        PlayerDrawing.Highlight.FillTransparency = 1;
                        PlayerDrawing.Highlight.OutlineTransparency = 0;
                    end;
                    PlayerDrawing.Highlight.Parent = Character;
				end;
                
				check(Character);
				table.insert(player_connections[Player], Character.ChildAdded:Connect(on_new_tool));
				local animator = Hum:FindFirstChildOfClass("Animator");
				if animator then
					table.insert(player_connections[Player], animator.AnimationPlayed:Connect(function(track)
                        if track.Animation and track.Animation.AnimationId and table.find(animations, track.Animation.AnimationId) then
                            Player:SetAttribute("LastSwing", tick());
                        end;
					end));
				end;
			end));

			local Root = Character and Character:FindFirstChild("HumanoidRootPart");
			local Hum = Root and Character:FindFirstChild("Humanoid");
			if Character then
				for i, v in pairs(Character:GetChildren()) do
                    on_new_tool(v);
                end;
				check(Character);
				table.insert(player_connections[Player], Character.ChildAdded:Connect(on_new_tool))
				if Hum then
					local animator = Hum:FindFirstChildOfClass("Animator")
					if animator then
						table.insert(player_connections[Player], animator.AnimationPlayed:Connect(function(track)
                            if track.Animation and track.Animation.AnimationId and table.find(animations, track.Animation.AnimationId) then
                                Player:SetAttribute("LastSwing", tick());
                            end;
						end));
					end
				end
			end

			player_drawings[Player] = {Offscreen = New("Triangle", nil, "Offscreen"), Name = New("Text", nil, "Name"), Tool = New("Text", nil, "Tool"), Distance = New("Text", nil, "Distance"), BoxOutline = New("Square", true, "BoxOutline"), Box = New("Square", nil, "Box"), HealthOutline = New("Line", true, "HealthOutline"), Health = New("Line", nil, "Health"), Tracer = New("Line", nil, "Tracer"), TracerOutline = New("Line", nil, "TracerOutline"), Swing = LastSwing, Parry = LastParry, Highlight = Instance.new("Highlight"), RootPart = Root, Humanoid = Hum, }
            player_drawings[Player].Highlight.Name = "ESP_Highlight"
            player_drawings[Player].Highlight.Enabled = false
            player_drawings[Player].Highlight.FillTransparency = 1
            player_drawings[Player].Highlight.OutlineTransparency = 0
            if Character then
                player_drawings[Player].Highlight.Parent = Character;
            end;
		end;
	end;

	for Player, _ in pairs(cachedplayers) do
        if Player ~= localplayer then
            Add(Player);
        end;
    end;

	players.PlayerAdded:Connect(Add)
	players.PlayerRemoving:Connect(function(Player)
		if player_drawings[Player] then
			for i, v in pairs(player_drawings[Player]) do
				if v and i ~= "RootPart" and i ~= "Humanoid" then
					if i == "Highlight" then
						v:Destroy();
					else
						v:Remove();
					end;
				end;
			end;
			if player_connections[Player] and next(player_connections[Player]) then
                for i, v in pairs(player_connections[Player]) do
                    v:Disconnect();
                end;
            end;
			player_drawings[Player] = nil;
		end;
	end);

	if Map then
		Map.ChildRemoved:Connect(function(Utility)
			if ESP and ESP.RemoveUtility then
                ESP.RemoveUtility(Utility);
            end;
		end);
	end;

	if EffectsJunk then
		EffectsJunk.ChildRemoved:Connect(function(Utility)
			if ESP and ESP.RemoveUtility then
                ESP.RemoveUtility(Utility);
            end;
		end);
	end;

	local function Rotate(point, center, angle)
		angle = math.rad(angle)
		return vector2_new(math_floor(math_cos(angle) * (point.X - center.X) - math_sin(angle) * (point.Y - center.Y) + center.X), math_floor(math_sin(angle) * (point.X - center.X) + math_cos(angle) * (point.Y - center.Y) + center.Y) )
	end
    
    if nil_player_drawings then
        for _, drawings in pairs(nil_player_drawings) do
            for _, drawing in pairs(drawings) do
                if type(drawing) == "table" and drawing.Remove then
                    pcall(function()
                        drawing:Remove();
                    end);
                end;
            end;
        end;
    end;

    nil_player_drawings = player_drawings
    if util_drawings then
        for _, drawings in pairs(util_drawings) do
            for _, drawing in pairs(drawings) do
                if type(drawing) == "table" and drawing.Remove then
                    pcall(function()
                        drawing:Remove();
                    end);
                end;
            end;
        end;
    end;

    util_drawings = UtilityDrawings;
    if nfov_circle then
        for _, drawing in pairs(nfov_circle) do
            if type(drawing) == "table" and drawing.Remove then
                pcall(function()
                    drawing:Remove();
                end);
            end;
        end;
    end;

    nfov_circle = fov_circles
		local lastrainbowtick = 0;
		local lastespdrawtick = 0;

		runservice.Heartbeat:Connect(LPH_JIT(function()
        local now_tick = tick();
        if now_tick - lastrainbowtick >= 0.1 then
            lastrainbowtick = now_tick;
            nil_global_rainbow_color = Color3.fromHSV(now_tick % 5 / 5, 1, 1);
        end;

        local mouse_position = userinputservice:GetMouseLocation();
        local smooth_amount = math.max(1, Classes.FOVCircleSmoothing.Value);
        if settings.stick and stick_target then
            local sticky_character = stick_target.Character;
            local stick_primarypart = sticky_character and sticky_character:FindFirstChild("HumanoidRootPart");
            if stick_primarypart then
                local screen_position, on_screen = camera:WorldToViewportPoint(stick_primarypart.Position);
                if on_screen then
                    local target_position = vector2_new(screen_position.X, screen_position.Y);
                    last_fov_circle_position = last_fov_circle_position + (target_position - last_fov_circle_position) / smooth_amount;
                else
                    last_fov_circle_position = last_fov_circle_position + (mouse_position - last_fov_circle_position) / smooth_amount;
                end;
            else
                last_fov_circle_position = last_fov_circle_position + (mouse_position - last_fov_circle_position) / smooth_amount;
            end;
        else
            last_fov_circle_position = last_fov_circle_position + (mouse_position - last_fov_circle_position) / smooth_amount;
        end;

        local target_size = Classes.FOVSize.Value;
        current_fov_circle_size = current_fov_circle_size + (target_size - current_fov_circle_size) / smooth_amount;

        if (Classes.ShowFOV and Classes.ShowFOV.Value and Classes.SilentAim.Value) then
            local fov_color = Classes.FOVCircleColor.Value;
            local fill_enabled = Classes.FOVCircleFill.Value;
            local fill_color = Classes.FOVCircleFillColor.Value;
            local fill_transparency = (Options.FOVCircleFillColor and Options.FOVCircleFillColor.Transparency) or 0.5;
            local outline_enabled = Classes.FOVCircleOutline.Value;
            local outline_color = Classes.FOVCircleOutlineColor.Value;

            if outline_enabled then
                fov_circle_visuals_outline.Visible = true;
                fov_circle_visuals_outline.Position = last_fov_circle_position;
                fov_circle_visuals_outline.Radius = current_fov_circle_size + 1;
                fov_circle_visuals_outline.Color = outline_color;
                fov_circle_visuals_outline.Thickness = 0.1;
                fov_circle_visuals_outline.ZIndex = 1;
            else
                fov_circle_visuals_outline.Visible = false;
            end;

            fov_circle_visuals.Visible = true;
            fov_circle_visuals.Position = last_fov_circle_position;
            fov_circle_visuals.Radius = current_fov_circle_size;
            fov_circle_visuals.Color = fov_color;
            fov_circle_visuals.Thickness = 1;
            fov_circle_visuals.ZIndex = 2;

            if fill_enabled then
                fov_circle_visuals_fill.Visible = true;
                fov_circle_visuals_fill.Position = last_fov_circle_position;
                fov_circle_visuals_fill.Radius = current_fov_circle_size;
                fov_circle_visuals_fill.Color = fill_color;
                fov_circle_visuals_fill.Transparency = (1 - fill_transparency);
                fov_circle_visuals_fill.Filled = true;
                fov_circle_visuals_fill.ZIndex = 0;
            else
                fov_circle_visuals_fill.Visible = false;
            end;
        else
            fov_circle_visuals.Visible = false;
            fov_circle_visuals_outline.Visible = false;
            fov_circle_visuals_fill.Visible = false;
        end;

        local closest_to_mousecursor = nil;
        local mouse_position = userinputservice:GetMouseLocation();
        local cursor_scan = last_cursor_scan or 0;

        if now_tick - cursor_scan >= 0.1 then
            last_cursor_scan = now_tick;
            local mouse_position = userinputservice:GetMouseLocation();
            local closest_distance = math.huge;
            for Player, _ in pairs(cachedplayers) do
                if Player == localplayer then continue; end;
                local char = Player.Character;
                local root = char and char:FindFirstChild("HumanoidRootPart");
                if not root then continue; end;
                local Pos, OnScreen = camera:WorldToViewportPoint(root.Position);
                if OnScreen then
                    local screen_dist = (vector2_new(Pos.X, Pos.Y) - mouse_position).Magnitude;
                    if screen_dist < closest_distance then
                        closest_distance = screen_dist;
                        closest_to_mousecursor = Player;
                    end;
                end;
            end;
            _lastcursorplayer = closest_to_mousecursor;
        else
            closest_to_mousecursor = _lastcursorplayer;
        end;

        if now_tick - lastespdrawtick < 0.05 then return; end;
        lastespdrawtick = now_tick;
        local maxdist = ESP.Settings.MaxDistance;
        local tracerenabled = Classes.Tracer.Value;
        local tracermaxdist = Classes.TracerMaxDist.Value;
        local ragetarget = serenium_ragebot_target or locked_target;
        local satarget = serenium_sa_target;
        for player in pairs(cachedplayers) do
            if player == localplayer then continue; end;
            local playerdrawing = player_drawings[player];
            if not playerdrawing then continue; end;
            local rootpart = playerdrawing.RootPart;
            local humanoid = playerdrawing.Humanoid;
            if not player.Character or not rootpart or not humanoid then
                playerdrawing.Offscreen.Visible = false;
                playerdrawing.Name.Visible = false;
                playerdrawing.Tool.Visible = false;
                playerdrawing.Distance.Visible = false;
                playerdrawing.Box.Visible = false;
                playerdrawing.BoxOutline.Visible = false;
                playerdrawing.Health.Visible = false;
                playerdrawing.HealthOutline.Visible = false;
                playerdrawing.Tracer.Visible = false;
                playerdrawing.TracerOutline.Visible = false;
                continue;
            end;

            local isragetarget = (ragetarget == player);
            local issatarget = (satarget == player);
            if playerdrawing.Highlight then
                if (isragetarget and Classes.ShowRageBotTarget.Value) or (issatarget and Classes.ShowTargetSA and Classes.ShowTargetSA.Value) then
                    playerdrawing.Highlight.Enabled = true;
                    playerdrawing.Highlight.Adornee = player.Character;
                    playerdrawing.Highlight.FillColor = Classes.HvhColor.Value or Color3.new(1, 1, 1);
                else
                    playerdrawing.Highlight.Enabled = false;
                end;
            end;

            local campos = camera.CFrame.Position;
            local rootpos = rootpart.Position;
            local distfromchar = (campos - rootpos).Magnitude;
            if distfromchar > maxdist then
                playerdrawing.Offscreen.Visible = false;
                playerdrawing.Name.Visible = false;
                playerdrawing.Tool.Visible = false;
                playerdrawing.Distance.Visible = false;
                playerdrawing.Box.Visible = false;
                playerdrawing.BoxOutline.Visible = false;
                playerdrawing.Health.Visible = false;
                playerdrawing.HealthOutline.Visible = false;
                playerdrawing.Tracer.Visible = false;
                playerdrawing.TracerOutline.Visible = false;
                continue;
            end;

            local pos, onscreen = camera:WorldToViewportPoint(rootpos);
            if not onscreen then
                playerdrawing.Box.Visible = false;
                playerdrawing.BoxOutline.Visible = false;
                playerdrawing.Name.Visible = false;
                playerdrawing.Tool.Visible = false;
                playerdrawing.Distance.Visible = false;
                playerdrawing.Health.Visible = false;
                playerdrawing.HealthOutline.Visible = false;
                playerdrawing.Tracer.Visible = false;
                playerdrawing.TracerOutline.Visible = false;
                if Classes.OutOfFOV.Value then
                    local rootpos2 = rootpos;
                    local camvec = campos;
                    local lookvec = camera.CFrame.LookVector;
                    local dot = lookvec:Dot(rootpos2 - camvec);
                    if dot <= 0 then rootpos2 = camvec + ((rootpos2 - camvec) - ((lookvec * dot) * 1.01)); end;
                    local screenpos, os2 = camera:WorldToScreenPoint(rootpos2);
                    if not os2 then
                        local drawing = playerdrawing.Offscreen;
                        local fov = 800 - Classes.OutFOVOffset.Value;
                        local size = Classes.OutFOVSize.Value;
                        local center = camera.ViewportSize / 2;
                        local direction = (vector2_new(screenpos.X, screenpos.Y) - center).Unit;
                        local radian = math.atan2(direction.X, direction.Y);
                        local clampedpos = center + (direction * math.min(math.abs(((center.Y - fov) / math_sin(radian)) * fov), math.abs((center.X - fov) / (math_cos(radian)) / 2)));
                        local point = vector2_new(math_floor(clampedpos.X - (size / 2)), math_floor((clampedpos.Y - (size / 2) - 15)));
                        local offsettings = Classes.OFFSettings.Value;
                        local rotation = math_floor(-math.deg(radian)) - 47;
                        drawing.PointA = Rotate(point + vector2_new(size, size), point, rotation);
                        drawing.PointB = Rotate(point + vector2_new(-size, -size), point, rotation);
                        drawing.PointC = Rotate(point + vector2_new(-size, size), point, rotation);
                        drawing.Color = esp_settings.Triangle.Color;
                        drawing.Filled = not ((offsettings == "Outline" or offsettings == "Both") or false);
                        drawing.Transparency = ((offsettings == "Blinking" or offsettings == "Both") or false) and (math_sin(tick() * 5) + 1) / 2 or 1;
                        drawing.Visible = true;
                    else
                        playerdrawing.Offscreen.Visible = false;
                    end;
                else
                    playerdrawing.Offscreen.Visible = false;
                end;

            else
                playerdrawing.Offscreen.Visible = false;
                local size = (camera:WorldToViewportPoint(rootpos - vector3_new(0, 3, 0)).Y - camera:WorldToViewportPoint(rootpos + vector3_new(0, 2.6, 0)).Y) / 2;
                local boxsize = vector2_new(math_floor(size * 1.5), math_floor(size * 1.9));
                local boxpos = vector2_new(math_floor(pos.X - size * 1.5 / 2), math_floor(pos.Y - size * 1.6 / 2));
                local namedrawing = playerdrawing.Name;
                local tooldrawing = playerdrawing.Tool;
                local distdrawing = playerdrawing.Distance;
                local box = playerdrawing.Box;
                local boxoutline = playerdrawing.BoxOutline;
                local health = playerdrawing.Health;
                local healthoutline = playerdrawing.HealthOutline;
                namedrawing.ZIndex = 2;
                tooldrawing.ZIndex = 2;
                distdrawing.ZIndex = 2;
                box.ZIndex = 2;
                boxoutline.ZIndex = 1;
                health.ZIndex = 2;
                healthoutline.ZIndex = 1;
                if tracerenabled and not whitelisted(player) then
                    local autoselect = Classes.TracerAutoSelect.Value;
                    local autodist = Classes.TracerAutoSelectDistance.Value;
                    local shoulddraw = false;
                    if autoselect then
                        local drawtarget = nil;
                        if settings.ragebot and (serenium_ragebot_target or locked_target) then
                            drawtarget = serenium_ragebot_target or locked_target;
                        elseif settings.stick and stick_target then
                            drawtarget = stick_target;
                        elseif distfromchar <= autodist then
                            drawtarget = closest_to_mousecursor;
                        end;
                        shoulddraw = (player == drawtarget);
                    else
                        shoulddraw = (distfromchar <= tracermaxdist);
                    end;
                    if shoulddraw then
                        local tracer = playerdrawing.Tracer;
                        local traceroutline = playerdrawing.TracerOutline;
                        if tracer and traceroutline then
                            local origin = Classes.TracerOrigin.Value;
                            local frompos = (origin == "Cursor") and mouse_position or vector2_new(camera.ViewportSize.X / 2, camera.ViewportSize.Y);
                            local topos = vector2_new(pos.X, pos.Y);
                            local tracercolor = Classes.TracerColor.Value or Color3.new(1, 1, 1);
                            if tracer.From ~= frompos then
                                tracer.From = frompos;
                            end;
                            if tracer.To ~= topos then
                                tracer.To = topos;
                            end;
                            if tracer.Color ~= tracercolor then
                                tracer.Color = tracercolor;
                            end;
                            tracer.Thickness = 1;
                            tracer.ZIndex = 1;
                            tracer.Visible = true;
                            if traceroutline.From ~= frompos then
                                traceroutline.From = frompos;
                            end;
                            if traceroutline.To ~= topos then
                                traceroutline.To = topos;
                            end;
                            traceroutline.Color = Color3.new(0, 0, 0);
                            traceroutline.Thickness = 2;
                            traceroutline.ZIndex = 0;
                            traceroutline.Visible = true;
                        end;
                    else
                        playerdrawing.Tracer.Visible = false;
                        playerdrawing.TracerOutline.Visible = false;
                    end;
                else
                    playerdrawing.Tracer.Visible = false;
                    playerdrawing.TracerOutline.Visible = false;
                end;
            end;
        end;
    end));
end;

init_esp()

local function initialize_visuals()
    local weaponchams_data = {
        original_properties = {};
        AppliedParts = {};
        CurrentWeapon = nil;
        WeaponHighlight = nil;
    };

    local character_vis_data = {
        original_properties = {},
        OutlineGlow = nil,
        RainbowConnection = nil;
    };

    clean_weapon_chams = function()
        if weaponchams_data.WeaponHighlight then
            pcall(function()
                weaponchams_data.WeaponHighlight:Destroy();
            end);
            weaponchams_data.WeaponHighlight = nil;
        end;
        for part, props in pairs(weaponchams_data.original_properties) do
            if part and part.Parent then
                pcall(function()
                    part.Material = props.Material;
                    part.Color = props.Color;
                    if props.Transparency then
                        part.Transparency = props.Transparency;
                    end;
                    if props.TextureID and part:IsA("MeshPart") then
                        part.TextureID = props.TextureID;
                    end;
                end);
            end;
        end;
        weaponchams_data.original_properties = {};
        weaponchams_data.AppliedParts = {};
        weaponchams_data.CurrentWeapon = nil;
    end;
    local last_weapon_chams = {
        Material = nil;
        Color = nil;
        Highlight = nil;
        HighlightColor = nil;
    };

    apply_weapon_chams = function(tool)
        if not tool or not tool:IsA("Tool") then return; end;
        if not Classes.WeaponChamsEnabled or not Classes.WeaponChamsEnabled.Value then
            clean_weapon_chams();
            return;
        end;
        local chams_material = Classes.WeaponChamsMaterial and Classes.WeaponChamsMaterial.Value or "Plastic";
        local chams_color = Classes.WeaponChamsColor and Classes.WeaponChamsColor.Value or Color3.new(1, 0, 0);
        local highlight_enabled = Classes.WeaponChamsHighlight and Classes.WeaponChamsHighlight.Value or false;
        local highlight_color = Classes.WeaponChamsHighlightColor and Classes.WeaponChamsHighlightColor.Value or Color3.new(1, 0, 0);
        local settings_changed = (last_weapon_chams.Material ~= chams_material) or (last_weapon_chams.Color ~= chams_color) or (last_weapon_chams.Highlight ~= highlight_enabled) or (last_weapon_chams.HighlightColor ~= highlight_color);

        if weaponchams_data.CurrentWeapon ~= tool or settings_changed then
            clean_weapon_chams();
            weaponchams_data.CurrentWeapon = tool;
            last_weapon_chams.Material = chams_material;
            last_weapon_chams.Color = chams_color
            last_weapon_chams.Highlight = highlight_enabled;
            last_weapon_chams.HighlightColor = highlight_color;
        else
            return;
        end;

        for _, part in pairs(tool:GetDescendants()) do
            if part:IsA("BasePart") then
                if not weaponchams_data.original_properties[part] then
                    weaponchams_data.original_properties[part] = {
                        Material = part.Material, Color = part.Color, Transparency = part.Transparency;
                    };
                end;
                pcall(function()
                    if Enum.Material[chams_material] then
                        part.Material = Enum.Material[chams_material];
                    else
                        part.Material = Enum.Material.Plastic;
                    end;
                    part.Color = chams_color;
                    if part:IsA("MeshPart") and part.TextureID ~= "" then
                        if not weaponchams_data.original_properties[part].TextureID then
                            weaponchams_data.original_properties[part].TextureID = part.TextureID;
                        end;
                        part.TextureID = "";
                    end;
                end);
                weaponchams_data.AppliedParts[part] = true;
            end;
        end;

        if Classes.WeaponChamsHighlight and Classes.WeaponChamsHighlight.Value then
            if not weaponchams_data.WeaponHighlight or not weaponchams_data.WeaponHighlight.Parent then
                weaponchams_data.WeaponHighlight = Instance.new("Highlight");
                weaponchams_data.WeaponHighlight.Name = "highlight";
                weaponchams_data.WeaponHighlight.FillTransparency = 0.5;
                weaponchams_data.WeaponHighlight.OutlineTransparency = 0;
                weaponchams_data.WeaponHighlight.Adornee = tool;
                weaponchams_data.WeaponHighlight.Parent = tool;
            end;
            local highlight_color = Classes.WeaponChamsHighlightColor and Classes.WeaponChamsHighlightColor.Value or Color3.new(1, 0, 0);
            weaponchams_data.WeaponHighlight.FillColor = highlight_color;
            weaponchams_data.WeaponHighlight.OutlineColor = highlight_color;
        else
            if weaponchams_data.WeaponHighlight then
                pcall(function()
                    weaponchams_data.WeaponHighlight:Destroy();
                end);
                weaponchams_data.WeaponHighlight = nil;
            end;
        end;
    end;

    local function clean_character_vis()
        if character_vis_data.OutlineGlow then
            pcall(function() 
                character_vis_data.OutlineGlow:Destroy();
            end);
            character_vis_data.OutlineGlow = nil;
        end;

        if character_vis_data.RainbowConnection then
            character_vis_data.RainbowConnection:Disconnect();
            character_vis_data.RainbowConnection = nil;
        end;

        for part, props in pairs(character_vis_data.original_properties) do
            if part and part.Parent then
                pcall(function()
                    part.Material = props.Material;
                    part.Color = props.Color;
                    part.Transparency = props.Transparency;
                end);
            end;
        end;
        character_vis_data.original_properties = {};
    end;

	local weapon_chams_active = false;
	local last_chams_tool = nil;

	on_tool_equipped = function(child)
		if not child:IsA("Tool") then return; end;
		if not (Classes.WeaponChamsEnabled and Classes.WeaponChamsEnabled.Value) then return; end;
		last_chams_tool = child;
		weapon_chams_active = true;
		apply_weapon_chams(child);
	end;

	local function on_tool_unequipped(child)
		if not child:IsA("Tool") then return; end;
		if last_chams_tool == child then
			last_chams_tool = nil;
			clean_weapon_chams();
		end;
	end;

	local chams_char_conn = {};
	local function bind_weapon_chams(char)
		for _, c in chams_char_conn do c:Disconnect(); end;
		table.clear(chams_char_conn);
		if not char then return; end;
		table.insert(chams_char_conn, char.ChildAdded:Connect(on_tool_equipped));
		table.insert(chams_char_conn, char.ChildRemoved:Connect(on_tool_unequipped));
		local existing = char:FindFirstChildOfClass("Tool");
		if existing then
			on_tool_equipped(existing);
		end;
	end;

	localplayer.CharacterAdded:Connect(function(new_character)
		clean_weapon_chams();
		clean_character_vis();
		character = new_character;
		humanoidrootpart = new_character:WaitForChild("HumanoidRootPart");
		humanoid = new_character:WaitForChild("Humanoid");
		bind_weapon_chams(new_character);
	end);

	if character then
		bind_weapon_chams(character);
	end;
end;

initialize_visuals();

gunmods:AddToggle("NoSpread", {
    Text = "no spread";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("minSpread", 0);
			modifyranged("maxSpread", 0);
		else
			revertranged("minSpread");
			revertranged("maxSpread");
		end;
	end;
});

gunmods:AddToggle("NoRecoil", {
    Text = "no recoil";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("recoilAmount", 0);
		else
			revertranged("recoilAmount");
		end;
	end;
});

gunmods:AddToggle("NoGravity", {
    Text = "no gravity";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("gravity", vector3_new(0, 0, 0));
		else
			revertranged("gravity");
		end;
	end;
});

gunmods:AddToggle("NoReloadCancel", {
    Text = "no reload cancel";
	Default = false;
	Callback = function(v)
		settings.nocancel = v;
	end;
});

gunmods:AddToggle("NoReloadSlow", {
    Text = "no reload slowdown";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("reloadWalkSpeedMultiplier", 1);
		else
			revertranged("reloadWalkSpeedMultiplier");
		end;
	end;
});

gunmods:AddToggle("InstantCharge", {
    Text = "instant charge";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("chargeOnDuration", 0.01);
			modifyranged("chargeOffDuration", 0.01);
		else
			revertranged("chargeOnDuration");
			revertranged("chargeOffDuration");
		end;
	end;
});

gunmods:AddToggle("InfiniteRange", {
    Text = "infinite range";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("max_distance", 10000);
		else
			revertranged("max_distance");
		end;
	end;
});

gunmods:AddToggle("Wallbang", {
    Text = "wallbang";
	Default = false;
	Callback = function(v)
		Config.Wallbang = v;
		Wallbang = v;
	end;
});

gunmods:AddToggle("always_head", {
    Text = "always head";
	Default = false;
	Callback = function(v)
		settings.always_head = v;
	end;
});

local Camera = workspace.CurrentCamera;
local KalmanFilter = {};
KalmanFilter.__index = KalmanFilter;

function KalmanFilter.new()
    return setmetatable({
        x = Vector3.zero;
        v = Vector3.zero;
        a = Vector3.zero;
        p = 1, r = 0.01;
        q = 0.001;
    }, KalmanFilter);
end;

function KalmanFilter:update(measured_pos, measured_vel, dt)
	local predicted_x = self.x + self.v * dt + 0.5 * self.a * dt * dt;
	local predicted_v = self.v + self.a * dt;
	local p_pred = self.p + self.q;
	local k = p_pred / (p_pred + self.r);
	self.x = predicted_x + k * (measured_pos - predicted_x);
	self.v = predicted_v + k * (measured_vel - predicted_v);
	self.p = (1 - k) * p_pred;
	return self.x, self.v;
end;

function PredictTargetPosition(origin, destination, weapon_speed, ping, gravity)
	local filter = destination.KalmanFilter or KalmanFilter.new();
	destination.KalmanFilter = filter;
	local measured_pos = destination.Position;
	local measured_vel = destination.Velocity or Vector3.zero;
	local dt = runservice.Heartbeat:Wait();
	local estimated_pos, estimated_vel = filter:update(measured_pos, measured_vel, dt);
	local network_delay = ping / 1000;
	local future_pos = estimated_pos + estimated_vel * network_delay;
	local travel_time = (future_pos - origin).magnitude / weapon_speed;
	if measured_vel.Y <= -15 or measured_vel.Y >= 15 then
        measured_vel = vector3_new(measured_vel.X, measured_vel.Y * travel_time, measured_vel.Z);
    end;
	future_pos = future_pos + estimated_vel * travel_time;
	future_pos = future_pos + vector3_new(0, -0.5 * gravity * travel_time ^ 2, 0);
	return future_pos;
end;

local hit_detection = {
    ConnectedCasters = {};
    ProcessedCasts = {};
    last_clone_time = {};
};

function hit_detection:ConnectToCaster(caster)
    if not caster or self.ConnectedCasters[caster] then return; end;
    self.ConnectedCasters[caster] = true;
    caster.RayHit:Connect(function(cast, result)
        if not Classes.HitDetectionEnabled.Value then return; end;
        if self.ProcessedCasts[cast] then return; end;
        if not cast.UserData then return; end;
        if cast.UserData.player and cast.UserData.player ~= localplayer then return; end;
        local struckPart = result.Instance;
        local character = struckPart and struckPart.Parent;
        if character and character:FindFirstChildOfClass("Humanoid") then
            local player = game.Players:GetPlayerFromCharacter(character)
            if player and player ~= localplayer then
                self.ProcessedCasts[cast] = true;
                task.delay(5, function()
                    self.ProcessedCasts[cast] = nil;
                end);
                local damage = 0;
                local tool = cast.UserData.tool;
                if tool then
                    local keys = {tool.Name};
                    if tool:GetAttribute("ItemId") then
                        table.insert(keys, tool:GetAttribute("ItemId"));
                    end;
                    local damage_config = nil;
                    for _, k in ipairs(keys) do
                        damage_config = framework:getmetadata(k) or framework:getutility(k);
                        if not damage_config and modules.Name["WeaponMetadata"] then
                            damage_config = modules.Name["WeaponMetadata"][k];
                        end;
                        if damage_config then break; end;
                    end;
                    if damage_config then
                        damage = damage_config.damage or damage_config.base_damage or damage_config.base_damage or damage_config.maxDamage or (damage_config.Stats and (damage_config.Stats.damage or damage_config.Stats.base_damage)) or 0
                        if struckPart and struckPart.Name == "Head" then
                            local headshot_multiplier = damage_config.headshotMultiplier or 1.75;
                            damage = damage * headshot_multiplier;
                        end
                    else
                        damage = tool:GetAttribute("Damage") or tool:GetAttribute("BaseDamage")
                        local multiplier = tool:GetAttribute("HeadshotMultiplier") or 1.5
                        if not damage or damage == 0 then
                            local config = tool:FindFirstChild("Configuration") or tool:FindFirstChild("Settings")
                            if config then
                                local dam_value = config:FindFirstChild("Damage") or config:FindFirstChild("BaseDamage") or config:FindFirstChild("MaxDamage")
                                if dam_value and dam_value:IsA("ValueBase") then damage = dam_value.Value end
                                local multiplier_value = config:FindFirstChild("HeadshotMultiplier")
                                if multiplier_value and multiplier_value:IsA("ValueBase") then
                                    multiplier = multiplier_value.Value;
                                end;
                            end;
                        end;
                        damage = damage or 0;
                        if struckPart and struckPart.Name == "Head" then
                            damage = damage * multiplier;
                        end;
                    end;
                end;
                OnHit(player, struckPart, damage, "Ranged");
            end;
        end;
    end);
end;

local Camera = workspace.CurrentCamera;
framework:BindToRenderStep(LPH_JIT(function()
    local char = localplayer.Character;
    if not char then return; end;
    local tool = char:FindFirstChildOfClass("Tool");
    if not tool then return; end;
    if hit_detection and not hit_detection.__monitoredTools then hit_detection.__monitoredTools = {}; end;
    if hit_detection.__monitoredTools[tool] then return; end;
    hit_detection.__monitoredTools[tool] = true;
    local wrapper = nil;
    if modules.Name["RangedWeaponClient"] then wrapper = modules.Name["RangedWeaponClient"].getObj(tool);
    end;
    if not wrapper and modules.Name["UtilityClient"] and modules.Name["UtilityClient"].getObj then
        wrapper = modules.Name["UtilityClient"].getObj(tool);
    end;
    if wrapper then
        if wrapper._mainCaster then
            hit_detection:ConnectToCaster(wrapper._mainCaster);
        elseif wrapper._caster then
            hit_detection:ConnectToCaster(wrapper._caster);
        end;
    end;
end));

hit_detection.Active = true;

do
	setthreadidentity(2);
	local ActiveCast = require(game:GetService("ReplicatedStorage").Shared.Vendor.FastCast.ActiveCast);
	setthreadidentity(7);

	local cache = {};
	local chance_cache = {};
	local silentaim_target = nil;
	local old_simulate_cast = getupvalue(ActiveCast.new, 6);
	local old_calculate_fire = modules.Name["RangedWeaponHandler"].calculateFireDirection;

	function new_simulate(...)
		local args = {... };
		local caster = args[1];
		local terminated = false;
		newcclosure(function()
			local weapon, metadata = framework:get_ranged();
			local Chance = framework:Chance(Classes.HitChance.Value);
			if not Chance then
                table.insert(chance_cache, caster);
            end;

			if Toggles.avoidprojectiles.Value and caster and caster.UserData and caster.UserData.tool ~= weapon then
				local root_part = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
				if not root_part then return; end;
				local pos = caster:GetPosition();
				if not pos then return; end;
				local projectile_speed = metadata._itemConfig.speed;
				if not projectile_speed or projectile_speed <= 0 then return; end;
				local distance = (root_part.Position - pos).Magnitude;
				local stats = game:GetService("Stats");
				local ping_value = stats.Network.ServerStatsItem["Data Ping"]:GetValue();
				local ping_seconds = ping_value / 1000;
				local caster_velocity = Vector3.zero;
				if caster.GetVelocity then
                    caster_velocity = caster:GetVelocity();
                end;
				local predicted_pos = pos + (caster_velocity * ping_seconds);
				local predicted_distance = (root_part.Position - predicted_pos).Magnitude;
				local predicted_travel_time = predicted_distance / projectile_speed;
				local saftey_bugger = 0.05;
				local adjusted_time = predicted_travel_time - ping_seconds - saftey_bugger;
				if adjusted_time <= 0.15 then
					setrunning("AvoidProjectiles", true)
					task.delay(0.5, function()
                        setrunning("AvoidProjectiles", false);
                    end);
                end;
            end;

			if not table.find(chance_cache, caster) and Chance and caster and caster.UserData and caster.StateInfo and caster.UserData.tool == weapon and (Classes.SilentAim.Value or settings.ragebot) and weapon and metadata then
				local Player = framework:closest_characters_origin(caster:GetPosition(), 19);
				if Classes.ClosestType.Value == "Only Redirect To Target" then
					Player = nil;
					local Characters = framework:closest_characters_to_origin(caster:GetPosition(), 19)
					if table.find(Characters, silentaim_target) then
                        Player = silentaim_target;
                    end;
				end;

				local mouse_closest = framework:closest_to_mouse(Classes.FOVSize.Value);

				if Player then
					local Head = Player:FindFirstChild("Head");
					local Character = localplayer.Character;
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart");
					if settings.ragebot and Head and HumanoidRootPart then
						if Toggles.ShowLine.Value then
							local part = Instance.new("Part");
							part.Anchored = true;
							part.CanCollide = false;
							part.Material = Enum.Material.Neon;
							part.Color = Options.LineColor.Value;
							part.Size = vector3_new(0.1, 0.1, (Head.Position - HumanoidRootPart.Position).Magnitude);
							part.CFrame = cframe_new(HumanoidRootPart.Position, Head.Position) * cframe_new(0, 0, -part.Size.Z / 2);
							part.Transparency = 0;
							part.Parent = workspace;
							task_spawn(LPH_JIT(function()
								local fade_time = 2;
								local steps = 30
								for i = 1, steps do
									part.Transparency = i / steps;
									task.wait(fade_time / steps);
								end;
								part:Destroy();
							end));
						end;
						if caster.Caster and caster.Caster.RayHit then
							local fake_result = {
								Instance = Head,
								Position = Head.Position,
								Normal = Vector3.yAxis,
								Material = Enum.Material.SmoothPlastic,
								Distance = 1,
							}
							local fake_velocity = (Head.Position - caster:GetPosition()).Unit * 3000
							caster.Caster.RayHit:Fire(
								caster,
								fake_result,
								fake_velocity,
								caster.RayInfo and caster.RayInfo.CosmeticBulletObject
							);
						end;
						caster:Terminate();
						terminated = true;
						return;
					end;
				end;

				if Classes.SilentAim.Value then
					if Classes.ClosestType.Value == "Closest To Mouse" then
						if mouse_closest then
							local player_character = mouse_closest.Character;
							if player_character then
								local HitPart = player_character:FindFirstChild( Classes.SilentHitPart.Value == "Random" and R6BodyParts[math_random(1, #R6BodyParts)] or Classes.SilentHitPart.Value);
								if HitPart and (HitPart.Position - caster:GetPosition()).Magnitude <= Classes.SilentAimRange.Value then
									local target_position = HitPart.Position;
									local origin = caster:GetPosition();
									local direction = (target_position - origin);
									local distance = direction.Magnitude;
									local speed = 3000;
									local Vel = direction.Unit * speed;
									caster:SetVelocity(Vel);
									caster.RayInfo.Direction = Vel.Unit;
								end;
							end;
						end;
					elseif Classes.ClosestType.Value == "Closest To Arrow" or Classes.ClosestType.Value == "Only Redirect To Target" then
						if Player then
							local HitPart = Player:FindFirstChild( Classes.SilentHitPart.Value == "Random" and R6BodyParts[math_random(1, #R6BodyParts)] or Classes.SilentHitPart.Value )
							if HitPart and (HitPart.Position - caster:GetPosition()).Magnitude <= Classes.SilentAimRange.Value then
								local target_position = HitPart.Position;
								local Vel = (target_position - caster:GetPosition()).Unit * 3000;
								caster:SetVelocity(Vel);
							end;
						end;
					end;
				end;
			end;
		end);

		if terminated then 
            return; 
        end;

		if caster and caster.UserData and caster.StateInfo then
            return old_simulate_cast(...);
        end;
	end;

	function new_calculate_fire(...)
		local args = {...};
		local target = framework:closest_to_mouse(Options.FOVSize.Value)
		if settings.stick and stick_target then 
            target = stick_target;
        end;
		local ranged, metadata = framework:get_ranged();
		if Classes.SilentAim.Value and target and ranged and metadata and framework:Chance(Classes.HitChance.Value) and not framework:in_menu(target) then
			local hit_part = target.Character:FindFirstChild(Classes.SilentHitPart.Value);
			local humanoid = target.Character:FindFirstChildOfClass("Humanoid");
			if hit_part and humanoid then
				local cheated_origin = metadata:getCheatedBackOriginIfInObject( metadata._mainCasterBehavior.RaycastParams);
				if cheated_origin then
					silentaim_target = target.Character;
					local projectile_speed = metadata._itemConfig.speed;
					local projectile_gravity = metadata._itemConfig.gravity or vector3_new(0, 0, 0);
					local aim_position = PredictTargetPosition(cheated_origin, {
                        Position = hit_part.Position,
                        Velocity = (Classes.Resolver.Value and humanoid.MoveDirection or hit_part.Velocity),
                    },
                    projectile_speed, localplayer:GetNetworkPing() * 1000, projectile_gravity);
					args[1] = CFrame.lookAt(vector3_new(), (aim_position - cheated_origin).Unit);
					local old_params = metadata._mainCasterBehavior.RaycastParams;
					local new_params = RaycastParams.new();
					new_params.FilterType = Enum.RaycastFilterType.Blacklist;
					new_params.IgnoreWater = old_params.IgnoreWater;
					local ignore_list = {};
					if old_params.FilterDescendantsInstances then
                        for _, v in ipairs(old_params.FilterDescendantsInstances) do
                            table.insert(ignore_list, v);
                        end;
                    end;
					for _, plr in pairs(game.Players:GetPlayers()) do
						local player_character = plr.Character;
						if player_character and player_character ~= target.Character then table.insert(ignore_list, player_character);
                        end;
					end;
					if not table.find(ignore_list, workspace.Terrain) then
                        table.insert(ignore_list, workspace.Terrain);
                    end;
					new_params.FilterDescendantsInstances = ignore_list;
					metadata._mainCasterBehavior.RaycastParams = new_params
					task.defer(function()
                        metadata._mainCasterBehavior.RaycastParams = old_params;
                    end);
                end;
            end;
		end;
		return old_calculate_fire(unpack(args));
	end;

	setupvalue(ActiveCast.new, 6, newcclosure(function(...) 
        return new_simulate(...);
    end));

	modules.Name["RangedWeaponHandler"].calculateFireDirection = new_calculate_fire;

    local visualizer_folder = Instance.new("Folder", game.Workspace.Terrain);
    visualizer_folder.Name = "FastCastVisualizationObjects"
    visualizer_folder.ChildAdded:Connect(function(child)
        task.wait();
        local Debris = game:GetService("Debris");
        Debris:AddItem(child, 0.7);
    end);

	local activeragebot = true;
	task_spawn(LPH_JIT(function()
		while task.wait() do
			if not activeragebot then
				break;
			end;

			if not settings.ragebot then
				task.wait(0.2);
				continue;
			end;

			local Character = localplayer.Character;
			if not Character then
				continue;
			end;

			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart");
			if not HumanoidRootPart then
				continue;
			end;

			local ranged, metadata = framework:get_ranged();
			if not ranged or not metadata then
				continue;
			end;

			local player = locked_target or framework:get_closest_2(Classes.RagebotDist.Value);

			if locked_target and not next(locked_target) then
				locked_target = nil;
				continue;
			end;

			if not player or not next(player) then
				continue;
			end;

            local target_player = players:FindFirstChild(next(player))
            if target_player and (should_skip_by_whitelist(target_player, "ragebot")) then
                locked_target = nil;
                continue;
            end;

			if metadata.canShootBulletssss == nil then
				metadata.canShootBulletssss = true;
			end;

			if not metadata.canShootBulletssss then
				if metadata._itemConfig.maxAmmo == 1 then
					metadata.canShootBulletssss = true;
				else
					continue;
				end;
			end;

			if metadata._clientAmmoVO.Value <= 0 then
				continue;
			end;

			if not metadata._mainCasterBehavior or not metadata._mainCaster then
				continue;
			end;

			local target_player = players:FindFirstChild(next(player));
			if not target_player or not target_player.Character then
				continue;
			end;

			local target_humanoid = target_player.Character:FindFirstChild("Humanoid");
			if not target_humanoid or target_humanoid.Health == 0 then
				locked_target = nil;
                metadata.canShootBulletssss = true;
				continue;
			end;

			if framework:in_menu(target_player) then
				locked_target = nil;
                metadata.canShootBulletssss = true;
				continue;
			end;

			local Head = target_player.Character:FindFirstChild("Head");
			if not Head or target_player.Character:FindFirstChildOfClass("ForceField") then
				locked_target = nil;
                metadata.canShootBulletssss = true;
				continue;
			end;

			metadata.canShootBulletssss = false;
			locked_target = player

			metadata._mainCasterBehavior.RaycastParams.FilterDescendantsInstances = {
				metadata._mainCasterBehavior.RaycastParams.FilterDescendantsInstances;
				PlayerCharacters;
				Map;
				Workspace.Terrain;
			};

			local origin = metadata:getCheatedBackOriginIfInObject(metadata._mainCasterBehavior.RaycastParams);
			local projectile_speed = metadata._itemConfig.speed or 200;
			local projectile_gravity = metadata._itemConfig.gravity or vector3_new(0, 0, 0);

			local final_posiiton = PredictTargetPosition(
				origin, { 
                    Position = Head.Position;
                    Velocity = Head.Velocity;
                },
				projectile_speed,
				localplayer:GetNetworkPing() * 1000,
				projectile_gravity
			);

			local CF = cframe_new(vector3_new(), (final_posiiton - origin).Unit);
			local dir = old_calculate_fire(CF, 0, 0, 5000);
            local EffectsJunk = workspace:WaitForChild("EffectsJunk");

			local fake_behaviour = {
				RaycastParams = metadata._mainCasterBehavior.RaycastParams;
				Acceleration = vector3_new();
				MaxDistance = 5000;
				HighFidelityBehavior = 1;
				HighFidelitySegmentSize = 0.5;
				CosmeticBulletContainer = EffectsJunk;
				AutoIgnoreContainer = true;
            };

			local template = metadata._cosmeticProjectileTemplate;
			if typeof(fake_behaviour) == "Instance" then
				fake_behaviour.CosmeticBulletProvider = nil;
				fake_behaviour.CosmeticBulletTemplate = template;
			else
				fake_behaviour.CosmeticBulletProvider = template;
				fake_behaviour.CosmeticBulletTemplate = nil;
			end;

			local cast = metadata._mainCaster:Fire(origin, dir, projectile_speed, fake_behaviour);
			metadata._cheatId = metadata._cheatId and metadata._cheatId + 1 or 1;

			cast.UserData = {
				["player"] = localplayer;
				["tool"] = ranged;
				["shotId"] = tostring(metadata._cheatId);
				["origin"] = origin;
				["chargePercentage"] = metadata._chargeProgressVO.Value;
			};

			fire_server("RangedFire", ranged, origin, {
				[tostring(metadata._cheatId)] = dir.Unit;
			}, {
				[tostring(metadata._cheatId)] = dir;
			}, {
				[1] = tostring(metadata._cheatId);
			}, nil, workspace.CurrentCamera.CFrame, workspace:GetServerTimeNow(), metadata._chargeProgressVO.Value);
			metadata._clientAmmoVO.Value = metadata._clientAmmoVO.Value - 1;

			local distance = (origin - Head.Position).Magnitude;
			local time_to_hit = distance / projectile_speed;

			if not (ranged.Name == "Longbow" or ranged.Name == "Crossbow" or ranged.Name == "Heavy Bow") then
				task.delay(time_to_hit + 0.08, function()
					if cast.UserData and cast.StateInfo and cast.StateInfo.UpdateConnection then
						if Toggles.ShowLine.Value then
							local part = Instance.new("Part");
							part.Anchored = true;
							part.CanCollide = false;
							part.Material = Enum.Material.Neon;
							part.Color = Options.linecolor.Value;
							part.Size = vector3_new(0.1, 0.1, (Head.Position - HumanoidRootPart.Position).Magnitude);
							part.CFrame = cframe_new(HumanoidRootPart.Position, Head.Position) * cframe_new(0, 0, -part.Size.Z / 2);
							part.Transparency = 0;
							part.Parent = workspace;
							task_spawn(LPH_JIT(function()
								local fade_time = 2;
								local steps = 30;
								for i = 1, steps do
									part.Transparency = i / steps;
									task.wait(fade_time / steps);
								end;
								part:Destroy();
							end));
						end;
						metadata._mainCaster.RayHit:Fire(cast, {
							Distance = 1;
							Instance = Head;
							Material = Enum.Material.SmoothPlastic;
							Position = Head.Position;
							Normal = Vector3.yAxis;
						}, nil, cast.RayInfo.CosmeticBulletObject);
						cast:Terminate();
					end;
				end);
			end;

			if metadata._clientAmmoVO.Value ~= 0 then
				local cooldown = metadata._itemConfig.cooldown;
				if Toggles.safe_mode_ragebot.Value then
					cooldown = cooldown + Options.safe_mode_slider1.Value
				end;
				task.wait(cooldown);
			end;
			metadata.canShootBulletssss = true;
		end
	end));
end;

local snipertext = "";
misc3 = misc_tab:AddTab("sniper");
local status = misc3:AddLabel("status: idle")

misc3:AddInput("sniper", {
    Placeholder = "enter username or userid";
    Default = "";
    Finished = false;
    Callback = function(Text)
        snipertext = Text;
    end;
});

misc3:AddButton({
    Text = "snipe player";
    Func = function()
        local input = snipertext;
        if not input or input == "" then
            status:SetText("status: no input (0x00)");
            return;
        end;
        local user_id = tonumber(input);
        if not user_id then
            local success, result = pcall(function()
                return game:GetService("Players"):GetUserIdFromNameAsync(input);
            end);
            if success then
                user_id = result;
            else
                status:SetText("status: invalid username");
                return;
            end;
        end;
        status:SetText("status: searching");
        task_spawn(function()
            local Success, InServer, _, PlaceId, JobId = invoke_server("GetPlayerPlaceInstanceInfo", user_id);
            if JobId then
                local server_info;
                local HttpService = game:GetService("HttpService");
                local ok, res = pcall(function()
                    return HttpService:JSONDecode(HttpService:GetAsync("https://games.roblox.com/v1/games/"  .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"));
                end);
                if ok and res and res.data then
                    for _, v in pairs(res.data) do
                        if v.id == JobId then
                            server_info = v;
                            break;
                        end;
                    end;
                end;
                local msg = "status: user found, teleporting:";
                if server_info then
                    local players = server_info.playing or "?";
                    local maxPlayers = server_info.maxPlayers or "?";
                    local region = server_info.region or "unknown";
                    msg ="status: user found | " .. players .. "/" .. maxPlayers .. " | region: " .. region;
                end;
                status:SetText(msg);
                wait(1);
                teleportservice:TeleportToPlaceInstance(PlaceId, JobId, game.Players.LocalPlayer, "", "=");
            else
                wait(0.8);
                status:SetText("status: target not playing cw");
            end;
        end);
    end;
});

settings_tab:AddLabel("menu bind"):AddKeyPicker("menubind", {
    Default = "RightAlt";
    NoUI = true;
    Text = "toggle ui";
});

library.ToggleKeybind = Options.menubind;

settings_tab:AddToggle('WatermarkEnabled', {
    Text = 'watermark';
    Default = false;
    Callback = function(Value)
        library:SetWatermarkVisibility(Value);
    end;
});

local function update_keybind_ui(option, mode)
    if not option.Keybind then return; end;
    if mode == 'all' then
        option.Keybind.NoUI = false;
    end;
end;

local function update_keybinds(mode)
    if not library.KeybindFrame then return; end;
    if mode == 'none' then
        library.KeybindFrame.Visible = false;
        return;
    end;
    library.KeybindFrame.Visible = true;
    for _, option in pairs(Options) do
        update_keybind_ui(option, mode);
    end;
end;

settings_tab:AddToggle('keybindmode', {
    Text = 'keybind mode';
    Default = false;
    Callback = function(Value)
        if not Value then
            library.KeybindFrame.Visible = false;
        else
            update_keybinds(current_keybind_mode);
        end;
    end;
});

settings_tab:AddDropdown('keybindoptions', {
    Text = 'keybind options';
    Default = 'all';
    Values = {'all', 'none'};
    Callback = function(Value)
        current_keybind_mode = Value;
        update_keybinds(Value);
    end;
});

do
    local frame_timer = tick();
    local frame_counter = 0;
    local FPS = 60;
    runservice.RenderStepped:Connect(LPH_JIT(function()
        frame_counter = frame_counter + 1;
        if (tick() - frame_timer) >= 1 then
            FPS = frame_counter;
            frame_timer = tick();
            frame_counter = 0;
        end;
        if Toggles.WatermarkEnabled and Toggles.WatermarkEnabled.Value then
            local ping = math_floor(localplayer:GetNetworkPing() * 1000);
            library:SetWatermark(('nil.solutions | %s fps | %s ms'):format(math_floor(FPS), ping));
        end;
    end));
end;

library.Watermark.AnchorPoint = vector2_new(1, 1)
library.Watermark.Position = UDim2.new(1, -20, 0.05, 0)

local function create_character_vis()
    local char_highlight = Instance.new("Highlight");
    char_highlight.Name = "CharacterVisualsHighlight";
    char_highlight.FillTransparency = 1;
    char_highlight.OutlineTransparency = 0;
    local original_data = {
        Parts = {};
        Decals = {};
        Meshes = {};
        Accessories = {};
        Char = nil;
    };

    local trail_ghosts = {};
    local last_settings = {};
    local applied_to_character = nil;
    local character_connection = {};

    local function clear_connections()
        for _, v in pairs(character_connection) do
            if v and v.Disconnect then
                v:Disconnect();
            end;
        end;
        character_connection = {};
    end;

    local function clear_original_data()
        original_data.Parts = {};
        original_data.Decals = {};
        original_data.Meshes = {};
        original_data.Accessories = {};
        original_data.Char = nil;
    end;

    local function store_original_data(char)
        if original_data.Char == char then return; end;
        clear_original_data();
        original_data.Char = char;
        for _, v in ipairs(char:GetDescendants()) do
            if v:IsA("BasePart") then
                local is_root = (v.Name == "HumanoidRootPart");
                local is_hitbox = v.Name:lower():find("hitbox");
                if is_root or is_hitbox then continue; end;
                original_data.Parts[v] = {
                    Material = v.Material;
                    Color = v.Color;
                    Transparency = v.Transparency;
                };

                if v:IsA("MeshPart") then
                    original_data.Parts[v].TextureID = v.TextureID;
                end;
                local sm = v:FindFirstChildOfClass("SpecialMesh");
                if sm then 
                    original_data.Meshes[sm] = {TextureId = sm.TextureId, MeshId = sm.MeshId; };
                end;
            elseif v:IsA("Decal") or v:IsA("Texture") then
                original_data.Decals[v] = {Texture = v.Texture, Transparency = v.Transparency; };
            elseif v:IsA("Accessory") then
                table.insert(original_data.Accessories, v);
            end;
        end;
    end;

    local function apply_visuals()
        local char = localplayer.Character;
        if not char or not next(original_data.Parts) then return; end;
        local is_rainbow = Toggles.RainbowCharacter and Toggles.RainbowCharacter.Value;
        local custom_color = Toggles.CustomMaterialColor and Toggles.CustomMaterialColor.Value;
        local mat = Classes.CharacterMaterial and Classes.CharacterMaterial.Value;
        local material_color = Classes.CharacterMaterialColor and Classes.CharacterMaterialColor.Value;
        local transparency = Classes.CharacterTransparency and Classes.CharacterTransparency.Value or 0;
        local remove_accessories = Toggles.RemoveAccessories and Toggles.RemoveAccessories.Value;
        local outline_glow = Classes.OutlineGlow and Classes.OutlineGlow.Value;
        local glow_color = Classes.OutlineGlowColor and Classes.OutlineGlowColor.Value;
        local is_forcefield = (mat == "ForceField");
        local is_neon = (mat == "Neon");
        for part, data in pairs(original_data.Parts) do
            if not part or not part.Parent then continue; end;
            if mat == "ForceField" then
                part.Material = Enum.Material.ForceField;
            elseif mat == "Neon" then
                part.Material = Enum.Material.Neon;
            elseif mat == "Plastic" then
                part.Material = Enum.Material.Plastic;
            else
                part.Material = data.Material;
            end;
            if not is_rainbow then
                if custom_color or is_forcefield or is_neon then
                    part.Color = material_color;
                else
                    part.Color = data.Color;
                end;
            end;
            if transparency > 0 and data.Transparency < 0.95 then
                part.Transparency = transparency;
            else
                part.Transparency = data.Transparency;
            end;
            if part:IsA("MeshPart") then
                local is_head = (part.Name == "Head")
                if (is_rainbow or is_forcefield) and not is_head then
                    part.TextureID = "";
                else
                    part.TextureID = data.TextureID or "";
                end;
            end;
        end;

        for mesh, data in pairs(original_data.Meshes) do
            if not mesh or not mesh.Parent then continue; end;
            local is_head = (mesh.Parent.Name == "Head");
            if (is_rainbow or is_forcefield) and not is_head then
                mesh.TextureId = "";
            else
                mesh.TextureId = data.TextureId;
            end;
        end;
        for decal, data in pairs(original_data.Decals) do
            if not decal or not decal.Parent then continue; end;
            local is_face = decal.Name:lower():find("face") or (decal.Parent and decal.Parent.Name == "Head");
            if (is_rainbow or is_forcefield) and not is_face then
                decal.Texture = ""
            else
                decal.Texture = data.Texture;
            end;
            if transparency > 0 and not is_face then
                decal.Transparency = math.max(data.Transparency, transparency);
            else
                decal.Transparency = data.Transparency;
            end;
        end;

        if remove_accessories then
            for _, acc in ipairs(original_data.Accessories) do
                if acc and acc:IsA("Accessory") and acc.Parent == char then
                    local is_face = acc.Name:lower():find("face") or acc.Name:lower():find("facial") or acc.Name:lower():find("head");
                    if not is_face then
                        acc.Parent = nil;
                    end;
                end;
            end;

            for _, v in ipairs(char:GetChildren()) do
                if v:IsA("Accessory") then
                    local is_face = v.Name:lower():find("face") or v.Name:lower():find("facial") or v.Name:lower():find("head")
                    if not is_face then
                        if not table.find(original_data.Accessories, v) then
                            table.insert(original_data.Accessories, v);
                        end;
                        v.Parent = nil;
                    end;
                end;
            end;
        else
            for _, acc in ipairs(original_data.Accessories) do
                if acc and acc:IsA("Accessory") and acc.Parent ~= char then
                    acc.Parent = char;
                end;
            end;
        end;
        if outline_glow then
            char_highlight.Parent = char;
            char_highlight.OutlineColor = is_rainbow and nil_global_rainbow_color or glow_color;
        else
            char_highlight.Parent = nil;
        end;
    end;

    local visuals_dirtyflag = false;

    local function mark_dirty()
        visuals_dirtyflag = true;
    end;

    local rainbowstepper = 0;
    local lastnochar = 0;
    local lastcharcheck = 0;

    runservice.Heartbeat:Connect(LPH_JIT(function(dt)
        local now2 = tick();
        local char = localplayer.Character;
        if not char or not char:FindFirstChild("HumanoidRootPart") then
            if now2 - lastnochar < 0.2 then return; end;
            lastnochar = now2;
            char_highlight.Parent = nil;
            applied_to_character = nil;
            for i = 1, #trail_ghosts do
                trail_ghosts[i]:Destroy();
            end;
            trail_ghosts = {};
            clear_original_data();
            clear_connections();
            return;
        end;
        lastcharcheck = now2;
        if original_data.Char ~= char then
            local appearanceready = false;
            local children = char:GetChildren();
            for i = 1, #children do
                local v = children[i];
                if v:IsA("Accessory") then appearanceready = true; break;
                elseif v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                    if v.Color ~= Color3.fromRGB(163, 162, 165) then
                        appearanceready = true;
                        break;
                    end;
                end;
            end;

            if appearanceready then
                clear_connections();
                store_original_data(char);
                table.insert(character_connection, char.ChildAdded:Connect(function(child)
                    if child:IsA("Accessory") then
                        task.wait();
                        local removeacc = Toggles.RemoveAccessories and Toggles.RemoveAccessories.Value;
                        local isface = child.Name:lower():find("face") or child.Name:lower():find("facial") or child.Name:lower():find("head");
                        if not table.find(original_data.Accessories, child) then
                            table.insert(original_data.Accessories, child);
                        end;
                        if removeacc and not isface then
                            child.Parent = nil;
                        end;
                    end;
                end));
                applied_to_character = nil;
                visuals_dirtyflag = true;
            else
                return;
            end;
        end;

        local israinbow = Toggles.RainbowCharacter and Toggles.RainbowCharacter.Value;
        local newmat = Classes.CharacterMaterial and Classes.CharacterMaterial.Value;
        local newcolor = Classes.CharacterMaterialColor and Classes.CharacterMaterialColor.Value;
        local newtrans = Classes.CharacterTransparency and Classes.CharacterTransparency.Value;
        local newcustom = Toggles.CustomMaterialColor and Toggles.CustomMaterialColor.Value;
        local newremoveacc = Toggles.RemoveAccessories and Toggles.RemoveAccessories.Value;
        local newglow = Classes.OutlineGlow and Classes.OutlineGlow.Value;
        local newglowcolor = Classes.OutlineGlowColor and Classes.OutlineGlowColor.Value;

        if applied_to_character ~= char or last_settings.Material ~= newmat or last_settings.Color ~= newcolor or last_settings.Transparency ~= newtrans or last_settings.Rainbow ~= israinbow or last_settings.CustomColor ~= newcustom or last_settings.RemoveAcc ~= newremoveacc or last_settings.OutlineGlow ~= newglow or last_settings.OutlineColor ~= newglowcolor then
            last_settings.Material = newmat;
            last_settings.Color = newcolor;
            last_settings.Transparency = newtrans;
            last_settings.Rainbow = israinbow;
            last_settings.CustomColor = newcustom;
            last_settings.RemoveAcc = newremoveacc;
            last_settings.OutlineGlow = newglow;
            last_settings.OutlineColor = newglowcolor;
            applied_to_character = char;
            apply_visuals();
        end;

        if israinbow then
            rainbowstepper = rainbowstepper + dt;
            if rainbowstepper >= 0.033 then
                rainbowstepper = 0;
                local rc = nil_global_rainbow_color;
                for part in pairs(original_data.Parts) do
                    if part and part.Parent and part:IsA("BasePart") then
                        part.Color = rc;
                    end;
                end;
                if char_highlight.Parent then
                    char_highlight.OutlineColor = rc;
                end;
            end;
        end;
    end));
end;

task_spawn(create_character_vis);

local function create_visuals()
    local fov_circle = drawing_new("Circle");
    fov_circle.Thickness = 1;
    fov_circle.NumSides = 100;
    fov_circle.Visible = false;
    local fov_circle_outline = drawing_new("Circle");
    fov_circle_outline.Thickness = 1;
    fov_circle_outline.NumSides = 100;
    fov_circle_outline.Visible = false;
    local ch_out1 = drawing_new("Line");
    local ch_out2 = drawing_new("Line");
    local ch_out3 = drawing_new("Line");
    local ch_out4 = drawing_new("Line");
    local ch_line1 = drawing_new("Line");
    local ch_line2 = drawing_new("Line");
    local ch_line3 = drawing_new("Line");
    local ch_line4 = drawing_new("Line");
    local weapon_highlight = Instance.new("Highlight");
    weapon_highlight.Name = "WeaponCham";
    local last_crosshair_position = userinputservice:GetMouseLocation();
    local current_rotation = 0;
    local last_tool = nil;
    local last_cham_settings = {
        Material = nil;
        Color = nil;
        Highlight = nil;
        HighlightColor = nil;
    };

    runservice.Heartbeat:Connect(LPH_JIT(function(dt)
        if Classes.CrosshairEnabled and Classes.CrosshairEnabled.Value then
            local mouse_location = userinputservice:GetMouseLocation();
            local smooth_amount = math.max(1, Classes.CrosshairSmoothing.Value);
            last_crosshair_position = last_crosshair_position + (mouse_location - last_crosshair_position) / smooth_amount;
            local center = vector2_new(math.round(last_crosshair_position.X), math.round(last_crosshair_position.Y));
            local size = Classes.CrosshairSize.Value;
            local gap = Classes.CrosshairGap.Value;
            local thick = Classes.CrosshairThickness.Value;
            local color = Classes.CrosshairColor.Value;
            if Classes.CrosshairSpin.Value then
                current_rotation = (current_rotation + (Classes.CrosshairSpinSpeed.Value * dt)) % (math.pi * 2);
            else
                current_rotation = 0;
            end;

            local function get_rotated(offset)
                local cos = math_cos(current_rotation);
                local sin = math_sin(current_rotation);
                return vector2_new( (offset.X * cos) - (offset.Y * sin), (offset.X * sin) + (offset.Y * cos));
            end;

            local function update_line(line, outline, from_off, to_off)
                local f_rotation = get_rotated(from_off);
                local t_rotation = get_rotated(to_off);
                local f = vector2_new(math.round((center + f_rotation).X), math.round((center + f_rotation).Y));
                local t = vector2_new(math.round((center + t_rotation).X), math.round((center + t_rotation).Y));
                if Classes.CrosshairOutline and Classes.CrosshairOutline.Value then
                    local dir = (t_rotation - f_rotation);
                    local len = dir.Magnitude;
                    if len > 0 then
                        local norm = dir / len;
                        outline.From = vector2_new(math.round((f - norm).X), math.round((f - norm).Y));
                        outline.To = vector2_new(math.round((t + norm).X), math.round((t + norm).Y));
                    else
                        outline.From = f;
                        outline.To = t;
                    end
                    outline.Thickness = thick + 1.5;
                    outline.Color = Color3.new(0, 0, 0);
                    outline.ZIndex = 0.15;
                    outline.Visible = true;
                else
                    outline.Visible = false;
                end
                line.From = f;
                line.To = t;
                line.Thickness = thick;
                line.Color = color;
                line.ZIndex = 1;
                line.Visible = true
            end
            update_line(ch_line1, ch_out1, vector2_new(0, gap), vector2_new(0, gap + size));
            update_line(ch_line2, ch_out2, vector2_new(0, -gap), vector2_new(0, -(gap + size)));
            update_line(ch_line3, ch_out3, vector2_new(gap, 0), vector2_new(gap + size, 0));
            update_line(ch_line4, ch_out4, vector2_new(-gap, 0), vector2_new(-(gap + size), 0));
        else
            ch_line1.Visible = false;
            ch_line2.Visible = false;
            ch_line3.Visible = false;
            ch_line4.Visible = false;
            ch_out1.Visible = false;
            ch_out2.Visible = false;
            ch_out3.Visible = false;
            ch_out4.Visible = false;
        end;
    end));
end;

task_spawn(create_visuals);

thememanager:SetLibrary(library);
thememanager:SetFolder("serenium");
thememanager:ApplyToTab(tabs.settings);
savemanager:SetLibrary(library);
savemanager:SetFolder("serenium/configs");
savemanager:BuildConfigSection(tabs.settings);
savemanager:LoadAutoloadConfig();
