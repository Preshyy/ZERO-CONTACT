/// @description Equip gun
global.hasgun = true; // Player has gun, destroys gun if player never picked it up in level 1
instance_create_layer(oPlayer.x, oPlayer.y, "Gun", oGun);
instance_destroy();