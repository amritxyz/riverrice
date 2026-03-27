exec gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
exec gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
exec gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
exec gsettings set org.gnome.desktop.interface cursor-size 16
exec gsettings set org.gnome.desktop.interface font-name 'sans 14'
exec gsettings set org.gnome.desktop.interface monospace-font-name 'mono 12'
exec gsettings set org.gnome.desktop.session session-name 'wlroots'
exec gsettings set org.gnome.desktop.wm.preferences button-layout 'none'
exec gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'none'
exec gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'none'
exec gsettings set org.gnome.desktop.wm.preferences action-left-click-titlebar 'none'
exec gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'none'
exec gsettings set org.gnome.desktop.wm.preferences titlebar-font 'none'

exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
exec systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
