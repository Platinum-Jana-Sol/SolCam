/*
   _____       _  _____                
  / ____|     | |/ ____|               
 | (___   ___ | | |     __ _ _ __ ___  
  \___ \ / _ \| | |    / _` | '_ ` _ \ 
  ____) | (_) | | |___| (_| | | | | | |
 |_____/ \___/|_|\_____\__,_|_| |_| |_| v1.2
                                       
                           by Jana Sol
        Please do not edit or re-release as your own asset. 
		This script is exclusively for use in maps and mappacks.
				
                                                                      $$$$$$$$     &&$$$$$$$$$      
                                                                   $$$x:::;$$    $$$XXXXXX$$        
                                                                 $$x:::..:$$$$$$$$XXXXXXX$$         
                                                     $$$$X++$$$$$X:::....:$+...$$XXXXXXX$$          
                                       $$        $$$$;.........;;;:.......:;..$$XXXXXXXX$$          
                                       $$$$$$$$$$:............................$XXXXXXXXX$$          
                                        $$+:::................................$$XXXXXXXX$$          
                                          $$$::::::............................$$$XXXXXXX$$$        
                                           $$$$X:::::::...................::X;...x$$XXXXXXX$$&      
                                         $$x.....:xx:...................+$X....+:.;$$XXXXXXXX$$     
                                       $$x...................:+.......;$$$x..;$+...:$XXXXXXXXX$$    
                                      $$..............+.....;X........$$$$$X:$$$:..$$XXXXXXXXX$+$$  
                                    $$$..............X;....+$......;$$$$XXXX$XXX:..:$XXXXXXXXX$;+$$ 
                                   $$:.............X$::XX$$$:..+X$$$$XXXXXXXXXXX$;.:XXXXXXXXX$$;:$$ 
                                $$$+...........::::::.$$$$$$$$$$XXXX$&&&&X$&XXXXXXx..+$XXXXXX$$::;$ 
                             $$$X::::::::::::::::::...&&$$&&&&XXXXX$:::::&$XXXXXXXX$$:;$XXX$$$$::$$ 
                               $$$$$;;;;;;;;;XX:......$X$X::X&;XXXXx...&$:$XXXXXXXXXXX$$XX$$$$:::$$ 
        &&&                              $$X..........$$$X.;+&&$XXX+.&&&&:$XXXXXXX$$$XXXX$$$$:::+$  
       &$X$&    &&&&&                   $$;.......:...;$Xx.x&&&XXXXXx.$$x+XXXXXXXX$:$$X$$$$$::::+$  
       &&X::&&&&x;.:$&&                $X:.....:::....x$$Xx.;++XXXXXXXXXXXXXXXXXXX$::$$$$$+::::::$$ 
         &&x...:;...x$$$$$            $$...::::;::...$$XXXXXXXXX$$XXXXXXXXXXXXXXX$$::x$$x:::::.:::X$
         &$&&+....;$$XXXX$$$$$$$    $$$:::::XX:.....X$XXXXXXXXXXXXXXXXXXXXXXXXX$$$$:::;::::...::+XX$
         &X.:::...$$XXXXXXXXXXXXX$$$$$    $$$:.....:$$XXXXXXXXX$&&&&XXXXXXXXXX$$$$x:::.......:::+$$ 
         &&X;:::::$XXXXXXXXXXXXXXXXXXX$$$$$$::......X$$XXXXXXXX&&&$X$&XXXXXX$$$$$+::.............:$$
           &&&&&&&$$$XXXXXXXXXXXXXXXXXXXXXX$$$$$$:...$$$$XXXXXXXXXXXXXXXX$$$$$$X:::...............:$
                   $$$XXXXXXXXXXXXXXXXXXXXXXXXX$$$$X;;$$$$$$$$$$$$$$$$$$$$$$X;:::..;$..............x
                     $$$$$XXXXXXXXXXXXXXXXXXXXX$$xx::::+X$$x;:::xx$$$$Xxxx:+++;..;x$$XXXX++++;..+X+x
                        $$$$XXXXXXXXXXXXXXXXXXXXX$X::::::::+$+:..::::$$$$$++:;++++;$$XXXXXXX$$$$x:X$
                           $$$$XXXXXXXXXXXXXXXX$$+;;X:::.:::::::....:::$:::.....::+$XXXXXXXXXXXX$$$X
                              $$$$$XXXXXXXXXX$$X:...............:.....:::.....:XX$$$XXXXXXXXXXXXXXX$
                                  $$$$$$XX$$$$.....................................:$$XXXXXXXXXXXXXX
                                       $$$::.........................................$$XXXXXXXXXXXXX
                                         $$;:::::..::::..............................+$XXXXXXXXXXXXX
                                           $$$++++:::................................+$XXXXXXXXXXXXX
                                           $$x.......................................+$XXXXXXXXXXXXX
                                           $$........................................:$$XXXXXXXXXXXX
                                           $........+......................::.........;$$XXXX$XXXXXX
                                          $$......::;:......................:;:::.......x$XXXXX$$$$X
                                          $x.....:::;::......................x$:::::::::$$XXXXXXX$$ 
                                        $$X.:::::::$+::::...::..............:$$$$$$$$$$$XXXX$XXXX$$ 
                                      $$X;;::::;XXXX$:::::...:..............$$XXXXXXXXXXXXXX$XXXX$$ 
                                          $$$$$$XXXX$+::::::.X:::...........$$XXXXXXXXXXXXX$$XXX$$  
                                              $$XXXX$+:::::::;$x:::........::$$XXXXXXXXXXXX$XXXX$   
                                              $$XXXX$:::::::;$$$X:::..$;:::;x$$XXXXXXXXXXX$XXXXX$   
                                              $$XXX$+:::::xX$XXXX$$x:::+$$$XXXXXXXXXXXXXX$XXXXXX$   
                                               $$X$$$$$$$XXXXXXXXXXX$$XX$$$XXXXXXXXXXX$$XXXXXXXX$   
                                                $$XXXXXXXXXXXXXXXXXXXXXXX$$XXXXXXX$$$XXXXXXXXXXX$   
                                                 $$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX$$  
                                                 $$$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX$$  
                                                  $$$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX$$$ 
                                                   $$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX$$ 
                                                    $$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX$$$
                                                     $XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX$$
                                                     $$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
*/
local currentversion = 3
local versionstring = "v1.2"

if SolCam then
	print("SolCam already loaded. Checking version...")
	if SolCam.version == 1 then
		print("\133 WARNING: The SolCam already loaded is critically out of date, please inform the mapper to upgrade IMMEDIATELY")	
		return
	elseif SolCam.version > currentversion then
		print("SolCam in this mod is out of date, please tell mapper to upgrade it.")
		return
	else
		print("Updating SolCam to "..versionstring)
		SolCam.preloaded = true
	end
else
	rawset(_G, "SolCam", {version = currentversion, preloaded = false, hooksloaded = {}}) 
end
local axis2dloaded = false
if axis2dudmf then
	print ("Axis2D for UDMF loaded. SolCam may have some issues")
	axis2dloaded = true
end

freeslot("MT_SOLCAM", "S_SOLCAM")

mobjinfo[MT_SOLCAM] = {
	doomednum = -1,
	spawnstate = S_SOLCAM,
	spawnhealth = 1,
	speed = 0,
	radius = 1*FRACUNIT,
	height = 1*FRACUNIT,
	dispoffset = 0,
	mass = 100,
	damage = 0,
	flags = MF_NOSECTOR|MF_NOBLOCKMAP|MF_NOGRAVITY
}

states[S_SOLCAM] = {
	sprite = SPR_NULL,
	frame = nil,
	tics = -1,
	var1 = 0,
	var2 = 0,
	nextstate = S_SOLCAM
}

SolCam.GetClosestTurn = function(time, oldangle, newangle)
	local intoldangle = FixedInt(AngleFixed(oldangle))
	local intnewangle = FixedInt(AngleFixed(newangle))
	local del1 = intoldangle - intnewangle
	local del2 = intnewangle - intoldangle
	local delangle = oldangle - newangle
	if delangle < 0 then delangle = InvAngle(delangle) end
	if del1 > del2 then
		--print(tostring(FixedInt(AngleFixed(del1))).." > "..tostring(FixedInt(AngleFixed(del2))))
		local offset = ease.inoutsine(time, 0, delangle)
		return oldangle - offset
	else
		--print(tostring(FixedInt(AngleFixed(del2))).." >= "..tostring(FixedInt(AngleFixed(del1))))
		local offset = ease.inoutsine(time, 0, delangle)
		return oldangle + offset
	end
end

SolCam.GetControlStyle = function(player)
	if (player.pflags & PF_ANALOGMODE and PF_DIRECTIONCHAR) then 
		player.controlmode = "simple"
	elseif (player.pflags &~ PF_ANALOGMODE and player.pflags & PF_DIRECTIONCHAR) then 
		player.controlmode = "standard"
	elseif (player.pflags &~ (PF_ANALOGMODE and PF_DIRECTIONCHAR)) then 
		player.controlmode = "strafe"
	end
end

SolCam.ForceFreeControl = function(player)
	player.pflags = $|PF_ANALOGMODE|PF_DIRECTIONCHAR
	player.forcedcontrol = true
end

SolCam.ResetControlStyle = function(player)
	if player.controlmode == "simple" then
		player.pflags = $|PF_ANALOGMODE|PF_DIRECTIONCHAR
	elseif player.controlmode == "standard" then
		player.pflags = $&~PF_ANALOGMODE
		player.pflags = $|PF_DIRECTIONCHAR
	elseif player.controlmode == "strafe" then
		player.pflags = $&~PF_ANALOGMODE
		player.pflags = $&~PF_DIRECTIONCHAR
	end
	player.forcedcontrol = false
end

SolCam.GetOldCamPosRelative = function(player)
	if player.solcam.mode == "default" then
		player.solcam.old = {XYangle = player.cmd.angleturn<<16 + ANGLE_180, radius = CV_FindVar("cam_dist").value, Zheight = CV_FindVar("cam_height").value + (5*P_GetPlayerHeight(player)/7), mode = "default"}
	elseif player.solcam.mode == "orbital" then
		player.solcam.old = {XYangle = player.solcam.XYangle, radius = player.solcam.radius, Zheight = player.solcam.Zheight, mode = "orbital"}
	elseif player.solcam.mode == "staticpoint" then
		player.solcam.old = {x = player.solcam.x, y = player.solcam.y, z = player.solcam.z, mode = "staticpoint"}
	elseif player.solcam.mode == "brokentransition" then
		player.solcam.old = {x = player.solcam.x, y = player.solcam.y, z = player.solcam.z, mode = "brokentransition"}
	elseif player.solcam.mode == "staticpointfixed" then
		player.solcam.old = {x = player.solcam.x, y = player.solcam.y, z = player.solcam.z, XYangle = player.solcam.XYangle, Zangle = player.solcam.Zangle, mode = "staticpointfixed"}
	end
end

SolCam.DoSolCamTransition = function(oldmode, newmode, player)
	if (oldmode == "orbital" and newmode == "default") or 
	   (oldmode == "orbital" and newmode == "orbital") or 
	   (oldmode == "default" and newmode == "orbital") then
		local radius = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.radius, player.solcam.old.radius)
		local XYangle = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.XYangle, player.solcam.old.XYangle)
		--ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, newXYangle, oldXYangle)
		local Zheight = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.Zheight, player.solcam.old.Zheight)
		player.solcam.mobj.angle = XYangle + ANGLE_180
		--player.awayviewaiming = -R_PointToAngle2(0, 0, radius, Zheight)
		player.awayviewaiming = -R_PointToAngle2(0, player.mo.z, R_PointToDist2(player.mo.x + FixedMul(radius, cos(XYangle)), player.mo.y + FixedMul(radius, sin(XYangle)), player.mo.x, player.mo.y), player.mo.z + Zheight)
		P_MoveOrigin(player.solcam.mobj, player.mo.x + FixedMul(radius, cos(XYangle)), player.mo.y + FixedMul(radius, sin(XYangle)), player.mo.z + Zheight)
	elseif (oldmode == "default" and newmode == "staticpoint") or 
	       (oldmode == "orbital" and newmode == "staticpoint") then
		local x = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.x, FixedMul(player.solcam.old.radius, cos(player.solcam.old.XYangle))+player.mo.x)
		local y = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.y, FixedMul(player.solcam.old.radius, sin(player.solcam.old.XYangle))+player.mo.y)
		local z = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.z, player.solcam.old.Zheight+player.mo.z)
		player.solcam.mobj.angle = R_PointToAngle2(x, y, player.mo.x, player.mo.y)
		player.awayviewaiming = -R_PointToAngle2(0, player.mo.z, R_PointToDist2(x, y, player.mo.x, player.mo.y), z)
		P_MoveOrigin(player.solcam.mobj, x, y, z)
	elseif (oldmode == "default" and newmode == "staticpointfixed") or
		   (oldmode == "orbital" and newmode == "staticpointfixed") then
		local x = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.x, FixedMul(player.solcam.old.radius, cos(player.solcam.old.XYangle))+player.mo.x)
		local y = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.y, FixedMul(player.solcam.old.radius, sin(player.solcam.old.XYangle))+player.mo.y)
		local z = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.z, player.solcam.old.Zheight+player.mo.z)
		local XYangle = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.XYangle, player.solcam.old.XYangle + ANGLE_180)
		local Zangle = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.Zangle, R_PointToAngle2(0, 0, player.solcam.old.radius, player.solcam.old.Zheight))
		player.solcam.mobj.angle = XYangle
		player.awayviewaiming = Zangle
		P_MoveOrigin(player.solcam.mobj, x, y, z)
	elseif (oldmode == "staticpointfixed" and newmode == "default") or
		   (oldmode == "staticpointfixed" and newmode == "orbital") then
		local x = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, FixedMul(player.solcam.radius, cos(player.solcam.XYangle))+player.mo.x, player.solcam.old.x)
		local y = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, FixedMul(player.solcam.radius, sin(player.solcam.XYangle))+player.mo.y, player.solcam.old.y)
		local z = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.Zheight+player.mo.z, player.solcam.old.z)
		local XYangle = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.XYangle + ANGLE_180, player.solcam.old.XYangle)
		local Zangle = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, R_PointToAngle2(0, 0, player.solcam.radius, player.solcam.Zheight), player.solcam.old.Zangle)
		player.solcam.mobj.angle = XYangle
		player.awayviewaiming = Zangle
		P_MoveOrigin(player.solcam.mobj, x, y, z)
	elseif (oldmode == "staticpoint" and newmode == "orbital") or 
		   (oldmode == "staticpoint" and newmode == "default") or
		   (oldmode == "brokentransition" and newmode == "orbital") or 
		   (oldmode == "brokentransition" and newmode == "default") then
		local x = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, FixedMul(player.solcam.radius, cos(player.solcam.XYangle))+player.mo.x, player.solcam.old.x)
		local y = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, FixedMul(player.solcam.radius, sin(player.solcam.XYangle))+player.mo.y, player.solcam.old.y)
		local z = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.Zheight+player.mo.z, player.solcam.old.z)
		player.solcam.mobj.angle = R_PointToAngle2(x, y, player.mo.x, player.mo.y)
		player.awayviewaiming = -R_PointToAngle2(0, player.mo.z, R_PointToDist2(x, y, player.mo.x, player.mo.y), z)
		P_MoveOrigin(player.solcam.mobj, x, y, z)
	elseif (oldmode == "staticpoint" and newmode == "staticpoint") or
		   (oldmode == "brokentransition" and newmode == "staticpoint") then
		local x = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.x, player.solcam.old.x)
		local y = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.y, player.solcam.old.y)
		local z = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.z, player.solcam.old.z)
		player.solcam.mobj.angle = R_PointToAngle2(x, y, player.mo.x, player.mo.y)
		player.awayviewaiming = -R_PointToAngle2(0, player.mo.z, R_PointToDist2(x, y, player.mo.x, player.mo.y), z)
		P_MoveOrigin(player.solcam.mobj, x, y, z)
	elseif (oldmode == "staticpoint" and newmode == "staticpointfixed") or
		   (oldmode == "brokentransition" and newmode == "staticpointfixed") then
		local x = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.x, player.solcam.old.x)
		local y = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.y, player.solcam.old.y)
		local z = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.z, player.solcam.old.z)
		player.solcam.mobj.angle = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.XYangle, R_PointToAngle2(x, y, player.mo.x, player.mo.y))
		player.awayviewaiming = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.Zangle, -R_PointToAngle2(0, player.mo.z, R_PointToDist2(x, y, player.mo.x, player.mo.y), z))
		P_MoveOrigin(player.solcam.mobj, x, y, z)
	elseif (oldmode == "staticpointfixed" and newmode == "staticpoint") or
		   (oldmode == "staticpointfixed" and newmode == "brokentransition") then
		local x = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.x, player.solcam.old.x)
		local y = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.y, player.solcam.old.y)
		local z = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.z, player.solcam.old.z)
		player.solcam.mobj.angle = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, R_PointToAngle2(x, y, player.mo.x, player.mo.y), player.solcam.old.XYangle)
		player.awayviewaiming = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, -R_PointToAngle2(0, player.mo.z, R_PointToDist2(x, y, player.mo.x, player.mo.y), z), player.solcam.old.Zangle)
		P_MoveOrigin(player.solcam.mobj, x, y, z)
	elseif (oldmode == "staticpointfixed" and newmode == "staticpointfixed")
		local x = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.x, player.solcam.old.x)
		local y = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.y, player.solcam.old.y)
		local z = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.z, player.solcam.old.z)
		player.solcam.mobj.angle = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.XYangle, player.solcam.old.XYangle)
		player.awayviewaiming = SolCam.GetClosestTurn(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.solcam.Zangle, player.solcam.old.Zangle)
		P_MoveOrigin(player.solcam.mobj, x, y, z)
	/*else
		local radius = player.solcam.radius
		local XYangle = player.solcam.XYangle
		local Zheight = player.solcam.Zheight
		player.solcam.mobj.angle = XYangle + ANGLE_180
		player.awayviewaiming = -R_PointToAngle2(0, 0, radius, Zheight)
		P_MoveOrigin(player.solcam.mobj, player.mo.x + FixedMul(radius, cos(XYangle)), player.mo.y + FixedMul(radius, sin(XYangle)), player.mo.z + Zheight)*/
	end
	if oldmode == "default" and newmode ~= "default" then
		local interpaiming = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.awayviewaiming, player.aiming - ANG10)
		player.awayviewaiming = interpaiming
	elseif newmode == "default" and oldmode ~= "default" then
		local interpaiming = ease.inoutsine(player.solcam.transitionrem*FRACUNIT/player.solcam.transitiontime, player.aiming - ANG10, player.awayviewaiming)
		player.awayviewaiming = interpaiming
	elseif oldmode == "default" and newmode == "default" then
		player.awayviewaiming = player.aiming - ANG10
	end
end

----------------
--Orbital mode--
----------------

SolCam.SetOrbitalMode = function(player, transitiontime, radius, XYangle, Zheight, canceltics, cancelflag)
	SolCam.GetOldCamPosRelative(player)
	if not radius then radius = 90*FRACUNIT end
	if not XYangle then XYangle = 0 end
	if not Zheight then Zheight = 20*FRACUNIT end
	if not canceltics then canceltics = 0 end
	if not cancelflag then cancelflag = "none" end
	if not transitiontime then transitiontime = 0 end
	player.solcam.radius = radius
	player.solcam.XYangle = XYangle
	player.solcam.Zheight = Zheight
	player.solcam.activetimer = canceltics
	if string.lower(cancelflag) == "jump" then
		player.solcam.cancelflag = "jump"
	elseif string.lower(cancelflag) == "spring" then
		player.solcam.cancelflag = "spring"
	elseif string.lower(cancelflag) == "spring" then
		player.solcam.cancelflag = "spring"
	elseif string.lower(cancelflag) == "grounded" then
		player.solcam.cancelflag = "grounded"
	elseif string.lower(cancelflag) == "carry" then
		player.solcam.cancelflag = "carry"
	else
		player.solcam.cancelflag = "none"
	end
	player.solcam.mode = "orbital"
	if player.solcam.old.radius == player.solcam.radius and player.solcam.old.XYangle == player.solcam.XYangle and player.solcam.old.Zheight == player.solcam.Zheight and player.solcam.old.mode == player.solcam.mode and player.solcam.transitionrem == 0 then
		return
	elseif player.solcam.transitionrem > 0 then
		player.solcam.old = {x = player.solcam.mobj.x, y = player.solcam.mobj.y, z = player.solcam.mobj.z, mode = "brokentransition"}
	end
	player.solcam.transitiontime = transitiontime
	player.solcam.transitionrem = transitiontime
end

rawset(_G, "SC_SetOrbitalMode",SolCam.SetOrbitalMode)

SolCam.SetOrbitalModeLine = function(line, mobj, sector)
	--print("New LUA Interface Version")
	local transitiontime, radius, XYangle, Zheight, canceltics, cancelflag
	if not udmf then
		transitiontime = 35
		radius = line.frontside.rowoffset*FRACUNIT
		XYangle = R_PointToAngle2(line.v1.x, line.v1.y, line.v2.x, line.v2.y)
		Zheight = line.frontside.textureoffset*FRACUNIT
		canceltics = 0
		cancelflag = "none"
	else
		if line.args[1] then --radius from player
			radius = line.args[1]*FRACUNIT
		else
			radius = 90*FRACUNIT
		end
		if line.args[2] then --XY angle from player
			XYangle = line.args[2]*ANG1
		else
			XYangle = 0
		end
		if line.args[3] then --Z height from player
			Zheight = line.args[3]*FRACUNIT
		else
			Zheight = 20*FRACUNIT
		end
		if line.args[4] then --autocancel timer
			canceltics = line.args[4]
		end
		if line.stringargs[1] then --autocancel flag
			if string.lower(line.stringargs[1]) == "jump" then
				cancelflag = "jump"
			elseif string.lower(line.stringargs[1]) == "spring" then
				cancelflag = "spring"
			elseif string.lower(line.stringargs[1]) == "spring" then
				cancelflag = "spring"
			elseif string.lower(line.stringargs[1]) == "grounded" then
				cancelflag = "grounded"
			elseif string.lower(line.stringargs[1]) == "carry" then
				cancelflag = "carry"
			end
		end
		if line.args[0] then--Time to move cam to the new point
			transitiontime = line.args[0]
		else
			transitiontime = 0
		end
	end
	SolCam.SetOrbitalMode(mobj.player, transitiontime, radius, XYangle, Zheight, canceltics, cancelflag)
end

SolCam.SwitchOrbital = function(line, mobj, sector)
	SolCam.SetOrbitalModeLine(line, mobj, sector)
end

----------------
--Default Mode--
----------------

SolCam.SetDefaultMode = function(player, transitiontime, XYangle)
	SolCam.GetOldCamPosRelative(player)
	if not transitiontime then transitiontime = 0 end
	if not XYangle then XYangle = 0 end
	local radius = CV_FindVar("cam_dist").value
	local Zheight = CV_FindVar("cam_height").value + (5*P_GetPlayerHeight(player)/7)
	player.solcam.radius = radius
	player.solcam.XYangle = XYangle
	player.solcam.Zheight = Zheight
	player.solcam.mode = "default"
	if player.solcam.old.mode == player.solcam.mode and player.solcam.transitionrem == 0 then
		return
	elseif player.solcam.transitionrem > 0 then
		player.solcam.old = {x = player.solcam.mobj.x, y = player.solcam.mobj.y, z = player.solcam.mobj.z, mode = "brokentransition"}
	end
	player.solcam.transitiontime = transitiontime
	player.solcam.transitionrem = transitiontime
end

rawset(_G, "SC_SetDefaultMode",SolCam.SetDefaultMode)

SolCam.SetDefaultModeLine = function(line, mobj, sector)
	--print("New LUA Interface Version")
	local transitiontime, XYangle
	if not udmf then 
		--print("WARNING: Binary Mapping not recommended for this mod")
		transitiontime = 35
		XYangle = R_PointToAngle2(line.v1.x, line.v1.y, line.v2.x, line.v2.y)
	else
		if line.args[1] then --XY angle from player
			XYangle = line.args[1]*ANG1
		else
			XYangle = 0
		end
		if line.args[0] then --Time to move cam to the new point
			transitiontime = line.args[0]
		else
			transitiontime = 0
		end
	end
	SolCam.SetDefaultMode(mobj.player, transitiontime, XYangle)
end

SolCam.SwitchDefault = function(line, mobj, sector)
	SolCam.SetDefaultModeLine(line, mobj, sector)
end

---------------------
--Static Point Mode--
---------------------

SolCam.SetPointMode = function(player, transitiontime, pointX, pointY, pointZ, canceltics, cancelflag)
	if not (pointX and pointY and pointZ) then 
		error("ERROR: Coordinates for camera not provided or invalid")
		return end
	SolCam.GetOldCamPosRelative(player)
	if not transitiontime then transitiontime = 0 end
	if not canceltics then canceltics = 0 end
	if not cancelflag then cancelflag = "none" end
	player.solcam.x = pointX
	player.solcam.y = pointY
	player.solcam.z = pointZ
	player.solcam.mode = "staticpoint"
	if player.solcam.old.x == player.solcam.x and player.solcam.old.y == player.solcam.y and player.solcam.old.z == player.solcam.z and player.solcam.old.mode == player.solcam.mode and player.solcam.transitionrem == 0 then
		return
	elseif player.solcam.transitionrem > 0 then
		player.solcam.old = {x = player.solcam.mobj.x, y = player.solcam.mobj.y, z = player.solcam.mobj.z, mode = "brokentransition"}
	end
	player.solcam.transitiontime = transitiontime
	player.solcam.transitionrem = transitiontime
end

rawset(_G, "SC_SetStaticPointMode",SolCam.SetPointMode)
SolCam.SetPointModeLine = function(line, mobj, sector)
	local transitiontime, pointX, pointY, pointZ, canceltics, cancelflag
	--print("New LUA Interface Version")
	if not udmf then 
		--print("WARNING: Binary Mapping not recommended for this mod")
		transitiontime = line.frontside.rowoffset
		local cammobj
		for sec in sectors.iterate do
			if sec.tag ~= line.tag then continue end
			for mobj in sector.thinglist() do
				if not mobj.mapthing then continue end
				if mobj.mapthing.type ~= 752 then continue end
				cammobj = mobj
			pointX = cammobj.x
			pointY = cammobj.y
			pointZ = cammobj.z
			canceltics = 0
			cancelflag = "none"
			break
			end
		end
	else
		if line.args[1] then --tag for point cam
			for thing in mapthings.tagged(line.args[1]) do
				if thing.type ~= 752 then continue end
				--print("found cam")
				pointX = thing.mobj.x
				pointY = thing.mobj.y
				pointZ = thing.mobj.z
				break
			end
		end
		if line.args[4] then
			canceltics = line.args[4]
		end
		if line.stringargs[1] then --autocancel flag
			if string.lower(line.stringargs[1]) == "jump" then
				cancelflag = "jump"
			elseif string.lower(line.stringargs[1]) == "spring" then
				cancelflag = "spring"
			elseif string.lower(line.stringargs[1]) == "spring" then
				cancelflag = "spring"
			elseif string.lower(line.stringargs[1]) == "grounded" then
				cancelflag = "grounded"
			elseif string.lower(line.stringargs[1]) == "carry" then
				cancelflag = "carry"
			end
		end
		if line.args[0] then --Time to move cam to the new point
			transitiontime = line.args[0]
		end
	end
	SolCam.SetPointMode(mobj.player, transitiontime, pointX, pointY, pointZ, canceltics, cancelflag)
end

SolCam.SwitchPoint = function(line, mobj, sector)
	SolCam.SetPointModeLine(line, mobj, sector)
end

------------------------------
-- Static Point Fixed Focus --
------------------------------

SolCam.SetPointFixedMode = function(player, transitiontime, pointX, pointY, pointZ, angle, tilt, canceltics, cancelflag)
	if not (pointX and pointY and pointZ and angle and tilt) then 
		error("ERROR: Coordinates for camera not provided or invalid")
		return end
	SolCam.GetOldCamPosRelative(player)
	if not transitiontime then transitiontime = 0 end
	if not canceltics then canceltics = 0 end
	if not cancelflag then cancelflag = "none" end
	player.solcam.x = pointX
	player.solcam.y = pointY
	player.solcam.z = pointZ
	player.solcam.XYangle = angle
	player.solcam.Zangle = tilt
	player.solcam.mode = "staticpointfixed"
	if player.solcam.old.x == player.solcam.x and player.solcam.old.y == player.solcam.y and player.solcam.old.z == player.solcam.z and player.solcam.old.mode == player.solcam.mode and player.solcam.transitionrem == 0 then
		return
	elseif player.solcam.transitionrem > 0 then
		player.solcam.old = {x = player.solcam.mobj.x, y = player.solcam.mobj.y, z = player.solcam.mobj.z, mode = "brokentransition"}
	end
	player.solcam.transitiontime = transitiontime
	player.solcam.transitionrem = transitiontime
end

rawset(_G, "SC_SetStaticPointFixedFocusMode",SolCam.SetPointFixedMode)

SolCam.SetPointFixedModeLine = function(line, mobj, sector)
	local transitiontime, pointX, pointY, pointZ, angle, tilt, canceltics, cancelflag
	--print("New LUA Interface Version")
	if not udmf then 
		--print("WARNING: Binary Mapping not recommended for this mod")
		transitiontime = line.frontside.rowoffset
		local cammobj
		for sec in sectors.iterate do
			if sec.tag ~= line.tag then continue end
			for mobj in sector.thinglist() do
				if not mobj.mapthing then continue end
				if mobj.mapthing.type ~= 752 then continue end
				cammobj = mobj
			pointX = cammobj.x
			pointY = cammobj.y
			pointZ = cammobj.z
			angle = cammobj.angle
			tilt = 0
			canceltics = 0
			cancelflag = "none"
			break
			end
		end
	else
		if line.args[1] then --tag for point cam
			for thing in mapthings.tagged(line.args[1]) do
				if thing.type ~= 752 then continue end
				--print("found cam")
				pointX = thing.mobj.x
				pointY = thing.mobj.y
				pointZ = thing.mobj.z
				angle = thing.mobj.angle
				tilt = thing.mobj.pitch
				break
			end
		end
		if line.args[4] then
			canceltics = line.args[4]
		end
		if line.stringargs[1] then --autocancel flag
			if string.lower(line.stringargs[1]) == "jump" then
				cancelflag = "jump"
			elseif string.lower(line.stringargs[1]) == "spring" then
				cancelflag = "spring"
			elseif string.lower(line.stringargs[1]) == "spring" then
				cancelflag = "spring"
			elseif string.lower(line.stringargs[1]) == "grounded" then
				cancelflag = "grounded"
			elseif string.lower(line.stringargs[1]) == "carry" then
				cancelflag = "carry"
			end
		end
		if line.args[0] then --Time to move cam to the new point
			transitiontime = line.args[0]
		end
	end
	SolCam.SetPointFixedMode(mobj.player, transitiontime, pointX, pointY, pointZ, angle, tilt, canceltics, cancelflag)
end

SolCam.SwitchPointFixed = function(line, mobj, sector)
	SolCam.SetPointFixedModeLine(line, mobj, sector)
end



SolCam.MapStart = function()
	for player in players.iterate do
		player.solcam = {}
		player.solcam.old = {}
		player.solcam.mobj = P_SpawnMobjFromMobj(player.mo, 0, 0, 0, MT_SOLCAM)
		player.solcam.mode = "default"
		player.solcam.transitionrem = 0
		SolCam.GetControlStyle(player)
		/*if udmf
			player.solcam.camsplines = {}
			for splinevtx in mapthings.tagged(999) do --tag all camera spline vertexes 999, this is to speed up the mapload to only instance what it needs
				if splinevtx.type ~= 752 then continue end
				if not player.solcam.camsplines[splinevtx.args[0]] then 
					player.solcam.camsplines[splinevtx.args[0]] = {}
				end
				player.solcam.camsplines[splinevtx.args[0]][splinevtx.args[1]] = splinevtx
			end
		else
			print("WARNING: Binary Mapping not recommended for this mod")
		end*/
	end
end

SolCam.MapLoad = function()
    SolCam.MapStart()
end

SolCam.PlayerThink = function(player)
	if mapheaderinfo[gamemap].solcam ~= "on" then return end
	if not player.solcam then player.solcam = {} end
	if not player.solcam.old then player.solcam.old = {} end
	if not player.solcam.mobj then player.solcam.mobj = P_SpawnMobjFromMobj(player.mo, 0, 0, 0, MT_SOLCAM) end
	if not player.solcam.mode then player.solcam.mode = "default" end
	if not player.solcam.transitionrem then player.solcam.transitionrem = 0 end
	if not player.forcedcontrol then player.forcedcontrol = false end
	if not player.solcam.emergencydisable then player.solcam.emergencydisable = false end
	if not player.solcam.activetimer then player.solcam.activetimer = 0 end
	if not player.solcam.cancelflag then player.solcam.cancelflag = "none" end
	if axis2dloaded == true then
		if player.mo.currentaxis then return end
	end
	if player.solcam.emergencydisable == true then return end --DO NOT USE THIS REGULARLY THIS IS FOR EMERGENCY REASONS ONLY
	if player.solcam.activetimer == 1 then
		SolCam.SetDefaultMode(player, 15, player.solcam.mobj.angle)
		player.solcam.activetimer = 0
	elseif player.solcam.activetimer > 0 then
		player.solcam.activetimer = $ - 1
	end
	if player.solcam.cancelflag == "jump" and (player.pflags & (PF_JUMPED | PF_STARTJUMP | PF_NOJUMPDAMAGE)) or
	   player.solcam.cancelflag == "spring" and (player.mo.eflags & MFE_SPRUNG) or
	   player.solcam.cancelflag == "grounded" and P_IsObjectOnGround(player.mo) or
	   player.solcam.cancelflag == "carry" and (player.powers[pw_carry] ~= 0) then
		local angle = player.solcam.mobj.angle
		if player.solcam.mode == "orbital" then angle = $+ANGLE_180 end
		SolCam.SetDefaultMode(player, 15, angle)
	end
	--print(player.solcam.activetimer, player.solcam.cancelflag)
	if player.solcam.transitionrem > 0 then
		player.awayviewmobj = player.solcam.mobj
		player.awayviewtics = 3
		SolCam.DoSolCamTransition(player.solcam.old.mode, player.solcam.mode, player)
		player.solcam.transitionrem = $ - 1
		if player.solcam.mode == "default" and player.solcam.old.mode ~= "default" then
			if player.forcedcontrol == true then SolCam.ResetControlStyle(player) end
			if player.forcedcontrol == false then SolCam.GetControlStyle(player) end
		elseif player.solcam.old.mode == "default" and player.solcam.mode == "default" then
			if player.forcedcontrol == true then SolCam.ResetControlStyle(player) end
			if player.forcedcontrol == false then SolCam.GetControlStyle(player) end
		else
			if player.forcedcontrol == false then SolCam.ForceFreeControl(player) end
		end
	else
		if player.solcam.mode == "default" then
			if player.forcedcontrol == false then SolCam.GetControlStyle(player) end
			if player.forcedcontrol == true then SolCam.ResetControlStyle(player) end
		elseif player.solcam.mode == "orbital" then
			player.awayviewmobj = player.solcam.mobj
			if player.forcedcontrol == false then SolCam.ForceFreeControl(player) end
			player.awayviewtics = 3
			player.solcam.mobj.angle = player.solcam.XYangle + ANGLE_180
			player.awayviewaiming = -R_PointToAngle2(0, 0, player.solcam.radius, player.solcam.Zheight)
			--print((player.mo.z + player.solcam.Zheight)/FRACUNIT, player.mo.z/FRACUNIT, player.solcam.Zheight/FRACUNIT, player.awayviewaiming/ANG1)
			P_MoveOrigin(player.solcam.mobj, player.mo.x + FixedMul(player.solcam.radius, cos(player.solcam.XYangle)), player.mo.y + FixedMul(player.solcam.radius, sin(player.solcam.XYangle)), player.mo.z + player.solcam.Zheight)
		elseif player.solcam.mode == "staticpoint" then
			player.awayviewmobj = player.solcam.mobj
			if player.forcedcontrol == false then SolCam.ForceFreeControl(player) end
			player.awayviewtics = 3
			player.solcam.mobj.angle = R_PointToAngle2(player.solcam.x, player.solcam.y, player.mo.x, player.mo.y)
			player.awayviewaiming = -R_PointToAngle2(0, player.mo.z, R_PointToDist2(player.solcam.x, player.solcam.y, player.mo.x, player.mo.y), player.solcam.z)
			P_MoveOrigin(player.solcam.mobj, player.solcam.x, player.solcam.y, player.solcam.z)
		elseif player.solcam.mode == "staticpointfixed" then
			player.awayviewmobj = player.solcam.mobj
			if player.forcedcontrol == false then SolCam.ForceFreeControl(player) end
			player.awayviewtics = 3
			player.solcam.mobj.angle = player.solcam.XYangle
			player.awayviewaiming = player.solcam.Zangle
		end
	end
	--print(player.solcam.mode, player.solcam.old.mode, player.solcam.transitionrem)
	--print(player.solcam.transitionrem, CV_FindVar("cam_dist").value, CV_FindVar("cam_height").value)
end

SolCam.PlayerThinker = function(player)
    SolCam.PlayerThink(player)
end

SolCam.CMD = function(player, cmd)
	if mapheaderinfo[gamemap].solcam ~= "on" then return end
	if axis2dloaded == true then
		if player.mo.currentaxis then return end
	end
	--if (player.mo.flags2 & MF2_TWOD) then return end
/*	if not player.solcam then return end
	if not player.solcam.transitionrem then return end
	if not player.solcam.mode then return end
	if not player.solcam.mob then return end
	if not player.solcam.mobj.angle then return end*/
	if player.solcam.transitionrem > 0 then
		cmd.angleturn = player.solcam.mobj.angle>>16
		--print(cmd.angleturn)
	else
		if player.awayviewtics == 3 and player.solcam.mode ~= "default" then
			cmd.angleturn = player.solcam.mobj.angle>>16
			--print(cmd.angleturn)
		end
	end
	--print(player.solcam.transitionrem, CV_FindVar("cam_dist").value, CV_FindVar("cam_height").value)
end

SolCam.CMDinterrupt = function(player, cmd)
    SolCam.CMD(player, cmd)
end

if not SolCam.hooksloaded["Orbital"] then
    addHook("LinedefExecute", SolCam.SwitchOrbital, "SOLCAMOR")
    SolCam.hooksloaded["Orbital"] = true
end

if not SolCam.hooksloaded["Default"] then
    addHook("LinedefExecute", SolCam.SwitchDefault, "SOLCAMDF")
    SolCam.hooksloaded["Default"] = true
end

if not SolCam.hooksloaded["Point"] then
    addHook("LinedefExecute", SolCam.SwitchPoint, "SOLCAMSP")
    SolCam.hooksloaded["Point"] = true
end --SolCam.SwitchPointFixed

if not SolCam.hooksloaded["PointFixed"] then
    addHook("LinedefExecute", SolCam.SwitchPointFixed, "SOLCAMSF")
    SolCam.hooksloaded["PointFixed"] = true
end

if not SolCam.hooksloaded["Player"] then
    addHook("PlayerThink", SolCam.PlayerThinker)
    SolCam.hooksloaded["Player"] = true
end

if not SolCam.hooksloaded["CMD"] then
    addHook("PlayerCmd", SolCam.CMDinterrupt)
    SolCam.hooksloaded["CMD"] = true
end

if not SolCam.hooksloaded["MapLoad"] then
    addHook("MapLoad", SolCam.MapLoad)
    SolCam.hooksloaded["MapLoad"] = true
end