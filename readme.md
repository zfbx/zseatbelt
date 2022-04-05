# zseatbelt - A Better FiveM Seatbelt System

## This project, as neat as it was.. is unreliable with the FiveM api for unknown reasons so for that reason this project is now archived

[![MIT License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge&logo=opensourceinitiative)](https://opensource.org/licenses/MIT)
[![Donate on PayPal](https://img.shields.io/badge/Donate-PayPal-%2300457C?style=for-the-badge&logo=paypal)](https://paypal.me/zfbx)
[![Sub on Patreon](https://img.shields.io/badge/Support-Patreon-%23FF424D?style=for-the-badge&logo=patreon)](https://www.patreon.com/zfbx)
[![Buy Me a Pizza](https://img.shields.io/badge/Pizza-BuyMeACoffee-%23FFDD00?style=for-the-badge&logo=buymeacoffee)](https://www.buymeacoffee.com/zfbx)

Most resources out there I've seen all use the same method of ejecting you out of car without a seatbelt but I thought they seemed a bit resource heavy so I made this built on a completely different concept using FiveM natives to handle the physics checking.

## Features
- Completely standalone, no dependencies
- Adjustable velocity for at what speed you get ejected when not wearing a seatbelt
- Buckle and Unbuckle sounds (Can be disabled)
- Has visual indicator when seatbelt isn't buckled (can be disabled)
- Buckle sounds for everyone else in the car with you (can be disabled)
- When seat buckled you can't get out of the car (can be disabled)
- Export for your current seatbelt status `exports.seatbelt:status()`
- Only uses 0.00-0.01ms normally and ~0.03ms while in vehicle

## Support
I've built and polished this standalone resource from the ground up for free and open sourced it for you. If you enjoy it and would like to send a thanks I have a [ko-fi](https://ko-fi.com/zfbx8), [Paypal](https://paypal.me/zfbx) and I even have a [Patreon](https://www.patreon.com/zfbx)! Any and all support is greatly appreciated but in no way manditory, all my resources will be free and open source :)


## How to use
1. Copy the inner `zseatbelt` directory into your fiveM resources (not the one with the this readme.md in it)
2. Add `ensure zseatbelt` (or whatever you renamed it to) to your server's .cfg
3. Add `setr game_enableFlyThroughWindscreen true` to the top of your server's .cfg **Without this the script wont work**
4. Adjust the `config.lua` variables to how you'd like them.


## FAQ
- Why does seatbelt buckles and unbuckles at the same time when I toggle it?
    So if you had a seatbelt resource before that used the same bind (If you still do, make sure you remove it), it might still be saved in your keybinds.
    To fix go to `ESC` -> `SETTINGS` -> `Keybinds` -> `FiveM` and find any other bindings that use the same one you have set (Default: B) if you see another bind in there for seatbelt and it doesn't have (zseatbelt) at the end, unbind it.


## License
I'm releasing this under the **MIT License** asking only that you preserve my credit (zfbx) in whatever you do with it :)

## Note
This concept is new as far as I'm aware and might have some weirdness, I'm totally not sure as I haven't been able to test it with other people, if you notice anything feel free to submit an [issue](https://github.com/zfbx/zseatbelt/issues).

