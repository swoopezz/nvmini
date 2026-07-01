return {
	'mason-org/mason.nvim',
	dependencies = {
		'mason-org/mason-registry'
	},
	opts_extend = { "ensure_installed" },
	opts = {
		ensure_installed = {
			'clangd',    			-- C++/C
			'neocmakelsp', 			-- CMake
			'lua-language-server',  -- Lua
		},
	},

	config = function(_, opts)
		require('mason').setup({})
		local registry = require('mason-registry')
		registry.refresh()

		for _, tool in pairs(opts.ensure_installed) do
			local pack = registry.get_package(tool)

			if not pack:is_installed() then
				pack:install()
			end
		end
	end
}
