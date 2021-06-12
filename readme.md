# zSeatbelt - A Better FiveM Seatbelt System

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
1. Copy the `zseatbelt` directory into your fiveM resources (rename it if you'd like)
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
This concept is new as far as I'm aware and might have some weirdness, I'm totally not sure as I haven't been able to test it with other people, if you notice anything feel free to submit an [issue](https://github.com/zfbx/zSeatbelt/issues).

