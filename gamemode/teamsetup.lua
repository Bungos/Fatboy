local ply = FindMetaTable("Player")


local teams = {}

teams[0] = {
	name = "Fatboy",
	color = Vector( 1.0, 0, 0),
	weapons = {} }
teams[1] = {
	name = "Survivor",
	color = Vector( 0, 1,0, 0),
	weapons = {} }
teams[2] = {
	name = "Diabetic",
	color = Vector( 0, 0, 1.0),
	weapons = {} }
teams[3] = {
	name = "Spectator",
	color = Vector( 1.0, 0, 0),
	weapons = {} }

function ply:SetupTeam( n )

if ( not teams[n] ) then return end
local rply = math.random(1, #player.GetAll())
local chosen = player.GetAll()[rply]
for i = 1, #player.GetAll() do


print (tostring (chosen) .. "is the new fatboy.")
		for _, v in pairs( player.GetAll() ) do
			v:SetTeam(1)
			chosen:SetTeam(0)

		end

	end
end 
