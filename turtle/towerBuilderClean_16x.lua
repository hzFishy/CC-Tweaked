--[[ réaliser par hzFishy / Fishy#0021 - merci de pas dupliquer/utiliser/modifier ce porgramme sans permission
utilisation: towerBuilderClean_16x
placer au centre la turtle, un bloc au dessus du niveau du mure
placer un coffre contenant les materiaux de builds a gauche de la turtle
placer un coffre contenant le fuel a droite de la turtle
--]]
local nb_blocs_par_etage = ?
local nb_fuel_return_level = ?

function goTo( x, y, z, xd, zd )
    while depth > y do
        if turtle.up() then
            depth = depth - 1
        elseif turtle.digUp() or turtle.attackUp() then
            collect()
        else
            sleep( 0.5 )
        end
    end

    if xPos > x then
        while xDir ~= -1 do
            turnLeft()
        end
        while xPos > x do
            if turtle.forward() then
                xPos = xPos - 1
            elseif turtle.dig() or turtle.attack() then
                collect()
            else
                sleep( 0.5 )
            end
        end
    elseif xPos < x then
        while xDir ~= 1 do
            turnLeft()
        end
        while xPos < x do
            if turtle.forward() then
                xPos = xPos + 1
            elseif turtle.dig() or turtle.attack() then
                collect()
            else
                sleep( 0.5 )
            end
        end
    end
    
    if zPos > z then
        while zDir ~= -1 do
            turnLeft()
        end
        while zPos > z do
            if turtle.forward() then
                zPos = zPos - 1
            elseif turtle.dig() or turtle.attack() then
                collect()
            else
                sleep( 0.5 )
            end
        end
    elseif zPos < z then
        while zDir ~= 1 do
            turnLeft()
        end
        while zPos < z do
            if turtle.forward() then
                zPos = zPos + 1
            elseif turtle.dig() or turtle.attack() then
                collect()
            else
                sleep( 0.5 )
            end
        end    
    end
    
    while depth < y do
        if turtle.down() then
            depth = depth + 1
        elseif turtle.digDown() or turtle.attackDown() then
            collect()
        else
            sleep( 0.5 )
        end
    end
    
    while zDir ~= zd or xDir ~= xd do
        turnLeft()
    end
end
local function place_forward(x)
    for i=1,x,1 do
        turtle.placeDown()
        turtle.forward()
		xPos = xPos + xDir
		zPos = zPos + zDir
    end
end
local function go_next(x)
    turtle.turnLeft()
	xDir, zDir = -zDir, xDir
    turtle.forward()
	xPos = xPos + xDir
	zPos = zPos + zDir
    turtle.turnRight()
	xDir, zDir = zDir, -xDir
    turtle.forward()
	xPos = xPos + xDir
	zPos = zPos + zDir
end
local function quart()
    place_forward(4)
    go_next()
    place_forward(3)
    go_next()
    place_forward(2)
    for i=1,4,1 do
        turtle.turnLeft()
		xDir, zDir = -zDir, xDir
        turtle.forward()
		xPos = xPos + xDir
		zPos = zPos + zDir
        turtle.turnRight()
		xDir, zDir = zDir, -xDir
        turtle.forward()
		xPos = xPos + xDir
		zPos = zPos + zDir
        turtle.placeDown()
		
    end
    go_next()
    place_forward(2)
    go_next()
    place_forward(3)
    go_next()
    place_forward(3)
end
local function check_blocs()
    total = 0
    for i=1,9,1 do
        --enlever slot de carburant
        total+= getItemCount(i)
    end
    if total >= nb_blocs_par_etage then
        return true
    elseif < nb_blocs_par_etage then
        return False
    end
end
local function check_fuel()
    if getFuelLevel() > nb_fuel_return_level then
        return true
    elseif getFuelLevel() < nb_fuel_return_level then
        return false
    end
end
local function get_blocs()
    turtle.turnLeft()
	xDir, zDir = -zDir, xDir
    turtle.suck()
    turtle.turnRight()
	xDir, zDir = zDir, -xDir
end
local function get_fuel()
    turtle.turnRight()
	xDir, zDir = zDir, -xDir
    turtle.suck()
    turtle.turnLeft()
	xDir, zDir = -zDir, xDir
end
local function goTo_beginning()
    local x,y,z,xd,zd = xPos,depth,zPos,xDir,zDir
    print("Returning down")
    goTo(0,0,0,0,-1)
end

local depth, xPos,zPos,xDir,zDir = 0,0,0,0,1
for i=1,15,1 do
    turtle.forward()
	xPos = xPos + xDir
	zPos = zPos + zDir
end
turtle.turnLeft()
xDir, zDir = -zDir, xDir
while true do
    if check_blocs() = true and check_fuel() = true then
        for i=1,4,1 do
            quart()
        turtle.up()
		depth = depth - 1
        end
    else then
        goTo_beginning()
        get_blocs()
        get_fuel()
        goTo( 0,0,0,0,1 )
        goTo(x,y,z,xd,zd)
    end
end