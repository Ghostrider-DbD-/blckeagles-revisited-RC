/*
	Original Credit:
	Updated for Epoch 0.3.8.0 by He-Man
	http://epochmod.com/forum/index.php?/topic/34661-release-hs-blackmarket-16-new-trader-system-special-trader-blackmarket/&page=38
	HALV_takegive_crypto.sqf
	by Halv
	
	Copyright (C) 2015  Halvhjearne & Suppe
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
	Contact : halvhjearne@gmail.com
*/
	params["_player","_nr"];

    _cIndex = EPOCH_customVars find "Crypto";
    _vars = _player getVariable["VARS", call EPOCH_defaultVars_SEPXVar];
    _current_crypto = _vars select _cIndex;
    _current_cryptoRaw = _current_crypto;
    _playerCryptoLimit = EPOCH_customVarLimits select _cIndex;
    _playerCryptoLimit params ["_playerCryptoLimitMax","_playerCryptoLimitMin"];
    _current_crypto = ((_current_cryptoRaw + _nr) min _playerCryptoLimitMax) max _playerCryptoLimitMin;
    _current_crypto remoteExec ['EPOCH_effectCrypto',(owner _player)];
    _vars set[_cIndex, _current_crypto];
    _player setVariable["VARS", _vars];


