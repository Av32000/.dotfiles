#!/bin/bash
plasma-apply-colorscheme BreezeLight
kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key theme "__aurorae__svg__McMojave-light"
qdbus org.kde.KWin /KWin reconfigure
spicetify config color_scheme purple-light
spicetify apply
