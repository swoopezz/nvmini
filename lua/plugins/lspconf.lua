return {
	'neovim/nvim-lspconfig',
	config = function()
		local lsps = {
			{ 'lua_ls', { settings = { Lua = { diagnostics = {
				globals = { 'vim' }
			}}}}},
			{ 'neocmake' },
			{ 'clangd', { init_options = {
				fallbackFlags = { '--std=c20' }
			}}},
		}
		for _, lsp in pairs(lsps) do
			local name, conf = lsp[1], lsp[2]

			vim.lsp.enable(name)
			if conf then
        		vim.lsp.config(name, conf)
			end
		end

	end
}
