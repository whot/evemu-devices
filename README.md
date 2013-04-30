evemu-devices - device recordings database
==========================================

This is a collection of input devices recorded by evemu. These files can be
used to simulate physical input devices and re-play device events to
reproduce behaviours or bugs of applications.

For more information about evemu, see:
http://wiki.freedesktop.org/wiki/Evemu
http://cgit.freedesktop.org/evemu/


Adding devices
--------------
If you have a device that is not part of this repository please record it
and send a pull request.

Naming conventions:
* device descriptions produced by evemu-describe:
  "device name.desc"
* event recordings produced by evemu-record:
  "device name.short-description.events"

Where the short description indicates the type of events recorded (tap,
double-tap, two-finger scroll, etc.). If a recording is more complex than
that, please add a comment to the recordings file directly explaining the
sequence.

Keep event sequences to a bare minimum to avoid unnecessarily slow
simulations.

Using devices
-------------
See the evemu man pages for how to create devices and re-play events.
