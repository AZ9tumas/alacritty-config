-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- theme selection
--vim.cmd("colorscheme onedark_dark")
-- vim.cmd("colorscheme tokyodark")
--vim.cmd("colorscheme onelight")
--vim.cmd("colorscheme onedark")

--[[ Check for any themes used last time, else select a random one. ]]

-- Function to read the theme from a file
local function read_theme_from_file(filepath)
  local file = io.open(filepath, "r")
  if file then
    local content = file:read("*all")
    file:close()
    return content:match("^%s*(.-)%s*$") -- Trim any leading/trailing whitespace
  end
  return nil
end

-- Function to write the current theme to a file
local function write_theme_to_file(filepath, theme)
  local file = io.open(filepath, "w")
  if file then
    file:write(theme)
    file:close()
  else
    vim.notify("Failed to open file for writing: " .. filepath, vim.log.levels.ERROR)
  end
end

-- Path to the file storing the selected theme
local theme_file_path = vim.fn.stdpath("config") .. "/temp.txt"

-- Read the selected theme from the file or default to 'onedark'
local selected_theme = read_theme_from_file(theme_file_path) or "onedark"

-- Apply the selected theme
vim.cmd("colorscheme " .. selected_theme)

-- Autocommand group for exit actions
local exit_group = vim.api.nvim_create_augroup("ExitGroup", { clear = true })

-- Autocommand to save the current theme before exiting Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  group = exit_group,
  callback = function()
    local current_theme = vim.g.colors_name or "unknown"
    write_theme_to_file(theme_file_path, current_theme)
    vim.notify("Saved current theme: " .. current_theme, vim.log.levels.INFO)
  end,
})

-- TypeScript and JavaScript setup
local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    -- Disable formatting because we use other tools for that
  end,
  filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact" },
})

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    -- Disable formatting because we use other tools for that
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = { "c", "cpp", "objc", "objcpp" },
})

vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.tabstop = 4        -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true   -- Convert tabs to spaces
