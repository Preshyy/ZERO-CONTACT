/// @description Ending
// Variables
gunsprite = layer_sprite_get_id("TitleAssets", "gGun");

// Creating multiple lines of text
// Ending 1
if (global.hasgun) && (global.kills > 0) {
	// Arrays for multiple lines
	endtext[0] = "Let it be known that on this day, our valiant Detective had slain " + string(global.kills) + " infected.";
	if (global.kills == 1) { // Edge case
		endtext[0] = "Let it be known that on this day, our vialant Detective had somehow only slain " + string(global.kills) + " infected.";
	}
	endtext[1] = "Even when the infected took up arms...";
	endtext[2] = "You, our very own hero, had the courage to rise up and answer the call.";
	endtext[3] = "Your efforts will forever be remembered and there will be songs of your conquest!";
	endtext[4] = "The mad scientist responsible for the creation of this virus has been apprehended,\nand will be put to trial in the highest of courts.";
	endtext[5] = "The Park Ranger who also contributed to this victory\nby guiding our you has been gracefully rewarded.";
	endtext[6] = "Thank you for playing!";
}
else {
	layer_sprite_destroy(gunsprite);
	endtext[0] = "Let is be known that on this day, our valiant Detective reminded us that violence\nis not always the answer.";
	endtext[1] = "We believed we were riddled by an infection that would end our race and out of fear\nwe sought to protect ourselves.";
	endtext[2] = "You, our hero, showed us that as long as we can be willing to look for\na different path, there will be one to find.";
	endtext[3] = "Thank you for your virtue of patience, as it has saved us all and brought us even\ncloser to each other.";
	endtext[4] = "The mad scientist responsible for this virus has surrendered himself and pledged to a life of goodwill!";
	endtext[5] = "The Park Ranger is also relieved to know that the park was safe and its people\ncan live in harmony once again.";
	endtext[6] = "Huzzah to that!! Thank you for playing!";
}

// Variables
spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(endtext[currentline]);
text = "";