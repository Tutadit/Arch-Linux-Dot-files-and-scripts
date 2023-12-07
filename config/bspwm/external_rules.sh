#!/bin/bash

wid=$1
class=$2
instance=$3

title=$(xdotool getwindowname $wid)

case "$instance.$class.$title" in
    *[wW]hats[aA]pp*)
	echo "state = tiled"
	echo "desktop = ^20"
    ;;
*wa:laravel*)
    echo "state = tiled"
    echo "desktop = ^13"
    ;;
*wa:localhost*)
    echo "state = tiled"
    echo "desktop = ^11"
;;
*wa:tailwindcss*)
    echo "state = tiled"
    echo "desktop = ^12"
;;  
*wa:hostwinds*)
    echo "state = tiled"
    echo "desktop = ^20"
;;
*[iI]nkscape*)
    echo "state = tiled"
    echo "desktop = ^18"
;;
*-studio*)
	echo "state = tiled"
;;	
*wa:google*)
	echo "state = floating"	
	echo "rectangle = 1920x1040+0+40"	
	echo "border = off"
	echo "sticky = on"
	echo "layer = above"	
;;
*[Mm]inecraft*)
	echo "desktop = ^6"
	echo "state = tiled"
;;
*[Oo]pening*)
	echo "state = pseudo_tiled"
;;
*File*Upload*)
	echo "state = floating"
;;
*wa:miro*)
	echo "state = tiled"
	echo "desktop = ^8"
;;
*wa:icloud*)
	echo "state = pseudo_tiled"
	echo "desktop = ^7"
;;
*wa:outlook*)
	echo "state = pseudo_tiled"
	echo "desktop = ^8"
;;
*wa:*)
	echo "state = floating"
	echo "desktop = ^15"
	echo "rectangle = 1866x981+27+72"
	echo "follow = on"	
	echo "manage = on"
;;
*ImageMagick*)
	echo "state = pseudo_tiled"
;;
*[zZ]oom*)
	echo "state = pseudo_tiled"
	echo "desktop = ^8"
;;
*[sS]lack*)
	echo "state = tiled"
	echo "desktop = ^4"
;;
*[Tt]icker*)
	echo "state = tiled"
	echo "desktop = ^8"
	echo "split_dir = north"
	echo "split_ratio = 0.18"
;;
*[Tt]imelord*)
	echo "state = pseudo_tiled"
	echo "desktop = ^9"
	echo "follow = true"
;;
*W3M*)
	echo "state = tiled"
	echo "desktop = ^7"
	echo "follow = true"
;;
*NewsByJP*)
	echo "desktop = ^8"
	echo "state = pseudo_tiled"
	echo "follow = true"
	;;
*designer.gravit.io*)
	echo "state = tiled"
	echo "desktop = ^3"
	;;

*Tickrs*)
	echo "desktop = ^8"
	echo "split_dir = east"
	echo "rectangle = 1920x300+0+0"
	echo "follow = true"
	echo "state = tiled"
	;;
*.[Ff]irefox*)
	echo "desktop = ^11"
	echo "follow = true"
	;;
*FloatingShell*)
	echo "state = floating"
	echo "border = off"	
	echo "rectangle = 1920x80+0+1000"	
	echo "monitor = HDMI-A-0"
	;;
*CustomOverlay*)
	echo "state = floating"
	echo "border = off"
	echo "monitor = HDMI-A-0"
	;;
*[Cc]ode*)
	echo "state = tiled"	
	;;
*.[Aa]lacritty*)
	echo "state = tiled"
	;;
*[Ss]potify*)
	echo "state = floating"
	echo "sticky = on"
	echo "border = off"
	;;
*[Dd]iscord*)
	echo "state = tiled"
	echo "desktop = ^2"
	;;
*)
	echo "state = floating"
	;;
esac
