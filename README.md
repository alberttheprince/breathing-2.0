![image](https://github.com/alberttheprince/breathing-2.0/assets/85725579/8a853f73-7950-4566-a5bb-5254e32b597e)


# breathing 2.0

Tired of unrealistic roleplay servers? Tired of hearing players complaining about how unrealistic your server is? **You've come to the right Repo!**

Breathing 2.0 **fundamentally changes** the way you roleplay, giving you and your players **total control** over their player's stamina consumption, taking back what was unjustly taken from you when Rockstar implemented auto-regenerating stamina.

By introducing realistic breathing functionality to your hardcore ultra-realistic no-pixel-inspired server, you will effectively solve any complaints about realism. Your community will gasp and then breathe sighs of relief as a new dawn of total immersion washes over them.

A new era of Roleplay has been unlocked, as we march forward into a post-casual roleplay reality. 

Despite hundreds of hours of man hours, dozens of consumer surveys, and industry experts advising not to, we have released this resource for everyone to use for Free!

# Features
- Press F to breath
- Hear your character breath
- Hear your character suffer as they suffocate to death
- Hear other players breathe and suffocate
- Finally, make your server a R E A L I S T I C roleplay server!

# Dependencies

- Ability to press or engage keyboard inputs (Audio based breathing recognition a WIP)


https://github.com/alberttheprince/breathing-2.0/assets/85725579/2636059a-4985-49a2-bf82-3d89538f807f

# Reflections of a Scholar

Thank you to [Demi-Automatic](https://github.com/Demigod916), [Manason](https://github.com/Manason), [sqrl](https://github.com/Sqrl34/s), and junction (on the CFX scripting discord) for their help with bug fixes, formatting, and coding. Without you, this resource wouldn't be a reality.

Thanks to [DurtyFree](https://forge.plebmasters.de/) and others in the Plebmasters discord for discussions on ambient audio and sound files.

**Notes for FiveM Development:**

This resource makes use of PlayAmbientSpeechFromPositionNative to play audio files typically used by Rockstar to play audio from peds including speech, ambient speech (duh), pain sounds, and thousands of other instances of audio that you would have audio in relation to characters or peds. 

However, as far as I've found through research and discussion with other users, you **cannot** use PlayPedAmbientSpeechNative or PlayPedAmbientSpeechWithVoiceNative to make the ped controlled by a player to speak. Additionally, setting the MP_ models PVG does not work (via natives or through streaming of meta files) and when setting it and attempting to use it in this way it will not produce any audio. You also cannot use these with PlaySoundFrontend or PlaySound, as those seem to handle other audio files, usually cut environmental, or cutscene audio.

The obvious weakness of PlayAmbientSpeechFromPositionNative is that despite having a wide library of audio you can use, you must play it on a coordinate, meaning if a user is moving quickly (say in one of your shitty de-badged vehicles at 300 mph) you may not hear the file being played. Additionally, as PlayAmbientSpeechFromPositionNative is client side only, use of Manason's [tool name link here] must be used to have the audio also play for other clients nearby.

Most audio files that can be used with this native can be found in the GTA files under SFX, and you can find a list by exploring DurtyFree's various collections/lists of audio files. 

12/20/2023 - Update

Following a lot of testing with [Manason](https://github.com/Manason), we encountered quite a few issues with using PlayAmbientSpeechFromPositionNative. It turns out to be client side only, this is solved by creating a tool to take advantage of PlayAmbientSpeechFromPositionNative and sync it between players, but Manason felt that it would be better to convert (or use custom audio) audio to audio libraries you can call via that uses PlaySoundFromEntity and other natives to play native audio. This tool is [mana_audio](https://github.com/Manason/mana_audio).

We encountered a couple of issues, one of which was audio refusing to play despite proper setup. This turned out to be an issue with how [LVCv3](https://forum.cfx.re/t/luxart-vehicle-control-v3/4436673) (or at least our setup) was loading audio banks. Depending on your artifact version, you can only ever have 7 - 10 audio banks loaded. With custom sirens, this set us at 6 audio banks due to us using Server Sided Siren Integration, it ended up conflicting (as well as other resources not unloading audio banks) which allowed us to use mana_audio to play sounds directly on the entity and sync it with other players.

As far as we can tell, this will still run into the 10 audio bank limit that exists. Whether this exists for PlayAmbientSpeechFromPositionNative, we're not sure, but the ability for this audio to be played directly from the ped is important for uses like this resource, or others that might want to play sounds from entities.

