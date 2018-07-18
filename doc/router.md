# Router Setup

I performed the following steps with the Netgear Nighthawk M1 router using its web
interface on `http://192.168.1.1`.

1. **Router Password**
   On first login the router password must be set
2. **Mobile Internet**
   For most mobile operators the SIM card should be detected without further APN
   configuration. Make sure the SIM security is deactivated or you need to enter
   PIN on every startup. You may also enable the roaming option if you want to
   run the device on foreign beaches. In this case the SIM should have an
   international data plan of course.
3. **Firmware Update**
   For the latest bug fixes perform an update under *Administration / Firmware Update*.
4. **WiFi**
   Under *Setup / Wifi Profiles* select *2.5 GHz Only* to save energy.
   Under *Setup / Wireless* set a SSID and password for the 2.4 GHz network.
   For best wireless experience set the WiFi standby to *60 Minutes* and the
   range to *Long*.
5. **USB Port**
   As we use the USB port for charging only under *Setup / Mobile Router Setup*
   set *Tethering* to *Charge only*.
6. **Ethernet**
   To avoid disconnecting the Raspberry Pi from under *Setup / Mobile Router Setup*
   select *Disabled* for *Ethernet Standby*.

   
   