# Zoom75 Wireless + VIA

Notes for the Meletrix **Zoom75 Wireless** keyboard (USB VID `0x1EA7`, Bluetooth VID `0x1EA8`, PID `0xCED3`).

Files in this folder:

- `zoom75_wireless_rgb-via-v33.json`: the VIA definition. VIA does not ship one for this keyboard, so you load it by hand.
- `zoom75_wireless_rgb.layout.json`: my saved layout (all layers). Load it from VIA's Configure tab, under "Save + Load".
- `kbd75hs-layout.json`: layout for a different keyboard (KBD75).

## Cmd key does nothing

### Quick fix

Press **Fn + the 2nd key from the left on the bottom row** (the Option key) once. Then test Cmd with Cmd+Space.

If that doesn't fix it, press **Fn + W** once to switch the keyboard to Mac mode.

### Why this works

My layer 0 bottom row (left to right) is:

| Position | 1 | 2 | 3 | 4 | right of Space |
| --- | --- | --- | --- | --- | --- |
| Layer 0 | Caps Lock | LAlt (Option) | LGUI (Cmd) | Space | `MO(1)` (Fn) |
| Layer 1 | – | **`TG_GUI`** | – | Out Usb | – |

- `MO(1)` is the Fn key. While you hold it, the keyboard uses layer 1.
- On layer 1, position 2 is `TG_GUI`, which means "toggle GUI". GUI is the Win/Cmd keycode. `TG_GUI` is a gaming-style "Win lock": while it's on, the keyboard drops every GUI keycode, from any key.
- So **Fn + Option** turns Cmd off. It's easy to hit by accident because the two keys sit close together. Pressing it again turns Cmd back on.
- The Cmd key is at position 3, not 2. So "Fn + the Cmd key" does nothing. The lock is on Fn + the key to its *left*.

Also on layer 1: **Fn + Q** = Win mode, **Fn + W** = Mac mode. Win mode can also change how Cmd/Option behave, so use Fn + W as a second step.

### How to tell where the problem is

1. **Check the Mac side first.** If these look clean, the problem is in the keyboard.
   - `pgrep -il karabiner`: nothing should be running.
   - `defaults -currentHost read -g | grep -A20 modifiermapping`: the `7847-52947-0` (USB) and `7848-52947-0` (Bluetooth) entries should map each key to itself (Src = Dst).
2. **Map the Cmd key to a letter in VIA** (for example `A`). If the letter types, the switch is fine. Then the keyboard is blocking the GUI keycode, which points to `TG_GUI`.
3. **Look at layer 1 in VIA** for `TG_GUI`, `GUI_OFF`, or anything else with "GUI" in the name.

### Things that did *not* fix it (October 2026)

- Removing the keyboard from Bluetooth and plugging in USB. The Mac side was never the problem.
- The plug-in combo **Space + LGui** (hold both while plugging in the cable), tried on both position 2 and position 3. My notes from August 2026 said this combo toggles a "Disable LGui" latch. It didn't help here. That August fix might also have been `TG_GUI`.

## Using VIA

Use https://usevia.app in Chrome, Edge, Arc, or Brave. Safari and Firefox can't talk to the keyboard. Connect over the **USB cable**. VIA doesn't work over Bluetooth.

### "Fetching v3 definition failed"

VIA doesn't know this keyboard. Load the definition:

1. Settings (gear icon) → turn on **Show Design tab**.
2. Design tab → **Load Draft Definition** → pick `zoom75_wireless_rgb-via-v33.json` from this folder.
3. Go to Configure and click **Authorize device** if VIA asks.

The browser remembers the definition until you clear its site data.

### "Receiving incorrect response for command" errors

This means VIA and the keyboard are out of step: each reply the keyboard sends answers the *previous* command. The keyboard is fine. To fix it:

1. Close every usevia.app tab and any VIA or Meletrix desktop app.
2. Unplug the keyboard and plug it back in.
3. Open **one** usevia.app tab and authorize again.

## Other hardware combos

From the [Meletrix user guide](https://meletrix.com/pages/meletrix-zoom75-user-guide):

- **Fn + Right Shift + R**: restart the keyboard.
- **Space + Backspace** held while plugging in: factory reset. This wipes the layout, so load `zoom75_wireless_rgb.layout.json` again afterwards.
- **Space + LCtrl** held while plugging in: swap Ctrl and Caps Lock.

## Firmware

- Check the version: `system_profiler SPUSBDataType | grep -A4 zoom75` (it was 1.11 in October 2026).
- Downloads: https://meletrix.com/pages/firmwares. The flashing tool is Windows-only, even though the page says it supports macOS.
