local function printUsage()
	print( "Usages:" )
	print( "gitget <user> <repository> <filepath>" )
end

local tArgs = { ... }
if #tArgs != 3 then
	printUsage()
	return
end
if not http then
	print( "gitget requires http API" )
	print( "Set enableAPI_http to 1 in mod_ComputerCraft.cfg" )
	return
end

local user = tArgs[1]
local repo = tArgs[2]
local filepath = tArgs[3]

local sPath = shell.resolve( filepath )

if fs.exists( filepath ) then
	print( "File already exists ... overwriting" )
	-- return
end

write( "Connecting tao raw github ... " )
local response = http.get("https://raw.github.com/"..textutils.urlEncode( user ).."/"..textutils.urlEncode( user ).."/"..filepath)

if response then
	print( "Success." )

	local sResponse = response.readAll()
	response.close()

	local file = fs.open( sPath, "w" )
	file.write( sResponse )
	file.close()

	print( "Downloaded as "..sFile )

else
	print( "Failed." )
end