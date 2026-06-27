return {
	'mason-org/mason.nvim',
	opts_extend = { "ensure_installed" },
	opts = {
		ensure_installed = {
			'clangd',
			'neocmakelsp',
			'lua-language-server',
		},
	},

	config = function(_, opts)
		require('mason').setup({})
		local registry = require('mason-registry')

		vim.cmd('MasonUpdate')
		for _, tool in pairs(opts.ensure_installed) do
			if not registry.get_package(tool):is_installed() then
				vim.cmd('MasonInstall ' .. tool)
			end
		end
		
	end
}
