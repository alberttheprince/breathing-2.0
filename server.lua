RegisterNetEvent('Breathing2.0:Player_Suffocating', function ()
    exports.mana_audio:PlaySoundFromEntity({
        audioBank = 'dlc_BREATHING_SOUNDSET\\BREATHING_SOUNDSET',
        audioName = 'INHALE_01',
        audioRef = 'BREATHING_SOUNDSET',
        entity = GetPlayerPed(source)
    }) 
end)

RegisterNetEvent('Breathing2.0:Player_Breathing', function ()
    exports.mana_audio:PlaySoundFromEntity({
        audioBank = 'dlc_BREATHING_SOUNDSET\\BREATHING_SOUNDSET',
        audioName = 'EXHAUSTED_02',
        audioRef = 'BREATHING_SOUNDSET',
        entity = GetPlayerPed(source)
    }) 
end)