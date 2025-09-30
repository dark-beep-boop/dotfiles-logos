-- [[ scan-adapters ]]

function ScanLuaFilesInDirectory(directory)
	return io.popen(
		'find "' .. directory .. '" -maxdepth 1 -name "*.lua" -type f'
	)
end

function ScanDAPAdapterParametersInDirectory(directory, moduleroot)
	local dapAdaptersParameters = {
		dependencies = {},
		adapters = {},
		configs = {},
	}

	local filenames_in_directory = ScanLuaFilesInDirectory(directory)
	if filenames_in_directory then
		for filename in filenames_in_directory:lines() do
			local noextension = string.gsub(filename, '[.]lua', '')
			local noprefix = string.gsub(noextension, '[/].+[/]', '')
			local modulename = moduleroot .. '.' .. noprefix

			local dapAdapterParameters = require(modulename)
			if type(dapAdapterParameters) == 'table' then
				if type(dapAdapterParameters.dependencies) == 'table' then
					for _, dependency in
						ipairs(dapAdapterParameters.dependencies)
					do
						table.insert(
							dapAdaptersParameters.dependencies,
							dependency
						)
					end
				end

				if type(dapAdapterParameters.adapters) == 'table' then
					for _, adapter in ipairs(dapAdapterParameters.adapters) do
						table.insert(dapAdaptersParameters.adapters, adapter)
					end
				end

				if type(dapAdapterParameters.config) == 'function' then
					table.insert(
						dapAdaptersParameters.configs,
						dapAdapterParameters.config
					)
				end
			end
		end
	end

	return dapAdaptersParameters
end

-- vim: ts=2 sts=2 sw=2 et
