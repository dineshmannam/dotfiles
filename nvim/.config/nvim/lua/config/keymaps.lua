-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function copy_rich()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local out, indent, in_code = {}, nil, false

  for _, line in ipairs(lines) do
    line = line:gsub("^%s*▎%s?", "")

    if line:match("^%s*```") then
      in_code = not in_code
      line = line:gsub("^%s+", "")
    elseif not in_code then
      line = line:gsub("^%s+", "")
      local marker = line:match("^%d+[.)]%s+")
      if marker then
        indent = string.rep(" ", #marker)
      elseif line:match("^[-*+]%s") then
        if indent then
          line = indent .. line
        end
      elseif line ~= "" then
        indent = nil
      end
    end

    table.insert(out, line)
  end

  local cmd = "set -o pipefail; pandoc -f gfm -t html | textutil -stdin -format html -inputencoding UTF-8 -convert rtf -stdout"
  local rtf = vim.fn.system(cmd, table.concat(out, "\n"))

  if vim.v.shell_error ~= 0 then
    vim.notify("Copy failed", vim.log.levels.ERROR)
    return
  end

  vim.fn.system("pbcopy", rtf)
  vim.notify("Copied as rich text")
end

vim.keymap.set("n", "<leader>yr", copy_rich, { desc = "Copy buffer as rich text" })
