# SolCam
![](https://github.com/Platinum-Jana-Sol/SolCam/blob/main/images/SolCamLogo-01.png?raw=true)
![](https://github.com/Platinum-Jana-Sol/SolCam/blob/main/images/SolCamText.png?raw=true)

An all new library to make any level more dynamic! Add custom cameras to any stage, allowing for more dynamic setpieces!

### Features

- An all new camera system entirely controlled by the mapper!
- Two new camera modes to make more dynamic levels!
- Compatibility with Goldenshine's Rails
- Partial compatibility with Axis2D
- Full Lua support! Call it to make more engaging levels or bosses!


# How to use (Mapping):
1. Add `lua.solcam = on`  to your levelheader to enable the camera
2. Create a control sector
3. Set up a linedef trigger
4. Set a line on the sector to type 443, Call Lua Function
5. Input the desired SolCam function in the "Function Name" field to select a mode
----

## Important Notes:
- BINARY MAPPING IS NOT RECOMMENDED FOR THIS TOOL
- Using any autocancel condition may have some jank, be aware that the transitions may not be perfect
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

## Static Point Fixed mode
This literally is the original Static Point Mode!
Note, this requires you to place an Alternate Viewpoint Thing to use this mode, and either tag it directly to the linedef (UDMF) or tag the sector its in to the linedef (Binary)

### Function Name: SOLCAMSF
### UDMF Arguments:
- Argument 1: Camera Transition Time [ticks]
- Argument 2: Tag of Alternate Viewpoint Mapthing [number]
- Argument 5: Autocancel after [ticks]
- Angle of mapthing: Direction to Point the Camera in [angle]
- Tilt of mapthing: The vertical tilt angle of the Camera [angle]
- String Argument 2: Extra Autocancel Condition

### Binary Arguments
- Front Side X Offset: Camera Transition Time [ticks]
- Tag: Sector tag where the Alternate Viewpoint Mapthing resides [number]
- Angle: The direction in which the camera points [angle]

### Autocancel Conditions
- `jump`:  SolCam cancels upon a jump
- `spring`: SolCam cancels when sprung
- `grounded`: SolCam cancels when you hit the ground
- `carry`: SolCam cancels when you get carried by something

----

# How To Use (Lua):
1. Add `lua.solcam = on`  to your levelheader to enable the camera (yes this means sol cam only works in supported maps, even via lua to prevent camera issues)
2. Call the functions below to transition the camera

----

## Default mode
This is the "OFF" mode of SolCam, where other cameras can take over, or where the player camera has input.

### Function Name: SC_SetDefaultMode(player, transitiontime, XYangle)
### Arguments:
- player: The Player this function is being called for [player_t]
- transitiontime: the time for the camera transition [ticks]
- XYangle: The angle to transition the camera to before giving control back to the player [angle_t]

----

## Orbital mode
Set a fixed camera that follows the player.

### Function Name: SC_SetOrbitalMode(player, transitiontime, radius, XYangle, Zheight[[, canceltics], cancelflag])
### Arguments:
- player: The Player this function is being called for [player_t]
- transitiontime: Camera Transition Time [ticks]
- radius: Camera Distance from Player [fixed_t]
- XYangle: Angle from Player [angle_t]
- Zheight: Camera Height Offset relative to Player [fixed_t]
- canceltics: Autocancel after [ticks] (set to zero to not cancel)
- cancelflag: Extra Autocancel Condition [string]

### Autocancel Conditions
- `jump`:  SolCam cancels upon a jump
- `spring`: SolCam cancels when sprung
- `grounded`: SolCam cancels when you hit the ground
- `carry`: SolCam cancels when you get carried by something

----

## Static Point mode
Like the original Alternate Viewpoint, except upgraded! This version doesnt need an object in the map and can be set to any arbitrary position!

### Function Name: SC_SetStaticPointMode(player, transitiontime, pointX, pointY, pointZ[[, canceltics], cancelflag])
### Arguments:
- player: The Player this function is being called for [player_t]
- transitiontime: Camera Transition Time [ticks]
- pointX: X position of the camera [fixed_t]
- pointY: Y position of the camera [fixed_t]
- pointZ: Z position of the camera [fixed_t]
- cancelticks: Autocancel after [ticks] (set to zero to not cancel)
- cancelflag: Extra Autocancel Condition [string]

### Autocancel Conditions
- `jump`:  SolCam cancels upon a jump
- `spring`: SolCam cancels when sprung
- `grounded`: SolCam cancels when you hit the ground
- `carry`: SolCam cancels when you get carried by something

----

## Static Point Fixed mode
This literally is the original Static Point Mode! This version doesnt need an object in the map and can be set to any arbitrary position!

### Function Name: SC_SetStaticPointFixedFocusMode(player, transitiontime, pointX, pointY, pointZ, angle, tilt[[, canceltics], cancelflag])
### Arguments:
- player: The Player this function is being called for [player_t]
- transitiontime: Camera Transition Time [ticks]
- pointX: X position of the camera [fixed_t]
- pointY: Y position of the camera [fixed_t]
- pointZ: Z position of the camera [fixed_t]
- angle: angle for where the camera should look [angle_t]
- tilt: the tilt angle for where the camera should look [angle_t]
- cancelticks: Autocancel after [ticks] (set to zero to not cancel)
- cancelflag: Extra Autocancel Condition [string]

### Autocancel Conditions
- `jump`:  SolCam cancels upon a jump
- `spring`: SolCam cancels when sprung
- `grounded`: SolCam cancels when you hit the ground
- `carry`: SolCam cancels when you get carried by something

----

More updates and modes are planned for this in the future! Stay tuned!
