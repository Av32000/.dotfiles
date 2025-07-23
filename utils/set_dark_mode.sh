#!/bin/bash
plasma-apply-colorscheme BreezeDark
kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key theme "__aurorae__svg__McMojave"
qdbus org.kde.KWin /KWin reconfigure
spicetify config color_scheme purple-dark
spicetify apply
