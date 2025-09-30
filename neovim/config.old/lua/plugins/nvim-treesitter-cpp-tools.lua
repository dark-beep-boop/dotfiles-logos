-- [[ nvim-treesitter-cpp-tools ]]

return {
	{
		'Badhi/nvim-treesitter-cpp-tools',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = function()
			local options = {
				preview = {
					quit = 'q',
					accept = '<tab>',
				},
				header_extension = 'h',
				source_extension = 'cpp',
				custom_define_class_function_commands = {
					TSCppImplWrite = {
						output_handle = require('nt-cpp-tools.output_handlers').get_add_to_cpp(),
					},
					--[[
                <your impl function custom command name> = {
                    output_handle = function (str, context)
                        -- string contains the class implementation
                        -- do whatever you want to do with it
                    end
                }
                ]]
				},
			}
			return options
		end,
		config = true,
	},
}
