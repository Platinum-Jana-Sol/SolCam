# SolCam
![](https://github.com/Platinum-Jana-Sol/SolCam/blob/main/images/SolCamLogo-01.png?raw=true)
![](https://github.com/Platinum-Jana-Sol/SolCam/blob/main/images/SolCamText.png?raw=true)

An all new library to make any level more dynamic! Add custom cameras to any stage, allowing for more dynamic setpieces!

### Features

- An all new camera system entirely controlled by the mapper!
- Two new camera modes to make more dynamic levels!
- Compatibility with Goldenshine's Rails
- Partial compatibility with Axis2D


# How to use:
1. Add `lua.solcam = on`  to your levelheader to enable the camera
2. Create a control sector
3. Set up a linedef trigger
4. Set a line on the sector to type 443, Call Lua Function
5. Input the desired SolCam function in the "Function Name" field to select a mode
----

## Important Notes:
- BINARY MAPPING IS NOT RECOMMENDED FOR THIS TOOL
- Using any autocancel condition will cause a camera snap, and will not be interpolated! If you wish to have a smooth return to default controls, please use the Default camera transition
----

## Default mode
This is the "OFF" mode of SolCam, where other cameras can take over, or where the player camera has input.

### Function Name: SOLCAMDF
### UDMF Arguments:
- Argument 1: Camera Transition Time [ticks]
- Argument 2: Angle for Exiting Camera [degrees]

### Binary Arguments
- Linedef Angle: Angle for Exiting Camera [degrees]

![](https://github.com/Platinum-Jana-Sol/SolCam/blob/main/images/DFArgs.png?raw=true)

----

## Orbital mode
Set a fixed camera that follows the player.

### Function Name: SOLCAMOR
### UDMF Arguments:
- Argument 1: Camera Transition Time [ticks]
- Argument 2: Camera Distance from Player [fracunits]
- Argument 3: Angle from Player [degrees]
- Argument 4: Camera Height Offset relative to Player [fracunits]
- Argument 5: Autocancel after [ticks]
- String Argument 2: Extra Autocancel Condition

### Binary Arguments
- Front Side X Offset: Camera Distance from Player [fracunits]
- Linedef Angle: Angle from Player [degrees]
- Front Side Y Offset: Camera Height Offset relative to Player [fracunits]

### Autocancel Conditions
- `jump`:  SolCam cancels upon a jump
- `spring`: SolCam cancels when sprung
- `grounded`: SolCam cancels when you hit the ground
- `carry`: SolCam cancels when you get carried by something

![](https://github.com/Platinum-Jana-Sol/SolCam/blob/main/images/ORArgs.png?raw=true)

----

## Static Point mode
Like the original Alternate Viewpoint, except upgraded!
Note, this requires you to place an Alternate Viewpoint Thing to use this mode, and either tag it directly to the linedef (UDMF) or tag the sector its in to the linedef (Binary)

### Function Name: SOLCAMSP
### UDMF Arguments:
- Argument 1: Camera Transition Time [ticks]
- Argument 2: Tag of Alternate Viewpoint Mapthing [number]
- Argument 5: Autocancel after [ticks]
- String Argument 2: Extra Autocancel Condition

### Binary Arguments
- Front Side X Offset: Camera Transition Time [ticks]
- Tag: Sector tag where the Alternate Viewpoint Mapthing resides [number]

### Autocancel Conditions
- `jump`:  SolCam cancels upon a jump
- `spring`: SolCam cancels when sprung
- `grounded`: SolCam cancels when you hit the ground
- `carry`: SolCam cancels when you get carried by something

![](https://github.com/Platinum-Jana-Sol/SolCam/blob/main/images/SPArgs.png?raw=true)

----

More updates and modes are planned for this in the future! Stay tuned!
