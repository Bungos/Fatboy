AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )
include( "teamsetup.lua")
include( "rounds.lua" )

roundActive = false
spawnPointFB = {}
spawnPointSV = {}

function GM:PlayerDeath( ply )
ply:Spectate(1)
RoundEndCheck()
	if ply:Team() == 1 then
		ply:SetTeam(2)
		timer.Simple( 3, function() ply:Spawn() end )
		print(tostring(ply) .. "Set to Diabetic")
	elseif ply:Team() == 2 then
		timer.Simple( 3, function() ply:Spawn() end )
	elseif ply:Team() == 0 then
	end

end

function GM:PlayerDeathThink( ply )

if ( roundActive == false ) then
	ply:Spawn()
	return true
else
	return false
	end
end


function GM:PlayerDeathSound() return true end

function GM:PlayerShouldTakeDamage ( ply, att )

	if 
	att:IsPlayer() then
	if 
	ply:Team() == att:Team() then
	return false
	elseif 
	ply:Team() == 0 and att:Team() == 2 then
	return false
elseif 
	ply:Team() == 2 and att:Team() == 0 then
	return false
	end
	end
	return true
end

function GM:PlayerDisconnected( ply )
	 RoundEndCheck()
end

function GM:PlayerInitialSpawn ( ply )


if (roundActive == true ) then
	print (tostring(ply) .. "killed silently")
	ply:PrintMessage( HUD_PRINTTALK , "Waiting for new round to start.")
	ply:Spectate(5)
	ply:KillSilent()
	return
else
	RoundStart()
end

if team.NumPlayers( 0 ) < 1 then
	ply:SetTeam(0)
else 
	ply:SetTeam(1)
end
end

function GM:PlayerSpawn( ply )


	ply:UnSpectate()

if 	
	(roundActive == true ) then
	if 
		ply:Team() ~= 2 then
		ply:KillSilent()
		return
	end
else
	
	RoundStart()


end

---1359.057983 -659.082275 -238.717438
if 

 	ply:Team() == 0 then
 		if game.GetMap() == "cs_office" then
		ply:SetPos( Vector(-1193.321411, -1093.556885, -263.665436))
		elseif game.GetMap() == "custommap3" then
			ply:SetPos( Vector(-810.865662, -509.642395, 54.203293))
end
 	ply:PrintMessage( HUD_PRINTTALK , "New Round Started")
 	RoundSFX()
 	ply:SetMaxHealth(1000)
 	ply:SetJumpPower (200)
 	ply:SetHealth(600 + (330  * (player.GetCount())))
	ply:SetGravity( 0.7 )
	ply:SetWalkSpeed ( 230 )
	ply:SetRunSpeed ( 230 )
	ply:SetCrouchedWalkSpeed ( 0.1)
	ply:SetDuckSpeed ( 0.1)
	ply:SetNoCollideWithTeammates ( true )
	ply:Give("halo_grav_hammer")
	ply:SetModel( "models/dawson/obese_male_deluxe/obese_male_deluxe.mdl" )
	ply:SetupHands()
elseif 
	ply:Team() == 1 then
		if game.GetMap() == "cs_office" then
		ply:SetPos( Vector(-1187.241089, 478.111176, -265.145447))
				elseif game.GetMap() == "custommap3" then
			ply:SetPos( Vector(528.293396, -3468.298584, 54.031250))
	end
		ply:PrintMessage( HUD_PRINTTALK , "New Round Started")
		RoundSFX()
	ply:SetJumpPower (200)
	ply:SetHealth(100)
	ply:Give("weapon_smg1")
	ply:SetAmmo(500, "smg1" )
	ply:SetGravity( 1 )
	ply:SetWalkSpeed ( 230 )
	ply:SetRunSpeed ( 270 )
	ply:SetCrouchedWalkSpeed ( 0.7)
	ply:SetDuckSpeed ( 0.5)
	ply:SetModel( "models/player/mossman.mdl" )
	ply:SetNoCollideWithTeammates ( true )
	ply:SetupHands()
elseif 
	ply:Team() == 2 then
		ply:PrintMessage( HUD_PRINTTALK , "You died, kill the remaining survivors!")
	RoundSFX()
	ply:SetHealth(1)
	ply:Give("weapon_crowbar")
	ply:SetGravity( 0.6 )
	ply:SetWalkSpeed ( 240 )
	ply:SetRunSpeed ( 240 )
	ply:SetCrouchedWalkSpeed ( 1)
	ply:SetDuckSpeed ( 1 )
	ply:SetNoCollideWithTeammates ( false )
	ply:SetModel( "models/player/skeleton.mdl" )
	ply:SetupHands()
end

end


