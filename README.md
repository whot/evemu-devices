evemu-devices - device recordings database
==========================================

This is a collection of input devices recorded by evemu. These files can be
used to simulate physical input devices and re-play device events to
reproduce behaviours or bugs of applications.

For more information about evemu, see:
http://wiki.freedesktop.org/wiki/Evemu
http://cgit.freedesktop.org/evemu/

Please note: use evemu 1.10 or later if possible. This version only requires
a single event recording instead of a separate recording for the device and
the events. evemu has few dependencies and can easily be built from git.

Adding devices
--------------
If you have a device that is not part of this repository please record it
and send a pull request.

Naming convention for files: NAME.DESC.evemu

* NAME is the device name (grep for the "N: " line in the recording).
* DESC is a short description to indicate the type of events recorded (tap, double-tap, two-finger scroll, etc.). If a recording is more complex than that, please add a comment to the recordings file directly explaining the sequence.

Keep event sequences to a bare minimum to avoid unnecessarily slow simulations.

What to record
--------------
All devices need a device description format.

   sudo evemu-device /dev/input/event0 > device-name.desc

The below describes what event recordings will likely be useful in debugging
your device. Substitute NAME with the name of your device.

If your device is a keyboard:
* NAME.qwerty.evemu: the top-left 5 keys (qwerty in us layout, azerty in fr, etc.) hit in left-to-right order
* NAME.multimediakeys.evemu: the multimedia keys in left-to-right order. If one isn't working, note this in a comment at the top of the file

If your device is a mouse or trackball:
* NAME.buttons.evemu: the mouse buttons in logical order (add a comment where it's not obvious). Ideally without mouse movement
* NAME.motion.evemu: left, right, up, down, in that order, as straight as you can manage
* NAME.scroll.evemu: up, down, left, right scroll events, in that order (where possible), ideally without mouse movement

If your device is a touchpad:
* NAME.buttons.evemu: physical button presses in logical order
* NAME.clickpad.evemu: clickpad button press
* NAME.two-finger-vscroll.evemu: up, down two-finger scrolling, in that order.
* NAME.two-finger-hscroll.evemu: left, right two-finger scrolling, in that order.
* NAME.edge-vscroll.evemu: right edge one-finger scroll, up, down
* NAME.edge-hscroll.evemu: bottom edge one-finger scroll, left, right
* NAME.tap.evemu: single-finger tap

if your touchpad supports multiple fingers, record a gesture with 3, 4, 5...
fingers as well and name it appropriately.

Using devices
-------------
See the evemu man pages for how to create devices and re-play events.