#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end", "_donatorlevel"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

	if(__GETC__(life_coplevel) < 1) then 
	{
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
	
// Paycheck for each Rang 
// Author KRinK
// All Rights by KRinK
// Set donor pay check increase
switch (__GETC__(life_donator)) do 
			{
				case 1: { _donatorlevel = 500; }; //Level 1
				case 2: { _donatorlevel = 1000; }; //Level 2
				case 3: { _donatorlevel = 1500; }; //Level 3
				default { _donatorlevel = 0; }; //default for non donators they get nada!
			};

// Set Paycheck for Police
switch (__GETC__(life_coplevel)) do 
			{
				case 1: { life_paycheck = ((2500) + (_donatorlevel)); }; //Polizeianwärter
				case 2: { life_paycheck = ((5000) + (_donatorlevel)); }; //Polizeiwachtmeister
				case 3: { life_paycheck = ((7500) + (_donatorlevel)); }; //Polizeioberwachtmeister
				case 4: { life_paycheck = ((10000) + (_donatorlevel)); }; //Polizeioberkommesar
				case 5: { life_paycheck = ((12500) + (_donatorlevel)); }; //Polizeihauptkommesar
				case 6: { life_paycheck = ((15000) + (_donatorlevel)); }; //Sondereinstzkommando
				case 7: { life_paycheck = ((20000) + (_donatorlevel)); }; //Polizeirat
				default { life_paycheck = ((30000) + (_donatorlevel)); }; //default in-case anything goes tits up
			};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn
{
while {true} do
{
waitUntil {uniform player == "U_Rangemaster"};
player setObjectTextureGlobal [0,"textures\Polizei_beamter.paa"];
waitUntil {uniform player != "U_Rangemaster"};
};
};