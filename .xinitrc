#!/bin/sh

# Source some scripts
 
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi



# Merge .Xresources file 
 
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
 


# set cursor, backround and keyboard 

xsetroot -cursor_name left_ptr &

sh ~/.fehbg &

setxkbmap gb



# Let's Go!!!

exec xmonad
