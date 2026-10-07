-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- No format-on-save for Python: most repos here are
-- not ruff/black formatted, so saving would reformat whole files. Format new files
-- manually with <leader>cf.
local function no_python_autoformat(buf)
  vim.b[buf].autoformat = false
end
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("python_no_autoformat", { clear = true }),
  pattern = "python",
  callback = function(ev)
    no_python_autoformat(ev.buf)
  end,
})
-- This file loads on VeryLazy, after a .py file opened from the command line got its filetype.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.bo[buf].filetype == "python" then
    no_python_autoformat(buf)
  end
end
