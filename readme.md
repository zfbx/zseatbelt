# FiveM Seatbelt System

Most resources out there I've seen all use the same method of ejecting you out of car without a seatbelt but I thought they seemed a bit resource heavy so I made this built on a completely different concept using FiveM natives to handle the physics checking.

## Features
- Completely standalone, no dependencies
- Adjustable velocity for at what speed you get ejected when not wearing a seatbelt
- Buckle and Unbuckle sounds (Can be disabled)
- Buckle sounds for everyone else in the car with you (can be disabled)
- When seat buckled you can't get out of the car (can be disabled)
- Export for your current seatbelt status `exports.seatbelt:status()`

## Support

I've built and polished this standalone resource from the ground up for free and open sourced it for you. If you enjoy it and would like to send a thanks I have a [ko-fi](https://ko-fi.com/zfbx8), [Paypal](https://paypal.me/zfbx) and I even have a [Patreon](https://www.patreon.com/zfbx)! Any and all support is greatly appreciated but in no way manditory, all my resources will be free and open source :)


## How to use

1. Copy the `seatbelt` directory into your fiveM resources (rename it if you'd like)
2. Add `ensure seatbelt` (or whatever you renamed it to) to your server's .cfg
3. Add `setr game_enableFlyThroughWindscreen true` to the top of your server's .cfg **Without this the script wont work**
4. Adjust the `config.lua` variables to how you'd like them.


## License

I'm releasing this under the **MIT License** asking only that you preserve my credit (zfbx) in whatever you do with it :)

## Note

This concept is new as far as I'm aware and might have some weirdness, I'm totally not sure as I haven't been able to test it with other people, if you notice anything feel free to submit an [issue](https://github.com/zfbx/FiveM-Seatbelt/issues).

Also I might add an optional visual indicator in the future that would be configurable
