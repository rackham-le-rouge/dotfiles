-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
require("vicious")

-- Load Debian menu entries
require("debian.menu")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/usr/share/awesome/themes/default/theme.lua")

cable=0
mount=0
mountmode=1

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -x " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
--tags = {}
--for s = 1, screen.count() do
    -- Each screen has its own tag table.
--    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
--end
-- }}}


-- {{{ Tags
-- Define a tag table which will hold all screen tags.
tags = {
  names  = { "µαιν", "σσħ", "ιcε", "µυττ", "⨋", "⚒", "☭", "⚔", "⚓" , "μocπ" },
  layout = { layouts[8], layouts[8], layouts[8], layouts[8], layouts[8],
             layouts[8], layouts[8], layouts[8], layouts[8], layouts[8], layouts[8], layouts[8], layouts[8]
}}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- }}}






-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Debian", debian.menu.Debian_menu.Debian },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}




-- Separators
spacer    = widget({ type = "textbox" })
separator = widget({ type = "textbox" })
spacer.text     = " "
separator.text  = " "




-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })




-- Create a batwidget (status chrg%)
baticon = widget({ type = "imagebox" })
baticon.image = image("/home/jerome/.config/awesome/icons/bat.png")
-- Initialize widget
batwidget = widget({ type = "textbox" })
-- Register widget
vicious.register(batwidget, vicious.widgets.bat, '<span color="#489EFF">$1$2%</span>', 31, "BAT0")


-- Create a memwidget (usage$ usedMB/TotalMB)
memicon = widget({ type = "imagebox" })
memicon.image = image("/home/jerome/.config/awesome/icons/mem.png")
-- Initialize widget
memwidget2 = widget({ type = "textbox" })
-- Register widget
vicious.register(memwidget2, vicious.widgets.mem, '<span color="#FF3131">$1%</span> <span color="#489EFF">($2/$3)</span>',13)


-- Create a cpuwidget (usage%)
cpuicon = widget({ type = "imagebox" })
cpuicon.image = image("/home/jerome/.config/awesome/icons/cpu.png")
-- Initialize widget
cpuwidget = widget({ type = "textbox" })
-- Register widget
vicious.register(cpuwidget, vicious.widgets.cpu, '<span color="#489EFF">$1% $2%</span>', 1)

-- Create a netwidget (usage)
dnicon = widget({ type = "imagebox" })
upicon = widget({ type = "imagebox" })
dnicon.image = image("/home/jerome/.config/awesome/icons/up.png")
upicon.image = image("/home/jerome/.config/awesome/icons/down.png")
-- Initialize widget
netwidget = widget({ type = "textbox" })

netwidget:buttons(awful.util.table.join(
   awful.button({ }, 1, function()
                --awesome.restart()
                --vicious.suspend()
                vicious.unregister(netwidget, false)
                if cable==1 then
                        cable=0
                        vicious.register(netwidget, vicious.widgets.net, '<span color="#FF3131">${wlan0 up_kb}k/s</span> w <span color="#33FF33">${wlan0 down_kb}k/s</span>', 1)
                else
                        cable=1
                        vicious.register(netwidget, vicious.widgets.net, '<span color="#FF3131">${eth0 up_kb}k/s</span> e <span color="#33FF33">${eth0 down_kb}k/s</span>', 1)
                end
                vicious.activate(netwidget)
        end)    -- function() awful.util.spawn("xev")
))

-- Register widget
if cable==1 then
        vicious.register(netwidget, vicious.widgets.net, '<span color="#FF3131">${eth0 up_kb}k/s</span> e <span color="#33FF33">${eth0 down_kb}k/s</span>', 1)
else
        vicious.register(netwidget, vicious.widgets.net, '<span color="#FF3131">${wlan0 up_kb}k/s</span> w <span color="#33FF33">${wlan0 down_kb}k/s</span>', 1)
end


-- {{ Mount function
mountwidget = widget({ type = "textbox" })

mountwidget:buttons(awful.util.table.join(
   awful.button({ }, 1, function()
                vicious.unregister(mountwidget, false)

                if mount==1 then
                        mount=0
                        vicious.register(mountwidget, vicious.widgets.net, '<span color="#FF3131">W</span>', 1)
                        os.execute("sudo umount /dev/sdb1")
                elseif mountmode==1 then
                        mount=1
                        vicious.register(mountwidget, vicious.widgets.net, '<span color="#FF3131">F</span>', 1)
                        os.execute("sudo mount -t vfat /dev/sdb1 /media/automonteur")
                elseif mountmode==2 then
                        mount=1
                        vicious.register(mountwidget, vicious.widgets.net, '<span color="#FF3131">L</span>', 1)
                        os.execute("sudo mount /dev/sdb1 /media/automonteur")
                elseif mountmode==3 then
                        mount=1
                        vicious.register(mountwidget, vicious.widgets.net, '<span color="#FF3131">N</span>', 1)
                        os.execute("sudo mount -t ntfs /dev/sdb1 /media/automonteur")
                end

                vicious.activate(mountwidget)
        end)
))

if mount==0 then
        vicious.register(mountwidget, vicious.widgets.net, '<span color="#FF3131">W</span>', 1)
else
        vicious.register(mountwidget, vicious.widgets.net, '<span color="#FF3131">M</span>', 1)
end
-- }}




-- {{{ Memory usage

-- icon
--memicon = widget({ type = "imagebox" })
--memicon.image = image(beautiful.widget_mem)

-- Initialize widget
batbarwidget = awful.widget.progressbar()
-- Progressbar properties
batbarwidget:set_width(120)
batbarwidget:set_height(20)
batbarwidget:set_vertical(false)
batbarwidget:set_background_color("#494B4F")
batbarwidget:set_border_color(nil)
batbarwidget:set_color("#AECF96")
batbarwidget:set_gradient_colors({ "#00FF00" ,  "#F82828",  "#9AFE2E"  })
-- Register widget
--vicious.register(memwidget, vicious.widgets.mem, "$1", 13)
--- The real one
--vicious.register(batbarwidget, vicious.widgets.bat, "$2", 31, "BAT0")
--- The cheated one
vicious.register(batbarwidget, vicious.widgets.mem, "$1", 13)

--}}}


-- {{{ CPU temperature
thermicon = widget({ type = "imagebox" })
thermicon.image = image("/home/jerome/.config/awesome/icons/therm.png")
thermalwidget  = widget({ type = "textbox" })
--vicious.register(thermalwidget, vicious.widgets.thermal, "$1", 20)
vicious.register(thermalwidget, vicious.widgets.thermal, '<span color="#FF3131">$1°C</span>', 20, "thermal_zone0" )
-- }}}


volicon = widget({ type = "imagebox" })
volicon.image = image("/home/jerome/.config/awesome/icons/hp.png")
volumewidget = widget({ type = "textbox"})
vicious.register(volumewidget, vicious.widgets.volume,
  function(widget, args)
    local label = { ["♫"] = "♫", ["♩"] = "♩" }
    return " " .. args[1] .. " " .. label[args[2]]
  end, 2, "Master")


-- Create a textclock widget
mytextclock2 = awful.widget.textclock({ align = "right" },'<span color="#489EFF">%d/%m | %Hh%M:%S </span>', 1)




-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock2,


        upicon, netwidget,      dnicon,         separator,
        batbarwidget, memwidget2, spacer, memicon, separator,
        batwidget,              baticon,        separator,
        thermalwidget,          thermicon,      separator,
        uptimewidget,
        volumewidget,           volicon,        separator,
        cpuwidget,              cpuicon,        separator,
        mountwidget,                            separator,



        s == 1 and mysystray or nil,
--        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}




-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    awful.key({modkey}, "o", awful.client.movetoscreen),


    -- perso keys
    awful.key({ modkey, "Control" }, "f", function () awful.util.spawn("firefox")                                       end),
    awful.key({ modkey, "Control" }, "i", function () awful.util.spawn("x-terminal-emulator -x irssi")                  end),
    awful.key({ modkey, "Control" }, "p", function () awful.util.spawn("x-terminal-emulator -x ping -i 0.2 8.8.8.8")    end),
    awful.key({ modkey, "Control" }, "m", function () awful.util.spawn("x-terminal-emulator -x mocp -T /home/jerome/.moc/theme/perso")  end),
    awful.key({ modkey, "Control" }, "a", function () awful.util.spawn("x-terminal-emulator -x mutt")                   end),
    awful.key({ modkey, "Control" }, "o", function () awful.util.spawn("x-terminal-emulator -x xset dpms force off")    end),
    awful.key({ modkey, "Control" }, "q", function () awful.util.spawn("x-terminal-emulator -x xset dpms force on")     end),
    awful.key({ modkey, "Control" }, "l", function () awful.util.spawn("x-terminal-emulator -x slock")                  end),
    awful.key({ modkey, "Control" }, ":", function () awful.util.spawn("x-terminal-emulator -x tudu")                   end),
    awful.key({ modkey, "Control" }, "c", function () awful.util.spawn("x-terminal-emulator -x tty-clock -sc")          end),
    awful.key({ modkey, "Control" }, "y", function () awful.util.spawn("x-terminal-emulator -x mpsyt")          end),

    awful.key({ modkey, "Control" }, "g", function () awful.util.spawn("mocp -G")                                       end),
    awful.key({ modkey, "Control" }, "t", function () awful.util.spawn("mocp -f")                                       end),
    awful.key({ modkey, "Control" }, "b", function () awful.util.spawn("mocp -r")                                       end),

    awful.key({ }, "XF86AudioPlay", function () awful.util.spawn("mocp -G")                                       end),
    awful.key({ }, "XF86AudioPrev", function () awful.util.spawn("mocp -r")                                       end),
    awful.key({ }, "XF86AudioNext", function () awful.util.spawn("mocp -f")                                       end),
    awful.key({ }, "XF86AudioStop", function () awful.util.spawn("mocp -p")                                       end),

    awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn("sudo amixer -c 0 set Master 5%+")       end),
    awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("sudo amixer -c 0 set Master 5%-")       end),
    awful.key({ }, "XF86AudioMute", function () awful.util.spawn("sudo amixer -c 0 set Master 0%")                end),


    awful.key({ }, "XF86Display", function () awful.util.spawn("xrandr --output VGA1 --mode 1280x1024 --right-of LVDS1")                                       end),

    awful.key({ }, "XF86Back", awful.tag.viewprev),
    awful.key({ }, "XF86Forward", awful.tag.viewnext),

    awful.key({ }, "Print", function () mountmode=1                     end),
    awful.key({ }, "Scroll_Lock", function () mountmode=2               end),
    awful.key({ }, "Pause", function () mountmode=3                     end),

    awful.key({ }, "XF86Launch1", function () awful.util.spawn("x-terminal-emulator -x /bin/bash")              end),




    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,            }, "F1",     function () awful.screen.focus(2) end),
    awful.key({ modkey,            }, "F2",     function () awful.screen.focus(1) end),
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}


-- Démarrer le widget de network manager

os.execute("killall nm-applet &")
os.execute("nm-applet &")


