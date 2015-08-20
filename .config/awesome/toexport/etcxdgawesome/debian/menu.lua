-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Aide"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian_Applications_Accessibilité"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Applications_Bureautique"] = {
	{"LibreOffice Writer","/usr/bin/libreoffice --writer","/usr/share/icons/hicolor/32x32/apps/libreoffice-writer.xpm"},
}
Debian_menu["Debian_Applications_Dessin_et_image"] = {
	{"ImageMagick","/usr/bin/display.im6 logo:","/usr/share/pixmaps/display.im6.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Applications_Éditeurs"] = {
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"Xedit","xedit"},
}
Debian_menu["Debian_Applications_Émulateurs_de_terminaux"] = {
	{"Gnome Terminal","/usr/bin/gnome-terminal","/usr/share/pixmaps/gnome-terminal.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_Applications_Gestion_de_données"] = {
	{"LibreOffice Base","/usr/bin/libreoffice --base","/usr/share/icons/hicolor/32x32/apps/libreoffice-base.xpm"},
	{"Tomboy","/usr/bin/tomboy"},
}
Debian_menu["Debian_Applications_Gestion_de_fichiers"] = {
	{"Brasero","/usr/bin/brasero"},
	{"mc", "x-terminal-emulator -e ".."/usr/bin/mc","/usr/share/pixmaps/mc.xpm"},
	{"Nautilus","/usr/bin/nautilus","/usr/share/pixmaps/nautilus.xpm"},
}
Debian_menu["Debian_Applications_Interpréteurs_de_commandes"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
}
Debian_menu["Debian_Applications_Lecteurs"] = {
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"Xditview","xditview"},
	{"Xpdf","/usr/bin/xpdf","/usr/share/pixmaps/xpdf.xpm"},
}
Debian_menu["Debian_Applications_Programmation"] = {
	{"Python (v2.6)", "x-terminal-emulator -e ".."/usr/bin/python2.6","/usr/share/pixmaps/python2.6.xpm"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
}
Debian_menu["Debian_Applications_Réseau_Communication"] = {
	{"Evolution","/usr/bin/evolution","/usr/share/pixmaps/evolution.xpm"},
	{"Irssi", "x-terminal-emulator -e ".."/usr/bin/irssi"},
	{"Mutt", "x-terminal-emulator -e ".."/usr/bin/mutt","/usr/share/pixmaps/mutt.xpm"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"Xbiff","xbiff"},
}
Debian_menu["Debian_Applications_Réseau_Navigateurs_web"] = {
	{"Iceweasel","iceweasel","/usr/share/pixmaps/iceweasel.xpm"},
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Debian_menu["Debian_Applications_Réseau_Surveillance"] = {
	{"WICD","/usr/bin/wicd-gtk","/usr/share/pixmaps/wicd-gtk.xpm"},
}
Debian_menu["Debian_Applications_Réseau"] = {
	{ "Communication", Debian_menu["Debian_Applications_Réseau_Communication"] },
	{ "Navigateurs web", Debian_menu["Debian_Applications_Réseau_Navigateurs_web"] },
	{ "Surveillance", Debian_menu["Debian_Applications_Réseau_Surveillance"] },
}
Debian_menu["Debian_Applications_Sciences_Mathématiques"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"Gnuplot", "x-terminal-emulator -e ".."/usr/bin/gnuplot"},
	{"LibreOffice Math","/usr/bin/libreoffice --math","/usr/share/icons/hicolor/32x32/apps/libreoffice-math.xpm"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Applications_Sciences"] = {
	{ "Mathématiques", Debian_menu["Debian_Applications_Sciences_Mathématiques"] },
}
Debian_menu["Debian_Applications_Son_et_musique"] = {
	{"grecord (GNOME 2.0 Recorder)","/usr/bin/gnome-sound-recorder","/usr/share/pixmaps/gnome-grecord.xpm"},
	{"moc", "x-terminal-emulator -e ".."/usr/bin/mocp"},
}
Debian_menu["Debian_Applications_Système_Administration"] = {
	{"Debian Task selector", "x-terminal-emulator -e ".."su-to-root -c tasksel"},
	{"Editres","editres"},
	{"Gnome Control Center","/usr/bin/gnome-control-center","/usr/share/pixmaps/gnome-control-center.xpm"},
	{"Reportbug", "x-terminal-emulator -e ".."/usr/bin/reportbug --exit-prompt"},
	{"Reportbug (GTK+)","/usr/bin/reportbug --exit-prompt --ui gtk2"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Applications_Système_Gestionnaires_de_paquets"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
	{"Synaptic Package Manager","x-terminal-emulator -e synaptic-pkexec","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Applications_Système_Matériel"] = {
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Applications_Système_Surveillance"] = {
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Applications_Système"] = {
	{ "Administration", Debian_menu["Debian_Applications_Système_Administration"] },
	{ "Gestionnaires de paquets", Debian_menu["Debian_Applications_Système_Gestionnaires_de_paquets"] },
	{ "Matériel", Debian_menu["Debian_Applications_Système_Matériel"] },
	{ "Surveillance", Debian_menu["Debian_Applications_Système_Surveillance"] },
}
Debian_menu["Debian_Applications_Vidéo"] = {
	{"Totem","/usr/bin/totem","/usr/share/pixmaps/totem.xpm"},
	{"VLC media player","/usr/bin/qvlc","/usr/share/icons/hicolor/32x32/apps/vlc.xpm"},
}
Debian_menu["Debian_Applications"] = {
	{ "Accessibilité", Debian_menu["Debian_Applications_Accessibilité"] },
	{ "Bureautique", Debian_menu["Debian_Applications_Bureautique"] },
	{ "Dessin et image", Debian_menu["Debian_Applications_Dessin_et_image"] },
	{ "Éditeurs", Debian_menu["Debian_Applications_Éditeurs"] },
	{ "Émulateurs de terminaux", Debian_menu["Debian_Applications_Émulateurs_de_terminaux"] },
	{ "Gestion de données", Debian_menu["Debian_Applications_Gestion_de_données"] },
	{ "Gestion de fichiers", Debian_menu["Debian_Applications_Gestion_de_fichiers"] },
	{ "Interpréteurs de commandes", Debian_menu["Debian_Applications_Interpréteurs_de_commandes"] },
	{ "Lecteurs", Debian_menu["Debian_Applications_Lecteurs"] },
	{ "Programmation", Debian_menu["Debian_Applications_Programmation"] },
	{ "Réseau", Debian_menu["Debian_Applications_Réseau"] },
	{ "Sciences", Debian_menu["Debian_Applications_Sciences"] },
	{ "Son et musique", Debian_menu["Debian_Applications_Son_et_musique"] },
	{ "Système", Debian_menu["Debian_Applications_Système"] },
	{ "Vidéo", Debian_menu["Debian_Applications_Vidéo"] },
}
Debian_menu["Debian_Jeux_Jouets"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Jeux"] = {
	{ "Jouets", Debian_menu["Debian_Jeux_Jouets"] },
}
Debian_menu["Debian"] = {
	{ "Aide", Debian_menu["Debian_Aide"] },
	{ "Applications", Debian_menu["Debian_Applications"] },
	{ "Jeux", Debian_menu["Debian_Jeux"] },
}
