#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in ["cop_1111"])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
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
				case 1: { life_paycheck = ((2000) + (_donatorlevel)); }; //Cadet
				case 2: { life_paycheck = ((3000) + (_donatorlevel)); }; //Officer
				case 3: { life_paycheck = ((4000) + (_donatorlevel)); }; //Cpl
				case 4: { life_paycheck = ((5000) + (_donatorlevel)); }; //Sgt
				case 5: { life_paycheck = ((6000) + (_donatorlevel)); }; //Lt
				case 6: { life_paycheck = ((6500) + (_donatorlevel)); }; //Captain
				default { life_paycheck = ((2000) + (_donatorlevel)); }; //default in-case anything goes tits up
			};
};


player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

//Introcam
[] spawn life_fnc_IntroCam;

//Skins und Backpacks für Cops
// CopLevel 1
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_Rangemaster"};
        player setObjectTextureGlobal [0,"skins\human\cop\rekrut.jpg"];
        waitUntil {uniform player != "U_Rangemaster"};
    };
};
// CopLevel 2
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_B_CombatUniform_mcam_vest"};
        player setObjectTextureGlobal [0,"skins\human\cop\polizei_uniform.jpg"];
        waitUntil {uniform player != "U_B_CombatUniform_mcam_vest"};
    };
};
// CopLevel 3+4
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_B_SpecopsUniform_sgg"};
        player setObjectTextureGlobal [0,"skins\human\cop\polizei2.jpg"];
        waitUntil {uniform player != "U_B_SpecopsUniform_sgg"};
	};
};
// CopLevel 5
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_B_CombatUniform_mcam"};
        player setObjectTextureGlobal [0,"skins\human\cop\sek.jpg"];
        waitUntil {uniform player != "U_B_CombatUniform_mcam"};
    };
};
// CopLevel 6
[] spawn
{
while {true} do
    {
        waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
        player setObjectTextureGlobal [0,"skins\human\cop\gsg9.paa"];
        waitUntil {uniform player != "U_B_CombatUniform_mcam_worn"};
	};
};
//End CLothes
