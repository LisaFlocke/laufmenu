--by Lisa

local looped = 8
local looped2 = 16

local PlayingAnim = false

Citizen.CreateThread(function()
    local checkbox2 = false
    WarMenu.CreateMenu('list', "Lauf Style")
    WarMenu.SetSubTitle('list', 'Lauf Style')
    WarMenu.CreateSubMenu('we', 'list', 'Weiblich')
    WarMenu.CreateSubMenu('ma', 'list', 'Mänlich')

    for theId,theItems in pairs(anims) do
        RequestAnimDict(theItems.dic)
    end


    while true do

        local ped = PlayerPedId()

        if (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) and PlayingAnim then
            ClearPedTasks(ped)
            PlayingAnim = false
        end
            
        if not IsPedActiveInScenario(ped) and PlayingAnim then
            PlayingAnim = false
        end
            
        if checkbox then
            looped = 1
        else
            looped = 32
        end

        if checkbox2 then
            looped2 = 1
        else
            looped2 = 0
        end

        if WarMenu.IsMenuOpened('list') then

            if WarMenu.MenuButton('Weiblich', 'we') then
            end
			
            if WarMenu.MenuButton('Mänlich', 'ma') then
            end
			
			
			
            WarMenu.Display() -- Weiblich
        elseif WarMenu.IsMenuOpened('we') then

			if WarMenu.Button('Normal') then
				SetPedMovementClipset( ped, "move_f@generic", 0 )

			elseif WarMenu.Button('Elegant') then
				SetPedMovementClipset( ped, "move_f@heels@c", 0 )
            
			elseif WarMenu.Button('Arrogant') then
				SetPedMovementClipset( ped, "move_f@arrogant@a", 0 )
			
			elseif WarMenu.Button('Joggen') then
				SetPedMovementClipset( ped, "move_f@depressed@a", 0 )
			
			elseif WarMenu.Button('Eilig') then
				SetPedMovementClipset( ped, "move_m@casual@f", 0 )
            
            elseif WarMenu.Button('Traurig') then
                SetPedMovementClipset( ped , "move_m@depressed@a", 0 )
            
            elseif WarMenu.Button('Betrunken') then 
                SetPedMovementClipset( ped , "move_m@hobo@a", 0 )
            
            end
			
            WarMenu.Display() -- Mänlich
        elseif WarMenu.IsMenuOpened('ma') then

			if WarMenu.Button('Normal') then
				SetPedMovementClipset( ped, "move_m@generic", 0 )
			
			elseif WarMenu.Button('dick') then
				SetPedMovementClipset( ped, "move_m@business@b", 0 )
			
			elseif WarMenu.Button('Arrogant') then
				SetPedMovementClipset( ped, "move_m@casual@b", 0 )
			
			elseif WarMenu.Button('Eilig') then
				SetPedMovementClipset( ped, "move_m@casual@f", 0 )
				
			elseif WarMenu.Button('Traurig') then
                SetPedMovementClipset( ped, "move_m@depressed@a", 0 )
                
            elseif WarMenu.Button('Betrunken') then 
                SetPedMovementClipset( ped , "move_m@hobo@a", 0 )
				
			end


            WarMenu.Display()
        elseif IsControlJustReleased(0, control_key) then --f5
            WarMenu.OpenMenu('list')
        end

        Citizen.Wait(0)
    end
end)
