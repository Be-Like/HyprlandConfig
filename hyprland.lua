--------------
-- MONITORS --
--------------

local monitorCenter = "DP-1"
local monitorLeft = "DP-2"

hl.monitor({
    output = monitorCenter,
    mode = "3440x1440@164",
    position = "0x0",
    scale = "1"
})

hl.monitor({
    output = monitorLeft,
    mode = "3840x2160@59",
    position = "-1728x-850",
    scale = "1.25",
    transform = 3
})


---------------------------
-- PROGRAM CONFIGURATION --
---------------------------

hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

---------------------------
-- ENVIRONMENT VARIABLES --
---------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

--------------
-- PROGRAMS --
--------------

local terminal = "alacritty"
local fileManager = "dolphin"
local menu = "~/.config/rofi/launchers/type-6/launcher.sh"
local screenshot = "~/.config/rofi/applets/bin/screenshot.sh"
local notificationDaemon = "dunst"
local clipboardManager = "clipse"
local windowBar = "waybar"

---------------
-- AUTOSTART --
---------------

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd(notificationDaemon)
    hl.exec_cmd(clipboardManager .. " -listen")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd(windowBar)
end)


-------------------
-- LOOK AND FEEL --
-------------------

local defaultOpacity = "1.0"
local secondaryOpacity = "0.8"

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border = {
                colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
                angle = 45
            },

            inactive_border = "rgba(595959aa)"
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle"
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = defaultOpacity,
        inactive_opacity = defaultOpacity,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0x1a1a1aee
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696
        }
    },

    animations = { enabled = true }
})

-----------------
-- SEXY CURVES --
-----------------

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })


hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true,
    }
})

hl.config({
    master = {
        new_status = "master"
    }
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true
    }
})

----------
-- MISC --
----------

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false
    }
})

------------
-- INPUTS --
------------

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 2,
        sensitivity = -0.9,

        touchpad = {
            natural_scroll = false,
        }
    }
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5
})

--------------
-- KEYBINDS --
--------------
local super = "SUPER"
local superShift = "SUPER + SHIFT"
local superCtl = "SUPER + Control_L"
local superAlt = "SUPER + ALT"
local superAltShift = "SUPER + SHIFT + ALT"

hl.bind(super .. " + Q", hl.dsp.window.close())
hl.bind(super .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(super .. " + backspace",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(super .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(super .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(super .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(super .. " + Y", hl.dsp.layout("togglesplit"))

-- Opacity

-- opacityRule:set_enabled(false)
-- opacityRule:set_enabled(true)
-- opacityRule:is_enabled()
-- hl.bind(super .. " + O", hl.dsp.window.set_prop({ active_opacity = 1.0})) -- TODO: I need to figure this out (again)
-- hl.bind(super .. " + O", hl.dsp.) -- TODO: I need to figure this out (again)
-- hl.bind(super .. " + O", hl.dsp.window.set_prop({ prop = "opacity", value = "1.0" }))

-- hl.bind(super .. " + O", hl.dispatch(hl.dsp.window.set_prop({ prop = "opacity", value = "0.8" })))


local opacityManager = {}

local function getSizeOfOpacityManager()
    local count = 0
    for _ in ipairs(opacityManager) do count = count + 1 end
    return count
end

local function findIndexOfOpacityManagerWindowByPid(pid)
    for i, value in ipairs(opacityManager) do
        if value[1] == pid then
            return i
        end
    end

    return nil
end

local function insertWindowIntoOpacityManager(pid, opacity)
    table.insert(opacityManager, { pid, opacity })
end

local function removeWindowFromOpacityManagerByPid(pid)
    local idx = findIndexOfOpacityManagerWindowByPid(pid)

    if idx == nil then
        return
    else
        table.remove(opacityManager, idx)
    end
end

local function isSpecialWorkspace(workspace)
    local workspaceName = tostring(workspace)
    local start, last = string.find(workspaceName, "special")

    if start == nil or last == nil then
        return false
    else
        return true
    end
end

hl.on("window.open", function(w)
    local windowPID = w.pid

    if isSpecialWorkspace(w.workspace) then
        hl.dispatch(hl.dsp.window.set_prop({ prop = "opacity", value = secondaryOpacity }))
        hl.dispatch(hl.dsp.window.set_prop({ prop = "opacity_inactive", value = secondaryOpacity }))
        insertWindowIntoOpacityManager(windowPID, secondaryOpacity)
    else
        insertWindowIntoOpacityManager(windowPID, defaultOpacity)
    end

    local count = 0
    for _ in ipairs(opacityManager) do count = count + 1 end

    -- hl.notification.create({
    --     text = "Workspace created: PID " .. windowPID .. " - Size: " .. getSizeOfOpacityManager(),
    --     timeout = 4000,
    --     icon = "ok"
    -- })
end)

hl.on("window.close", function(window)
    local windowPID = window.pid
    removeWindowFromOpacityManagerByPid(windowPID)

    -- hl.notification.create({
    --     text = "Workspace closed: " .. windowPID,
    --     timeout = 4000,
    --     icon = "ok"
    -- })
end)


hl.bind(super .. " + O", function()
    local window = hl.get_active_window()

    if window == nil then return end

    local windowPID = window.pid
    local idx = findIndexOfOpacityManagerWindowByPid(windowPID)

    if idx == nil then
        local opacity

        local workspace = hl.get_active_workspace()
        if isSpecialWorkspace(workspace) then opacity = secondaryOpacity else opacity = defaultOpacity end

        insertWindowIntoOpacityManager(windowPID, opacity)
        hl.dispatch(hl.dsp.window.set_prop({ prop = "opacity", value = opacity }))
        hl.dispatch(hl.dsp.window.set_prop({ prop = "opacity_inactive", value = opacity }))
    else
        local currentOpacity = opacityManager[idx][2]

        if currentOpacity == defaultOpacity then
            hl.dispatch(hl.dsp.window.set_prop({ prop = "opacity", value = secondaryOpacity }))
            hl.dispatch(hl.dsp.window.set_prop({ prop = "opacity_inactive", value = secondaryOpacity }))
            opacityManager[idx][2] = secondaryOpacity
        else
            hl.dispatch(hl.dsp.window.set_prop({ prop = "opacity", value = defaultOpacity }))
            hl.dispatch(hl.dsp.window.set_prop({ prop = "opacity_inactive", value = defaultOpacity }))
            opacityManager[idx][2] = defaultOpacity
        end
    end

    -- hl.notification.create({
    --     text = "Opacity toggle: size of workspace" .. getSizeOfOpacityManager(),
    --     timeout = 4000,
    --     icon = "ok"
    -- })
end)

-- Mousebinds
hl.bind(super .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(super .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(superShift .. " + mouse_down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(superShift .. " + mouse_up", hl.dsp.window.move({ workspace = "e-1" }))

hl.bind(super .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(super .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Window movements
hl.bind(super .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(super .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(super .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(super .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(super .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(super .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(super .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(super .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(super .. " + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(super .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(super .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(super .. " + down", hl.dsp.window.move({ direction = "down" }))

hl.bind(superShift .. " + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(superShift .. " + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(superShift .. " + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(superShift .. " + j", hl.dsp.window.move({ direction = "down" }))

----------------------------
-- WINDOWS AND WORKSPACES --
----------------------------
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize"
})

hl.window_rule({
    name = "fix-xwayland-drags",

    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false
    },

    no_focus = true
})

local defaultWorkspace = 1
local defaultKeybind = 7
local defaultSpecialWorkspace = 11
hl.workspace_rule({ workspace = tostring(defaultWorkspace), monitor = monitorCenter, default = true, default_name = "I" })
hl.bind(super .. " + " .. defaultKeybind, hl.dsp.focus({ workspace = tostring(defaultWorkspace) }))
hl.bind(superShift .. " + " .. defaultKeybind, hl.dsp.window.move({ workspace = tostring(defaultWorkspace) }))
hl.bind(superAlt .. " + " .. defaultKeybind, hl.dsp.workspace.toggle_special(defaultSpecialWorkspace))
hl.bind(superAltShift .. " + " .. defaultKeybind, hl.dsp.window.move({ workspace = "special:" .. defaultSpecialWorkspace }))

local secondaryWorkspace = "2"
local secondaryWorkspaceKeybind = 6
hl.workspace_rule({ workspace = tostring(secondaryWorkspace), monitor = monitorCenter, default_name = "II" })
hl.bind(super .. " + " .. secondaryWorkspaceKeybind, hl.dsp.focus({ workspace = secondaryWorkspace }))
hl.bind(superShift .. " + " .. secondaryWorkspaceKeybind, hl.dsp.window.move({ workspace = secondaryWorkspaceKeybind }))

local passiveWorkspace = 9
local passiveWorkspaceKeybind = 0
hl.workspace_rule({ workspace = tostring(passiveWorkspace), monitor = monitorLeft, default = true, default_name = "Passive" })
hl.bind(super .. " + " .. passiveWorkspaceKeybind, hl.dsp.focus({ workspace = tostring(passiveWorkspace) }))
hl.bind(superShift .. " + " .. passiveWorkspaceKeybind, hl.dsp.window.move({ workspace = tostring(passiveWorkspace) }))

local softwareDevelopmentOne = 3
local sofwareDevelopmentOneKeybind = 8
local softwareDevelopmentOneSpecialWorkspace = 13
hl.workspace_rule({ workspace = "name:" .. softwareDevelopmentOne, monitor = monitorCenter, default_name = "SD-I" })
hl.bind(super .. " + " .. sofwareDevelopmentOneKeybind, hl.dsp.focus({ workspace = softwareDevelopmentOne }))
hl.bind(superShift .. " + " .. sofwareDevelopmentOneKeybind, hl.dsp.window.move({ workspace = softwareDevelopmentOne }))
hl.bind(superAlt .. " + " .. sofwareDevelopmentOneKeybind, hl.dsp.workspace.toggle_special(softwareDevelopmentOneSpecialWorkspace))
hl.bind(superAltShift .. " + " .. sofwareDevelopmentOneKeybind, hl.dsp.window.move({ workspace = "special:" .. softwareDevelopmentOneSpecialWorkspace }))

local softwareDevelopmentTwo = 4
local sofwareDevelopmentTwoKeybind = 9
local softwareDevelopmentTwoSpecialWorkspace = 14
hl.workspace_rule({ workspace = "name:" .. softwareDevelopmentTwo, monitor = monitorCenter, default_name = "SD-II"})
hl.bind(super .. " + " .. sofwareDevelopmentTwoKeybind, hl.dsp.focus({ workspace = softwareDevelopmentTwo }))
hl.bind(superShift .. " + " .. sofwareDevelopmentTwoKeybind, hl.dsp.window.move({ workspace = softwareDevelopmentTwo }))
hl.bind(superAlt .. " + " .. sofwareDevelopmentTwoKeybind, hl.dsp.workspace.toggle_special(softwareDevelopmentTwoSpecialWorkspace))
hl.bind(superAltShift .. " + " .. sofwareDevelopmentTwoKeybind, hl.dsp.window.move({ workspace = "special:" .. softwareDevelopmentTwoSpecialWorkspace }))

local messagingSpecialWorkspace = "Messaging"
local messagingSpecialKeybind = "m"
hl.workspace_rule({ workspace = "special:" .. messagingSpecialWorkspace, on_created_empty = "slack && discord" })
hl.bind(super .. " + " .. messagingSpecialKeybind, hl.dsp.workspace.toggle_special(messagingSpecialWorkspace))
hl.bind(superAltShift .. " + " .. messagingSpecialKeybind, hl.dsp.window.move({ workspace = "special:" .. messagingSpecialWorkspace }))

local mailWorkspace = 5
local mailWorkspaceName = "Mail"
local mailWorkspaceKeybind = 4
hl.workspace_rule({ workspace = "name:" .. mailWorkspace, monitor = monitorCenter, default_name = mailWorkspaceName })
hl.bind(super .. " + " .. mailWorkspaceKeybind, hl.dsp.focus({ workspace = mailWorkspace }))
hl.bind(superShift .. " + " .. mailWorkspaceKeybind, hl.dsp.window.move({ workspace = mailWorkspace }))

local entertainmentWorkspace = 10
local entertainmentWorkspaceName = "Entertainment"
local entertainmentWorkspaceKeybind = 5
hl.workspace_rule({ workspace = "name:" .. entertainmentWorkspace, monitor = monitorCenter, default_name =
entertainmentWorkspaceName })
hl.bind(super .. " + " .. entertainmentWorkspaceKeybind, hl.dsp.focus({ workspace = entertainmentWorkspace }))
hl.bind(superShift .. " + " .. entertainmentWorkspaceKeybind, hl.dsp.window.move({ workspace = entertainmentWorkspace }))

-- Clipse
hl.bind(super .. " + COMMA", hl.dsp.exec_cmd(terminal .. " --class floating -e zsh -c 'clipse'"))
hl.window_rule({
    name = "keyboard-manager-interface",

    match = { class = "(floating)" },

    float = true,
    size = { 800, 500 },
    stay_focused = true
})

-- Screenshot
hl.bind(superShift .. " + S", hl.dsp.exec_cmd(screenshot))
