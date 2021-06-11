-- Note: You must have "setr game_enableFlyThroughWindscreen true" in your server cfg

-- repository: https://github.com/zfbx/zSeatbelt
-- License: MIT Open Source by https://github.com/zfbx
-- Support: https://www.patreon.com/zfbx | https://paypal.me/zfbx

fx_version 'cerulean'
games { 'gta5' }

author 'zfbx'
description 'zSeatbelt - a seatbelt/ejection system'
version '1.0.0'

client_scripts {
    'config.lua',
    'client/main.lua',
}

server_scripts {
    'config.lua',
    'server/main.lua',
}

ui_page "client/html/index.html"

-- Files needed for NUI
files {
    'client/html/index.html',
    'client/html/buckle.ogg',
    'client/html/unbuckle.ogg',
}