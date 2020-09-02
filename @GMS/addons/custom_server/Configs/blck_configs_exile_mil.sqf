/*
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "\q\addons\custom_server\Configs\blck_defines.hpp";	

////////////
// Exile-specific settings
////////////	
	
// list of locations that are protected against mission spawns

switch (toLower(worldName)) do
{
	case "altis": {
		blck_locationBlackList append [
		//Add location as [[xpos,ypos,0],minimumDistance],
		// Note that there should not be a comma after the last item in this table
		[[10800,10641,0],1000]  // isthmus - missions that spawn here often are glitched.
		];
	};
	case "tanoa": {
		blck_locationBlackList append [	];
	};
};
	
/*********************************************************************************

AI WEAPONS, UNIFORMS, VESTS AND GEAR

**********************************************************************************/
	
	blck_blacklistSpawns = false;
	blck_listConcreteMixerZones	= false;
	blck_AI_Side = EAST;

	blck_crateMoneyBlue = [100,250];
	blck_crateMoneyRed = [175, 300];
	blck_crateMoneyGreen = [300, 500];
	blck_crateMoneyOrange = [500, 750];

	blck_crateTypes = ["Box_FIA_Ammo_F","Box_FIA_Support_F","Box_FIA_Wps_F","I_SupplyCrate_F","Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","IG_supplyCrate_F","Box_NATO_Wps_F","I_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F"];  // Default crate type.
		
	blck_maximumItemPriceInAI_Loadouts = 1000;
	
	blck_armed_vehicles_Exile = [
		"Exile_Car_BTR40_MG_Green",
		"Exile_Car_HMMWV_M134_Green",
		"Exile_Car_HMMWV_M2_Green",
		"B_LSV_01_armed_F",
		"Exile_Car_Offroad_Armed_Guerilla01"			
	];
	
	blck_lightlyArmed_ARMA3 = [
		"B_G_Offroad_01_armed_F", 
		"O_G_Offroad_01_armed_F",
		"B_MRAP_01_gmg_F", 
		"B_MRAP_01_hmg_F",
		"O_MRAP_02_gmg_F",  
		"O_MRAP_02_hmg_F",
		"I_MRAP_03_hmg_F", 
		"I_MRAP_03_gmg_F",
		"B_APC_Wheeled_01_cannon_F", 			
		"I_APC_Wheeled_03_cannon_F"	
	];

	blck_light_AT_ARMA3 = [
		"O_G_Offroad_01_AT_F", 
		"B_G_Offroad_01_AT_F", 
		"O_T_LSV_02_AT_F", 
		"O_LSV_02_AT_F", 
		"B_T_LSV_01_AT_F", 
		"B_LSV_01_AT_F"
	];
	blck_tracked_AA_ARMA3 = [
		"O_APC_Tracked_02_AA_F",
		"B_APC_Tracked_01_AA_F"	
	];
	blck_tracked_APC_ARMA3 = [
		"B_APC_Tracked_01_rcws_F",
		"B_APC_Tracked_01_CRV_F",
		"O_APC_Tracked_02_cannon_F", 
		"O_APC_Wheeled_02_rcws_F", 
		"I_APC_tracked_03_cannon_F"
	];

	blck_Tanks_ARMA3 = [
		//"B_MBT_01_arty_F",
		//"B_MBT_01_mlrs_F",
		"B_MBT_01_TUSK_F",
		"O_MBT_02_cannon_F",
		//"O_MBT_02_arty_F",
		"I_MBT_03_cannon_F"
	];
	#ifdef useCUP
	blck_APC_CUP = [
		"CUP_B_Mastiff_GMG_GB_D",  
		"CUP_B_Mastiff_HMG_GB_D",  
		"CUP_B_Ridgback_HMG_GB_D",  
		"CUP_B_Ridgback_GMG_GB_D",  
		"CUP_B_M1128_MGS_Desert",  
		"CUP_B_M1135_ATGMV_Desert_Slat",  
		"CUP_B_M1133_MEV_Desert_Slat",  
		"CUP_B_LAV25M240_desert_USMC",  
		"CUP_B_M1129_MC_MK19_Desert_Slat",  
		"CUP_B_LAV25_HQ_desert_USMC",  
		"CUP_B_BRDM2_ATGM_CDF",  
		"CUP_B_BTR60_CDF",  
		"CUP_B_M1130_CV_M2_Desert_Slat",  
		"CUP_B_M1126_ICV_MK19_Desert_Slat",  
		"CUP_O_BTR90_RU",  
		"CUP_O_GAZ_Vodnik_BPPU_RU",
		"CUP_B_M1126_ICV_M2_Desert",  
		"CUP_B_M1126_ICV_MK19_Desert",  
		"CUP_B_M1130_CV_M2_Desert",  
		"CUP_B_M1126_ICV_M2_Desert_Slat",  
		"CUP_B_M1133_MEV_Desert",  
		"CUP_O_GAZ_Vodnik_AGS_RU",  
		"CUP_O_GAZ_Vodnik_PK_RU"
	];

	blck_Tanks_CUP = [
		"CUP_B_M2A3Bradley_USA_D",  
		//"CUP_B_M113_desert_USA",  
		//"CUP_B_M163_USA",  
		"CUP_B_M6LineBacker_USA_D",  
		"CUP_B_M1A1_DES_US_Army",  
		"CUP_B_M1A2_TUSK_MG_DES_US_Army",  
		//"CUP_B_AAV_USMC",  
		//"CUP_B_M270_DPICM_USA",  
		"CUP_B_ZSU23_CDF",  
		//"CUP_B_BMP2_CDF",  
		"CUP_B_T72_CDF",  
		//"CUP_I_T34_NAPA",  
		"CUP_B_Challenger2_NATO",  
		//"CUP_B_FV432_Bulldog_GB_D_RWS",  
		//"CUP_B_FV432_Bulldog_GB_D",  
		"CUP_B_FV510_GB_D_SLAT",  
		//"CUP_B_MCV80_GB_D_SLAT",  
		//"CUP_O_2S6_RU",  
		"CUP_O_BMP3_RU",  
		"CUP_O_T90_RU",  
		"CUP_O_T55_SLA"  //,  
		//"CUP_O_BMP1P_TKA",  
		//"CUP_B_M270_DPICM_USA",
		//"CUP_B_M2Bradley_USA_W",  
		//"CUP_B_FV510_GB_D",  
		//"CUP_B_MCV80_GB_D",  
		//"CUP_B_M7Bradley_USA_D",  
		//"CUP_O_2S6_RU",  
		//"CUP_O_BMP1_TKA""
	];
	#endif

	blck_AIPatrolVehicles = 
	[
	//"Exile_Car_Offroad_Armed_Guerilla01",
	//"Exile_Car_Offroad_Armed_Guerilla02",
	//"Exile_Car_BTR40_MG_Green",
	//"Exile_Car_BTR40_MG_Camo",
	//"Exile_Car_HMMWV_M134_Green",
	//"Exile_Car_HMMWV_M134_Desert",
	//"Exile_Car_HMMWV_M134_Desert",
	"Exile_Car_HMMWV_M2_Desert",
	"B_LSV_01_armed_F",
	//"B_MRAP_02_gmg_ghex_F",
	//"O_MRAP_02_hmg_ghex_F",
	"O_MRAP_03_gmg_ghex_F",
	//"O_MRAP_03_hmg_ghex_F",	
	"B_MBT_01_cannon_F",
	"B_MBT_01_cannon_F",	// Duplicate to increase chance that these will spawn relative to others
	//"B_MBT_01_mlrs_base_F",
	//"B_MBT_01_mlrs_F",
	"B_MBT_01_TUSK_F",
	"B_MBT_01_TUSK_F",// Duplicate to increase chance that these will spawn relative to others
	"B_APC_Tracked_01_AA_F",
	"B_APC_Tracked_01_AA_F",// Duplicate to increase chance that these will spawn relative to others
	"B_APC_Tracked_01_AA_F",// Duplicate to increase chance that these will spawn relative to others	
	"B_APC_Tracked_01_CRV_F",
	"B_APC_Tracked_01_rcws_F"																						
	]; // Type of vehicle spawned to defend AI bases	

	///  Defined again below in this instance to show options available and also my personal preferences for mil servers
	blck_AIPatrolVehiclesBlue = [	
		"Exile_Car_Offroad_Armed_Guerilla01",
		"Exile_Car_Offroad_Armed_Guerilla02",
		"Exile_Car_BTR40_MG_Green",
		"Exile_Car_BTR40_MG_Camo",
		"Exile_Car_HMMWV_M134_Green",
		"Exile_Car_HMMWV_M134_Desert",
		"Exile_Car_HMMWV_M134_Desert",
		"Exile_Car_HMMWV_M2_Desert",
		"B_LSV_01_armed_F"		
	];

	blck_AIPatrolVehiclesBlue = blck_AIPatrolVehicles;


	#ifdef useCUP
	blck_AIPatrolVehiclesRed = blck_lightlyArmed_ARMA3 + blck_APC_CUP;
	blck_AIPatrolVehiclesGreen = blck_Tanks_ARMA3 + blck_Tanks_CUP;
	blck_AIPatrolVehiclesOrange =  blck_Tanks_ARMA3 + blck_Tanks_CUP;	
	#else
	blck_AIPatrolVehiclesRed = blck_lightlyArmed_ARMA3;
	blck_AIPatrolVehiclesGreen = blck_Tanks_ARMA3;
	blck_AIPatrolVehiclesOrange =  blck_Tanks_ARMA3;	
	#endif
	
	if (toLower(worldName) isEqualTo "namalsk") then
	{
		blck_lightlyArmed_ARMA3 = [
			"B_G_Offroad_01_armed_F", 
			"O_G_Offroad_01_armed_F",
			//"B_MRAP_01_gmg_F", 
			"B_MRAP_01_hmg_F",
			//"O_MRAP_02_gmg_F",  
			"O_MRAP_02_hmg_F",
			"I_MRAP_03_hmg_F" 
			//"I_MRAP_03_gmg_F",
			//"B_APC_Wheeled_01_cannon_F", 			
			//"I_APC_Wheeled_03_cannon_F"	
		];	
		diag_log "blck)configs_exile_mil.sqf:: - > Using special settings for namalsk";
		blck_AIPatrolVehiclesRed = blck_lightlyArmed_ARMA3 + blck_AIPatrolVehiclesBlue;
		blck_AIPatrolVehiclesGreen = blck_AIPatrolVehiclesRed;
		blck_AIPatrolVehiclesOrange = blck_AIPatrolVehiclesRed;		
	};
	
	// Blacklisted itesm
	blck_blacklistedOptics = ["optic_Nightstalker","optic_tws","optic_tws_mg"];
	
	// AI Weapons and Attachments
	blck_bipods = ["bipod_01_F_blk","bipod_01_F_mtp","bipod_01_F_snd","bipod_02_F_blk","bipod_02_F_hex","bipod_02_F_tan","bipod_03_F_blk","bipod_03_F_oli"];

	blck_Optics_Holo = ["optic_Hamr","optic_MRD","optic_Holosight","optic_Holosight_smg","optic_Aco","optic_ACO_grn","optic_ACO_grn_smg","optic_Aco_smg","optic_Yorris"];
	blck_Optics_Reticule = ["optic_Arco","optic_MRCO"];
	blck_Optics_Scopes = [
		"optic_AMS","optic_AMS_khk","optic_AMS_snd",
		"optic_DMS",
		"optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan",
		"optic_LRPS",
		"optic_Nightstalker",
		"optic_NVS",
		"optic_SOS",
		"optic_tws",
		"optic_tws_mg"
		];
		
	#ifdef useAPEX	
	blck_Optics_Apex = [
		//Apex
		"optic_Arco_blk_F",	"optic_Arco_ghex_F",
		"optic_DMS_ghex_F",
		"optic_Hamr_khk_F",
		"optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F",
		"optic_SOS_khk_F",
		"optic_LRPS_tna_F","optic_LRPS_ghex_F",
		"optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_smg_blk_F"
		];	
	blck_Optics = blck_Optics_Holo + blck_Optics_Reticule + blck_Optics_Scopes;
	blck_Optics = blck_Optics + blck_Optics_Apex;
	#endif

	blck_bipods = [
		"bipod_01_F_blk","bipod_01_F_mtp","bipod_01_F_snd","bipod_02_F_blk","bipod_02_F_hex","bipod_02_F_tan","bipod_03_F_blk","bipod_03_F_oli",
		//Apex
		"bipod_01_F_khk"
		];
	
	blck_silencers = [
		"muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_93mmg","muzzle_snds_93mmg_tan","muzzle_snds_acp","muzzle_snds_B",
		"muzzle_snds_H","muzzle_snds_H_MG","muzzle_snds_H_SW","muzzle_snds_L","muzzle_snds_M",
		//Apex			
		"muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_58_blk_F","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F",
		"muzzle_snds_58_wdm_F","muzzle_snds_65_TI_blk_F","muzzle_snds_65_TI_hex_F","muzzle_snds_65_TI_ghex_F","muzzle_snds_H_MG_blk_F","muzzle_snds_H_MG_khk_F"
		];		

	blck_RifleSniper = [ 
		"srifle_EBR_F","srifle_GM6_F","srifle_LRR_F","srifle_DMR_01_F" 		
	];

	blck_RifleAsault_556 = [
		"arifle_SDAR_F","arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F","arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F","arifle_SDAR_F"
		];
	
	blck_RifleAsault_650 = [
		"arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F"
		];
	
	blck_RifleAsault = [
		"arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F",
		"arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F","arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F"
	];

	blck_RifleLMG = [
		"LMG_Mk200_F","LMG_Zafir_F"
	];

	blck_RifleOther = [
		"SMG_01_F","SMG_02_F"
	];

	blck_Pistols = [
		"hgun_PDW2000_F","hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Pistol_Signal_F"
	];	
	blck_Pistols_blue = blck_Pistols;
	blck_Pistols_red = blck_Pistols;
	blck_Pistols_green = blck_Pistols;
	blck_Pistols_orange = blck_Pistols;
	
	blck_DLC_MMG = [
				"MMG_01_hex_F","MMG_02_sand_F","MMG_01_tan_F","MMG_02_black_F","MMG_02_camo_F"
	];
	
	blck_DLC_Sniper = [
		"srifle_DMR_02_camo_F","srifle_DMR_02_F","srifle_DMR_02_sniper_F","srifle_DMR_03_F","srifle_DMR_03_tan_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_F","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F"
	];
				
	//This defines the random weapon to spawn on the AI
	//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
	blck_WeaponList_Orange = blck_RifleSniper + blck_RifleAsault_650 + blck_RifleLMG + blck_DLC_Sniper + blck_DLC_MMG;
	blck_WeaponList_Green = blck_RifleSniper + blck_RifleAsault_650 +blck_RifleLMG + blck_DLC_MMG;
	blck_WeaponList_Blue = blck_RifleOther + blck_RifleAsault_556 + blck_RifleAsault_650;
	blck_WeaponList_Red = blck_RifleAsault_556 + blck_RifleSniper + blck_RifleAsault_650 + blck_RifleLMG;

	#ifdef useAPEX
	blck_apexWeapons = ["arifle_AK12_F","arifle_AK12_GL_F","arifle_AKM_F","arifle_AKM_FL_F","arifle_AKS_F","arifle_ARX_blk_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F",
						"arifle_CTAR_ghex_F","arifle_CTAR_GL_blk_F","arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_CTARS_ghex_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F",
						"arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F","arifle_SPAR_03_blk_F",
						"arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","arifle_MX_khk_F","arifle_MX_GL_khk_F","arifle_MXC_khk_F","arifle_MXM_khk_F"];
			
	blck_WeaponList_Orange = blck_WeaponList_Orange + blck_apexWeapons;
	blck_WeaponList_Green = blck_WeaponList_Green + blck_apexWeapons;	
	#endif
	

	
	blck_backpacks = ["B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_oli","B_Carryall_khk","B_Carryall_cbr" ];  
		
	#ifdef useAPEX
	blck_ApexBackpacks = [
		"B_Bergen_mcamo_F","B_Bergen_dgtl_F","B_Bergen_hex_F","B_Bergen_tna_F","B_AssaultPack_tna_F","B_Carryall_ghex_F",
		"B_FieldPack_ghex_F","B_ViperHarness_blk_F","B_ViperHarness_ghex_F","B_ViperHarness_hex_F","B_ViperHarness_khk_F",
		"B_ViperHarness_oli_F","B_ViperLightHarness_blk_F","B_ViperLightHarness_ghex_F","B_ViperLightHarness_hex_F","B_ViperLightHarness_khk_F","B_ViperLightHarness_oli_F"
		];	
	blck_backpacks = blck_backpacks + blck_ApexBackpacks;
	#endif
	blck_backpacks_blue = blck_backpacks;
	blck_backpacks_red = blck_backpacks;
	blck_backpacks_green = blck_backpacks;
	blck_backpacks_orange = blck_backpacks;
	
	blck_BanditHeadgear = ["H_Shemag_khk","H_Shemag_olive","H_Shemag_tan","H_ShemagOpen_khk"];
	//This defines the skin list, some skins are disabled by default to permit players to have high visibility uniforms distinct from those of the AI.
	blck_headgear = [
		"H_Cap_blk",
		"H_Cap_blk_Raven",
		"H_Cap_blu",
		"H_Cap_brn_SPECOPS",
		"H_Cap_grn",
		"H_Cap_headphones",
		"H_Cap_khaki_specops_UK",
		"H_Cap_oli",
		"H_Cap_press",
		"H_Cap_red",
		"H_Cap_tan",
		"H_Cap_tan_specops_US",
		"H_Watchcap_blk",
		"H_Watchcap_camo",
		"H_Watchcap_khk",
		"H_Watchcap_sgg",
		"H_MilCap_blue",
		"H_MilCap_dgtl",
		"H_MilCap_mcamo",
		"H_MilCap_ocamo",
		"H_MilCap_oucamo",
		"H_MilCap_rucamo",
		"H_Bandanna_camo",
		"H_Bandanna_cbr",
		"H_Bandanna_gry",
		"H_Bandanna_khk",
		"H_Bandanna_khk_hs",
		"H_Bandanna_mcamo",
		"H_Bandanna_sgg",
		"H_Bandanna_surfer",
		"H_Booniehat_dgtl",
		"H_Booniehat_dirty",
		"H_Booniehat_grn",
		"H_Booniehat_indp",
		"H_Booniehat_khk",
		"H_Booniehat_khk_hs",
		"H_Booniehat_mcamo",
		"H_Booniehat_tan",
		"H_Hat_blue",
		"H_Hat_brown",
		"H_Hat_camo",
		"H_Hat_checker",
		"H_Hat_grey",
		"H_Hat_tan",
		"H_StrawHat",
		"H_StrawHat_dark",
		"H_Beret_02",
		"H_Beret_blk",
		"H_Beret_blk_POLICE",
		"H_Beret_brn_SF",
		"H_Beret_Colonel",
		"H_Beret_grn",
		"H_Beret_grn_SF",
		"H_Beret_ocamo",
		"H_Beret_red",
		"H_Shemag_khk",
		"H_Shemag_olive",
		"H_Shemag_olive_hs",
		"H_Shemag_tan",
		"H_ShemagOpen_khk",
		"H_ShemagOpen_tan",
		"H_TurbanO_blk",
		"H_CrewHelmetHeli_B",
		"H_CrewHelmetHeli_I",
		"H_CrewHelmetHeli_O",
		"H_HelmetCrew_I",
		"H_HelmetCrew_B",
		"H_HelmetCrew_O",
		"H_PilotHelmetHeli_B",
		"H_PilotHelmetHeli_I",
		"H_PilotHelmetHeli_O",
		//Apex

		"H_MilCap_tna_F",
		"H_MilCap_ghex_F",
		"H_Booniehat_tna_F",
		"H_Beret_gen_F",
		"H_MilCap_gen_F",
		"H_Cap_oli_Syndikat_F",
		"H_Cap_tan_Syndikat_F",
		"H_Cap_blk_Syndikat_F",
		"H_Cap_grn_Syndikat_F"		
	];
	blck_helmets = [
		"H_HelmetB",
		"H_HelmetB_black",
		"H_HelmetB_camo",
		"H_HelmetB_desert",
		"H_HelmetB_grass",
		"H_HelmetB_light",
		"H_HelmetB_light_black",
		"H_HelmetB_light_desert",
		"H_HelmetB_light_grass",
		"H_HelmetB_light_sand",
		"H_HelmetB_light_snakeskin",
		"H_HelmetB_paint",
		"H_HelmetB_plain_blk",
		"H_HelmetB_sand",
		"H_HelmetB_snakeskin",
		"H_HelmetCrew_B",
		"H_HelmetCrew_I",
		"H_HelmetCrew_O",
		"H_HelmetIA",
		"H_HelmetIA_camo",
		"H_HelmetIA_net",
		"H_HelmetLeaderO_ocamo",
		"H_HelmetLeaderO_oucamo",
		"H_HelmetO_ocamo",
		"H_HelmetO_oucamo",
		"H_HelmetSpecB",
		"H_HelmetSpecB_blk",
		"H_HelmetSpecB_paint1",
		"H_HelmetSpecB_paint2",
		"H_HelmetSpecO_blk",
		"H_HelmetSpecO_ocamo",
		"H_CrewHelmetHeli_B",
		"H_CrewHelmetHeli_I",
		"H_CrewHelmetHeli_O",
		"H_HelmetCrew_I",
		"H_HelmetCrew_B",
		"H_HelmetCrew_O",
		"H_PilotHelmetHeli_B",
		"H_PilotHelmetHeli_I",
		"H_PilotHelmetHeli_O",
		"H_Helmet_Skate",
		"H_HelmetB_TI_tna_F",
		// Apex
		//"H_HelmetO_ViperSP_hex_F",
		//"H_HelmetO_ViperSP_ghex_F",
		"H_HelmetB_tna_F",
		"H_HelmetB_Enh_tna_F",
		"H_HelmetB_Light_tna_F",
		"H_HelmetSpecO_ghex_F",
		"H_HelmetLeaderO_ghex_F",
		"H_HelmetO_ghex_F",
		"H_HelmetCrew_O_ghex_F"			
	];
	blck_headgearList = blck_headgear + blck_helmets;
	blck_headgear_blue = blck_headgearList;
	blck_headgear_red = blck_headgearList;
	blck_headgear_green = blck_headgearList;
	blck_headgear_orange = blck_headgearList;
	
	//This defines the skin list, some skins are disabled by default to permit players to have high visibility uniforms distinct from those of the AI.
	blck_SkinList = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
		// I have commented out some high visibility uniforms that can be reserved for players or special missions.
		// for example, you could have a uniform list specified in a mission template.
		"U_AntigonaBody",
		"U_AttisBody",
		"U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam_worn","U_B_CombatUniform_sgg","U_B_CombatUniform_sgg_tshirt","U_B_CombatUniform_sgg_vest","U_B_CombatUniform_wdl","U_B_CombatUniform_wdl_tshirt","U_B_CombatUniform_wdl_vest",
		"U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3",	
		"U_B_GhillieSuit",
		"U_B_HeliPilotCoveralls","U_B_PilotCoveralls",
		"U_B_SpecopsUniform_sgg",
		"U_B_survival_uniform",
		"U_B_Wetsuit",
		//"U_BasicBody",
		"U_BG_Guerilla1_1","U_BG_Guerilla2_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_Guerilla3_2",
		"U_BG_leader",
		"U_C_Commoner_shorts","U_C_Commoner1_1","U_C_Commoner1_2","U_C_Commoner1_3","U_C_Commoner2_1","U_C_Commoner2_2","U_C_Commoner2_3",
		"U_C_Farmer","U_C_Fisherman","U_C_FishermanOveralls","U_C_HunterBody_brn","U_C_HunterBody_grn",
		//"U_C_Journalist",
		"U_C_Novak",
		//"U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour",
		"U_C_Poor_1","U_C_Poor_2","U_C_Poor_shorts_1","U_C_Poor_shorts_2","U_C_PriestBody","U_C_Scavenger_1","U_C_Scavenger_2",
		//"U_C_Scientist","U_C_ShirtSurfer_shorts","U_C_TeeSurfer_shorts_1","U_C_TeeSurfer_shorts_2",
		"U_C_WorkerCoveralls","U_C_WorkerOveralls","U_Competitor",
		"U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_I_CombatUniform_tshirt","U_I_G_resistanceLeader_F",
		"U_I_G_Story_Protagonist_F",
		"U_I_GhillieSuit",
		"U_I_HeliPilotCoveralls",
		"U_I_OfficerUniform",
		"U_I_pilotCoveralls",
		"U_I_Wetsuit",
		"U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2",
		"U_IG_leader",
		"U_IG_Menelaos",
		//"U_KerryBody",
		//"U_MillerBody",
		//"U_NikosAgedBody",
		//"U_NikosBody",
		"U_O_CombatUniform_ocamo","U_O_CombatUniform_oucamo",
		"U_O_GhillieSuit",
		"U_O_OfficerUniform_ocamo",
		"U_O_PilotCoveralls",
		"U_O_SpecopsUniform_blk",
		"U_O_SpecopsUniform_ocamo",
		"U_O_Wetsuit",
		"U_OG_Guerilla1_1","U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla2_3","U_OG_Guerilla3_1","U_OG_Guerilla3_2","U_OG_leader",
		//"U_OI_Scientist",
		//"U_OrestesBody",
		"U_Rangemaster",
		// DLC
		"U_B_FullGhillie_ard","U_I_FullGhillie_ard","U_O_FullGhillie_ard","U_B_FullGhillie_sard","U_O_FullGhillie_sard","U_I_FullGhillie_sard","U_B_FullGhillie_lsh","U_O_FullGhillie_lsh","U_I_FullGhillie_lsh",
		//Apex
		"U_B_T_Soldier_F",
		"U_B_T_Soldier_AR_F",
		"U_B_T_Soldier_SL_F",
		//"U_B_T_Sniper_F",
		//"U_B_T_FullGhillie_tna_F",
		"U_B_CTRG_Soldier_F",
		"U_B_CTRG_Soldier_2_F",
		"U_B_CTRG_Soldier_3_F",
		"U_B_GEN_Soldier_F",
		"U_B_GEN_Commander_F",
		"U_O_T_Soldier_F",
		"U_O_T_Officer_F",
		//"U_O_T_Sniper_F",
		//"U_O_T_FullGhillie_tna_F",
		"U_O_V_Soldier_Viper_F",
		"U_O_V_Soldier_Viper_hex_F",
		"U_I_C_Soldier_Para_1_F",
		"U_I_C_Soldier_Para_2_F",
		"U_I_C_Soldier_Para_3_F",
		"U_I_C_Soldier_Para_4_F",
		"U_I_C_Soldier_Para_5_F",
		"U_I_C_Soldier_Bandit_1_F",
		"U_I_C_Soldier_Bandit_2_F",
		"U_I_C_Soldier_Bandit_3_F",
		"U_I_C_Soldier_Bandit_4_F",
		"U_I_C_Soldier_Bandit_5_F",
		"U_I_C_Soldier_Camo_F",
		"U_C_man_sport_1_F",
		"U_C_man_sport_2_F",
		"U_C_man_sport_3_F",
		"U_C_Man_casual_1_F",
		"U_C_Man_casual_2_F",
		"U_C_Man_casual_3_F",
		"U_C_Man_casual_4_F",
		"U_C_Man_casual_5_F",
		"U_C_Man_casual_6_F",
		"U_B_CTRG_Soldier_urb_1_F",
		"U_B_CTRG_Soldier_urb_2_F",
		"U_B_CTRG_Soldier_urb_3_F"
	];
	blck_SkinList_blue = blck_SkinList;
	blck_SkinList_red = blck_SkinList;
	blck_SkinList_green = blck_SkinList;
	blck_SkinList_orange = blck_SkinList;
		
	blck_vests = [
		"V_Press_F",
		"V_Rangemaster_belt",
		"V_TacVest_blk",
		"V_TacVest_blk_POLICE",
		"V_TacVest_brn",
		"V_TacVest_camo",
		"V_TacVest_khk",
		"V_TacVest_oli",
		"V_TacVestCamo_khk",
		"V_TacVestIR_blk",
		"V_I_G_resistanceLeader_F",
		"V_BandollierB_blk",
		"V_BandollierB_cbr",
		"V_BandollierB_khk",
		"V_BandollierB_oli",
		"V_BandollierB_rgr",
		"V_Chestrig_blk",
		"V_Chestrig_khk",
		"V_Chestrig_oli",
		"V_Chestrig_rgr",
		"V_HarnessO_brn",
		"V_HarnessO_gry",
		"V_HarnessOGL_brn",
		"V_HarnessOGL_gry",
		"V_HarnessOSpec_brn",
		"V_HarnessOSpec_gry",
		"V_PlateCarrier1_blk",
		"V_PlateCarrier1_rgr",
		"V_PlateCarrier2_rgr",
		"V_PlateCarrier3_rgr",
		"V_PlateCarrierGL_blk",
		"V_PlateCarrierGL_mtp",
		"V_PlateCarrierGL_rgr",
		"V_PlateCarrierH_CTRG",
		"V_PlateCarrierIA1_dgtl",
		"V_PlateCarrierIA2_dgtl",
		"V_PlateCarrierIAGL_dgtl",
		"V_PlateCarrierIAGL_oli",
		"V_PlateCarrierL_CTRG",
		"V_PlateCarrierSpec_blk",
		"V_PlateCarrierSpec_mtp",
		#ifdef useAPEX
		//Apex
		"V_TacChestrig_grn_F",
		"V_TacChestrig_oli_F",
		"V_TacChestrig_cbr_F",
		"V_PlateCarrier1_tna_F",
		"V_PlateCarrier2_tna_F",
		"V_PlateCarrierSpec_tna_F",
		"V_PlateCarrierGL_tna_F",
		"V_HarnessO_ghex_F",
		"V_HarnessOGL_ghex_F",
		"V_BandollierB_ghex_F",
		"V_TacVest_gen_F",
		"V_PlateCarrier1_rgr_noflag_F",
		#endif
		"V_PlateCarrier2_rgr_noflag_F"
		];
	blck_vests_blue = blck_vests;
	blck_vests_red = blck_vests;
	blck_vests_green = blck_vests;
	blck_vests_orange = blck_vests;	

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
		
	//CraftingFood
	blck_Meats=[
		
	];
	blck_Drink = [
		"Exile_Item_PlasticBottleCoffee",
		"Exile_Item_PowerDrink",
		"Exile_Item_PlasticBottleFreshWater",
		"Exile_Item_Beer",
		"Exile_Item_EnergyDrink",
		"Exile_Item_MountainDupe"
	];
	blck_Food = [
		"Exile_Item_EMRE",		
		"Exile_Item_GloriousKnakworst",
		"Exile_Item_Surstromming",
		"Exile_Item_SausageGravy",
		"Exile_Item_Catfood",
		"Exile_Item_ChristmasTinner",
		"Exile_Item_BBQSandwich",
		"Exile_Item_Dogfood",
		"Exile_Item_BeefParts",
		"Exile_Item_Cheathas",
		"Exile_Item_Noodles",
		"Exile_Item_SeedAstics",
		"Exile_Item_Raisins",
		"Exile_Item_Moobar",
		"Exile_Item_InstantCoffee"
	];
	#ifdef blck_addCarParts
	blck_carParts = [
		"Exile_Item_CarWheel",
		"DDR_Item_Tailrotor",
		"DDR_Item_Main_Rotor",
		"DDR_Item_Engine",
		"DDR_Item_Glass",
		"DDR_Item_Fuel_Tank",
		"DDR_Item_Fishing_Net",
		"DDR_Item_Fiberglass"
	];
	#endif 	
	#ifdef useCUP
	
	#endif
	
	#ifdef useRHS
	
	#endif
	blck_ConsumableItems = blck_Meats + blck_Drink + blck_Food;
	blck_throwableExplosives = ["HandGrenade","MiniGrenade"];
	blck_otherExplosives = ["1Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag"];
	blck_explosives = blck_throwableExplosives + blck_otherExplosives;
	blck_medicalItems = ["Exile_Item_InstaDoc","Exile_Item_Bandage","Exile_Item_Vishpirin"];
	blck_specialItems = blck_throwableExplosives + blck_medicalItems;
	
	blck_NVG = ["NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR","Exile_Item_XM8"];
	blck_buildingMaterials = ["Exile_Item_ExtensionCord","Exile_Item_JunkMetal","Exile_Item_LightBulb","Exile_Item_MetalBoard",
			"Exile_Item_MetalPole","Exile_Item_MetalScrews","Exile_Item_Cement","Exile_Item_Sand","Exile_Item_MetalWire","Exile_Item_ExtensionCord","Exile_Item_JunkMetal"];	
	blck_tools = ["Exile_Item_Matches","Exile_Item_CookingPot","Exile_Melee_Axe","Exile_Melee_SledgeHammmer","Exile_Item_Handsaw","Exile_Item_Pliers","Exile_Item_CanOpener","Exile_Item_Shovel"];

/***************************************************************************************
DEFAULT CONTENTS OF LOOT CRATES FOR EACH MISSION
Note however that these configurations can be used in any way you like or replaced with mission-specific customized loot arrays
for examples of how you can do this see \Major\Compositions.sqf
***************************************************************************************/			

	// values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
	blck_lootCountsOrange = [8,32,8,30,16,1];   // Orange
	blck_lootCountsGreen = [7,24,6,16,18,1]; // Green
	blck_lootCountsRed = [5,16,4,10,6,1];  // Red	
	blck_lootCountsBlue = [4,12,3,6,6,1];   // Blue
	
	blck_BoxLoot_Orange = 
		// Loot is grouped as [weapons],[magazines],[items] in order to be able to use the correct function to load the item into the crate later on.
		// Each item consist of the following information ["ItemName",minNum, maxNum] where min is the smallest number added and min+max is the largest number added.
		
		[  
			[// Weapons	
				#ifdef useAPEX
				"arifle_AK12_F","arifle_AK12_GL_F","arifle_AKM_F","arifle_AKM_FL_F","arifle_AKS_F","arifle_ARX_blk_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F",
				"arifle_CTAR_ghex_F","arifle_CTAR_GL_blk_F","arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_CTARS_ghex_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F",
				"arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F","arifle_SPAR_03_blk_F",
				"arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","arifle_MX_khk_F","arifle_MX_GL_khk_F","arifle_MXC_khk_F","arifle_MXM_khk_F",
				#endif
				#ifdef blck_useLAGO
				"LAGO_KU3K","LAGO_KU3K",
				#endif
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["srifle_DMR_01_F","10Rnd_762x54_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x54_Box"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["MMG_01_tan_F","150Rnd_93x64_Mag"],
				["MMG_02_black_F","150Rnd_93x64_Mag"],
				["MMG_02_camo_F","150Rnd_93x64_Mag"],
				["MMG_02_sand_F","150Rnd_93x64_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
				["srifle_DMR_02_F","10Rnd_338_Mag"],
				["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],
				["srifle_DMR_03_F","10Rnd_338_Mag"],
				["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_05_hex_F","10Rnd_338_Mag"],
				["srifle_DMR_05_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"],				
				["srifle_DMR_04_F","10Rnd_127x54_Mag"],
				["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]				
			],
			[//Magazines
				#ifdef blck_useLAGO
				["AP_MAG",3,6],
				["HE_MAG",3,6],
				["LAGO_KU3K_magazine",3,6],
				//["LAGO_KU5K_MAG_T",3,6],
				//["LAGO_KU5K_MAG_H",3,6],
				//["LAGO_KU5K_MAG_buck",3,6],
				//["KUoooK_MAG",3,6],
				//["KUoooK_MAG_buck",3,6],
				//["KUoooK_MAG_Cluster",3,6],
				//["KUoooK_MAG_HE",3,6],
				//["LAGO_TWP_magazine",3,6],
				#endif
				["3rnd_HE_Grenade_Shell",3,6],				
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["20Rnd_762x51_Mag",7,14],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,5],
				// Marksman Pack Ammo
				["10Rnd_338_Mag",3,5],
				["10Rnd_338_Mag",3,5],				
				["10Rnd_127x54_Mag" ,3,5],
				["10Rnd_127x54_Mag",3,5],
				["10Rnd_93x64_DMR_05_Mag" ,3,5],
				["10Rnd_93x64_DMR_05_Mag" ,3,5],
				["150Rnd_93x64_Mag",3,5],
				["130Rnd_338_Mag",3,5]				
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],
				["optic_Arco",1,3],
				["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[// Materials and supplies	
				#ifdef blck_addCarParts
				["Exile_Item_CarWheel",3,6],["DDR_Item_Tailrotor",1,3],["DDR_Item_Main_Rotor",1,3],["DDR_Item_Engine",2,4],["DDR_Item_Glass",3,6],["DDR_Item_Fuel_Tank",2,4],["DDR_Item_Fiberglass",3,6],
				#endif			
				["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,8],["Exile_Item_ExtensionCord",1,8],["Exile_Item_FuelCanisterEmpty",1,2],
				["Exile_Item_JunkMetal",1,10],["Exile_Item_LightBulb",1,10],["Exile_Item_MetalBoard",1,10],["Exile_Item_MetalPole",1,10],["Exile_Item_CamoTentKit",1,10],["Exile_Item_WorkBenchKit",1,10],
				["Exile_Item_WoodWindowKit",1,10],["Exile_Item_WoodWallKit",1,10],["Exile_Item_WoodStairsKit",1,10],["Exile_Item_WoodGateKit",1,10],["Exile_Item_WoodDoorwayKit",1,10],["Exile_Item_MetalBoard",1,10],
				["Exile_Item_MetalBoard",1,10],["Exile_Item_ExtensionCord",1,10],["Exile_Item_MetalPole",1,10],["Exile_Item_Sand",3,10],["Exile_Item_Cement",3,10],["Exile_Item_MetalWire",3,10],["Exile_Item_MetalScrews",3,10]
				//
			],
			[//Items
				["Exile_Item_InstaDoc",1,2],["NVGoggles",1,2],["Rangefinder",1,2],["Exile_Item_Bandage",1,3],["Exile_Item_Vishpirin",1,3],  
				["Exile_Item_Catfood",1,3],["Exile_Item_Surstromming",1,3],["Exile_Item_BBQSandwich",1,3],["Exile_Item_ChristmasTinner",1,3],["Exile_Item_SausageGravy",1,3],["Exile_Item_GloriousKnakworst",1,3],
				["Exile_Item_BeefParts",1,3],["Exile_Item_Cheathas",1,3],["Exile_Item_Noodles",1,3],["Exile_Item_SeedAstics",1,3],["Exile_Item_Raisins",1,3],["Exile_Item_Moobar",1,3],["Exile_Item_InstantCoffee",1,3],["Exile_Item_EMRE",1,3],
				["Exile_Item_PlasticBottleCoffee",1,3],["Exile_Item_PowerDrink",1,3],["Exile_Item_PlasticBottleFreshWater",1,3],["Exile_Item_Beer",1,3],["Exile_Item_EnergyDrink",1,3],["Exile_Item_MountainDupe",1,3]				
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_cbr",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],
				["B_FieldPack_blk",1,2],["B_FieldPack_cbr",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oucamo",1,2],
				["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],["B_Kitbag_sgg",1,2],
				["B_Parachute",1,2],["V_RebreatherB",1,2],["V_RebreatherIA",1,2],["V_RebreatherIR",1,2],
				["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],["B_TacticalPack_rgr",1,2],
				["B_Bergen_blk",1,2],["B_Bergen_mcamo",1,2],["B_Bergen_rgr",1,2],["B_Bergen_sgg",1,2],
				["B_HuntingBackpack",1,2],["B_OutdoorPack_blk",1,2],["B_OutdoorPack_blu",1,2],["B_OutdoorPack_tan",1,2]
			]
	];		
		
	blck_BoxLoot_Green = 
		[
			[// Weapons
				// Format is ["Weapon Name","Magazine Name"],
				#ifdef useAPEX
				"arifle_AK12_F","arifle_AK12_GL_F","arifle_AKM_F","arifle_AKM_FL_F","arifle_AKS_F","arifle_ARX_blk_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F",
				"arifle_CTAR_ghex_F","arifle_CTAR_GL_blk_F","arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_CTARS_ghex_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F",
				"arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F","arifle_SPAR_03_blk_F",
				"arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","arifle_MX_khk_F","arifle_MX_GL_khk_F","arifle_MXC_khk_F","arifle_MXM_khk_F",
				#endif
				#ifdef blck_useLAGO
				"LAGO_KU3K","LAGO_KU3K",
				#endif				
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["srifle_DMR_01_F","10Rnd_762x54_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x54_Box"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
				["srifle_DMR_03_F","10Rnd_338_Mag"],		
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_05_hex_F","10Rnd_338_Mag"],	
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"]				
			],
			[//Magazines
				#ifdef blck_useLAGO
				["LAGO_KU3K_magazine",3,6],
				#endif			
				// Format is ["Magazine name, Minimum number to add, Maximum number to add],
				["3rnd_HE_Grenade_Shell",2,4],
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["20Rnd_762x51_Mag",6,12],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,3],
				// Marksman Pack Ammo				
				["10Rnd_338_Mag",1,4],
				["10Rnd_338_Mag",1,4],				
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4],
				["130Rnd_338_Mag",3,5],
				// Apex Ammo				
				["130Rnd_338_Mag",1,3],
				["150Rnd_93x64_Mag",1,3]
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[// Materials and supplies	
				#ifdef blck_addCarParts
				["Exile_Item_CarWheel",3,6],["DDR_Item_Tailrotor",1,3],["DDR_Item_Main_Rotor",1,3],["DDR_Item_Engine",2,4],["DDR_Item_Glass",3,6],["DDR_Item_Fuel_Tank",2,4],["DDR_Item_Fiberglass",3,6],
				#endif						
				["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,8],["Exile_Item_ExtensionCord",1,8],["Exile_Item_FuelCanisterEmpty",1,2],
				["Exile_Item_JunkMetal",1,5],["Exile_Item_LightBulb",1,5],["Exile_Item_MetalBoard",1,5],["Exile_Item_MetalPole",1,5],["Exile_Item_CamoTentKit",1,5],["Exile_Item_WorkBenchKit",1,5],
				["Exile_Item_MetalBoard",1,5],["Exile_Item_MetalWire",3,10],["Exile_Item_MetalScrews",3,10],["Exile_Item_ExtensionCord",1,5],["Exile_Item_MetalPole",1,5],["Exile_Item_Sand",2,5],["Exile_Item_Cement",2,5]
			],
			[//Items
				["Exile_Item_InstaDoc",1,2],["NVGoggles",1,2],["Rangefinder",1,2],["Exile_Item_Bandage",1,6],["Exile_Item_Vishpirin",1,6],  
				["Exile_Item_Catfood",1,3],["Exile_Item_Surstromming",1,3],["Exile_Item_BBQSandwich",1,3],["Exile_Item_ChristmasTinner",1,3],["Exile_Item_SausageGravy",1,3],["Exile_Item_GloriousKnakworst",1,3],
				["Exile_Item_BeefParts",1,3],["Exile_Item_Cheathas",1,3],["Exile_Item_Noodles",1,3],["Exile_Item_SeedAstics",1,3],["Exile_Item_Raisins",1,3],["Exile_Item_Moobar",1,3],["Exile_Item_InstantCoffee",1,3],["Exile_Item_EMRE",1,3],
				["Exile_Item_PlasticBottleCoffee",1,3],["Exile_Item_PowerDrink",1,3],["Exile_Item_PlasticBottleFreshWater",1,3],["Exile_Item_Beer",1,3],["Exile_Item_EnergyDrink",1,3],["Exile_Item_MountainDupe",1,3]	
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_cbr",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],
				["B_FieldPack_blk",1,2],["B_FieldPack_cbr",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oucamo",1,2],
				["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],["B_Kitbag_sgg",1,2],
				["B_Parachute",1,2],["V_RebreatherB",1,2],["V_RebreatherIA",1,2],["V_RebreatherIR",1,2],
				["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],["B_TacticalPack_rgr",1,2],
				["B_Bergen_blk",1,2],["B_Bergen_mcamo",1,2],["B_Bergen_rgr",1,2],["B_Bergen_sgg",1,2],
				["B_HuntingBackpack",1,2],["B_OutdoorPack_blk",1,2],["B_OutdoorPack_blu",1,2],["B_OutdoorPack_tan",1,2]
			]
		];
		
	blck_BoxLoot_Blue = 
		[
			[// Weapons
				#ifdef blck_useLAGO
				"LAGO_KU3K","LAGO_KU3K",
				#endif			
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["SMG_02_F","30Rnd_9x21_Mag"],
				["SMG_01_F","30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["srifle_DMR_01_F","10Rnd_762x54_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"]		
			],
			[//Magazines
				#ifdef blck_useLAGO
				["LAGO_KU3K_magazine",3,6],
				#endif			
				["3rnd_HE_Grenade_Shell",1,2],
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["20Rnd_762x51_Mag",3,10],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,4],
				["HandGrenade",1,3],
				// Marksman Pack Ammo				
				["150Rnd_93x64_Mag",1,4],
				["10Rnd_338_Mag",1,4],
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],	
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[// Materials and supplies				
				#ifdef blck_addCarParts
				["Exile_Item_CarWheel",3,6],["DDR_Item_Tailrotor",1,3],["DDR_Item_Main_Rotor",1,3],["DDR_Item_Engine",2,4],["DDR_Item_Glass",3,6],["DDR_Item_Fuel_Tank",2,4],["DDR_Item_Fiberglass",3,6],
				#endif			
				["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,3],["Exile_Item_ExtensionCord",1,2],["Exile_Item_FuelCanisterEmpty",1,2],
				["Exile_Item_JunkMetal",1,6],["Exile_Item_LightBulb",1,6],["Exile_Item_MetalBoard",1,6],["Exile_Item_MetalPole",1,6],["Exile_Item_CamoTentKit",1,6],["Exile_Item_MetalWire",1,4]
			],
			[//Items
				["Exile_Item_InstaDoc",1,2],["NVGoggles",1,2],["Rangefinder",1,2],["Exile_Item_Bandage",1,3],["Exile_Item_Vishpirin",1,3],  
				["Exile_Item_Catfood",1,3],["Exile_Item_Surstromming",1,3],["Exile_Item_BBQSandwich",1,3],["Exile_Item_ChristmasTinner",1,3],["Exile_Item_SausageGravy",1,3],["Exile_Item_GloriousKnakworst",1,3],
				["Exile_Item_BeefParts",1,3],["Exile_Item_Cheathas",1,3],["Exile_Item_Noodles",1,3],["Exile_Item_SeedAstics",1,3],["Exile_Item_Raisins",1,3],["Exile_Item_Moobar",1,3],["Exile_Item_InstantCoffee",1,3],["Exile_Item_EMRE",1,3],
				["Exile_Item_PlasticBottleCoffee",1,3],["Exile_Item_PowerDrink",1,3],["Exile_Item_PlasticBottleFreshWater",1,3],["Exile_Item_Beer",1,3],["Exile_Item_EnergyDrink",1,3],["Exile_Item_MountainDupe",1,3]	
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_cbr",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],
				["B_FieldPack_blk",1,2],["B_FieldPack_cbr",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oucamo",1,2],
				["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],["B_Kitbag_sgg",1,2],
				["B_Parachute",1,2],["V_RebreatherB",1,2],["V_RebreatherIA",1,2],["V_RebreatherIR",1,2],
				["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],["B_TacticalPack_rgr",1,2],
				["B_Bergen_blk",1,2],["B_Bergen_mcamo",1,2],["B_Bergen_rgr",1,2],["B_Bergen_sgg",1,2],
				["B_HuntingBackpack",1,2],["B_OutdoorPack_blk",1,2],["B_OutdoorPack_blu",1,2],["B_OutdoorPack_tan",1,2]
			]
		];
	
	blck_BoxLoot_Red = 
		[	
			[// Weapons
				#ifdef blck_useLAGO
				"LAGO_KU3K","LAGO_KU3K",
				#endif			
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				//["arifle_MX_SW_Black_Hamr_pointer_F","100Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["SMG_02_F","30Rnd_9x21_Mag"],
				["SMG_01_F","30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["srifle_DMR_01_F","10Rnd_762x54_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x54_Box"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"]
			],
			[//Magazines
				#ifdef blck_useLAGO
				["LAGO_KU3K_magazine",3,6],
				#endif		
				["3rnd_HE_Grenade_Shell",1,5],["30Rnd_65x39_caseless_green",3,6],["30Rnd_556x45_Stanag",3,6],["30Rnd_556x45_Stanag",3,6],["30Rnd_45ACP_Mag_SMG_01",3,6],["20Rnd_556x45_UW_mag",3,6],
				["10Rnd_762x51_Mag",3,6],["20Rnd_762x51_Mag",3,7],["200Rnd_65x39_cased_Box",3,6],["100Rnd_65x39_caseless_mag_Tracer",3,6],
				// Marksman Pack Ammo				
				["150Rnd_93x64_Mag",1,4],
				["10Rnd_338_Mag",1,4],
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],		
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],			
			[// Materials and supplies	
				#ifdef blck_addCarParts
				["Exile_Item_CarWheel",3,6],["DDR_Item_Tailrotor",1,3],["DDR_Item_Main_Rotor",1,3],["DDR_Item_Engine",2,4],["DDR_Item_Glass",3,6],["DDR_Item_Fuel_Tank",2,4],["DDR_Item_Fiberglass",3,6],
				#endif						
				["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,8],["Exile_Item_ExtensionCord",1,8],["Exile_Item_FuelCanisterEmpty",1,2],
				["Exile_Item_JunkMetal",1,5],["Exile_Item_LightBulb",1,5],["Exile_Item_MetalBoard",1,5],["Exile_Item_MetalPole",1,5],["Exile_Item_CamoTentKit",1,5],["Exile_Item_WorkBenchKit",1,5],
				["Exile_Item_MetalBoard",1,5],["Exile_Item_MetalWire",3,10],["Exile_Item_MetalScrews",3,10],["Exile_Item_ExtensionCord",1,5],["Exile_Item_MetalPole",1,5],["Exile_Item_Sand",2,5],["Exile_Item_Cement",2,5]
			],
			[//Items
				["Exile_Item_InstaDoc",1,2],["NVGoggles",1,2],["Exile_Item_Energydrink",1,4],["Exile_Item_Beer",1,3],["Rangefinder",1,2],
				["Exile_Item_Catfood",1,3],["Exile_Item_Surstromming",1,3],["Exile_Item_BBQSandwich",1,3],["Exile_Item_ChristmasTinner",1,3],["Exile_Item_SausageGravy",1,3],["Exile_Item_GloriousKnakworst",1,3] 
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_cbr",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],
				["B_FieldPack_blk",1,2],["B_FieldPack_cbr",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oucamo",1,2],
				["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],["B_Kitbag_sgg",1,2],
				["B_Parachute",1,2],["V_RebreatherB",1,2],["V_RebreatherIA",1,2],["V_RebreatherIR",1,2],
				["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],["B_TacticalPack_rgr",1,2],
				["B_Bergen_blk",1,2],["B_Bergen_mcamo",1,2],["B_Bergen_rgr",1,2],["B_Bergen_sgg",1,2],
				["B_HuntingBackpack",1,2],["B_OutdoorPack_blk",1,2],["B_OutdoorPack_blu",1,2],["B_OutdoorPack_tan",1,2]
			]
		];

		

blck_contructionLootExile = [  
		[// Weapons	
							
		],
		[//Magazines
						
		],			
		[  // Optics
			
		],
		[// Materials and supplies				
			
			//
			["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,8],["Exile_Item_ExtensionCord",1,8],["Exile_Item_FuelCanisterEmpty",1,2],
			["Exile_Item_JunkMetal",1,10],["Exile_Item_LightBulb",1,10],["Exile_Item_MetalBoard",1,10],["Exile_Item_MetalPole",1,10],["Exile_Item_CamoTentKit",1,10],["Exile_Item_MetalScrews",3,10]
		],
		[//Items
			"Exile_Item_Matches","Exile_Item_CookingPot","Exile_Item_CanOpener","Exile_Item_Handsaw","Exile_Item_Pliers","Exile_Item_Grinder","Exile_Item_Foolbox","Exile_Item_Hammer",
			"Exile_Item_CordlessScrewdriver","Exile_Item_FireExtinguisher","Exile_Item_OilCanister","Exile_Item_Screwdriver","Exile_Item_Shovel","Exile_Item_Wrench","Exile_Item_CordlessScrewdriver",
			"Exile_Item_FireExtinguisher","Exile_Item_OilCanister","Exile_Item_Screwdriver","Exile_Item_DuctTape","Binocular","Rangefinder","ItemGPS","ItemMap","ItemCompass","ItemRadio","ItemWatch",
			"Exile_Item_XM8"
		],
		[ // Backpacks
			
		]
];
blck_contructionLoot = blck_contructionLootExile;
blck_supportLootExile = [
		[// Weapons	

		],
		[//Magazines
						
		],			
		[  // Optics
			
		],
		[// Materials and supplies				
			
		],
		[//Items
			["Exile_Item_Matches",2,4],["Exile_Item_CookingPot",2,4],["Exile_Item_CanOpener",2,4],
			["Exile_Item_InstaDoc",1,2],["NVGoggles",1,2],["Rangefinder",1,2],["Exile_Item_Bandage",1,3],["Exile_Item_Vishpirin",1,3],  
			["Exile_Item_Catfood",1,3],["Exile_Item_Surstromming",1,3],["Exile_Item_BBQSandwich",1,3],["Exile_Item_ChristmasTinner",1,3],["Exile_Item_SausageGravy",1,3],["Exile_Item_GloriousKnakworst",1,3],
			["Exile_Item_BeefParts",1,3],["Exile_Item_Cheathas",1,3],["Exile_Item_Noodles",1,3],["Exile_Item_SeedAstics",1,3],["Exile_Item_Raisins",1,3],["Exile_Item_Moobar",1,3],["Exile_Item_InstantCoffee",1,3],["Exile_Item_EMRE",1,3],
			["Exile_Item_PlasticBottleCoffee",1,3],["Exile_Item_PowerDrink",1,3],["Exile_Item_PlasticBottleFreshWater",1,3],["Exile_Item_Beer",1,3],["Exile_Item_EnergyDrink",1,3],["Exile_Item_MountainDupe",1,3]						
		],
		[ // Backpacks
			
		]
];

blck_supportLoot = blck_supportLootExile;

blck_highPoweredLoot = [ 
		[// Weapons	
			["MMG_01_hex_F","150Rnd_93x64_Mag"],
			["MMG_01_tan_F","150Rnd_93x64_Mag"],
			["MMG_02_black_F","150Rnd_93x64_Mag"],
			["MMG_02_camo_F","150Rnd_93x64_Mag"],
			["MMG_02_sand_F","150Rnd_93x64_Mag"],
			["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
			["srifle_DMR_02_F","10Rnd_338_Mag"],
			["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],
			["srifle_DMR_03_F","10Rnd_338_Mag"],
			["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
			["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
			["srifle_DMR_05_hex_F","10Rnd_338_Mag"],
			["srifle_DMR_05_tan_F","10Rnd_338_Mag"],
			["srifle_DMR_06_camo_F","10Rnd_338_Mag"],				
			["srifle_DMR_04_F","10Rnd_127x54_Mag"],
			["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
			["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"],
			["launch_NLAW_F","NLAW_F"],
			["launch_RPG32_F","RPG7_F"],
			["launch_B_Titan_F","Titan_AT"],
			["launch_I_Titan_F","Titan_AT"],
			["launch_O_Titan_F","Titan_AP"],
			["launch_B_Titan_short_F","Titan_AA"],
			["launch_I_Titan_short_F","Titan_AA"],
			["launch_O_Titan_short_F","Titan_AA"],
			["launch_RPG7_F","RPG32_F"],
			["launch_O_Vorona_brown_F","vorona_HEAT"],
			["launch_O_Vorona_green_F","Vorona_HE"]									
		],
		[//Magazines
			#ifdef blck_useLAGO
			["LAGO_KU3K_magazine",3,6],
			#endif		
			["NLAW_F",1,3],
			["RPG32_F",1,3],
			["RPG32_HE_F",1,3],
			["Titan_AA",1,3],
			["Titan_AT",1,3],
			["Titan_AP",1,3],
			["RPG7_F",1,3],
			["vorona_HEAT",1,3],
			["Vorona_HE",1,3],
			//["10Rnd_338_Mag",1,5],
			["10Rnd_338_Mag",3,5],				
			//["10Rnd_127x54_Mag" ,1,5],
			["10Rnd_127x54_Mag",3,5],
			["10Rnd_93x64_DMR_05_Mag" ,3,5],
			//["10Rnd_93x64_DMR_05_Mag" ,1,5],
			["150Rnd_93x64_Mag",2,5],
			["130Rnd_338_Mag",3,5]
		],			
		[  // Optics
			
		],
		[// Materials and supplies				
			
		],
		[//Items
		],
		[ // Backpacks
			
		]
];

	["Configurations for Exile Loaded"] call blck_fnc_log;

