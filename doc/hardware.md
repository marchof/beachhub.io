# Hardware

The following requirements were to consider when building the beachhub.io data center:

* **Power Supply:** The entire system should only be operated on solar power. Therefore total power consumption must be
  handled by a portable solar panel. To guarantee continuous operations a re-chargeable battery should buffer
  temporary drops in the solar power supply. For ease of integration I only considered distributing power with USB
  connections.
* **WiFi Access:** To make the hub accessible on the beach a WiFi network should be provided which lasts for at least a
  handful of devices.
* **Internet Connectivity:** The hub itself should have internet access and should also be accessible from the internet
  when active. Also it would be nice if the WiFi network could serve as a hotspot.

Considering these requirements I came up with the following setup:

## Solar Panels

I'm a big fan of Anker hardware for cables and power supplies. So my natural
choice was their *PowerPort Solar Charger 21W*. It has two USB ports with up to
2.4A each (but only 3A in total). You may easily figure out that this makes 15W
and not 21W as the name suggests -- but hey, this is how product marketing
works. Fortunately this is still enough for our setup. The panel is somehow
flexible and can be folded to a flat, portable package. The solar cells are
covered in a robust canvas which has four loops (each in every corner) so the
panel can be easily installed in different environments.

## Server

As a widely adopted low energy computing platform I picked a *Raspberry Pi 3 B+*
board. It has all the connectivity we need and is powerful enough to host Git
repos and maybe provide some simple means of continuous integration. I added
two persistent volumes to it:

1. A 32GB micro SD card for the operating system and all software
2. A small 64GB USB stick for all data (Git repos)

Separating the data from the system volumes allows me to update or re-stage the
system on the latter without worrying about the data.

To help with cooling under beach conditions I attached the heat sinks delivered
with the case and installed a small USB powered fan. It looks like the this
combination significantly reduces CPU temperature.


## 4G WIFI Router

While quite expensive though the best option currently on the market seems to be the Netgear Nighthawk M1. While it has
a quite compact form factor it encapsulates a gigabit 4G an WIFI router. A comparison with a stationary Huawai B593s-22
under identical, poor signal conditions showed that the signal received by the M1 is significant lower and so is the
bandwidth (Huawai 20 MBit/s down, 6 MBit/s up / Netgear 5 MBit/s down, 4MBit/s up). Maybe the signal strength can be
improved with external antennas. For this the M1 has two TS-9 connectors.

The router can be flexible configured and especially allows to map ports from the public IP to our Raspberry Pi for
access to BeachHub from the public internet (i.e. people not spending a nice day at the same beach). The WiFi provides a
2.4 GHz and a 5 GHz band and allows up to 20 concurrent user. Few even stationary routers come with such a feature set.

On top of this the hardware and its connectivity is ideal for our setup: There is one ethernet port which can be used for a
direct, reliable connection to the Raspberry Ri. It also comes with two different USB port: A USB-C port can be used for
charging from the solar panel. An additional USB 2.0 port provides power from its internal battery. We connect the raspberry
to this port for power supply. The nice side effect is that the internal router battery now serves as a kind of UPS for the
Raspberry Pi in case we have temporary drops in the solar power. What is also nice is that the power supply of the USB 2.0
port is switched with the router. So we can power up and down our whole data center with a single button.

## Mini USB Fan

As small small enough to directly fit in the Raspberry Pi case should help to
control the CPU temperature. It has an USB cable and its power consumption is
so small that it can be directly plugged in one of the Pi's USB ports.

## Wiring

For a minimal setup the wiring is quite simple:

- Long UBS 2.0/USB-C cable to connect the solar panel with the router (power supply)
- Short USB 2.0 cable to connect the router with the Raspberry Pi (power supply)
- The mini fan is plugged directly to a Raspberry Pi's USB port (power supply)
- Short ethernet cable to connect the router with the Raspberry Pi (network)

## Additional Hardware

- **Eithernet Hub** A small USB powered hub to connect additional devices if required.
- **Power Monitor** This small device can be plugged into a USB connection and shows voltage, current
  power and accumulated energy consumption. This device helped me to figure out what the solar panel
  actually can handle.

