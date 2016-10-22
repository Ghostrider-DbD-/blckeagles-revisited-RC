class CfgPatches {
	class custom_server {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

class CfgFunctions {
	class blck_init {
		class blck_start {
			file = "\q\addons\custom_server\init";
			class init {
				postInit = 1;
			};
		};
	};
};