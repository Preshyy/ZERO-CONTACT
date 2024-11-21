/// @description If enemy has weapon...
if (hasweapon) {
	mygun = instance_create_layer(x,y,"Gun",oEgun)	
	with (mygun) {
		owner = other.id;
	}
}
else {
	mygun = noone;	
}