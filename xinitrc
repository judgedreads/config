source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
xrandr --dpi 125 &
xautolock -locker slock &
setxkbmap -layout us -variant altgr-intl
xmodmap $HOME/.Xmodmap
xrdb .Xresources &
sh $HOME/.fehbg
synclient TouchpadOff=1
#exec gnome-session
#exec i3
#exec openbox-session
exec xmonad
