mash_app   = {"alt", "shift"}


hs.hotkey.bind({"alt"}, "S", function ()
    hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind({"alt"}, "O", function ()
    hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind({"alt"}, "P", function ()
    hs.application.launchOrFocus("Spotify")
end)

hs.hotkey.bind({"alt"}, "C", function ()
    hs.application.launchOrFocus("Cursor")
end)

hs.hotkey.bind({"alt"}, "i", function ()
    hs.application.launchOrFocus("iTerm")
end)

-- resize to occupy the whole screen
hs.hotkey.bind({"alt", "shift"}, "O", function()
  local win = hs.window.focusedWindow()
  if not win then
    hs.alert.show("No window focused - Please check Hammerspoon permissions")
    return
  end
  
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
  
  -- Ensure changes are applied immediately
  win:setFrameWithWorkarounds(f)
end)

-- resize to occupy the left half of the screen
hs.hotkey.bind({"alt", "shift"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- resize to occupy the right half of the screen
hs.hotkey.bind({"alt", "shift"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)


-- -- left, upper corner
-- hs.hotkey.bind({"alt", "shift"}, "Y", function()
--     local win = hs.window.focusedWindow()
--     local f = win:frame()
--     local screen = win:screen()
--     local max = screen:frame()

--     f.x = max.x / 2
--     f.y = max.y / 2
--     f.w = max.w / 2
--     f.h = max.h / 2
--     win:setFrame(f)
-- end)

-- Right, lower corner
hs.hotkey.bind({"alt", "shift"}, "J", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y + (max.h / 2)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

-- Right upper corner
hs.hotkey.bind({"alt", "shift"}, "K", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y / 2
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


-- Move window to next screen
hs.hotkey.bind({"alt", "shift"}, "N", function()
    local win = hs.window.focusedWindow()
    if not win then
        hs.alert.show("No window focused")
        return
    end
    
    local screen = win:screen():next()
    if not screen then
        hs.alert.show("No next screen")
        return
    end
    hs.alert.show(screen:name())
    win:moveToScreen(screen, true, true, 0)
    -- full screen
    win:setFrame(screen:frame())
end)

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")
