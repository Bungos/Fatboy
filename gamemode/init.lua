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

--
if 

 	ply:Team() == 0 then
 	ply:PrintMessage( HUD_PRINTTALK , "New Round Started")
 	RoundSFX()
 	ply:SetPos( Vector(-1176.484863, 1218.249756, -346.352631))
 	ply:SetMaxHealth(1000)
 	ply:SetJumpPower (200)
 	ply:SetHealth(600 + (375* (player.GetCount())))
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
		ply:SetPos( Vector(-1187.241089, 478.111176, -265.145447))
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
		ply:SetPos( Vector(-1176.484863, 1218.249756, -346.352631))
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


