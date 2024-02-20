Config = {}

-- Values for editing the most realistic roleplay resource to ever be created

Config.StaminaStandingWalking = 0.25 -- How much stamina a player regains back when standing still or walking (out of 1)
Config.StaminaRunning = 0.15 -- How much stamina a player regains while running (out of 1)
Config.BreathLoss = 10 -- How much stamina a player loses each Tick (out of 100)
Config.BreathLossTick = 1000 -- 1000 ms = 1 second, how often player loses stamina
Config.Suffocation = 10 -- Below what oxygen level does someone's character starts to suffocate and take damage (out of 100)
Config.SuffocationDamage = 10 -- how much damage a player takes each tick
Config.OxygenDelivery = 100 -- in MS (100 ms = .1 second), how long it takes for stamina to be restored
Config.Exhale = 10 -- How much stamina you lose every tick (out of 100)


-- Only edit the below if you're a bad enough dude

CreateThread(function()
    while true do
        local breath = (GetPlayerStamina(PlayerId()))
        SetPlayerStamina(PlayerId(), (breath - Config.Exhale))
        Wait(Config.BreathLossTick)
        if breath <= Config.Suffocation then
            ApplyDamageToPed(PlayerPedId(), Config.SuffocationDamage, false)
            -- local PlayerCoords = GetEntityCoords(PlayerPedId())
            -- PlayAmbientSpeechFromPositionNative("EXHAUSTED", "WAVELOAD_PAIN_FRANKLIN", PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, "SPEECH_PARAMS_FORCE_NORMAL")
            TriggerServerEvent('Breathing2.0:Player_Suffocating')
        end
    end
end)

local isBreathing = false
RegisterCommand('Breathe', function()
    if isBreathing then return end
    isBreathing = true

    if IsPedStill(PlayerPedId()) then
        Wait(Config.OxygenDelivery)
        RestorePlayerStamina(PlayerId(), Config.StaminaStandingWalking)
        --local PlayerCoords = GetEntityCoords(PlayerPedId())
        --PlayAmbientSpeechFromPositionNative("JOGGING_BREATH", "WAVELOAD_PAIN_FRANKLIN", PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, "SPEECH_PARAMS_FORCE_NORMAL")
        TriggerServerEvent('Breathing2.0:Player_Breathing')
    elseif (IsPedSprinting(PlayerPedId()) or IsPedRunning(PlayerPedId())) then
        Wait(Config.OxygenDelivery)
        RestorePlayerStamina(PlayerId(), Config.StaminaRunning)
        -- local PlayerCoords = GetEntityCoords(PlayerPedId())
        --PlayAmbientSpeechFromPositionNative("JOGGING_BREATH", "WAVELOAD_PAIN_FRANKLIN", PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, "SPEECH_PARAMS_FORCE_NORMAL")
        TriggerServerEvent('Breathing2.0:Player_Breathing')
    end
    isBreathing = false
end, false)

RegisterKeyMapping('Breathe', 'Breathe', 'keyboard', 'F')

TriggerEvent('chat:removeSuggestion', '/Breathe')