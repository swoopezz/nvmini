local map = vim.keymap.set

map('n', '<C-n>', ":Neotree toggle<CR>")
map('n', '<C-s>', ":Telescope find_files<CR>")
map('i', '<C-BS>', "<C-w>")

map("i", "<Tab>", function()
  if vim.fn.pumvisible() ~= 0 then return "<C-n>" end
  return "<Tab>"
end, { expr = true })

map("i", "<S-Tab>", function()
  if vim.fn.pumvisible() ~= 0 then return "<C-p>" end
  return "<S-Tab>"
end, { expr = true })

map({ "i", "s" }, "<C-j>", "<C-n>")
map({ "i", "s" }, "<C-k>", "<C-p>")

map("i", "<CR>", function()
  if vim.fn.complete_info()["selected"] ~= -1 then return "<C-y>" end
  if vim.fn.pumvisible() ~= 0 then return "<C-e><CR>" end
  return "<CR>"
end, { expr = true })
