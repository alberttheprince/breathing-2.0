fx_version 'cerulean'
game 'gta5'

description 'A Resource that implements total realism by forcing players to breathe or DIE'
author "PrinceAlbert - Noor Nahas"

version '1.0.0'

client_scripts {
	'client.lua'
}

server_scripts {
	'server.lua'
}

files {
	'dlc_BREATHING_SOUNDSET/BREATHING_SOUNDSET.awc',
	'data/BREATHING_SOUNDSET.dat54.rel',
	'data/BREATHING_SOUNDSET.dat54.nametable',
}

data_file "AUDIO_WAVEPACK" "dlc_BREATHING_SOUNDSET"
data_file "AUDIO_SOUNDDATA" "data/BREATHING_SOUNDSET.dat"


lua54 'yes'
use_experimental_fxv2_oal 'yes'