
params["_object","_dir"];
switch (typeName _dir) do 
{
	case "SCALAR": {_object setDir _dir};
	case "ARRAY": {_object setVectorDirAndUp _dir};
};