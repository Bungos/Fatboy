AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )
include( "teamsetup.lua")
include( "rounds.lua" )

roundActive = false

function GM:PlayerDeath( ply )

	if ply:Team() == 1 then
		ply:SetTeam(2)
		ply:Spawn()
		print(tostring(ply) .. "Set to Diabetic")
	end
RoundEndCheck()
end

function GM:PlayerDeathThink( ply )
	if ply:Team() == 2 then
			ply:Spawn()
	elseif ( roundActive == false ) then
		ply:Spawn()
		return true
	else
		return false
	end
end


function GM:PlayerDeathSound() return true end

function GM:PlayerShouldTakeDamage ( ply, att )
if att:IsPlayer() then
	if ply:Team() == att:Team() then
		return false
		end
	end
	return true
end

function GM:PlayerHurt ( ply, att, hp, dt )

end
	
function GM:CanPlayerSuicide()
	return false
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

if (roundActive == true ) then
	if ply:Team() ~= 2 then
	ply:KillSilent()
	return
end
else
	RoundStart()
end


ply:SetupHands()

 if ply:Team() == 0 then
 	ply:SetMaxHealth(1000)
 	ply:SetJumpPower (200)
 	ply:SetHealth(300 + (150 * (player.GetCount())))
	ply:SetGravity( 0.7 )
	ply:SetWalkSpeed ( 260 )
	ply:SetRunSpeed ( 260 )
	ply:SetCrouchedWalkSpeed ( 0.1)
	ply:SetDuckSpeed ( 0.1)
	ply:SetNoCollideWithTeammates ( true )
	ply:Give("weapon_crowbar")
	ply:SetModel( "models/player/zombie_soldier.mdl" )

elseif ply:Team() == 1 then
	ply:SetHealth(25)
	ply:Give("weapon_smg1")
	ply:SetAmmo(300, "smg1" )
	ply:GiveAmmo(300, "smg1" )
	ply:SetGravity( 1 )
	ply:SetWalkSpeed ( 260 )
	ply:SetRunSpeed ( 350 )
	ply:SetCrouchedWalkSpeed ( 0.3)
	ply:SetDuckSpeed ( 0.5)
	ply:SetModel( "models/player/mossman.mdl" )
	ply:SetNoCollideWithTeammates ( true )

	elseif ply:Team() == 2 then

	ply:SetHealth(10)
	ply:Give("weapon_crowbar")
	ply:SetGravity( 0.6 )
	ply:SetWalkSpeed ( 500 )
	ply:SetRunSpeed ( 500 )
	ply:SetCrouchedWalkSpeed ( 1)
	ply:SetDuckSpeed ( 1 )
	ply:SetNoCollideWithTeammates ( false )
	ply:SetModel( "models/player/skeleton.mdl" )

end
end


