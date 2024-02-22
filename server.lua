RegisterNetEvent('Breathing2.0:Player_Suffocating', function ()
    exports.mana_audio:PlaySoundFromEntity({
        audioBank = 'DLC_BREATHE\\BREATHE',
        audioName = 'jogging_breath_01',
        audioRef = 'breathe_soundset',
        entity = GetPlayerPed(source)
    })
end)

RegisterNetEvent('Breathing2.0:Player_Breathing', function ()
    exports.mana_audio:PlaySoundFromEntity({
        audioBank = 'DLC_BREATHE\\BREATHE',
        audioName = 'exhausted_02',
        audioRef = 'breathe_soundset',
        entity = GetPlayerPed(source)
    })
end)
