/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\q\addons\custom_server\Configs\blck_defines.hpp";

blck_UMS_uniforms = 
[
	"U_I_Wetsuit",
	"U_O_Wetsuit",
	"U_B_Wetsuit"
];

blck_UMS_headgear = 
[
	"G_Diving",
	"G_B_Diving",
	"G_O_Diving",
	"G_I_Diving"
];

blck_UMS_vests = 
[
	"V_RebreatherB",
	"V_RebreatherIA",
	"V_RebreatherIR"
];

blck_UMS_weapons = 
[
	"arifle_SDAR_F"
];

if ((tolower blck_modType) isEqualTo "exile") then
{
	blck_UMS_submarines =
	[
		
		"Exile_Boat_SDV_CSAT",
		"Exile_Boat_SDV_Digital",
		"Exile_Boat_SDV_Grey"
	];
	
	blck_UMS_crates =	["Exile_Container_SupplyBox"];
};
if ((tolower blck_modType) isEqualTo "epoch") then
{
	blck_UMS_submarines = ["B_SDV_01_EPOCH"];
	blck_UMS_crates = blck_crateTypes;
	//blck_UMS_crates = ["container_epoch"];	
};
if ((toLower blck_modType) isEqualTo "default") then 
{
	blck_UMS_submarines =
	[
		
		"Exile_Boat_SDV_CSAT",
		"Exile_Boat_SDV_Digital",
		"Exile_Boat_SDV_Grey"
	];
	
	blck_UMS_crates = blck_crateTypes;

};

blck_UMS_unarmedSurfaceVessels = 
[
	"B_Boat_Transport_01_F",
	"I_Boat_Transport_01_F"
];
blck_UMS_armedSurfaceVessels =
[
	"B_Boat_Armed_01_minigun_F",
	"I_Boat_Armed_01_minigun_F"	
];
blck_UMS_surfaceVessels = blck_UMS_unarmedSurfaceVessels + blck_UMS_armedSurfaceVessels;
blck_UMS_shipWrecks =
[
	"Land_Boat_06_wreck_F",
	"Land_Boat_05_wreck_F",
	"Land_Boat_04_wreck_F",
	"Land_Boat_02_abandoned_F",
	"Land_Boat_01_abandoned_red_F",
	"Land_Boat_01_abandoned_blue_F"
];
