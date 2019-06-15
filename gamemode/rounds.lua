

function RoundStart()
	local Alive = 0 
	for k, v in pairs( player.GetAll() ) do
		if (v:Alive() ) then
			Alive = Alive + 1
		end
	end
		if ( Alive >= table.Count( player.GetAll() ) && table.Count( player.GetAll() ) > 1 ) then
			roundActive = true
		end
		print( "Round started " .. tostring(roundActive))

		RoundEndCheck()
	end

	function RoundEndCheck()
		print ( "Round active " .. tostring (roundActive))
		if(roundActive == false ) then return end
		timer.Create( "checkdelay", 1, 1, function()
			local FBAlive = 0
			local SAlive = 0
			for k, v in pairs( team.GetPlayers(0) ) do
				if( v:Alive() ) then
					FBAlive = FBAlive + 1
				end
			end

			for k, v in pairs( team.GetPlayers(1) ) do
				if( v:Alive() ) then
					SAlive = SAlive + 1
				end
			end

	for k, v in pairs( player.GetAll() ) do
			if (FBAlive == 0 ) then

				EndRound("Survivor")
				v:PrintMessage( HUD_PRINTTALK , "Survivors win!")
			elseif (SAlive == 0 ) then
				EndRound("Fatboy")
				v:PrintMessage( HUD_PRINTTALK , "Fatboy wins!")
			end
end
		end)
	end






	function EndRound( winners )
		local ply = FindMetaTable("Player")
		print ( winners .. " won the round!")
		timer.Create( "cleanup", 3, 1, function ()
		game.CleanUpMap( false, {} )
		for _, v in pairs( player.GetAll() ) do
		if ( 	v:Alive() ) then
				v:SetupHands()
				v:StripWeapons()
				v:KillSilent()
		end			
					v:SetupTeam ( v:Team() )
		
	end
	roundActive = false


	end)
end
