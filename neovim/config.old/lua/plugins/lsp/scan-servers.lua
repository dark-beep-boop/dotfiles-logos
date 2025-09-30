-- [[ scan-servers ]]

function ScanLuaFilesInDirectory(directory)
	return io.popen(
		'find "' .. directory .. '" -maxdepth 1 -name "*.lua" -type f'
	)
end

function ScanLSPServersInDirectory(directory, moduleroot)
	local lspServers = {}

	local filenames_in_directory = ScanLuaFilesInDirectory(directory)
	if filenames_in_directory then
		for filename in filenames_in_directory:lines() do
			local noextension = string.gsub(filename, '[.]lua', '')
			local noprefix = string.gsub(noextension, '[/].+[/]', '')
			local modulename = moduleroot .. '.' .. noprefix

			local lspCurrentServers = require(modulename)
			if type(lspCurrentServers) == 'table' then
				for key, value in pairs(lspCurrentServers) do
					lspServers[key] = value
				end
			end
		end
	end

	return lspServers
end

-- vim: ts=2 sts=2 sw=2 et
