# Power Management

With the USB tester plug I measured the following currents for the different BeachHub
devices. As all devices are powered with USB connectors the voltage is 5V in all cases.


Device                  | Min    | Max   
----------------------- | ------ | ------
Router (not charging)   | 0.25 A | 0.45 A     
Raspberry Pi 3 B+       | 0.38 A | 0.75 A
Mini Fan                | 0.12 A | 0.16 A


--> You can quantify power requirements of any specific device you have with lsusb -v and the MaxPower property.

## Bad Cables

It turned out that some of the USB cables I tested cause such a significant voltage
drop that the Raspberry Pi goes off. To avoid such surprises I checked all cables
used in BeachHub with the USB tester:

1. Find a constant and strong power source (charger or large power bank)
2. Connect a heavy load (empty smart phone oder battery back) with a the USB tester
   to the power source. Write down the voltage shown by the tester.
3. Now insert the cable in question between the power source and the USB tester.
   Note the voltage shown now.
 
If the voltage is decreased by more that 0.2V or the voltage measured in step 3
is less than 4.8V you can't run a Raspberry Pi reliable on this cable.

## Under Voltage

If the supplied voltage is too low the CPU gets throttled. With the following command you can check whether this or was the case:

    vcgencmd get_throttled
    
The bits in the returned integer have the following meanings:

| Bit | Meaning |
|:---:|---------|
| 0   | Under-voltage detected |
| 1   | Arm frequency capped |
| 2   | Currently throttled |
| 3   | Soft temperature limit active |
| 16  | Under-voltage has occurred |
| 17  | Arm frequency capped has occurred |
| 18  | Throttling has occurred |
| 19  | Soft temperature limit has occurred |
